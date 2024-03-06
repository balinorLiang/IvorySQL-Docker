#!/bin/bash

/var/local/ivorysql/ivorysql-3/bin/initdb -D /var/local/ivorysql/ivorysql-3/data 

sed -ri "s!^#?(listen_addresses)\s*=\s*\S+.*!\1 = '*'!" /var/local/ivorysql/ivorysql-3/data/postgresql.conf; \
    grep -F "listen_addresses = '*'" /var/local/ivorysql/ivorysql-3/data/postgresql.conf

/var/local/ivorysql/ivorysql-3/bin/pg_ctl -D /var/local/ivorysql/ivorysql-3/data -l /var/local/ivorysql/ivory.log start

trap 'echo signal received...' SIGINT SIGTERM
while :
do
 sleep 1
done

wait

echo "IvorySQL database exit..."
