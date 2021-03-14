#!/bin/bash
BASE_DIR='/docker-deployments'

echo -e "Update bibliogram image and restart container\n"
cd ${BASE_DIR}/bibliogram && \
docker-compose pull && docker-compose up --detach --force-recreate --remove-orphans
echo -e "bibliogram update done\n"

echo -e "Update libreddit image and restart container\n"
cd ${BASE_DIR}/libreddit && \
docker-compose pull && docker-compose up --detach --force-recreate --remove-orphans
echo -e "libreddit update done\n"

echo -e "Update nitter image and restart container\n"
cd ${BASE_DIR}/nitter && \
docker-compose pull && docker-compose up --detach --force-recreate --remove-orphans
echo -e "nitter update done\n"

echo -e "Update whoogle image and restart container\n"
cd ${BASE_DIR}/whoogle-search && \
docker-compose pull && docker-compose up --detach --force-recreate --remove-orphans
echo -e "whoogle update done\n"

echo "Now cleanup old images and volumes:"
docker system prune --volumes --force

echo -e "Configure Whoogle via curl:"
docker run --rm --network traefik_default curlimages/curl \
  whoogle-search:5000/config \
  -d 'lang_interface=lang_en&lang_search=lang_en&alts=on' \
  --retry 5 --retry-delay 10 --retry-connrefused
