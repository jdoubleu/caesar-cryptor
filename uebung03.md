# Uebung 3

## Aufgabe 3.1
### a)

Befehl: `nmap localhost`.
Ergebnis:
```
Starting Nmap 7.70 ( https://nmap.org ) at 2018-05-14 10:28 CEST
Nmap scan report for localhost (127.0.0.1)
Host is up (0.00047s latency).
Other addresses for localhost (not scanned): ::1
Not shown: 970 closed ports
PORT      STATE    SERVICE
80/tcp    open     http
443/tcp   open     https
705/tcp   filtered agentx
720/tcp   filtered unknown
749/tcp   filtered kerberos-adm
1011/tcp  filtered unknown
1071/tcp  filtered bsquare-voip
1108/tcp  filtered ratio-adp
1271/tcp  filtered excw
2968/tcp  filtered enpp
3221/tcp  filtered xnm-clear-text
3306/tcp  open     mysql
4900/tcp  filtered hfcs
5030/tcp  filtered surfpass
5510/tcp  filtered secureidprop
5907/tcp  filtered unknown
6025/tcp  filtered x11
6547/tcp  filtered powerchuteplus
7070/tcp  open     realserver
8002/tcp  filtered teradataordbms
8080/tcp  open     http-proxy
8291/tcp  filtered unknown
8292/tcp  filtered blp3
8443/tcp  open     https-alt
9101/tcp  filtered jetdirect
11110/tcp filtered sgi-soap
27355/tcp filtered unknown
32783/tcp filtered unknown
44501/tcp filtered unknown
65000/tcp filtered unknown

Nmap done: 1 IP address (1 host up) scanned in 5.90 seconds
```

vs. Wenn VSCODE geschlossen ist:

```
Starting Nmap 7.70 ( https://nmap.org ) at 2018-05-14 10:31 CEST
Nmap scan report for localhost (127.0.0.1)
Host is up (0.0024s latency).
Other addresses for localhost (not scanned): ::1
Not shown: 994 closed ports
PORT     STATE SERVICE
80/tcp   open  http
443/tcp  open  https
3306/tcp open  mysql
7070/tcp open  realserver
8080/tcp open  http-proxy
8443/tcp open  https-alt

Nmap done: 1 IP address (1 host up) scanned in 8.57 seconds
```

### b)

Entnommen von [^1]:
* `-sS` TCP SYN scan
* `-sT` TCP connect scan (default)
* `-sU` UDP scans
usw.

Durch Lücken im TCP Protokoll können mit `-sN`, `-sF`, oder `-sX` (sog. TCP NULL, FIN, and Xmas scans) unentdeckbare Scans durchgeführt werden.

### c)
Möglicherweise nicht, da es sich hier um sehr low-level Pakete handelt und die Firewall noch keinen wirklichen Dienst erkennen kann. Allerdings könnte sich bei dem Angriff ein Muster ergeben, welches ein IDS wohlmöglich später erkennen könnte.

## Aufgabe 3.2

Filter: `pop or smtp`.
Gefundene E-Mail:
```
+OK 1313 octets
Return-Path: <john@mysecretcompany.io>
Delivered-To: lisa@freemailer.io
Received: from mail.mymailserver.io (mail.mymailserver.io [127.0.0.1])
	by mail.mymailserver.io (Postfix) with ESMTP id 4EA5A2DAD1
	for <lisa@freemailer.io>; Wed, 13 Apr 2016 22:46:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.mymailserver.io
Received: from mail.mymailserver.io ([127.0.0.1])
	by mail.mymailserver.io (mail.mymailserver.io [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id JYv8efWb86kd for <lisa@freemailer.io>;
	Wed, 13 Apr 2016 22:45:53 +0200 (CEST)
Received: from _ (mail.mymailserver.io [127.0.0.1])
	by mail.mymailserver.io (Postfix) with ESMTPSA id 0B7F12EB77
	for <lisa@freemailer.io>; Wed, 13 Apr 2016 22:45:53 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Wed, 13 Apr 2016 22:45:52 +0200
From: john@mysecretcompany.io
To: lisa@freemailer.io
Subject: Meeting
Message-ID: <b8adcb931d03ecbba2d7176cd32d3d21@mysecretcompany.io>
X-Sender: john@mysecretcompany.io
User-Agent: Roundcube Webmail

Lisa,

Lets meet in Bad Aibling HQ #QF9 tomorrow at 9:00 am.

Best,
John

PS: Connect to root@23.11.5.113 with password "8h15j01mA!" and download 
our latest documents about the new backdoor.
.
```

### a)
john@mysecretcompany.io hat über den Mailserver mail.mymailserver.io eine E-Mail an Lisa geschickt.

### b)
John schlaägt vor sich in Bad Aibling HQ #QF9 morgen um 9 Uhr zu treffen.

### c)
Informationen, die misbraucht werden könnten:
* Ein Login zu einem Server ist in der E-Mail enthalten,
* Informationen über das Treffen, 
* die Mailserver der Beiden,
* das Verwendete Virenprogramm.

### d)
Login Paket:
```
0000   08 00 27 1e 8c 2e 08 00 27 f3 d4 b8 08 00 45 00  ..'.....'.....E.
0010   00 62 82 0e 40 00 40 06 c6 69 c0 a8 38 65 c0 a8  .b..@.@..i..8e..
0020   38 68 e2 c2 00 6e 40 b0 45 be e5 6d 5a c0 80 18  8h...n@.E..mZ...
0030   00 e5 0f 05 00 00 01 01 08 0a ff ff c7 af 00 04  ................
0040   a4 27 41 47 78 70 63 32 46 41 5a 6e 4a 6c 5a 57  .'AGxpc2FAZnJlZW
0050   31 68 61 57 78 6c 63 69 35 70 62 77 42 73 61 58  1haWxlci5pbwBsaX
0060   4e 68 63 33 4e 6c 59 33 4a 6c 64 41 3d 3d 0d 0a  Nhc3NlY3JldA==..
```

Login `AGxpc2FAZnJlZW1haWxlci5pbwBsaXNhc3NlY3JldA==` -> base64 decoded: `lisa@freemailer.iolisassecret`

### e)
Der Inhalt der E-Mail könnte über eine Ende-zu-Ende Verschlüsselung geschützt werden.

Darüber hinaus sollte unbedingt über das TLS Protokoll mit dem Mailserver kommuniziert werden. Dann ist erstmal der gesammte Datenvekehr von Lisa mit dem Mailserver geschüzt.

[^1]: https://nmap.org/book/man-port-scanning-techniques.html