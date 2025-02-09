db_host = 'localhost'
db_port = 1433
db_name = 'Sales'
db_user = 'spark'
db_pass = 'spark'

jdbc_url = f"jdbc:sqlserver://{db_host}:{str(db_port)};databaseName={db_name};encrypt=true;trustServerCertificate=true"
connection_properties = {
    "user": db_user,
    "password": db_pass,
    "driver": "com.microsoft.sqlserver.jdbc.SQLServerDriver"
}

pyodbc_url = f"DRIVER=ODBC Driver 18 for SQL Server;SERVER={db_host};DATABASE={db_name};UID={db_user};PWD={db_pass};TrustServerCertificate=yes"