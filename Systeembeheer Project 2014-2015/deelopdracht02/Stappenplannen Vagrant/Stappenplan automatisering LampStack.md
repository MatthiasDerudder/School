##Automatisering Lamp-Stack

### Benodigdheden
* Installatie Virtualbox
* Installatie Vagrant
* box-file gegeven door school

### Setup Vagrant
1) De box gegeven door school toevoegen aan vagrant via Gitbash
> vagrant box add $KIESEENNAAMVOORDEBOX $PLAATS/VAN/BOX/OP/HOST

2) Cd via Gitbash naar de directory waar je de vagrant files wil bijhouden

3) Voer volgend commando in
> vagrant init $NAAMBOX

4) Laat vagrant de VM bouwen
> vagrant up

### Opstellen VM
in virtualbox is nu een nieuwe virtuele machine verschenen.
Ga hiervan naar de netwerkinstellingen en voeg een host-ony adapter toe.

=> Na uren proberen was het niet mogelijk een eigen box te maken om dit proces ook te automatiseren. Als gevolg zal de automatisatie gebeuren via een bash-script in de virtuele machine zelf, i.p.v. provisioning via vagrant.

Indien het wel mogelijk zou zijn een eigen box te maken waar alle netwerk-adapters in orde staan moeten volgende zaken gebeuren:

1) Open de Vagrant File met een text-editor. Deze file vind je terug in de directory die je zelf hebt gekozen om de vagrant files bij te houden.

2) voeg volgende regel code toe:
> config.vm.provision 'shell', path: 'lampscript.sh'

3) Plaats dit [https://github.com/HoGentTIN/ops-g-08/blob/master/deelopdracht02/Stappenplannen%20Vagrant/lampscript.sh](https://github.com/HoGentTIN/ops-g-08/blob/master/deelopdracht02/Stappenplannen%20Vagrant/lampscript.sh) .sh-bestand in dezelfde map als de VagrantFile

4) vagrant -f destroy

5) vagrant up

### Aanmaken en runnen script
1) log via SSH in op de VM

2) switch naar de root user

3) Maak een map genaamd scripts in de root folder en ga hierin
>mkdir scripts

>cd scripts

4) Maak een .sh-bestand aan en open de editor
> vi lampscript.sh

5) Plak de tekst van [https://github.com/HoGentTIN/ops-g-08/blob/master/deelopdracht02/Stappenplannen%20Vagrant/lampscript.sh](https://github.com/HoGentTIN/ops-g-08/blob/master/deelopdracht02/Stappenplannen%20Vagrant/lampscript.sh) in de editor

6) Sla op en verlaat de editor
> :wq!

7) Maak ons script executable
> chmod +x lampscript.sh

8) Tijd om het script te runnen
> ./lampscript.sh
 
9) Klaar!
