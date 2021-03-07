#!/bin/bash
BASE_DIR='/docker-deployments'

echo -e "Update libreddit image and restart container\n"
cd ${BASE_DIR}/libreddit && \
docker-compose pull && docker-compose up --detach --force-recreate --remove-orphans
echo -e "libreddit update done\n"

echo -e "Update whoogle image and restart container\n"
cd ${BASE_DIR}/whoogle && \
docker-compose pull && docker-compose up --detach --force-recreate --remove-orphans
echo -e "whoogle update done\n"

echo "Now cleanup old images and volumes"
docker system prune --volumes --force
