

e3e5a0336a96
*** Found logs served from host http://e3e5a0336a96:8793/log/dag_id=yellow_taxi_pipeline/run_id=manual__2025-09-14T17:18:07.766664+00:00/task_id=download_data_kaggle/attempt=2.log
[2025-09-14, 17:20:12 UTC] {taskinstance.py:1956} INFO - Dependencies all met for dep_context=non-requeueable deps ti=<TaskInstance: yellow_taxi_pipeline.download_data_kaggle manual__2025-09-14T17:18:07.766664+00:00 [queued]>
[2025-09-14, 17:20:12 UTC] {taskinstance.py:1956} INFO - Dependencies all met for dep_context=requeueable deps ti=<TaskInstance: yellow_taxi_pipeline.download_data_kaggle manual__2025-09-14T17:18:07.766664+00:00 [queued]>
[2025-09-14, 17:20:12 UTC] {taskinstance.py:2170} INFO - Starting attempt 2 of 2
[2025-09-14, 17:20:12 UTC] {taskinstance.py:2191} INFO - Executing <Task(PythonOperator): download_data_kaggle> on 2025-09-14 17:18:07.766664+00:00
[2025-09-14, 17:20:12 UTC] {standard_task_runner.py:60} INFO - Started process 194 to run task
[2025-09-14, 17:20:12 UTC] {standard_task_runner.py:87} INFO - Running: ['airflow', 'tasks', 'run', 'yellow_taxi_pipeline', 'download_data_kaggle', 'manual__2025-09-14T17:18:07.766664+00:00', '--job-id', '9', '--raw', '--subdir', 'DAGS_FOLDER/yellow_taxi_dag.py', '--cfg-path', '/tmp/tmpf2ognpfs']
[2025-09-14, 17:20:12 UTC] {standard_task_runner.py:88} INFO - Job 9: Subtask download_data_kaggle
[2025-09-14, 17:20:12 UTC] {task_command.py:423} INFO - Running <TaskInstance: yellow_taxi_pipeline.download_data_kaggle manual__2025-09-14T17:18:07.766664+00:00 [running]> on host e3e5a0336a96
[2025-09-14, 17:20:12 UTC] {taskinstance.py:2480} INFO - Exporting env vars: AIRFLOW_CTX_DAG_OWNER='airflow' AIRFLOW_CTX_DAG_ID='yellow_taxi_pipeline' AIRFLOW_CTX_TASK_ID='download_data_kaggle' AIRFLOW_CTX_EXECUTION_DATE='2025-09-14T17:18:07.766664+00:00' AIRFLOW_CTX_TRY_NUMBER='2' AIRFLOW_CTX_DAG_RUN_ID='manual__2025-09-14T17:18:07.766664+00:00'
[2025-09-14, 17:20:12 UTC] {taskinstance.py:2698} ERROR - Task failed with exception
Traceback (most recent call last):
  File "/home/airflow/.local/lib/python3.8/site-packages/airflow/models/taskinstance.py", line 433, in _execute_task
    result = execute_callable(context=context, **execute_callable_kwargs)
  File "/home/airflow/.local/lib/python3.8/site-packages/airflow/operators/python.py", line 199, in execute
    return_value = self.execute_callable()
  File "/home/airflow/.local/lib/python3.8/site-packages/airflow/operators/python.py", line 216, in execute_callable
    return self.python_callable(*self.op_args, **self.op_kwargs)
  File "/opt/airflow/dags/yellow_taxi_dag.py", line 26, in fetch_yellow_taxi_data_kaggle
    result = subprocess.run(
  File "/usr/local/lib/python3.8/subprocess.py", line 493, in run
    with Popen(*popenargs, **kwargs) as process:
  File "/usr/local/lib/python3.8/subprocess.py", line 858, in __init__
    self._execute_child(args, executable, preexec_fn, close_fds,
  File "/usr/local/lib/python3.8/subprocess.py", line 1720, in _execute_child
    raise child_exception_type(errno_num, err_msg, err_filename)
PermissionError: [Errno 13] Permission denied: 'kaggle'
[2025-09-14, 17:20:12 UTC] {taskinstance.py:1138} INFO - Marking task as FAILED. dag_id=yellow_taxi_pipeline, task_id=download_data_kaggle, execution_date=20250914T171807, start_date=20250914T172012, end_date=20250914T172012
[2025-09-14, 17:20:12 UTC] {standard_task_runner.py:107} ERROR - Failed to execute job 9 for task download_data_kaggle ([Errno 13] Permission denied: 'kaggle'; 194)
[2025-09-14, 17:20:12 UTC] {local_task_job_runner.py:234} INFO - Task exited with return code 1
[2025-09-14, 17:20:12 UTC] {taskinstance.py:3280} INFO - 0 downstream tasks scheduled from follow-on schedule check
