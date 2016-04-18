
## CentOS DHCP opstellen

1) Installeer CentOS minimal install.

2) Na het inloggen, verkrijg je root toegang en gaan we de DHCP server installeren op onze machine.

> yum install dhcp -y

3) Vervolgens maken we een kopie van het voorbeeld configuratiebestand naar de configuratiemap.

 >cp /usr/share/doc/dhcp-*/dhcpd.conf.sample /etc/dhcp/dhcpd.conf

4) Je kan nu het bestand aanpassen met een teksteditor! Het bestand bevindt zich in:

> /etc/dhcp/dhcpd.conf
