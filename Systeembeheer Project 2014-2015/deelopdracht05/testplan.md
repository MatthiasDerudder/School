## Testplan en -rapport taak 5

* Verantwoordelijke uitvoering: frederik
* Verantwoordelijke testen: bono

### Testplan

Auteur(s) testplan: Frederik

#### Testplan: Algemeen

Om dit lokaal netwertk te testen is het belangrijk om het onderscheid te maken dat elke client/host goed geconfigureerd staat.

<<<<<<< HEAD
=======
## Testplan
>>>>>>> 483745a6834a4dfbe53bb2b7ffbb17bf27b5438a

###Deel 1: DHCP-Server

We controleren eerst of de DHCP-Server naar behoren werkt. Na het volgen van [dit stappenplan](https://github.com/HoGentTIN/ops-g-08/blob/master/deelopdracht05/Interne%20Servers/Centos%20DHCP.md) en dan de DHCP te configureren kunnen we testen of alles werkt. 

De configuratie zou na het instellen moeten lijken op dit voorbeeld.
![img](http://puu.sh/hEsqW/d41db86828.png)

Controleer als volgende of de DHCP service draait door het volgende commando te runnen.

    service dhcpd status

Als alles goed is zie je dat de service "active running" is.

![img](http://puu.sh/hEsBy/3cbf16bbf9.png)

Als laatste testen we het geheel door de server en een client aan te sluiten op een switch en ipconfig te runnen op de client. Zo kunnen we controleren of alles goed wordt doorgegeven.


###Deel 2: Active Directory en DNS

We kunnen testen of de AD werkt door 





Als dit in orde is moeten we eerst testen of DNS wel naar behoren werkt. Dit is makkelijk aan de hand van een commando in Windows Opdrachtprompt. Hier testen we of de DNS-server van Google. Vervang het adres  door het IP van uw DNS-server.
    
    nslookup google.com

![img](http://puu.sh/hEt4D/4f5540f784.png)

