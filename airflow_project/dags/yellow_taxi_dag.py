from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.python import PythonOperator
from airflow.utils.dates import days_ago
from datetime import timedelta
import os
import subprocess


# =========================
# Download Yellow Taxi Data
# =========================
def fetch_yellow_taxi_data_kaggle(**kwargs):
    kaggle_dataset = "gauravpathak1789/yellow-tripdata-2020-01"
    download_dir = "/opt/airflow/data"
    output_csv = f"{download_dir}/yellow_tripdata_2020-01.csv"

    # Set Kaggle credentials from environment
    os.environ["KAGGLE_USERNAME"] = os.getenv("KAGGLE_USERNAME")
    os.environ["KAGGLE_KEY"] = os.getenv("KAGGLE_KEY")

    # Ensure download directory exists
    os.makedirs(download_dir, exist_ok=True)

    # Run Kaggle CLI command
    result = subprocess.run(
        [
            "kaggle", "datasets", "download",
            "-d", kaggle_dataset,
            "--unzip", "-p", download_dir
        ],
        check=True,
        capture_output=True,
        text=True
    )

    print(result.stdout)
    print(f"✅ Dataset downloaded and extracted to {download_dir}")

    if os.path.exists(output_csv):
        print(f"✅ CSV available: {output_csv}")
    else:
        raise FileNotFoundError(f"❌ Expected file not found: {output_csv}")


# =========================
# Airflow DAG Definition
# =========================
default_args = {
    "owner": "airflow",
    "depends_on_past": False,
    "retries": 1,
    "retry_delay": timedelta(minutes=2),
}

with DAG(
    dag_id="yellow_taxi_pipeline",
    default_args=default_args,
    description="ETL pipeline for NYC Yellow Taxi data (Kaggle → Spark → MySQL)",
    schedule_interval="@daily",
    start_date=days_ago(1),
    catchup=False,
) as dag:

    # Task 1: Download data from Kaggle
    download_task = PythonOperator(
        task_id="download_data_kaggle",
        python_callable=fetch_yellow_taxi_data_kaggle,
    )

    # Task 2: Spark ETL job
    etl_task = BashOperator(
        task_id="spark_etl",
        bash_command=(
            "spark-submit --master spark://spark-master:7077 "
            "--jars /opt/airflow/spark_jobs/mysql-connector-j-8.0.33.jar "
            "/opt/airflow/spark_jobs/etl_yellow_taxi.py "
            "/opt/airflow/data/yellow_tripdata_2020-01.csv "
            "jdbc:mysql://mysql:3306/airflow_db "
            "airflow airflow"
        ),
    )

    # DAG flow
    download_task >> etl_task
