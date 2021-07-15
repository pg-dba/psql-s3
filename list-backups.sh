RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}full backup list:${NC}"

barman-cloud-backup-list -P ${AWS_PROFILE_MINIO} --endpoint-url ${MINIO_ENDPOINT_URL} s3://backups $1
