#!/bin/sh

# Mongodb DB host
HOST=
# Mongodb DB name
DBNAME=
# Mongodb Port number
PORT=27017
# Mongodb user
USER=
# Mongodb password
PASS=""
# Current time
TIME=`/bin/date +%d-%m-%Y-%T`
# Backup directory destination
DEST=/home/mongodb_backup/$TIME
# Create backup dir (-p to avoid warning if already exists)
/bin/mkdir -p $DEST
# ZIP file location
ZIP=$DEST/../$TIME.zip
# Log
echo "Backing up $HOST/$DBNAME to email on $TIME";
# Dump from mongodb host into backup directory
/usr/bin/mongodump --uri=""  --out $DEST
# Create zip with password of backup directory
cd $DEST && /usr/bin/zip -P $PASS -r ../$TIME.zip .

# SMTP setting for sending through mail
SMTP=
# SMTP Port
SMTP_PORT=
# SMTP User
SMTP_USER=
# SMTP Pass
SMTP_PASS=
#Email
TO=
SUBJECT="[DBBackup] as of $TIME"
BODY="Hello Admin,\nDB Backup operation has been performed for backing up $HOST/$DBNAME at $TIME (d-m-y time).\nPlease find the backup at the attachment.\nKind regards,\nDBBackup Ops"
# Send email with backup file is attached
/usr/bin/sendemail -f "BackupDBOps <$SMTP_USER>" -t "Admin<$TO>" -o tls=yes -s $SMTP:$SMTP_PORT -xu $SMTP_USER -xp $SMTP_PASS -u $SUBJECT -m $BODY -a $ZIP

# Remove zip file locally if you want uncomment this
/bin/rm -f $ZIP

# Remove backup directory if you want uncomment this
/bin/rm -rf $DEST
# All done
echo "Backup and send email operation are done!"
