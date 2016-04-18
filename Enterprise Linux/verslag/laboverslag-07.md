## Laboverslag: Troubleshooting 2

- Naam cursist: Matthias Derudder
- Bitbucket repo: https://bitbucket.org/Matthyz/enterprise-linux-labo

### Procedures

1. vi /etc/samba/smb.conf aanpassen: write access
2. Firewall checken firewall-cmd --permanent --zone=public --add-service=samba
3. Owner aanpassen van groups sudo chown 
4. permissies anapassen sudo chmod
5. smbclient //brokensamba/alpha --user=bob



### Testplan en -rapport

####PLAN
Tests slagen

####rapport
Tests slagen

### Retrospectieve

Reflecteer na afwerken van het labo over volgende vragen en licht toe:

#### Wat ging goed?

- Permiessies en gebruikers aanpassen

#### Wat ging niet goed?

Wat lukte (eerst) niet? Welke problemen ben je tegengekomen (en hoe ben je tot een oplossing gekomen)? Wat hield je tegen om de opdracht tot een goed einde te brengen?

- Troubleshooten voor bravo

#### Wat heb je geleerd?

- Ga ook wat verder kijken dan de voor de hand liggende zaken.

Troubleshooting SMBclient

#### Waar heb je nog problemen mee?

En zijn er evt. nog vragen die open blijven en die je aan de lector wil voorleggen?

/

### Referenties

Welke informatiebronnen heb je gebruikt bij het uitwerken van dit labo? Titels van boeken, URL's naar handleiding, HOWTO, enz.
