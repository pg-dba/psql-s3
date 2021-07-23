#!/bin/bash

aws configure --profile ${AWS_PROFILE_MINIO:-minio} set aws_access_key_id "${AWS_ACCESS_KEY_ID}"
aws configure --profile ${AWS_PROFILE_MINIO:-minio} set aws_secret_access_key "${AWS_SECRET_ACCESS_KEY}"
mc config --quiet host add ${AWS_PROFILE_MINIO} ${MINIO_ENDPOINT_URL} ${AWS_ACCESS_KEY_ID} ${AWS_SECRET_ACCESS_KEY}

#cat /root/.aws/credentials 
#cat /var/lib/postgresql/.aws/credentials 

echo "echo ''" >> /root/.bashrc
echo "RED='\033[0;31m'" >> /root/.bashrc
echo "YELLOW='\033[1;33m'" >> /root/.bashrc
echo "NC='\033[0m'" >> /root/.bashrc

echo 'echo -e "${RED}postgres container must be stopped.${NC}"' >> /root/.bashrc
echo "echo ''" >> /root/.bashrc
echo 'echo -e "${YELLOW}restore example:${NC}"' >> /root/.bashrc
echo 'echo -e "${YELLOW}./list-backups.sh private-postgres-1${NC}"' >> /root/.bashrc
echo 'echo -e "${YELLOW}./restore.sh private-postgres-1 20210715T095028${NC}"' >> /root/.bashrc
echo "echo ''" >> /root/.bashrc

"$@"
