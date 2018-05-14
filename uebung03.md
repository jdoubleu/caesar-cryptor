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

[^1]: https://nmap.org/book/man-port-scanning-techniques.html