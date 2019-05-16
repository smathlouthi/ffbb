#!/usr/bin/bash

#activer mode maintenance
drush sset system.maintenance_mode = 1

#recuperer le code
git pull origine master


#ajouter vider le dossier vendor

#reintsaller les librairies
composer install --no-dev

#vider le cache avant le dump
drush cr

#faire un backup de la bd
 drush sql-dump > my-sql-dump-file-name.sql

#Mise à jour de la base
drush updb -y

#exporter les config de prod a part
drush csex prod -y

#importer les config de de synch
drush cim -y

#vider le cache
drush cr

#desactiver mode maintenance
drush sset system.maintenance_mode = 0
