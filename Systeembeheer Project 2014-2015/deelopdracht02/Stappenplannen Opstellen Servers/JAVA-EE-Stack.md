## Apache tomcat installeren op CentOS 7

### Stap Eén - Tomcat downloaden en installeren



1) Root worden en Java installeren
>  su
>   
>  yum install java-1.7.0-openjdk
     

2) Tomcat downloaden
> cd /opt
> 
> yum install wget
> 
> wget http://apache.mirrors.hoobly.com/tomcat/tomcat-8/v8.0.18/bin/apache-tomcat-8.0.18.tar.gz

3) Files unzippen
> cd /usr/share/
> 
> tar -zxvf /tmp/apache-tomcat-8.0.18.tar.gz

> mv apache-tomcat-8.0.15 tomcat

### Stap twee - Omgevingsvariabelen instellen via mijn script

1) Script downloaden
> wget http://goo.gl/6D7JTf?gdriveurl -O script.sh

2) Verplaatsen en gepaste rechten geven

> mv script.sh /etc/profile.d/

> chmod +x /etc/profile.d/script.sh

> chmod +x /opt/tomcat/bin/startup.sh

> chmod +x /opt/tomcat/bin/shutdown.sh

> chmod +x /opt/tomcat/bin/catalina.sh

###Stap drie - Firewall openzetten
1) Firewall commands
> firewall-cmd  --add-port=8080/tcp --permanent

> firewall-cmd --reload


###Stap vier - De server starten


1) Tomcat opstarten
/opt/tomcat/bin/startup.sh




