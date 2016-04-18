## Opzetten Lamp Stack op Centos 7

### Stap Eén - User Setup
-> Als root-gebruiker invoeren:

1) Nieuwe gebruiker, genaamd admin, aanmaken 
>   /usr/sbin/adduser admin

2) passwoord voor dit account aanmaken
> passwd admin

3) Sudo-rechten aan deze gebruiker koppelen
> gpasswd -a admin wheel

4) Inloggen als admin
> su admin

### Stap Twee - Installeer En Run Apache
1) Apache installeren via yum
> sudo yum install httpd

2) Start apache-service
> sudo systemctl start httpd.service

3) Zorg dat apache opstart bij het opstarten van de machine
> sudo systemctl enable httpd.service

### Stap Drie - Installeer En Run Een MySQL-Server
1) Installeren via yum
> sudo yum install mariadb-server mariadb

2) start MariaDB
> sudo systemctl start mariadb

3) Start en run het basis beveiligingsscript
> sudo mysql_ secure_installation

4) laat de MySQL starten bij het opstarten 
> sudo systemctl enable mariadb.service

### Stap Vier - Installeer PHP
1) Installeren via yum
> sudo yum install php php-mysql

2) Start php service
> sudo systemctl restart httpd.service

### Stap Vijf - Firewall Configuratie
1) Controleer of HTTP reeds toegestaan is door de firewall
> sudo firewall-cmd --list-all

Bij services zou hier HTTP moeten staan. Zoniet:
> sudo firewall-cmd --permanent --add-service=http

--permanent zorgt er hier voor dat de HTTP-service ook opstart bij het opstarten

2) Reload settings
> sudo firewall-cmd --reload


### Stap Zes - Testen
1) Aanmaken Script-bestand in de web root
> sudo vi /var/www/html/info.php

vul in de editor het volgende in:
> <?php phpinfo(); ?>

Dit is een standaard php-commando, die we via een browser gaan proberen aanroepen.

Verlaat vervolgens de Editor (ESC), en sla op (duw op " : " en typ " wq! " )

2) Acherhaal het ip van onze webserver:
> ip a

Stanaard in virtualbox is dit het ipadres: 
> http://192.168.56.101

3) Ga nu naar een browser buiten je Virtuele machine en ga naar:
> http://192.168.56.101/info.php

Als alles vlot is verlopen krijg je het volgende scherm te zien:
![phpinfo](https://github.com/HoGentTIN/ops-g-08/blob/master/deelopdracht02/Stappenplannen%20Opstellen%20Servers/vb-phpinfo.jpg)

### Stap Zeven - Installeren PHPMyAdmin
PhpMyadmin maakt het mogelijk zeer makkelijk MySql-databases te beheren.
1) Maak van de homefolder een index-menu
> vi /etc/httpd/conf.d/welcome.conf

verander 
> Options **-**Indexes

naar
> Options **+**indexes

en sla op (:wq!)

2) Restart server en bekijk het resultaat
> systemctl restart httpd

Je zou nu dit moeten zien als je naar de server surft vanuit de Guest:

![foto](http://puu.sh/gnhzf/8e530e5fe3.png)

3) PhpMyadmin behoort niet tot de basis van Centos, dus moeten we een externe package toevoegen:
>sudo yum install epel-release

4) Vervolgens installeren we de phpMyAdmin-package
> yum install phpmyadmin

5) Nadien zorgen we ervoor dat we overal aan phpmyadmin kunnen
> vi /etc/httpd/conf.d/phpMyAdmin.conf 

Verwijder alles en vervang door de info op deze [ link ](http://ask.xmodulo.com/install-phpmyadmin-centos.html)

6) Vervolgens voegen we een glassfish code toe:
>vi /etc/phpMyAdmin/config.inc.php

en verander de lange cijferreeks bij $cfg[blowfish_secret] door

> d9^l6n$jOhfoA5S5K)pmcxjk{*X#sl9W87r*$y~8

en sla op (:wq!)

7) herstart de server nog een laatste maal
> systemctl restart httpd

8) Ga nu naar de browser van je host-machine en ga naar:
> vervang-dit-door-server-ip/phpmyadmin

normaal krijg je dit scherm te zien:
![phpmyadmin](http://puu.sh/gnitz/bca248d4a4.png)

En kan je inloggen met je Root-gegevens van de Guest-machine
