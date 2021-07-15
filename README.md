# psql-s3

docker build -t psql-s3 .

docker run --rm --network host --name psql-s3 -it \\
 -e AWS_PROFILE_MINIO=minio \\
 -e AWS_ACCESS_KEY_ID=minioadmin \\
 -e AWS_SECRET_ACCESS_KEY=P@ssw0rd \\
 -e MINIO_ENDPOINT_URL=http://u20d1h4:9000 \\
 -v /data/postgres:/var/lib/postgresql/data \\
 psql-s3 bash
