#!/bin/bash -eu
# provision.sh -- Install Apache and a test PHP script

 clear
echo 'Installatie van de LAMP stack, hold your horses!'
echo '------------------------'

echo 'Het systeem wordt geüpdated'
echo '------------------------'
sudo yum update -y

echo 'gebruiker admin, met passwoord admin wordt aangemaakt'
echo '------------------------'
/usr/sbin/adduser admin
usermod -p $(echo admin | openssl passwd -1 -stdin) admin
gpasswd -a admin wheel
echo 'gebruiker admin is aangemaakt!'

echo 'Installatie apache'
echo '------------------------'
yum install -y httpd 
systemctl enable httpd.service
systemctl start httpd.service

echo 'Installatie MySql'
echo '------------------------'
yum install -y mariadb-server mariadb
systemctl start mariadb
#volgende commands automatiseren mysql_secure_installation
mysql -e "UPDATE mysql.user SET Password = PASSWORD('vagrant') WHERE User = 'root'"
mysql -e "DROP USER ''@'localhost'"
mysql -e "DROP USER ''@'$(hostname)'"
mysql -e "DROP DATABASE test"
mysql -e "FLUSH PRIVILEGES"
systemctl enable mariadb.service

echo 'Installatie php'
echo '------------------------'
yum install -y php php-mysql
systemctl restart httpd.service

echo 'Installatie firewall'
echo '------------------------'
systemctl enable firewalld
systemctl start firewalld
firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload

echo 'Aanmaken testbestand phpinfo() in index.php'
echo '------------------------'
cat > /var/www/html/index.php << EOF
<?php phpinfo(); ?>
EOF

echo 'Installatie klaar, have fun!!'


