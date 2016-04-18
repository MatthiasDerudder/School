## AWS - Javastack	

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
Hierbij volg je de uitleg  [uit deelopdracht 2](https://github.com/HoGentTIN/ops-g-08/blob/master/deelopdracht02/Stappenplannen%20Opstellen%20Servers/JAVA-EE-Stack.md)

### Stap Vijf - Testen of alles werkt

1) Ga naar het EC2 controlepaneel en achterhaal het public IP.

2) Kopieer dit ip-adres in je adresbalk en zet er ':8080' achter.

> vb: 192.168.52.103:8080

3) Als het goed is gelukt kom je nu op het controlepaneel van Tomcat, gefeliciteerd!




