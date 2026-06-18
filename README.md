# Hands-on: AWS Core Services (S3, Glue, CloudWatch, Athena)
This repository contains files related to the *Hands-On: AWS Core Services (S3, Glue, CloudWatch, Athena)*.

The SQL syntax used in the five queries is stored in the file `athena_queries.sql`.

One csv-file (`Amazon Sale Report.csv`) was downloaded from Kaggle and it was pre-processed locally prior to uploading it into an S3 bucket. For example, the names of columns were re-written in lowercase without spaces (instead of spaces, hyphens were employed). The name of the csv-file was also changed to `sales_report.csv`, initially there were errors while executing the queries in Athena becase of the table name inhereted the file name with spaces.

The five queries that were executed in Athena did yield output files which are stored under the directory `output_tables/`.

Below, images generated with screenshots of CloudWatch, IAM and S3 are reported.

### Screenshot 1
![View of CloudWatch](https://github.com/acintron-a/HO-L9-AC/raw/main/images/cloudwatch_ac.png)

### Screenshot 2
![View of IAM](https://github.com/acintron-a/HO-L9-AC/raw/main/images/aim_ac.png)

### Screenshot 3
![View of S3 buckets](https://github.com/acintron-a/HO-L9-AC/raw/main/images/s3_ac.png)
