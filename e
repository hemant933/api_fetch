version: "3.9"

x-airflow-common: &airflow-common
  image: apache/airflow:2.8.1
  env_file:
    - .env
  environment:
    AIRFLOW__WEBSERVER__SECRET_KEY: "9a2b6f4e1f07a5c37db1ff4c0f01d5d8764d2e59b927c88f7a4c1e26c8c6b1a2"  # ✅ strong random key
    PATH: "/home/airflow/.local/bin:$PATH"  # ✅ ensure pip-installed kaggle is found
  volumes:
    - ./dags:/opt/airflow/dags
    - ./spark_jobs:/opt/airflow/spark_jobs
    - ./requirements.txt:/requirements.txt
    - /c/Users/user/.kaggle:/home/airflow/.kaggle:ro   # ✅ mount Kaggle credentials from Windows
  user: "${AIRFLOW_UID:-50000}:${AIRFLOW_GID:-0}"
  depends_on:
    mysql:
      condition: service_healthy

services:
  # ======================
  # MySQL Database
  # ======================
  mysql:
    image: mysql:8.0
    container_name: mysql_airflow
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: ${MYSQL_DB}
      MYSQL_USER: ${MYSQL_USER}
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
    ports:
      - "3306:3306"
    volumes:
      - ./mysql_data:/var/lib/mysql
    healthcheck:
      test: ["CMD", "mysqladmin", "ping", "-h", "localhost"]
      interval: 10s
      timeout: 5s
      retries: 5

  # ======================
  # Airflow Init (one-time setup)
  # ======================
  airflow-init:
    <<: *airflow-common
    entrypoint: /bin/bash
    command:
      - -c
      - |
        pip install --no-cache-dir -r /requirements.txt
        airflow db init
        airflow users create \
          --username ${_AIRFLOW_WWW_USER_USERNAME} \
          --firstname Admin --lastname User \
          --role Admin \
          --email admin@example.com \
          --password ${_AIRFLOW_WWW_USER_PASSWORD}
    depends_on:
      mysql:
        condition: service_healthy

  # ======================
  # Airflow Webserver
  # ======================
  airflow-webserver:
    <<: *airflow-common
    command: webserver
    ports:
      - "8080:8080"
    depends_on:
      mysql:
        condition: service_healthy

  # ======================
  # Airflow Scheduler
  # ======================
  airflow-scheduler:
    <<: *airflow-common
    command: scheduler
    depends_on:
      mysql:
        condition: service_healthy

  # ======================
  # Spark Master
  # ======================
  spark-master:
    image: bitnami/spark:3.5.0
    container_name: spark-master
    environment:
      - SPARK_MODE=master
    ports:
      - "7077:7077"
      - "8081:8080"
    volumes:
      - ./spark_jobs:/opt/spark_jobs

  # ======================
  # Spark Worker
  # ======================
  spark-worker:
    image: bitnami/spark:3.5.0
    container_name: spark-worker
    environment:
      - SPARK_MODE=worker
      - SPARK_MASTER_URL=spark://spark-master:7077
    depends_on:
      - spark-master
    volumes:
      - ./spark_jobs:/opt/spark_jobs
