#!/bin/bash -eu

clear 
echo 'Installatie van de JAVA EE STACK.'
echo '---------------------------------'

echo 'Systeemsupdate wordt uitgevoerd'
echo '-------------------------------'
sudo yum update -y


echo 'Java wordt geïnstalleerd'
echo '-------------------------------'
yum install java -y

echo 'Installatie van tools'
echo '-------------------------------'

yum install net-tools unzip wget -y

cd /opt

echo 'Tomcat wordt gedownload en geïnstalleerd'
echo '----------------------------------------'
wget http://mirror.reverse.net/pub/apache/tomcat/tomcat-8/v8.0.20/bin/apache-tomcat-8.0.20.tar.gz

tar -zxvf apache-tomcat-8.0.20.tar.gz

mv apache-tomcat-8.0.20 tomcat

cd /etc/profile.d/

wget http://goo.gl/lVYDqH?gdriveurl -O script.sh


chmod +x script.sh

cd /opt/tomcat/bin

chmod +x startup.sh
chmod +x shutdown.sh
chmod +x catalina.sh

echo 'Tomcat wordt gestart'
echo '-------------------------------'

bash startup.sh

echo 'Installatie firewall'
echo '------------------------'
systemctl enable firewalld
systemctl start firewalld
firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload

echo 'De installatie is klaar!'
echo '-------------------------------'



