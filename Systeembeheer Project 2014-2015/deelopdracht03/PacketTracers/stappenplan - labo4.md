## Stappenplan Labo 4

### stap 1: Plaats routers, switches en end devices

### Geef de routers Serial interfaces
1) dubbelklik op de router

2) Kies Physcial -> WIC-1T

3) Zet de router uit en sleep de afbeelding rechts onder 2 maal op de juiste plaats

4) Zet de router terug aan


=> herhaal dit voor alle routers

### Stap 3: Plug de juiste kabels in
Van router naar router : Serial DTE

de overige verbindingen : copper straight through

### Stap 4: Configureer de (interface)instellingen voor elke router
Volg de commandos in de CLI

**R1**

- en
- conf t
- hostname R1
- no ip domain-lookup
- enable secret cisco
- line console 0
- password cisco
- login 
- line vty 0 4
- password cisco
- login
- interface fa0/0
- ip address 172.16.3.1 255.255.255.0
- no shutdown
- interface s0/0/0
- ip address 192.16.2.1 255.255.255.0
- no shutdown


**R2**

- en
- conf t
- hostname R2
- no ip domain-lookup
- enable secret cisco
- line console 0
- password cisco
- login 
- line vty 0 4
- password cisco
- login
- interface fa0/0
- ip address 172.16.1.1 255.255.255.0
- no shutdown
- interface s0/0/0
- ip address 192.16.2.2 255.255.255.0
- interface s0/1/0
- ip address 192.168.1.2 255.255.255.0
- no shutdown

**R3**

- en
- conf t
- hostname R3
- no ip domain-lookup
- enable secret cisco
- line console 0
- password cisco
- login 
- line vty 0 4
- password cisco
- login
- interface fa0/0
- ip address 192.168.2.1 255.255.255.0
- no shutdown
- interface s0/1/0
- ip address 192.168.1.1 255.255.255.0
- no shutdown

###Stap 5: Configureer de ip's van de Host-pc's

verander bij elke host de subnetmask van 255.255.0.0 naar 255.255.255.0

Verander het ip adress van:

**pc1** 172.16.3.10

**pc2** 172.16.1.10

**pc3** 192.168.2.1

###Stap 6: Maak static ip routes
in de CLI:

**R1**

- en 
- conf t
- ip route 0.0.0.0 0.0.0.0 172.16.2.2

**R2**

- en
- conf t
- ip route 192.168.2.0 255.255.255.0 192.168.1.1
- ip route 172.16.3.0 255.255.255.0 s0/0/0


**R3**

- en 
- conf t
- ip route 172.16.0.0 255.255.252.0 192.168.1.2
