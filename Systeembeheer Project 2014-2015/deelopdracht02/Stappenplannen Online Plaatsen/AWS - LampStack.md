## AWS - LampStack

Aangezien ons github-studentpack nog niet beschikbaar was, kozen we voor de amazon web service: 


inloggegevens:
> dready701@hotmail.com - schoolproject

Opletten dat je enkel de gratis zaken gebruikt, aangezien er een creditcard aan gekoppeld is!

### Stap Een - Instellingen Amazon EC2
De nodige documentatie staat mooi gedocumenteerd op
[deze link](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/get-set-up-for-amazon-ec2.html)

Als dit doorlopen is, kunnen we door naar de volgende stap.

### Stap Twee - Lanceren EC2 Applicatie
ook [hier](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-instance_linux.html) bestaat er een goed stappenplan.

**OPGELET: Bij Stap 3: hier kiezen we voor de officiële centos 7 image.**

### Stap Drie - Vanuit Windows met de virtuele machine connecteren

Als stap 2 vlot verlopen is, staat er nu een verse centos 7 editie in de cloud. In deze stap gaan we hiermee verbinding maken zodat we ook daadwerkelijk zaken kunnen uitvoeren.

[Deze link](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html) beschrijft hoe je:

1) Via Putty verbinding maakt via SSH

2) Via WinSCP een ftp-verbinding legt voor bestandsoverdrachten.

Normaal gezien heb je na deze stappen een werkende terminal, en wordt het tijd voor de laatste stap.

### Stap Vier - Lampstack Installeren en testen
Hierbij volg je de uitleg  [uit deelopdracht 2](https://github.com/HoGentTIN/ops-g-08/blob/master/deelopdracht02/Stappenplannen%20Opstellen%20Servers/Lamp-Stack.md) tot stap 5.

**vervolgens maken we de firewall in orde:**

1) De firewall package installeren:
> sudo yum install -y firewalld

2) inschakelen en starten firewall
> systemctl enable firewalld

> systemctl start firewalld

3) HTTP toevoegen
> sudo firewall-cmd --permanent --add-service=http

4) Reload settings
> sudo firewall-cmd --reload

**Als laatste maken we de testbestanden aan**

1) Aanmaken Script-bestand in de web root
> sudo vi /var/www/html/info.php

vul in de editor het volgende in:
> <?php phpinfo(); ?>

Dit is een standaard php-commando, die we via een browser gaan proberen aanroepen.

Verlaat vervolgens de Editor (ESC), en sla op (duw op " : " en typ " wq! " )

2) Maak van de homefolder een index-menu
> vi /etc/httpd/conf.d/welcome.conf

verander 
> Options **-**Indexes

naar
> Options **+**indexes

en sla op (:wq!)

2) Restart de server 
> sudo systemctl restart httpd

3) Vervolgens gaan we naar het amazon EC2 console panel en achterhalen het public ip van onze instantie. Dit kan men gewoon aflezen van het algemeen overzicht.

4) Kopieer dit ip-adres in je adresbalk. Als alles goed gaat krijg je nu een index-pagina te zien.

5) Als laatste test controleren we of php werkt, dit doen we door naar 
>$vulhierhetpublicipin/info.php 

te surfen. 
