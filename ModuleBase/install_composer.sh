#!/bin/bash

if [ -f "$WWWHOME/composer.phar" ]
then
    echo "Composer already installed ..."
else
    EXPECTED_SIGNATURE="$(wget -q -O - https://composer.github.io/installer.sig)"
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    ACTUAL_SIGNATURE="$(php -r "echo hash_file('SHA384', 'composer-setup.php');")"

    if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
    then
        >&2 echo 'ERROR: Invalid installer signature'
        rm composer-setup.php
        exit 1
    fi

    php composer-setup.php
    rm composer-setup.php
fi

if [ -f "$WWWHOME/C2M/composer.json" ]
then
    echo "Symfony already installed ..."
    cd C2M
    git fetch --all
else
    # echo "Installing Symfony 4 in $WWWHOME ..."
    # if [ -f "$WWWHOME/C2M/README.md" ]
    # then
    #     echo "Symfony directory not empty -> Updating ..."
    #     php composer.phar create-project symfony/website-skeleton ./tmpInstall/C2M
    #     cp -R ./tmpInstall/C2M/* ./C2M/
    #     rm -rf ./tmpInstall/C2M
    # else
    #     php composer.phar create-project symfony/website-skeleton ./C2M
    # fi
    git clone https://github.com/JulienMarusi/C2M.git
    cd C2M
    npm install yarn
fi

echo "Updating packets"
php ../composer.phar install
yarn install
yarn encore dev

echo "Install OK"
exit $?