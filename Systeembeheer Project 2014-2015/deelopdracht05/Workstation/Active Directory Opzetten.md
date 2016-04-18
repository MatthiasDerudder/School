
## Windows Server 2012 AD opzetten

### 1) Installeer Windows server 2012 met GUI

### 2) Aanpassen Computer naam

1.Log in op de machine en ga naar de Server Manager. 

2.Hier navigeer je naar local server en klik je op de hyperlink naast Computer name. 

3.Druk op changge en geef een toepasselijke computer naam in.

4.De machine zal nu herstarten.

### 3) Opzetten AD DS

1.Open opnieuw Server Manager en onder "Manage" navigeer naar "Add Roles and Features".

2.Kies voor "Role-based or feature-based installation".

3.Selecteer als Destination Server de huidige server in de server pool.

4.Vervolgens in Select server roles selecteer Active Directory Domein Services.

5.Een venster zal verschijnen, klik op Add features.

6.We selecteren geen additional features, dus druk gewoon op next.

7.Confirmeer de installatie en wanneer hij klaar is close hem.

8.In de server manager zal AD DS verschenen zijn

### 4) Configureren AD DS

1.Ga in de server manager naar AD DS en, onder action, klik op Promote this server to domain controller.

2.Selecteer Add a new forest en geef de Domain naam.

3.In Domain Controller Options selecteer Domain Name System Server en geef een DSRM password.

4.DNS Options kan voorlopig met gerust gelaten worden.

5.In de additional options geef een NetBIOS domain name.

6.Confirmeer als de paths in orde zijn en druk op next.

7.Als de Prerequisites check geslaagd is druk op install.

8.De machine zal herstarten

### 5) Voeg users toe, zie ImporterenPersoneel.md voor het importeren van users vanuit een csv file.


