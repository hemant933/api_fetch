# Airflow Config
# -------------------------
AIRFLOW_UID=50000
AIRFLOW_GID=0
 
# Fernet key (keep secret, generate with: `openssl rand -base64 32`)
AIRFLOW__CORE__FERNET_KEY=Hyojx3WWBtc42CCq9bBAgb9FOV7EwtcTYKOj3dWe09k=
 
# -------------------------
# Airflow Admin User (for airflow-init command)
# -------------------------
ADMIN_USER=airflow
ADMIN_PASSWORD=airflow
ADMIN_FIRSTNAME=Air
ADMIN_LASTNAME=Flow
ADMIN_EMAIL=admin@example.com
 
# -------------------------
# MySQL Config
# -------------------------
MYSQL_HOST=mysql
MYSQL_PORT=3306
MYSQL_USER=airflow
MYSQL_PASSWORD=airflow
MYSQL_DB=airflow_db
 
# -------------------------
# Airflow DB Config
# -------------------------
AIRFLOW__DATABASE__SQL_ALCHEMY_CONN=mysql+mysqlconnector://${MYSQL_USER}:${MYSQL_PASSWORD}@${MYSQL_HOST}:${MYSQL_PORT}/${MYSQL_DB}
AIRFLOW__CORE__EXECUTOR=LocalExecutor
