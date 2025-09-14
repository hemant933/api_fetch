airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/util/compat.py", line 211, in raise_
airflow-init-1  |     raise exception
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/base.py", line 686, in __connect
airflow-init-1  |     self.dbapi_connection = connection = pool._invoke_creator(self)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/engine/create.py", line 574, in connect
airflow-init-1  |     return dialect.connect(*cargs, **cparams)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/engine/default.py", line 598, in connect
airflow-init-1  |     return self.dbapi.connect(*cargs, **cparams)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/mysql/connector/__init__.py", line 272, in connect
airflow-init-1  |     return CMySQLConnection(*args, **kwargs)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/mysql/connector/connection_cext.py", line 94, in __init__
airflow-init-1  |     self.connect(**kwargs)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/mysql/connector/abstracts.py", line 1052, in connect
airflow-init-1  |     self._open_connection()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/mysql/connector/connection_cext.py", line 251, in _open_connection
airflow-init-1  |     raise errors.get_mysql_exception(msg=exc.msg, errno=exc.errno,
airflow-init-1  | mysql.connector.errors.DatabaseError: 2003 (HY000): Can't connect to MySQL server on '127.0.0.1:3306' (111)
airflow-init-1  |
airflow-init-1  | The above exception was the direct cause of the following exception:
airflow-init-1  |
airflow-init-1  | Traceback (most recent call last):
airflow-init-1  |   File "/home/airflow/.local/bin/airflow", line 8, in <module>
airflow-init-1  |     sys.exit(main())
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/airflow/__main__.py", line 57, in main
airflow-init-1  |     args.func(args)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/airflow/cli/cli_config.py", line 49, in command
airflow-init-1  |     return func(*args, **kwargs)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/airflow/utils/cli.py", line 112, in wrapper
airflow-init-1  |     check_and_run_migrations()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/airflow/utils/db.py", line 821, in check_and_run_migrations
airflow-init-1  |     with _configured_alembic_environment() as env:
airflow-init-1  |   File "/usr/local/lib/python3.8/contextlib.py", line 113, in __enter__
airflow-init-1  |     return next(self.gen)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/airflow/utils/db.py", line 809, in _configured_alembic_environment
airflow-init-1  |     ) as env, settings.engine.connect() as connection:
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/future/engine.py", line 412, in connect
airflow-init-1  |     return super(Engine, self).connect()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/engine/base.py", line 3325, in connect
airflow-init-1  |     return self._connection_cls(self, close_with_result=close_with_result)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/engine/base.py", line 96, in __init__
airflow-init-1  |     else engine.raw_connection()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/engine/base.py", line 3404, in raw_connection
airflow-init-1  |     return self._wrap_pool_connect(self.pool.connect, _connection)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/engine/base.py", line 3374, in _wrap_pool_connect
airflow-init-1  |     Connection._handle_dbapi_exception_noconnection(
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/engine/base.py", line 2208, in _handle_dbapi_exception_noconnection
airflow-init-1  |     util.raise_(
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/util/compat.py", line 211, in raise_
airflow-init-1  |     raise exception
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/engine/base.py", line 3371, in _wrap_pool_connect
airflow-init-1  |     return fn()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/base.py", line 327, in connect
airflow-init-1  |     return _ConnectionFairy._checkout(self)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/base.py", line 894, in _checkout
airflow-init-1  |     fairy = _ConnectionRecord.checkout(pool)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/base.py", line 493, in checkout
airflow-init-1  |     rec = pool._do_get()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/impl.py", line 146, in _do_get
airflow-init-1  |     self._dec_overflow()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/util/langhelpers.py", line 70, in __exit__
airflow-init-1  |     compat.raise_(
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/util/compat.py", line 211, in raise_
airflow-init-1  |     raise exception
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/impl.py", line 143, in _do_get
airflow-init-1  |     return self._create_connection()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/base.py", line 273, in _create_connection
airflow-init-1  |     return _ConnectionRecord(self)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/base.py", line 388, in __init__
airflow-init-1  |     self.__connect()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/base.py", line 691, in __connect
airflow-init-1  |     pool.logger.debug("Error on connect(): %s", e)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/util/langhelpers.py", line 70, in __exit__
airflow-init-1  |     compat.raise_(
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/util/compat.py", line 211, in raise_
airflow-init-1  |     raise exception
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/base.py", line 686, in __connect
airflow-init-1  |     self.dbapi_connection = connection = pool._invoke_creator(self)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/engine/create.py", line 574, in connect
airflow-init-1  |     return dialect.connect(*cargs, **cparams)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/engine/default.py", line 598, in connect
airflow-init-1  |     return self.dbapi.connect(*cargs, **cparams)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/mysql/connector/__init__.py", line 272, in connect
airflow-init-1  |     return CMySQLConnection(*args, **kwargs)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/mysql/connector/connection_cext.py", line 94, in __init__
airflow-init-1  |     self.connect(**kwargs)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/mysql/connector/abstracts.py", line 1052, in connect
airflow-init-1  |     self._open_connection()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/mysql/connector/connection_cext.py", line 251, in _open_connection
airflow-init-1  |     raise errors.get_mysql_exception(msg=exc.msg, errno=exc.errno,
airflow-init-1  | sqlalchemy.exc.DatabaseError: (mysql.connector.errors.DatabaseError) 2003 (HY000): Can't connect to MySQL server on '127.0.0.1:3306' (111)
airflow-init-1  | (Background on this error at: https://sqlalche.me/e/14/4xp6)
airflow-init-1  | Traceback (most recent call last):
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/mysql/connector/connection_cext.py", line 246, in _open_connection
airflow-init-1  |     self._cmysql.connect(**cnx_kwargs)
airflow-init-1  | _mysql_connector.MySQLInterfaceError: Can't connect to MySQL server on '127.0.0.1:3306' (111)
airflow-init-1  |
airflow-init-1  | During handling of the above exception, another exception occurred:
airflow-init-1  |
airflow-init-1  | Traceback (most recent call last):
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/engine/base.py", line 3371, in _wrap_pool_connect
airflow-init-1  |     return fn()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/base.py", line 327, in connect
airflow-init-1  |     return _ConnectionFairy._checkout(self)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/base.py", line 894, in _checkout
airflow-init-1  |     fairy = _ConnectionRecord.checkout(pool)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/base.py", line 493, in checkout
airflow-init-1  |     rec = pool._do_get()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/impl.py", line 146, in _do_get
airflow-init-1  |     self._dec_overflow()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/util/langhelpers.py", line 70, in __exit__
airflow-init-1  |     compat.raise_(
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/util/compat.py", line 211, in raise_
airflow-init-1  |     raise exception
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/impl.py", line 143, in _do_get
airflow-init-1  |     return self._create_connection()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/base.py", line 273, in _create_connection
airflow-init-1  |     return _ConnectionRecord(self)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/base.py", line 388, in __init__
airflow-init-1  |     self.__connect()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/base.py", line 691, in __connect
airflow-init-1  |     pool.logger.debug("Error on connect(): %s", e)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/util/langhelpers.py", line 70, in __exit__
airflow-init-1  |     compat.raise_(
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/util/compat.py", line 211, in raise_
airflow-init-1  |     raise exception
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/base.py", line 686, in __connect
airflow-init-1  |     self.dbapi_connection = connection = pool._invoke_creator(self)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/engine/create.py", line 574, in connect
airflow-init-1  |     return dialect.connect(*cargs, **cparams)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/engine/default.py", line 598, in connect
airflow-init-1  |     return self.dbapi.connect(*cargs, **cparams)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/mysql/connector/__init__.py", line 272, in connect
airflow-init-1  |     return CMySQLConnection(*args, **kwargs)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/mysql/connector/connection_cext.py", line 94, in __init__
airflow-init-1  |     self.connect(**kwargs)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/mysql/connector/abstracts.py", line 1052, in connect
airflow-init-1  |     self._open_connection()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/mysql/connector/connection_cext.py", line 251, in _open_connection
airflow-init-1  |     raise errors.get_mysql_exception(msg=exc.msg, errno=exc.errno,
airflow-init-1  | mysql.connector.errors.DatabaseError: 2003 (HY000): Can't connect to MySQL server on '127.0.0.1:3306' (111)
airflow-init-1  |
airflow-init-1  | The above exception was the direct cause of the following exception:
airflow-init-1  |
airflow-init-1  | Traceback (most recent call last):
airflow-init-1  |   File "/home/airflow/.local/bin/airflow", line 8, in <module>
airflow-init-1  |     sys.exit(main())
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/airflow/__main__.py", line 57, in main
airflow-init-1  |     args.func(args)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/airflow/cli/cli_config.py", line 49, in command
airflow-init-1  |     return func(*args, **kwargs)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/airflow/utils/cli.py", line 112, in wrapper
airflow-init-1  |     check_and_run_migrations()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/airflow/utils/db.py", line 821, in check_and_run_migrations
airflow-init-1  |     with _configured_alembic_environment() as env:
airflow-init-1  |   File "/usr/local/lib/python3.8/contextlib.py", line 113, in __enter__
airflow-init-1  |     return next(self.gen)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/airflow/utils/db.py", line 809, in _configured_alembic_environment
airflow-init-1  |     ) as env, settings.engine.connect() as connection:
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/future/engine.py", line 412, in connect
airflow-init-1  |     return super(Engine, self).connect()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/engine/base.py", line 3325, in connect
airflow-init-1  |     return self._connection_cls(self, close_with_result=close_with_result)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/engine/base.py", line 96, in __init__
airflow-init-1  |     else engine.raw_connection()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/engine/base.py", line 3404, in raw_connection
airflow-init-1  |     return self._wrap_pool_connect(self.pool.connect, _connection)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/engine/base.py", line 3374, in _wrap_pool_connect
airflow-init-1  |     Connection._handle_dbapi_exception_noconnection(
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/engine/base.py", line 2208, in _handle_dbapi_exception_noconnection
airflow-init-1  |     util.raise_(
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/util/compat.py", line 211, in raise_
airflow-init-1  |     raise exception
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/engine/base.py", line 3371, in _wrap_pool_connect
airflow-init-1  |     return fn()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/base.py", line 327, in connect
airflow-init-1  |     return _ConnectionFairy._checkout(self)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/base.py", line 894, in _checkout
airflow-init-1  |     fairy = _ConnectionRecord.checkout(pool)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/base.py", line 493, in checkout
airflow-init-1  |     rec = pool._do_get()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/impl.py", line 146, in _do_get
airflow-init-1  |     self._dec_overflow()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/util/langhelpers.py", line 70, in __exit__
airflow-init-1  |     compat.raise_(
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/util/compat.py", line 211, in raise_
airflow-init-1  |     raise exception
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/impl.py", line 143, in _do_get
airflow-init-1  |     return self._create_connection()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/base.py", line 273, in _create_connection
airflow-init-1  |     return _ConnectionRecord(self)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/base.py", line 388, in __init__
airflow-init-1  |     self.__connect()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/base.py", line 691, in __connect
airflow-init-1  |     pool.logger.debug("Error on connect(): %s", e)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/util/langhelpers.py", line 70, in __exit__
airflow-init-1  |     compat.raise_(
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/util/compat.py", line 211, in raise_
airflow-init-1  |     raise exception
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/pool/base.py", line 686, in __connect
airflow-init-1  |     self.dbapi_connection = connection = pool._invoke_creator(self)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/engine/create.py", line 574, in connect
airflow-init-1  |     return dialect.connect(*cargs, **cparams)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/sqlalchemy/engine/default.py", line 598, in connect
airflow-init-1  |     return self.dbapi.connect(*cargs, **cparams)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/mysql/connector/__init__.py", line 272, in connect
airflow-init-1  |     return CMySQLConnection(*args, **kwargs)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/mysql/connector/connection_cext.py", line 94, in __init__
airflow-init-1  |     self.connect(**kwargs)
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/mysql/connector/abstracts.py", line 1052, in connect
airflow-init-1  |     self._open_connection()
airflow-init-1  |   File "/home/airflow/.local/lib/python3.8/site-packages/mysql/connector/connection_cext.py", line 251, in _open_connection
airflow-init-1  |     raise errors.get_mysql_exception(msg=exc.msg, errno=exc.errno,
airflow-init-1  | sqlalchemy.exc.DatabaseError: (mysql.connector.errors.DatabaseError) 2003 (HY000): Can't connect to MySQL server on '127.0.0.1:3306' (111)
airflow-init-1  | (Background on this error at: https://sqlalche.me/e/14/4xp6)
