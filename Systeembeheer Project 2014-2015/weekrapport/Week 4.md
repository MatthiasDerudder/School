# Voortgangsrapport week 4

* Groep: G08
* Datum: 2015-03-05

| Student               | Aanw. | Opmerking |
| :---                  | :---  | :---      |
| Frederik Van Brussel  |       |           |
| Bono Vanderpoorten    |       |           |
| Matthias Derudder     |       |           |

## Wat heb je deze week gerealiseerd?

### Algemeen

![KanBan](http://puu.sh/gncYb/9e762ed53f.png)


### Frederik Van Brussel

* ![toggl](http://puu.sh/gndAG/e4c77cf859.png)


### Bono Vanderpoorten

![BonoToggle](http://puu.sh/gnd3k/289b938fe6.png)

### Matthias Derudder

![toggl](http://i.imgur.com/Q331N5O.jpg)




## Wat plan je volgende week te doen?
### Algemeen
### Frederik Van Brussel
Testrapporten afwerken, phpmyadmin installeren op lamp stack, vagrant in orde krijgen
### Bono Vanderpoorten
Vagrant box zelf maken, en het script schrijven om alles te automatiseren.
### Matthias Derudder
Golden Image voor Windows Server en Azure

## Waar hebben jullie nog problemen mee?

* Bono: Vagrant (SSH problemen bij de het aanmken box)
    * Sorry, maar zonder details kan ik niet helpen.
* fred: vagrant maken base box: qwerty wil niet veranderen(base box school), elke yum opdracht krijgt 'cannot find base url'-error (base box school), ssh-problemen (eigen boxes)
    * Idem als hierboven. 
    * Je kan geen QWERTY-problemen hebben als je inlogt met Vagrant SSH (maar dat werkt blijkbaar niet). Workaround: commando `sudo loadkeys be-latin1`.
    * `Cannot find base url` wijst op connectieprobleem. De server heeft geen internetverbinding. Kijk dit na ahv. wat je geleerd hebt in Besturingssystemen, of kijk naar mijn cheat sheets (zie feedback vorige week)
* Plaatsen we de Linux-servers ook op Azure?
    * Nee, op een ander Linux-georiënteerd cloudplatform zoals DigitalOcean
* Matthias: Mijn golden image is 20Gig, moet ik deze volledig uploaden op azure?
    * Niet noodzakelijk! Azure is een PaaS, wat betekent dat je een kant-en-klare server ter beschikking kan krijgen. Je moet wel de opstelling van je VM kunnen reconstrueren. Als je dit geautomatiseerd hebt, is dat een peulschil, zoniet moet je je procedurehandleiding gebruiken.

## Feedback technisch luik

### Algemeen

Opm. Begeleider BertVV afwezig wegens ziekteverlof

- Waar worden de afbeeldingen voor de weekrapporten gehost? Ik zie nu enkel die van week 3. Je doet dit best in een subdirectory, bv. `img/`. Je kan dan verwijzen met een relatieve link naar bv. `![prestaties algemeen](img/week4-algemeen.jpg)`.
- Geen activiteit op Huboard => niets gepresteerd afgelopen week?
    - Zijn er taken afgewerkt? Dan duid je dit aan!
    - Sommige taken zijn noodzakelijkerwijs gekoppeld. Bv. het opzetten van een VM en het schrijven van het stappenplan gebeurt (hopelijk) gelijktijdig. Dan maak je daar best één issue van.
- De Vagrant-configuratie en provisioning-scripts ontbreken! Zo kan ik geen feedback geven.
- In het lastenboek staan een aantal taken gekoppeld die niet samen horen, bv. "opzetten wisa, java EE, lamp op een VM" Dit zijn drie afzonderlijke taken!
- Testplan ziet er ok uit, dit lijkt me voldoende detail om het opzetten van een server onafhankelijk te reproduceren.
- Nog helemaal niets gedaan ivm deelopdracht 3? Ik verwacht tegen volgende keer op zijn minst een lastenboek
- Buiten de donderdag wordt er weinig gewerkt. Merk op dat de totale studietijd van dit opleidingsonderdeel 150 uur bedraagt, dus verdeeld over 12 weken zouden jullie 12,5u moeten presteren!

Weinig vooruitgang te merken en jullie houden informatie achter (bv. scripts).

Hieronder volgt een overzicht van de bijdrage van elk teamlid, gegenereerd ahv het commando `git blame` over alle files in het project. De cijfers geven aan hoeveel lijnen (tekst of code) elk teamlid heeft bijgedragen. Zorg er voor dat het evenwicht een beetje bewaard blijft! Hier heeft iedereen trouwens een erg laag cijfer...

```
   1992 lilswif
    777 unknown
    384 BonoVanderpoorten
     60 MatthiasDerudder
```


## Feedback analyseluik

### Algemeen

### Frederik Van Brussel
### Bono Vanderpoorten
### Matthias Derudder

