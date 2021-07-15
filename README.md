# psql-s3

docker build -t psql-s3 .

docker run --rm --network host --name psql-s3 -it \\<BR>
 -e AWS_PROFILE_MINIO=minio \\<BR>
 -e AWS_ACCESS_KEY_ID=minioadmin \\<BR>
 -e AWS_SECRET_ACCESS_KEY=P@ssw0rd \\<BR>
 -e MINIO_ENDPOINT_URL=http://u20d1h4:9000 \\<BR>
 -v /data/postgres:/var/lib/postgresql/data \\<BR>
 psql-s3 bash
