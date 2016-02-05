#!bin/bash

log() { echo "$1"; }
succeed() { echo "Dev install succeeded" && exit 0; }

#trap fail ERR
log 'Downloading claroline/Claroline archive...'
    wget https://github.com/claroline/Claroline/archive/5.x.zip
    unzip master.zip
    mv Claroline-master Claroline
    rm master.zip
    cd Claroline
log 'Installing dependencies...'
    composer require composer/composer dev-master --prefer-source
    composer require claroline/bundle-recorder "~5.0" --prefer-source

    log "Copying composer min"
    cp composer.json.min composer.json
    cp app/config/parameters.yml.dist app/config/parameters.yml
    composer update --no-dev --prefer-source -o
log 'Adding placeholders...'
    touch app/cache/.gitkeep
    touch app/logs/.gitkeep
log 'Removing operations file...'
    rm app/config/operations.xml
log 'Updating permissons...'
    chmod -R 0777 app/cache
    chmod -R 0777 app/sessions
    chmod 0777 app/config
    chmod 0777 app/config/bundles.ini
    chmod 0777 app/config/parameters.yml
    chmod 0777 app/config/platform_options.yml
    chmod 0777 app/config/ips
    chmod -R 0777 app/logs
    chmod -R 0777 files
    chmod -R 0777 web/uploads
    #these are some basic permissions. Feel dree to change them.
succeed


