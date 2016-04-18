## Laboverslag: verslag 05

- Naam cursist: Matthias Derudder
- Bitbucket repo: https://bitbucket.org/Matthyz/enterprise-linux-labo

### Procedures

1. Toevoegen van pr011 in vagrant_hosts & site
2. pr011.yml in host_vars
3. Aanpassen all.yml
4. Toevoegen van samba.bats en vsftp.bats in tests/pr011
5. vsftpd role toevoegen

### Testplan en -rapport

- Vagrant up -> werkende Samba server met correcte leestoegang
- De Samba-service is beschikbaar vanop het hostsysteem via \\files
- Vagrant up -> werkende Vsftp-server met correcte leestoegang
- De Vsftpd-service is beschikbaar vanop het hostsysteem via ftp://IPADRES/
- Gebruikers hebben toegang tot hun home-directory (enkel Samba)
- Schrijftoegang op de Samba-shares is correct
- Schrijftoegang via Vsftpd is correct
- Leden van dezelfde groep hebben schrijftoegang op elkaars bestanden

Word getest via runbats.sh

\\files moet zichtbaar zijn

### Retrospectieve

Testen samba.bats en vsftp.bats slagen zonder errors/skips

\\ files was zichtbaar

#### Wat ging goed?

-Troublshooting: via de testen was duidelijk te zien wat er nog moest aangepast worden voor een correct verloop.
-Users en toewijzen permissies van de shares.

#### Wat ging niet goed?

Er was een probleem met de virtualbox waardoor ik een error krijg omtrent de host only.
Probleem wordt veroorzaakt door windows 10.
Oplossing was om alle virtual box adapters te deinstalleren via device manager.

Het opzetten van de role was wat moeizaam

#### Wat heb je geleerd?

- Samba
- FTP-server in linux
- SELinux
- Ansible roles

#### Waar heb je nog problemen mee?


### Referenties

https://www.youtube.com/watch?v=w2RxBkqQ3ZQ&feature=youtu.be
https://hogentsysadmin.wordpress.com/2014/04/24/een-fileserver-met-samba-op-centos-6-5/
https://www.samba.org/samba/docs/man/Samba-HOWTO-Collection/
https://www.samba.org/samba/docs/man/manpages-3/smb.conf.5.html
