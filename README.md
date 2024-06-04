## Mongo Backup Script

> A Lightweight shell script designed to automate the backup process of MongoDB databases and send the backup files via email. This script ensures that your database backups are created securely and efficiently, with an easy-to-follow setup and execution process.

<a href="https://ibb.co/HnHB615"><img src="https://i.ibb.co/J5smV0D/Add-a-heading-1.png" alt="Add-a-heading-1" border="0"></a>

### Features

> <ul>
>  <li>Automated Backups: Schedule backups to run automatically at specified intervals using cron jobs.</li>
>  <li>Pre-Defined Date Ranges: Easily select common date ranges such as: 
>  <ul>
>    <li>Last 6 Months</li>
>        <li>Last 3 Months</li>
>        <li>Current Month</li>
>  </ul>
>  </li>
>  <li>Compression: Creates a compressed ZIP file of the backup directory with optional password protection.</li>
>  <li>Email Notifications: Sends the backup file as an email attachment to a specified email address.</li>
>  <li>Customizable Settings: Easily configure MongoDB connection details, email SMTP settings, and backup directory paths.</li>
>  <li>Log Generation: Generates logs of the backup operation for easy monitoring and troubleshooting.</li>
> </ul>

### Pre-Requists

> sendemail
> ```# Make sure to:
 - Name this file `mongobackup.sh` and place it in /home/$userdir
 - Run sudo apt-get install sendemail to install the sendemail for sending the backup file through email
 - Fill in DB host, name, port number, user and password
 - Run chmod +x mongobackup.sh
 - Test it out via ./mongobackup.sh
 - Set up a monthly backup via `crontab -e`:
    0 0 1 * * /home/ubuntu/mongobackup.sh > /home/ubuntu/backup.log```
>
>
>
