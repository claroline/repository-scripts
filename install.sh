#!bin/bash

log() { echo "$1"; }
succeed() { echo "Dev install succeeded" && exit 0; }

#trap fail ERR
log 'Downloading claroline/Claroline archive...'
    wget https://github.com/claroline/Claroline/archive/master.zip
    unzip master.zip
    mv Claroline-master Claroline
    rm master.zip
    cd Claroline
log 'Installing dependencies...'
    log "Copying composer min"
    cp composer-min.json composer.json
    cp app/config/parameters.yml.dist app/config/parameters.yml
    composer update --no-dev --prefer-source -o
log 'Removing operations file...'
    rm app/config/operations.xml
log 'Updating permissons...'
    # these are some basic permissions. Feel free to change them.
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
succeed


