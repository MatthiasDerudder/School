## Handleiding voor het terugzetten van fabrieksinstellingen voor een Cisco-Switch.


* We kunnen de registerwaarden aanpassen naar de originele fabrieksinstellingen aan de hand van een paar simpele commando's in de command line. 




###Stap 1) De switch-configuratie resetten.

* De huidige start-up configuratie verwijderen

> write erase

OF

> erase startup-config

* Bevestig indien nodig

* Gebruik het reload commando om de router te herstarten. **Sla niet op!**

> reload

* Als je de switch nu heropstart zal deze de fabrieksinstellingen hebben!

### Stap 2) De VLAN-Info resetten

* Als we "show vlan" runnen zien we of er nog info staat over de netwerken op de switch. Indien hier geen info meer staat hoef je dit stuk niet meer te volgen.

* We kunnen de VLAN-info verwijderen door het volgende commando

> delete flash:vlan.dat

* Vervolgens reloaden we.

> reload

* En we controleren of het gelukt is.

> show vlan

