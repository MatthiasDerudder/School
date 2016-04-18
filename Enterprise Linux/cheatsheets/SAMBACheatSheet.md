## SAMBA commando's

| Commando | Beschrijving |
|--------|--------|
|yum install samba samba-client samba-common| install samba|
|vi /etc/samba/smb.conf| Change configuration|
|firewall-cmd --permanent --zone=public --add-service=samba| add samba to firewall|
|firewall-cmd --reload| restarts firewall|
|groupadd smbgrp| add the group for secure share|
|useradd user -G smbgrp| adds a user to the smb group|
|smbpasswd -a fixit| set password|
|mkdir -p /samba/secure_folder| create folder for secure share|
|chmod -R 0777 sharename| set permissions|
|chcon | change security context|
|testparm| checks for errors|
|getsebool -a `|` grep samba | find the bolean settings|