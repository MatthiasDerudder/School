## Testplan en -rapport taak 2

* Verantwoordelijke uitvoering: matthias
* Verantwoordelijke testen: frederik

### Testplan

Auteur(s) testplan: Frederik

#### Tesplan Lampstack & Java EE
##### PHP & Mysql functioneel & draaiend
1) Installeer een Centos 7 min virtuele machine in Virtual Box

2) Na de installatie, volg dit stappenplan: 

> https://github.com/HoGentTIN/ops-g-08/blob/master/deelopdracht02/>Stappenplannen%20Opstellen%20Servers/Lamp-Stack.md

Als dit alles correct verloopt kan je er zeker van zijn dat zowel php als apache draaien. 
Aangezien we php.info te zien krijgen, kunnen we daaruit concluderen dat php ten volle werkt.

Door vanuit een host-machine de client's server te bezoeken weten we ook dat apache (en de firewall-settings) in orde zijn. Het enige wat we nu nog moeten testen is MySql, aangezien er nog geen databanken aanwezig zijn.

#### Testen MySQL
1) Log via de commandline in op MariaDB als root-user en diens paswoord
> mysql -u root -p -h localhost

2) Maak een database aan
> CREATE DATABASE db1;

Wat een positieve respons zou moeten geven : 'Query OK, 1 row Affected (0.00sec)

3) Vervolgens gaan we deze database gaan gebruiken, en informatie toevoegen:
> USE mydb;

4) Maken van een tabel in de databank (= waar de werkelijke informatie wordt in bijgehouden)
CREATE TABLE mytable ( id INT PRIMARY KEY, name VARCHAR(20) );

5) Vervolgens steken we data in deze tabel:
> INSERT INTO mytable VALUES ( 1, 'Fred' );
> INSERT INTO mytable VALUES ( 2, 'Bono' );
> INSERT INTO mytable VALUES ( 3, 'Matthias' );

6) Opvragen van informatie uit deze tabel
> SELECT id, name FROM mytable WHERE id = 1;

7) Veranderingen aanbrengen
  aanpassen:
> UPDATE mytable SET name = 'Willy' WHERE id = 1;
> SELECT id, name FROM mytable;

  verwijderen:
> DELETE FROM mytable WHERE id = 1;
> SELECT id, name FROM mytable;

8) De database tenslotte verwijderen
> DROP DATABASE db1;

Als dit alles lukt, kunnen we concluderen dat de MySQL-service werkt.

#### Tesplan Wisastack

##### Testen IIS
1) Controleer of IIS aanwezig staat in de linkerbalk van de Server Manager. 
Indien dit niet het geval is, heb je IIS niet correct geinstaleerd.

2) Ga naar Start en zoek Internet Information Services Manager op.

3) In de linkerbalk 'Connections' Zal je de naam van de machine zien staan.
Klap deze open, hierin zal je Application Pools en Sites in terug vinden.
Als je nog niets in de IIS Manager hebt aangepast vind je in de Sites folder normaal een Default Web Site terug vinden die al aan het lopen is.

4) Open Internet Explorer en geef als url je IP-adress of localhost in.
Als IIS correct geïnstaleerd is krijg je normaal een pagina weer over IIS.

Als dit alles werkt, kunnen we concluderen dat IIS correct geïnstaleerd is.

##### Testen SQL Server
1) Ga naar Start en open Sql Server Configuration Manager, ga vervolgens naar SQL Server Services en controleer of de service SQL Server running is.

2) Ga nogmaals naar Start en open Microsoft SQL Server Management Studio. 
Als je deze opent zal een venster verschijnen met de Server type, Server name en Authentication. 
Druk op connect

3) Maak nu een test Database aan:
1. Rechterklik op Databases in de Object Explorer en selecteer New Database.
2. Het venster New Database zal verschijnen. Geef een Database name in en druk op Ok.

4) SQLQuery test:
1. Klik bovenaan op de knop New Query.
2. In de query schrijf: create database Test01.
3. Bij messages zou 'Command(s) completed successfully.' moeten verschijnen.

Als dit alles werkt, kunnen we concluderen dat de SQL server functioneel is.

##### Testen ASP.NET 4.0
1) Klik op Start en open Run.
2) In run schrijf je het volgende: Regedit.
3) Druk op ok en volg dit pad in de Registry Editor: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ASP.NET\4.0.30319.0\DllFullPath.

Als dit werkt, kunnen we concluderen dat ASP.NET geïnstalleerd is.

### Testrapport

Uitvoerder(s) test: Mattthias

#### Testrapport Lampstack & Java EE

PHP & Mysql functioneel & draaiend: ✓

Testen MySQL: ✓

#### Tesplan Wisastack
Testen IIS: ✓

Testen SQL: ✓

Testen ASP.NET 4.0: ✓
