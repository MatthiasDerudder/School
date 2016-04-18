# Voortgangsrapport week 10

* Groep: G08
* Datum: 30/04

| Student               | Aanw. | Opmerking |
| :---                  | :---  | :---      |
| Frederik Van Brussel  | V     |           |
| Bono Vanderpoorten    | V     |           |
| Matthias Derudder     | V     |           |

## Wat heb je deze week gerealiseerd?
DHCP server, netwerk lokaal volledig opgesteld

### Algemeen

![img](http://i.imgur.com/7YH0Eki.jpg)

### Frederik Van Brussel

![img](http://puu.sh/hw0SB/f26556423e.png)

### Bono Vanderpoorten

![img](http://puu.sh/hw0SU/bbda8c12c1.png)


### Matthias Derudder

![img](http://i.imgur.com/nV99AlY.jpg)



## Wat plan je volgende week te doen?
Werken aan opdracht 5

### Algemeen
### Frederik Van Brussel
### Bono Vanderpoorten
### Matthias Derudder

## Waar hebben jullie nog problemen mee?

* Het lukte niet om een werkstation toe te voegen aan het domein
    * foutboodschap: geen SRV record voor _ldap ... uplink.g08.be (pingen gaat wel, dus er is wel een A-record)
    * opgelost via instellingen VirtualBox netwerkadapter

## Feedback technisch luik

* IP-adressering ok (eventueel het document mooier structureren, bv. tabel)
* DC
    * Importeren is gelukt (one-liner die CSV inleest en meteen users aanmaakt)
    * Gebruikersnaam `=concatenate(voornaam, familienaam)` -> sommige zijn dan te lang. Documenteer dit!
    * niet toegevoegd aan de juiste OU! -> denk er over na om dit te automatiseren
    * DNS is ok
* Werkstation
    * Kan inloggen op domein
* Owncloud
    * Staat online in Azure
    * Eerst lokaal netwerk opzetten, dan pas kijken naar
    * DC "slave" naast de Owncloud server op Azure zetten zal niet werken: Azure VMs ondersteunen LDAP niet
    * Nieuw idee = via VPN werken
* Router lokaal netwerk
    * Externe interface krijgt IP in netwerklokaal (172.19.x.y) via DHCP
    * NAT nog instellen om routering terug op te zetten

## Feedback analyseluik

### Algemeen

### Frederik Van Brussel
### Bono Vanderpoorten
### Matthias Derudder

