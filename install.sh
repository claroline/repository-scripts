#!bin/bash

log() { echo -e "$1"; }
succeed() { echo -e "Release process succeeded" && exit 0; }

#trap fail ERR
log 'Downloading claroline/Claroline archive...'
    wget https://github.com/claroline/Claroline/archive/master.zip
    unzip master.zip
    mv Claroline-master Claroline
    rm master.zip
    cd Claroline
log 'Installing dependencies...'
    composer require composer/composer dev-master --prefer-source
    composer require claroline/bundle-recorder "~4.0" --prefer-source

    log "Copying composer min"
    cp composer.json.min composer.json
    cp app/config/parameters.yml.dist app/config/parameters.yml
    composer update --no-dev --prefer-source -o
log 'Adding placeholders...'
    touch app/cache/.gitkeep
    touch app/logs/.gitkeep

succeed


