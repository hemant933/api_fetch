from pyspark.sql import SparkSession
from pyspark.sql.functions import col, to_date
import sys


def main(input_path, mysql_url, mysql_user, mysql_password):
    # Start Spark session
    spark = SparkSession.builder \
        .appName("YellowTaxiETL") \
        .getOrCreate()

    print(f"✅ Reading input file: {input_path}")

    # Load CSV
    df = spark.read.option("header", True).csv(input_path)

    # Basic cleaning: parse dates, filter bad fares
    df = df.withColumn("tpep_pickup_datetime", to_date(col("tpep_pickup_datetime"))) \
           .withColumn("tpep_dropoff_datetime", to_date(col("tpep_dropoff_datetime"))) \
           .filter(col("fare_amount") > 0)

    print(f"✅ Number of rows after cleaning: {df.count()}")

    # Write to MySQL
    df.write.format("jdbc") \
        .option("url", mysql_url) \
        .option("dbtable", "yellow_taxi_trips") \
        .option("user", mysql_user) \
        .option("password", mysql_password) \
        .option("driver", "com.mysql.cj.jdbc.Driver") \
        .option("createTableColumnTypes",
                "VendorID INT, "
                "tpep_pickup_datetime DATE, "
                "tpep_dropoff_datetime DATE, "
                "passenger_count INT, "
                "trip_distance DOUBLE, "
                "payment_type INT, "
                "fare_amount DOUBLE") \
        .mode("overwrite") \
        .save()

    print("✅ Data successfully written to MySQL!")

    spark.stop()


if __name__ == "__main__":
    # CLI args from airflow DAG → BashOperator
    input_path = sys.argv[1]
    mysql_url = sys.argv[2]
    mysql_user = sys.argv[3]
    mysql_password = sys.argv[4]

    main(input_path, mysql_url, mysql_user, mysql_password)
