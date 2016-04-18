## Handleiding voor het terugzetten van fabrieksinstellingen voor een Cisco-Router.


* We kunnen de registerwaarden aanpassen naar de originele fabrieksinstellingen aan de hand van een paar simpele commando's in de command line. 


* **Zorg ervoor dat je je bevindt in de global configuration mode!**

###Stap 1 

* Gebruik het commando "show version" om de configuratie te bekijken. Deze staat op de laatste lijn en zou 0x2102 moeten zijn. Als dit niet zo is kan je dit gemakkelijk aanpassen.


* Gebruik de volgende commandos om de basisconfiguratie in te stellen.

> config-register 0x2102

> end

* De huidige start-up configuratie verwijderen

> write erase

* Gebruik het reload commando om de router te herstarten. **Sla niet op!**

> reload

* Als je de router nu heropstart zal deze de fabrieksinstellingen hebben!