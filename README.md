# psql-s3

<B>version:</B><BR>
<BR>
psql 10.19<BR>
barman-cli 2.17<BR>
awscli 1.18<BR>
mc RELEASE.2021-12-16T23-38-39Z
<BR><BR>
<B>examples:</B><BR>
<BR>
docker build -t psql-s3 .

docker run --rm --network host --name psql-s3 --hostname psql-s3 -it \\<BR>
 -e MINIO_BUCKET=mybackups \\<BR>
 -e MINIO_ACCESS_KEY_ID=minioadmin \\<BR>
 -e MINIO_SECRET_ACCESS_KEY=P@ssw0rd \\<BR>
 -e MINIO_ENDPOINT_URL=http://u20d1h4:9000 \\<BR>
 -v /data/postgres:/var/lib/postgresql/data \\<BR>
 psql-s3 bash

docker run --rm --network host --name psql-s3 --hostname psql-s3 -it \\<BR>
 -e MINIO_BUCKET=backups \\<BR>
 -e MINIO_ACCESS_KEY_ID=minioadmin \\<BR>
 -e MINIO_SECRET_ACCESS_KEY=P@ssw0rd \\<BR>
 -e MINIO_ENDPOINT_URL=http://172.27.172.91:30000 \\<BR>
 -v /data/pg1/data:/var/lib/postgresql/data \\<BR>
 psql-s3 bash

