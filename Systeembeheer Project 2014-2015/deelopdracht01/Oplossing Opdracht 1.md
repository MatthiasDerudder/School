##Opgave 1:

**IP-adres van deze host**

196.83.116.149

**IP-adres van het subnet**

192.830116.144

**Broadcastadres van dat subnet**

196.83.116.159

**Eerste machine van dat subnet**

196.83.116.145

**Laatste machine van dat subnet**

196.83.116.158

**Klasse van het hoofdnetwerk (A, B,…)**

C

**Aantal bruikbare subnetten in het hoofdnetwerk**

16

**Aantal bruikbare hostadressen in elk subnet**

14


##Opgave 2:

We kozen voor: 172.16.0.0/16

**Reden**: De andere adressen bieden oftewel te weinig ip-adressen oftewel veel te veel. Daarom is dit adres het beste in dit geval (Type B).

|Subnet Name			    |NS		  |AS		  |Address		  |Mask	|Dec Mask			    |Assignable Range			      |Broadcast|
| :---					      | :---	| :---	| :---			  | :---| :---				    | :---						          | :---
|Personeel				    |500	  |510	  |	172.16.0.0	|/23	|255.255.254.0		|172.16.0.1 - 172.16.1.254	|172.16.1.255|
|Administratie			  |20		  |30		  |	172.16.2.0	|/27	|255.255.255.224	|172.16.2.1 - 172.16.2.30	  |172.16.2.31|
|Directie				      |10		  |14		  |	172.16.2.32	|/28	|255.255.255.240	|172.16.2.33 - 172.16.2.46	|172.16.2.47|
|S Verbinding B1 B2		|2		  |2		  |	172.16.2.48	|/30	|255.255.255.252	|172.16.2.49 - 172.16.2.50	|172.16.2.51|
|S Verbinding ISP B2	|2		  |2		  |	172.16.2.52	|/30	|255.255.255.252	|172.16.2.53 - 172.16.2.54	|172.16.2.55|


