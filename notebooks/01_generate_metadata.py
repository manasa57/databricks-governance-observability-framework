# Databricks notebook source
from pyspark.sql import Row
from pyspark.sql import functions as F
import json

# COMMAND ----------

tables = spark.catalog.listTables(
    "platform_monitoring"
)

print(f"Total Tables Found: {len(tables)}")

# COMMAND ----------

metadata_rows = []

for table in tables:

    table_name = table.name

    df = spark.table(
        f"platform_monitoring.{table_name}"
    )

    row_count = df.count()

    column_count = len(df.columns)

    schema_json = json.dumps(
        df.schema.jsonValue()
    )

    metadata_rows.append(
        Row(
            table_name=table_name,
            row_count=row_count,
            column_count=column_count,
            schema_json=schema_json
        )
    )

print("Metadata Collection Complete")

# COMMAND ----------

metadata_df = spark.createDataFrame(
    metadata_rows
)

metadata_df.show(
    truncate=False
)

# COMMAND ----------

metadata_df = (
    metadata_df
    .withColumn(
        "metadata_collection_time",
        F.current_timestamp()
    )
    .withColumn(
        "owner",
        F.lit("platform_team")
    )
)

# COMMAND ----------

metadata_df.write \
.mode("overwrite") \
.format("delta") \
.saveAsTable(
"platform_monitoring.table_metadata"
)

# COMMAND ----------

spark.table(
"platform_monitoring.table_metadata"
).show(
50,
False
)

# COMMAND ----------

spark.sql("""

SELECT

COUNT(*) total_tables,

SUM(row_count) total_rows

FROM platform_monitoring.table_metadata

""").show()

# COMMAND ----------

metadata_df.write \
.mode("append") \
.format("delta") \
.saveAsTable(
"platform_monitoring.table_metadata_history"
)