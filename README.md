# psql-s3

<B>version:</B><BR>
<BR>
psql 10.17<BR>
barman-cli 2.15<BR>
awscli 1.19<BR>
mc RELEASE.2021-06-13T17-48-22Z
<BR><BR>
<B>examples:</B><BR>
<BR>
docker build -t psql-s3 .

docker run --rm --network host --name psql-s3 --hostname psql-s3 -it \\<BR>
 -e MINIO_BACKET=mybackups \\<BR>
 -e AWS_ACCESS_KEY_ID=minioadmin \\<BR>
 -e AWS_SECRET_ACCESS_KEY=P@ssw0rd \\<BR>
 -e MINIO_ENDPOINT_URL=http://u20d1h4:9000 \\<BR>
 -v /data/postgres:/var/lib/postgresql/data \\<BR>
 psql-s3 bash
