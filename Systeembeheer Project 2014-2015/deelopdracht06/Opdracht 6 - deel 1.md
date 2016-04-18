
## Taak 6 : Configuring 802.1Q Trunk-Based Inter-VLAN Routing

###Part 1
**1) Basic Switch Commando's**

=> screen /dev/ttyS0

A) no ip domain-lookup 

B) Hostname S1 of s2

C) enable password class

d) line vty 0 4

 password cisco

 login

E) line con 0

 password cisco

 logging synchronous

 login

F) 
**S1** interface Vlan1

 ip address 192.168.1.11 255.255.255.0

 no ip route-cache

**S2** interface Vlan1

 ip address 192.168.1.12 255.255.255.0

 no ip route-cache

END

G) ip default-gateway 192.168.1.1 

ip http server

H) **S1**

interface 0/1

speed auto

 duplex auto

 mdix auto

 end

**S2**
interface 0/1

speed auto

 duplex auto

 mdix auto

 end


**2) Basic Router Commando's**

A) no ip domain-lookup

B) Hostname r1

C) interface Loopback0

 ip address 209.165.200.225 255.255.255.224

 END

D)  enable password class

E) line vty 0 4

 password cisco

 login

F) line con 0

 password cisco

 logging synchronous

 login

###Part 2
**Switch S1**

- S1(config)# vlan 10
- S1(config-vlan)# name Students
- S1(config-vlan)# vlan 20
- S1(config-vlan)# name Faculty
- S1(config-vlan)# exit
- S1(config)# interface f0/1
- S1(config-if)# switchport mode trunk
- S1(config-if)# interface f0/5
- S1(config-if)# switchport mode trunk
- S1(config-if)# interface f0/6
- S1(config-if)# switchport mode access
- S1(config-if)# switchport access vlan 10
- S1(config)# interface vlan 10
- ip adress 192.168.1.11 255.255.255.0
- no shutdown



**Switch S2**

- S2(config)# vlan 10
- S2(config-vlan)# name Students
- S2(config-vlan)# vlan 20
- S2(config-vlan)# name Faculty
- S2(config)# interface f0/1
- S2(config-if)# switchport mode trunk
- S2(config-if)# interface f0/18
- S2(config-if)# switchport mode access
- S2(config-if)# switchport access vlan 20
- S1(config)# interface vlan 10
- ip adress 192.168.1.12 255.255.255.0
- no shutdown

**Router R1**

- R1(config)# interface g0/1.1
- R1(config-subif)# encapsulation dot1Q 1
- R1(config-subif)# ip address 192.168.1.1 255.255.255.0
- R1(config-subif)# interface g0/1.10
- R1(config-subif)# encapsulation dot1Q 10
- R1(config-subif)# ip address 192.168.10.1 255.255.255.0
- R1(config-subif)# interface g0/1.20
- R1(config-subif)# encapsulation dot1Q 20
- R1(config-subif)# ip address 192.168.20.1 255.255.255.0
- R1(config-subif)# exit
- R1(config)# interface g0/1
- R1(config-if)# no shutdown