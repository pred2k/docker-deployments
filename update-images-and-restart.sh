#!/bin/bash
BASE_DIR='/docker-deployments'

# Liste von Verzeichnissen definieren
DIRS=("redlib" "whoogle-search")

# Update-Funktion definieren
update_dir () {
    echo -e "Update $1 image and restart container\n"
    cd ${BASE_DIR}/$1 && \
    docker compose pull && docker compose up --detach --force-recreate --remove-orphans
    echo -e "$1 update done\n"
}

# Aktualisierungsprozess durchlaufen
for dir in "${DIRS[@]}"; do
    update_dir $dir
done

# Aufräumen alter Images und Volumen
echo "Now cleanup old images and volumes:"
docker system prune --volumes --all --force

