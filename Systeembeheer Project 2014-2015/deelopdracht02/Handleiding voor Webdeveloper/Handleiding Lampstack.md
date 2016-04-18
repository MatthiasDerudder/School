###Hoe plaats ik mijn site online?

1) Download en installeer van de officiele sites:
- Virtual Box
- Vagrant
- Gitbash

2) Bemachtig een exemplaat van de centos-base box, gegeven door Hogent.

3) Ga naar een zelfgekozen locatie op je computer en kopieer hierin:

- [lampscript](https://github.com/HoGentTIN/ops-g-08/blob/master/deelopdracht02/Stappenplannen%20Vagrant/lampscript.sh)
- [vagrantfile](https://github.com/HoGentTIN/ops-g-08/blob/master/deelopdracht02/Stappenplannen%20Vagrant/Vagrantfile-lamp)

=> Verander de naam van Vagrantfile-lamp naar VagrantFile

=> maak een map aan met de naam wwww

4) open gitbash & type:
> vagrant box add centosbox $locatie/centosbox/gegeven/door/hogent  

5) CD via gitbash naar de folder waar je lampscript.sh & VagrantFile staan hebt

6) Type 
> vagrant up


7) Nadat de installatie klaar is, kopieer je in de zelf gecreëerde map uit stap 3 al je bestanden voor de website 

=> in de virtuele machine in Virtual Box kan je deze bestanden nu terug vinden in /var/www/html

8) Indien je een database nodig hebt ga je naar
> $jeserverip/phpmyadmin

-> Indien je niet weet wat je server ip is;
> ip a

in de commandline

3) Je bent klaar! De site is toegankelijk op je ip adres