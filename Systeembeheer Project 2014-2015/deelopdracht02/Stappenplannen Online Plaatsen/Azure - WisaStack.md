# AZURE - WisaStack

Voor het online zetten van de WISA stack kozen we voor Microsoft Azure.

Om de WISA stack online te plaatsen heb ik twee verschillende methodes uitgeprobeerd.

## Methode 1: Golden Image uploaden via Microsoft Azure PowerShell
BELANGRIJK: Azure accepteert enkel .vhd bestanden met een rond getal aan megabytes, indien het geen rond getal is zal je in de Azure omgeving een error krijgen NA de hele upload procedure (wat een heel traag proces is en veel bandbreedte vraagt). Dit kan opgelost worden door de VHD te resizen met behulp van een programma (Zie links vanonder voor een voorbeeld). 

### Stap 1 - Sysprep
Hier maken we de virtuele machine klaar voor de upload.

1. In de Windows 2012 server linker klik op de start knop en klik op Command Prompt (Admin)
2. In de Command Promp gebruik de volgende commandos in dezelfde volgorde

> cd sysprep

> sysprep /generalize /oobe /shutdown

### Stap 2 - Creëer een storage account in Azure
1. Navigeer naar de Azure Management Portal en log in op je account
2. Op de command bar links vanonder klik op New
3. Klik op Data Services > Storage > Quick Create
4. Geef je account een url en kies de correcte locatie.
5. In de linker bar navigeer naar Storage, hier vind je de nieuwe storage die je hebt aangemaakt open deze.
6. Navigeer nu naar containers en klik op Create a container, kies een naam en zet Acces op Private.


### Stap 3 - Verbinden met Azure
Download Microsoft Azure PowerShell (http://azure.microsoft.com/en-us/downloads/ Windows PowerShell onder Command-line tools)

Gebruik het volgende commando
> Add-AzureAccount
Een venster zal openen waar je moet inloggen.

ALTERNATIEF:
Vraag een .publishsettings bestand op, sla dit bestand op
> Get-AzurePublishSettingsFile

Importeer de file nu met het volgende commando 
> Import-AzurePublishSettingsFile <PathToFile>

### Stap 4 - Uploaden 
Gebruik het volgende commando: 
>Add-AzureVhd -Destination "<BlobStorageURL>/<YourImagesFolder>/<VHDName>.vhd" -LocalFilePath <PathToVHDFile>

De BlobStorageURL kan je vinden in de Azure Management Portal in storage onder containers (Stap 2).
Het uploaden van een VHD kan lang duren en neemt veel van de bandbreedte in, het is dus aangeraden dit overnacht te doen (afhangende van je VHD groote en upload speed).

### Stap 5 - Creëren van de virtuele machine
*Deze stap heb ik zelf niet meer uitgevoerd aangezien mijn VHD het verkeerde aantal bytes had*

1. In de Azure Management Portal, navigeer naar Virtual Machines in de linkerbar.
2. Maak nu een image aan. Ga naar de tab Images in Virtual Machines en klik op Create an Image. 
Bij het creëren van de image zal je een naam, beschrijving en de url naar de VHD moeten beschrijven (deze vind je in de storage die je in stap 2 hebt aangemaakt. Vink I have run Sysprep aan.
3. Maak de Virtuele Machine aan: druk links vanonder op NEW en selecteer Compute -> Virtual Machine -> From Gallery. 
Selecteer onder My Images de image van de VHD die je hebt upgeload.

## Methode 2: Maak een nieuwe WISA aan in Azure
1. Creëer een Windows Server in Azure
In de Azure Management portal klik op NEW en vervolgens Compute -> Virtual Machine. 
Kies in de lijst voor een Windows Server 2012. Geef de machine een naam en maak een gebruiker aan. 
Kies vervolgens voor Stand-Alone en vul de rest van de gegevens aan.
2. Configureer de machine 
Na het verbinden met de virtueele machine (wat hieronder beschreven staat), volg het stappen plan (https://github.com/HoGentTIN/ops-g-08/blob/master/deelopdracht02/Stappenplannen%20Opstellen%20Servers/WISA-Stack.md).

Voor het installeren van de SQL server deed ik het volgende:

1. Open Remote Desktop Connection, maar verbind nog niet met de server.
2. Klik op de tab Local Resources en onder Local devices and resources klik op More...
3. Een venster zal open gaan waar je je locale drives in zal zien staan, zorg ervoor dat je de drive waar je SQL Server ISO inzit geselecteerd is.
4. Connecteer nu met de machine
5. In File Explorer zal je de drives van de pc waar je met de virtuele machine connecteert zien staan. 
Navigeer nu naar de SQL Server ISO en kopieer deze naar de virtueele machine.
6. Zodra je ISO op één van de virtual drives staat rechterklik deze en selecter Mount.
7. Run de installer en volg de stappen zoals beschreven in het stappen plan.

## Connecteren met de server
### Methode 1: Azure
In het Azure Management Portal kan je navigeren naar Virtual Machines, je machine selecteren en vervolgens op Connect drukken.
Je zal een .rdp bestand krijgen, open dit met Remote Desktop Connect, geef vervolgens de gegevens in en druk op OK.

### Methode 2: Manueel via Remote Desktop Connect
Open Remote Desktop Connection en geef de Computer en User name in, druk vervolgens op connect hier zal een wachtwoord gevraagd worden geef het wachtwoord en druk op ok.

### Info
Computer
> G08.cloudapp.net:52927

User name
> MatthiasDerudder

Password
> G08password

### Gebruikte Documentatie + Links
http://azure.microsoft.com/en-us/documentation/articles/virtual-machines-create-upload-vhd-windows-server/

https://www.youtube.com/watch?v=DraC0YmJUas

http://haacked.com/archive/2010/05/18/remote-desktop-file-copy.aspx/

http://www.pc-magazin.de/download/vhd-resize-1000283.html

http://azure.microsoft.com/en-us/downloads/

https://manage.windowsazure.com
