root@u16d1h5:~# nano restore.sh 
root@u16d1h5:~# cat restore.sh 
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

if [[ ! -z "$1" ]] && [[ ! -z "$2" ]]; 
then

rm -rf /var/lib/postgresql/data/*
rm -rf /var/lib/postgresql/data/.barman-recover.info 
echo -e "${YELLOW}directory must be empty before restore${NC}"
ls -la /var/lib/postgresql/data/

echo -e "${RED}full backup $1 restoring...${NC}"
barman-cloud-restore -P ${AWS_PROFILE_MINIO} --endpoint-url ${MINIO_ENDPOINT_URL} s3://backups $1 $2 /var/lib/postgresql/data/

echo -e "${YELLOW}prepare for WAL restore:${NC}"

rm -f /var/lib/postgresql/data/recovery.done

echo -e "${YELLOW}disable archiving at time restoring WAL${NC}"
sed -i 's/DEBUG=1/DEBUG=0/' /var/lib/postgresql/data/archive_wal.sh 
sed -i 's/LOG=1/LOG=0/' /var/lib/postgresql/data/archive_wal.sh 
sed -i 's/ARCHIVE=1/ARCHIVE=0/' /var/lib/postgresql/data/archive_wal.sh 
cat /var/lib/postgresql/data/archive_wal.sh | grep -v -P '^\s*(#|;|$)' | grep "DEBUG=\|LOG=\|ARCHIVE="

echo -e "${YELLOW}command for restoring WAL${NC}"
echo "restore_command = 'barman-cloud-wal-restore -P ${AWS_PROFILE_MINIO} --endpoint-url ${MINIO_ENDPOINT_URL} s3://backups $1 %f %p'" > /var/lib/postgresql/data/recovery.conf
echo "recovery_target_timeline = 'latest'" >> /var/lib/postgresql/data/recovery.conf

chown 999:999 /var/lib/postgresql/data/recovery.conf
cat /var/lib/postgresql/data/recovery.conf
chown 999:999 /var/lib/postgresql/data/backup_label

echo -e "${YELLOW}completed:${NC}"
ls -la /var/lib/postgresql/data/

echo -e "${YELLOW}You can start the container. And control:${NC}"
echo 'cat $(ls -tr /var/lib/postgresql/data/log/*.csv | tail -n1) | grep "archive recovery complete\|database system is ready to accept connections" | tail -n2'
echo ''
echo -e "${YELLOW}Then run:${NC}"
echo 'sed -i "s/ARCHIVE=0/ARCHIVE=1/" /var/lib/postgresql/data/archive_wal.sh'
echo ''

else

echo -e "${RED}must be 2 parameters${NC}"

fi
