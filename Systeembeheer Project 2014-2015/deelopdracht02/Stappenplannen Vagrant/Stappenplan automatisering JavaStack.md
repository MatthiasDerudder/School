##Automatisering Lamp-Stack

### Benodigdheden
* Installatie Virtualbox
* Installatie Vagrant
* box-file gegeven door school

### Setup Vagrant
1) De box gegeven door school toevoegen aan vagrant via Gitbash
> vagrant box add $NaamVanBox $Bestands/Pad

2) Cd via Gitbash naar de directory waar je de vagrant files wil bijhouden

3) Voer volgend commando in
> vagrant init $NaamVanBox

4) Laat vagrant de VM bouwen
> vagrant up

### Opstellen VM
In virtualbox is nu een nieuwe virtuele machine verschenen.
Ga hiervan naar de netwerkinstellingen en voeg een host-ony adapter toe.

Ook bij mij was het werkend krijgen van vagrant een onmogelijke opdracht daarom ga ik analoog werken aan Frederik.

Indien het wel mogelijk zou zijn een eigen box te maken waar alle netwerk-adapters in orde staan moeten volgende zaken gebeuren:

1) Open de Vagrant File met een text-editor. Deze file vind je terug in de directory die je zelf hebt gekozen om de vagrant files bij te houden.

2) voeg volgende regel code toe:
> config.vm.provision 'shell', path: 'tomcatscript.sh'

3) Plaats dit [script](https://github.com/HoGentTIN/ops-g-08/blob/master/deelopdracht02/Stappenplannen%20Vagrant/tomcatscript.sh) in dezelfde map als de VagrantFile

4) vagrant -f destroy

5) vagrant up

### Aanmaken en runnen script
1) log via SSH in op de VM

2) switch naar de root user

3) Maak een map genaamd scripts in de root folder en ga hierin
>mkdir scripts

>cd scripts

4) Download het script met volgend commando

wget http://goo.gl/DIAzx2?gdriveurl -O tomcatscript.sh

7) Maak ons script executable
> chmod +x tomcatscript.sh

8) Tijd om het script te runnen
> ./tomcatscript.sh

(: invalid option) !!!
 
9) Klaar!
