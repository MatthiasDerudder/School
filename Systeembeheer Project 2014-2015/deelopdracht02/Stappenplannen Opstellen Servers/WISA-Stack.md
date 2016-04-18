### ASP.NET & ISS

1. Open Server Manager
2. Navigeer naar Manage en kies voor Add Roles and Features
3. Kies voor Role-based or feature-based installation
4. Select a server from the server pool
5. Bij Server Roles, Selecteer Web Server(IIS)
6. Bij Features kies voor .NET Framework 4.5 features, klap deze open en controleer of ASP.NET 4.5 geselecteerd is.
7. Confirmeer je selectie en volg de rest van de installer tot hij is afgerond.

### SQL Server

1. Download de SQL server 2012 iso (http://www.microsoft.com/en-us/download/details.aspx?id=35575)
2. ISO booten in Windows Server
3. Onder Storage in de settings van je virtual machine kan je de ISO toevoegen
4. Begin de instalatie
>   Open file explorer en ga naar de CD Drive hierin vind je 'setup', open dit en selecteer 'Installation' in de linker balk.
    Kies hier voor New SQL server stand-alone installation or add features to an existing installation.

5. Druk op OK
6. Geef de product key in en druk op next.
7. Accept license terms en druk op next.
8. Druk op install
9. Druk op next en selecteer SQL Server Feature Installation
10. In Feature Selection: Select All
11. Instance configuration 
>   Selecteer Default instance

12. In Server Configuration hoef je niets aan te passen.
13.  Database Engine Configuration 
>   Selecteer Mixed Mode, geef een password en Add current user.
    Ga vervolgens naar de FILESTREAM Tab. Enable FILESTREAM, for file I/O access, Allow remote clients access.

14. Analysis Services Configuration
>   Selecteer Multidimensional and data Mining Mode en Add Current User.

15. Reporting Services Configuration
>   Selecteer Install and configure bij Reporting Services Native Mode, Install only bij Raporting Services SharePoint Integrated Mode en druk op next.

16. Distributed Replay Controller
>   Add Current User.

17. Distributed Replay Client
>   Geef de Controller een naam en druk op next.

18. Volg de rest van de installer en sluit de installer af.
