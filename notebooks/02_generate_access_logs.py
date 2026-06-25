# Databricks notebook source
from pyspark.sql import functions as F

# COMMAND ----------

access_logs = (
    spark.range(100000)

    .withColumn(
        "table_name",
        F.expr("""
        CASE
            WHEN rand() < .10 THEN 'customers'
            WHEN rand() < .20 THEN 'orders'
            WHEN rand() < .30 THEN 'payments'
            WHEN rand() < .40 THEN 'products'
            WHEN rand() < .50 THEN 'inventory'
            WHEN rand() < .60 THEN 'sales'
            WHEN rand() < .70 THEN 'employees'
            WHEN rand() < .80 THEN 'shipments'
            WHEN rand() < .90 THEN 'transactions'
            ELSE 'audit_logs'
        END
        """)
    )

    .withColumn(
        "user_name",
        F.concat(
            F.lit("user_"),
            (F.rand()*50).cast("int")
        )
    )

    .withColumn(
        "access_type",
        F.expr("""
        CASE
            WHEN rand() < .80 THEN 'READ'
            ELSE 'WRITE'
        END
        """)
    )
)

# COMMAND ----------

access_logs = access_logs.withColumn(
    "access_timestamp",
    (F.current_timestamp() - F.expr("CAST(rand() * 180 AS INT)") * F.expr("INTERVAL 1 DAY"))
)

# COMMAND ----------

access_logs.write \
.mode("overwrite") \
.format("delta") \
.saveAsTable(
"workspace.platform_monitoring.access_logs"
)

# COMMAND ----------

spark.table(
"platform_monitoring.access_logs"
).show(20,False)

# COMMAND ----------

spark.sql("""

SELECT
COUNT(*)
FROM platform_monitoring.access_logs

""").show()