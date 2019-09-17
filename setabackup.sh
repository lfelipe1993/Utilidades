diadia=`date +%d`
semana=`date +%a`
export PGPASSWORD=xxxxx

find /backup/ -name "*.backup" -mtime +1 -print -delete


## Acessa Binario
cd /
cd /usr/pgsql-11/bin

## Faz o Backup no local indicado
./pg_dump -h localhost -p 5432 -U postgres -F c -b -v -f /backup/Pentaho_$semana.backup  xxxxx
cd /

cd /script


sshpass -p bola1020## scp -P 3322 /backup/Pentaho_$semana.backup setadigital_@10.10.10.69:/setadb/backup/Pentaho.backup

ftp -inv 10.10.10.200 << EOF > log1.txt 2>&1
  user gm wki10#jk*###
  cd gm
  put /backup/Pentaho_$semana.backup Pentaho_$semana.backup
  bye
EOF

ftp -inv 10.10.10.205 << EOF > log2.txt 2>&1
  user setabac5 seta123##@@
  cd setabac5
  put /backup/Pentaho_$semana.backup Pentaho_$diadia.backup
  bye
EOF

ftp -inv 10.10.10.203 << EOF > log3.txt 2>&1
  user gm gm102030##$$
  cd gm
  put /backup/Pentaho_$semana.backup Pentaho_$semana.backup
  bye
EOF





