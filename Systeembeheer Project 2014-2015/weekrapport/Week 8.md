# Voortgangsrapport week 8

* Groep: G08
* Datum: 2015-04-02

| Student               | Aanw. | Opmerking |
| :---                  | :---  | :---      |
| Frederik Van Brussel  |  V    |           |
| Bono Vanderpoorten    |  V    |           |
| Matthias Derudder     |  V    |           |

## Wat heb je deze week gerealiseerd?

- deelopdracht 3 afgewerkt
- Interne servers & owncloud opgesteld


### Algemeen

![img](http://puu.sh/gYCVa/ba8b6c18a5.png)
![huboard](http://puu.sh/gYCY0/5fabc567c7.png)

### Frederik Van Brussel

 ![img](http://puu.sh/gYCLY/4b39613ecd.png)


### Bono Vanderpoorten

![togglerinobono](http://puu.sh/gYD69/8113c823b1.png)


### Matthias Derudder
 ![img](http://i.imgur.com/tHOEwyc.jpg)

* ...



## Wat plan je volgende week te doen?

### Algemeen
### Frederik Van Brussel
### Bono Vanderpoorten
DHCP problemen proberen te vermijden en goed samenwerken!
### Matthias Derudder
Automatiseren toevoegen users

## Waar hebben jullie nog problemen mee?

* gedetailleerder uitwerken opdracht 5

## Feedback technisch luik

- Overleg uitwerking opdracht
    - Interne servers via VirtualBox VMs
    - In testopstelling via fysieke switch (evt. doorverbonden met klasnetwerk via fysieke router)
    - Gebruik in eerste instantie host-only interface in de "ontwikkelingsfase", in de testopstelling best via bridged interface
- lastenboek is nog veel te vaag, werk dit concreter uit.
    - taken die kunnen uitgevoerd worden door één persoon
- Kijk IP-adressering na. Het subnetten van een klasse-B netwerk (172.16.0.0/16) in een "klasse C" (172.16.1.0/24) beperkt je uitbreidingsmogelijkheden. Nu zijn er 5 IP-adressen voor "servers" (172.16.1.1-5) waarvan er al 3 ingenomen zijn. Dus kunnen er nog max. 2 servers toegevoegd worden en je moet je adresseringsschema herwerken.
    - Herwerk adresseringsschema en documenteer dit ook (in het lastenboek)!
- Met een machine waar software op geïnstalleerd is, is die nog niet productieklaar! De configuratie is het meest tijdrovende.
- Werkstation is vooraf geconfigureerd ("golden image")
    - authenticatie via DC
    - ownCloud client
    - andere software?
- DC is opgezet en gebruikers ingevoerd, maar manueel
    - Procedurehandleiding?
    - automatiseren import gebruikers
- DHCP is geïnstalleerd maar niet geconfigureerd
    - Let op: foutboodschappen bij opstarten kan je vinden via `journalctl -u dhcpd.service`
    - Vaak voorkomende foutboodschap is "not configured to listen on any interface". Het subnet dat aangeboden wordt door de DHCP-server moet overeenkomen met zijn eigen IP-adres. Bv. als Ip-adres 172.16.1.4/16 is, moet de range ook in datzelfde netwerk zitten
- nog geen afspraken gemaakt ivm het opnemen van de uitbreidingstaken, maar Lync wordt zeker overwogen als de rest voldoende vlot verloopt.
    - Lync is beschikbaar via DreamSpark Premium

## Feedback analyseluik

### Algemeen

### Frederik Van Brussel
### Bono Vanderpoorten
### Matthias Derudder

