056124e5a50c
*** !!!! Please make sure that all your Airflow components (e.g. schedulers, webservers, workers and triggerer) have the same 'secret_key' configured in 'webserver' section and time is synchronized on all your machines (for example with ntpd)
See more at https://airflow.apache.org/docs/apache-airflow/stable/configurations-ref.html#secret-key
*** Could not read served logs: Client error '403 FORBIDDEN' for url 'http://056124e5a50c:8793/log/dag_id=yellow_taxi_pipeline/run_id=manual__2025-09-14T17:03:51.649007+00:00/task_id=download_data_kaggle/attempt=2.log'
For more information check: https://httpstatuses.com/403
