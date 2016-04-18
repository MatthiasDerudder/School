## Laboverslag: Taak 2: LAMP stack

- Naam cursist: Matthias Derudder
- Bitbucket repo: https://bitbucket.org/Matthyz/enterprise-linux-labo

### Procedures

1. Toevoegen packages
2. Configuratie MariaDB
3. Wordpress pagina configuratie
4. Correct configureren van de firewall
5. SELinux-configuratie
6. Self-signed certificate aanmaken
7. Self-signed certificate opzetten
8. Runbats.sh runnen met lampbats.

### Testplan en -rapport

####Testplan

1. Importeer lamp.sh, configureer de variabelen
2. Runbats.sh
3. Vagrant destroy -f en vagrant up
4. Pas configuraties toe en run runbats.sh

####Testrapport:

Enkel een kleine (kwaadloze?) bug  met EPEL repository (zie wat ging niet goed)

Anders geen fouten.

### Retrospectieve

Reflecteer na afwerken van het labo over volgende vragen en licht toe:

#### Wat ging goed?

Packages installeren.
Alle configuratie ging vlot.

#### Wat ging niet goed?

Wat lukte (eerst) niet? Welke problemen ben je tegengekomen (en hoe ben je tot een oplossing gekomen)? Wat hield je tegen om de opdracht tot een goed einde te brengen?

Zat even bezig met het certificate juist toe te passen. Opgelost door research via google.

Bij het testen faalde de eerste, de EPEL repository test. Dit is te fixen door opnieuw yum install epel-realese te runnen alhoewel de uitkomst van deze install zal zijn: already installed.

#### Wat heb je geleerd?

Ga ook wat verder kijken dan de voor de hand liggende zaken.

Certificaat correct installeren

Configureren van firewall binnen Centos.

Werken met wordpress

#### Waar heb je nog problemen mee?

EPEL test faalt na een bepaalde duur en de install moet altijd opnieuw uitgevoerd worden.


### Referenties

Welke informatiebronnen heb je gebruikt bij het uitwerken van dit labo? Titels van boeken, URL's naar handleiding, HOWTO, enz.

Taak-02-lamp bestand op chamilo

https://www.digitalocean.com/community/tutorials/how-to-create-an-ssl-certificate-on-apache-for-centos-7
https://www.digitalocean.com/community/tutorials/additional-recommended-steps-for-new-centos-7-servers