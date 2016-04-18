####Importeren van het personeel
1) Voeg SAMAccountname aan de file toe gebruik een excel formule om makkelijk een naam te vormen
> =CONCATENATE(D2, A2) 

Met dit commando neem je de voornaam van de werknemer en een uniek nummer.

2) Breng de file over naar de Windows Server

3) Open Active Directory Module for Windows PowerShell

4) Geef het volgende commando in: Import-CSV C:\Users.csv | New-ADUser -Path "OU=???,DC=???,DC=???" -AccountPassword $pass -Enabled $True -ChangePasswordAtLogon $True
. Dus in ons geval zal dit het volgende zijn

>Import-CSV C:\Gebruikers.csv | New-ADUser -Path "OU=G08,DC=G08,DC=be" -AccountPassword (ConvertTo-SecureString Pass123 -AsPlainText -force) -Enabled $True -ChangePasswordAtLogon $True

####Alternatief
Het is ook mogelijk met een script te werken:

>Import-Module ActiveDirectory 
$Users = Import-Csv -Delimiter ";" -Path ".\werknemers.csv"  
foreach ($User in $Users)  
{  
    $OU = "OU=G08,DC=G08,DC=be"  
    $Password = $User.password 
    $Detailedname = $User.firstname + " " + $User.name 
    $UserFirstname = $User.Firstname 
    $FirstLetterFirstname = $UserFirstname.substring(0,1) 
    $SAM =  $FirstLetterFirstname + $User.name 
    New-ADUser -Name $Detailedname -SamAccountName $SAM -UserPrincipalName $SAM -DisplayName $Detailedname -GivenName $user.firstname -Surname $user.name -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) -Enabled $true -Path $OU  
} 
