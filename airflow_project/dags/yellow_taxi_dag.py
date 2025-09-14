from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.python import PythonOperator
from airflow.utils.dates import days_ago
from datetime import timedelta
import requests
import os
import zipfile
import subprocess

# Function to download the yellow taxi dataset from Kaggle
def fetch_yellow_taxi_data_kaggle(**kwargs):
    kaggle_dataset = "gauravpathak1789/yellow-tripdata-2020-01"
    download_dir = "/opt/airflow/data"
    output_csv = f"{download_dir}/yellow_tripdata_2020-01.csv"

    # Ensure Kaggle credentials are set
    os.environ['KAGGLE_USERNAME'] = 'hemantchaudhary933'  # Replace with your Kaggle username
    os.environ['KAGGLE_KEY'] = 'bbeabd969d80443a93a86ea2e8dd62af'            # Replace with your Kaggle API key

    # Create directory if not exists
    os.makedirs(download_dir, exist_ok=True)

    # Run Kaggle API command
    result = subprocess.run(
        [
            'kaggle', 'datasets', 'download',
            '-d', kaggle_dataset,
            '--unzip', '-p', download_dir
        ],
        check=True,
        capture_output=True,
        text=True
    )

    print(result.stdout)
    print(f"Dataset downloaded and extracted to {download_dir}")
    if os.path.exists(output_csv):
        print(f"CSV file available at: {output_csv}")
    else:
        raise FileNotFoundError(f"Expected file not found: {output_csv}")

# Function to download the yellow taxi dataset from S3 (alternative)
# def fetch_yellow_taxi_data_s3(**kwargs):
#     url = "https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-01.csv"
#     output_path = "/opt/airflow/spark_jobs/yellow_tripdata.csv"
#     response = requests.get(url, stream=True)
#     with open(output_path, "wb") as f:
#         for chunk in response.iter_content(chunk_size=1024 * 1024):
#             f.write(chunk)
#     print(f"Downloaded dataset to {output_path}")

default_args = {
    "owner": "airflow",
    "depends_on_past": False,
    "retries": 1,
    "retry_delay": timedelta(minutes=2),
}

with DAG(
    dag_id="yellow_taxi_pipeline",
    default_args=default_args,
    description="ETL pipeline for NYC Yellow Taxi data (Kaggle or S3)",
    schedule_interval="@daily",
    start_date=days_ago(1),
    catchup=False,
) as dag:

    # Choose one of the following tasks to use:
    
    # Option 1: Download from Kaggle
    download_task = PythonOperator(
        task_id="download_data_kaggle",
        python_callable=fetch_yellow_taxi_data_kaggle,
    )

    # Option 2: Download from S3 (uncomment to use)
    # download_task = PythonOperator(
    #     task_id="download_data_s3",
    #     python_callable=fetch_yellow_taxi_data_s3,
    # )

    # Spark ETL task (uses the output from either Kaggle or S3 version)
    etl_task = BashOperator(
        task_id="spark_etl",
        bash_command=(
            "spark-submit --master spark://spark-master:7077 "
            "--jars /opt/airflow/spark_jobs/mysql-connector-j-8.0.33.jar "
            "/opt/airflow/spark_jobs/etl_yellow_taxi.py "
            "/opt/airflow/data/yellow_tripdata_2020-01.csv "  # Match with Kaggle output path
            "jdbc:mysql://mysql:3306/airflow_db "
            "airflow airflow"
        ),
    )

    download_task >> etl_task
