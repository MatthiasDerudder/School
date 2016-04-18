## Laboverslag: Linux Troubleshooting

- Naam cursist: Matthias Derudder
- Bitbucket repo: https://bitbucket.org/Matthyz/enterprise-linux-labo

### Procedures

1. Zet keyboard naar azerty Sudo loadkeys be-latin1
2. Check kabels, inclusief virtualbox instellingen
3. Gateway, ip adress en dns-server checken
4. Check the ip adressen: ip a, ip r, cat/etc/resolv.conf
5. Gebruiken van het dig commando.
6. Gebruiken van syntax check.
7. aanpassen van cynaclo.com & var/named/... files (puntjes invullen en aanpassingen maken) Reverse IPs toepassen
8. Iostarten van de service named.service
9. DNS service toevoegen aan firewall
10. Dig commando gebruiken om te testen

### Testplan en -rapport

#### Testplan

- Met host connecten

- Voer de  .bats test uit

#### Testrapport

De host kon bereikt worden en alle testen waren geslaagd.

### Retrospectieve

Reflecteer na afwerken van het labo over volgende vragen en licht toe:

#### Wat ging goed?

Opsporen waar het probleem lag

#### Wat ging niet goed?

Wat lukte (eerst) niet? Welke problemen ben je tegengekomen (en hoe ben je tot een oplossing gekomen)? Wat hield je tegen om de opdracht tot een goed einde te brengen?

Ik had de reverse IPs niet in alle files toegepast, waardoor ik dacht dat er nog een ander probleem aanwezig was. 
Oplossing: toepassen van de syntax check. 

#### Wat heb je geleerd?

Ga ook wat verder kijken dan de voor de hand liggende zaken.

De syntax check is je grote vriend bij het troubleshooten.

Probeer te 'pinpointen' waar het probleem ligt voor je naar de forums gaat omzo niet op een verkeerd spoort te graken.

#### Waar heb je nog problemen mee?

En zijn er evt. nog vragen die open blijven en die je aan de lector wil voorleggen?

/

### Referenties

Welke informatiebronnen heb je gebruikt bij het uitwerken van dit labo? Titels van boeken, URL's naar handleiding, HOWTO, enz.

https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/
http://google.be 
http://stackoverflow.com/