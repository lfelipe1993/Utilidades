#!/bin/bash

# A simple script to perform postgres db backup.

DATE=$(date +"%Y_%m_%d_%H_%M")
PGPATH=/usr/pgsql-11/

cd /home/gerenciador/backups

# TODO : Update your servername, username and database names

PGPASSWORD="#S@p4ttu&gfx7q5n#" $PGPATH/bin/pg_dump -h 127.0.0.1 -U pgsapattu -F t gerenciador > gerenciador_${DATE}.tar

PGPASSWORD="#S@p4ttu&gfx7q5n#" $PGPATH/bin/pg_dump -h 127.0.0.1 -U pgsapattu -F t dw_setabi > dw_setabi_${DATE}.tar

gzip gerenciador_${DATE}.tar
gzip dw_setabi_${DATE}.tar

# Cleanup configuration backups older than 30 days. 
#You can comment or adjust this if you donot want to delete old backups.

find /home/gerenciador/backups -name "gerenciador*.gz" -mtime +30 -type f -delete
find /home/gerenciador/backups -name "dw_setabi*.gz" -mtime +30 -type f -delete
