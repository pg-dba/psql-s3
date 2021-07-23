#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "\n${RED}postgres container must be stopped.${NC}"
echo -e "\n${YELLOW}restore example:${NC}"
echo -e "\n${YELLOW}./list-backups.sh${NC}"
echo -e "${YELLOW}./list-backups.sh private-postgres-1${NC}"
echo -e "\n${YELLOW}./restore.sh private-postgres-1 20210715T095028${NC}"
echo -e "${YELLOW}./restore.sh private-postgres-1 20210715T095028 '2021-07-15 10:05:10'${NC}"
