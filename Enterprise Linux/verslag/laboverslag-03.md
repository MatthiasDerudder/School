## Laboverslag 03

- Naam cursist: Matthias Derudder
- Bitbucket repo: https://bitbucket.org/Matthyz/enterprise-linux-labo

### Procedures

1. Toevoegen hosts pu001 en pu002 in vagrant_hosts
2. pu001.yml (binds, packages, repositories, firewall)
3. pu002.yml (binds, packages, repositories, firewall)
4. site.yml toevoegen van hosts pu001 en pu002
5. tests plaatsen in mapjes volgens server namen

### Testplan en -rapport

####Testplan

-Run runbats.sh op elke machine uitvoeren

-Run het dig commando

*dig 192.0.2.10 linuxlab.net

*dig 192.0.2.11 linuxlab.net

####Testrapport

-De testen geven geen errors

-De dig commandos gaven geen error

### Retrospectieve

Reflecteer na afwerken van het labo over volgende vragen en licht toe:

#### Wat ging goed?

Geen echte problemen tegengekomen enkel wat gestruikeled over kleine zaken zoals de firewall.

#### Wat ging niet goed?

Wat problemen met de firewall en had ergens een verkeerd ip address gezet waardoor vagrant up met een error kwam.

#### Wat heb je geleerd?

-Opzetten van dns
-Master/slave bij dns
-Firewall configuratie
-Troubleshooting IP adressen

#### Waar heb je nog problemen mee?

