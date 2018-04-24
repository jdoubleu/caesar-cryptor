# Uebung 1

## Aufgabe 1.1
### a)
Ziele[^1]:
* Einheitliche Benennung von Sicherheitslücken
* Kommunikation zwischen Entdecker und Verursacher
* Standardtisierte Beschreibung

Beschrieben[^2]:
* CVE ID durch CNA
* Description durch CNA
    * Name, affected product and vendor
    * Summary of affected versions
    * vulnerability type
    * impact
    * "the access that an attacker requires to exploit the vulnerability"
    * "the important code components or inputs that are involved"
* References durch CNA

Gesponsert von US-CERT, office of Cybersecurity and Communications.
Früher auch NIST, NSA, Department of Energy

### b)
[^3] NVD wird vom NIST betrieben und, wie CVE, vom US-CERT gesponsert.
NVD ist eine Datenbank, die direkt mit der CVE synchronisiert ist.

### c)
Nach CVSS v2.0: Basis Score von 5.0 (medium) aber Exploitability Subscore von 10! [^4]


Mit https://nvd.nist.gov/vuln-metrics/cvss/v2-calculator nachgerechnet:
```
AV:N
AC:L
Au:N
C:P
I:N
A:N
```

### d)
Ähnlich wie CVE nur für Schwachstekken in Architektur, Design oder Code [^5].

Betreiber: MITRE, wie oben CVE.

### e)
"Buffer Over-read [CWE-126]" [^6].

### f)
Gegenmaßnamen: Updates/Patches

Verwundbare Systeme[^7]:
* Debian Wheezy (stable), OpenSSL 1.0.1e-2+deb7u4
* Ubuntu 12.04.4 LTS, OpenSSL 1.0.1-4ubuntu5.11
* CentOS 6.5, OpenSSL 1.0.1e-15
* Fedora 18, OpenSSL 1.0.1e-4
* OpenBSD 5.3 (OpenSSL 1.0.1c 10 May 2012) and 5.4 (OpenSSL 1.0.1c 10 May 2012)
* FreeBSD 10.0 - OpenSSL 1.0.1e 11 Feb 2013
* NetBSD 5.0.2 (OpenSSL 1.0.1e)
* OpenSUSE 12.2 (OpenSSL 1.0.1c)

## Aufgbae 1.2
### a)
CVE-2017-5753 aka. Spectre[^8].

Ursache zurückzuführen auf die Prozessor-Architektur[^8].

Betroffene Unternehmen, siehe https://meltdownattack.com/#faq-advisory.

[^1]: http://cve.mitre.org/about/index.html
[^2]: http://cve.mitre.org/about/faqs.html#cve_entry_descriptions_created
[^3]: http://cve.mitre.org/about/cve_and_nvd_relationship.html
[^4]: https://nvd.nist.gov/vuln/detail/CVE-2014-0160
[^5]: https://cwe.mitre.org/about/index.html
[^6]: https://cwe.mitre.org/data/definitions/126.html
[^7]: http://heartbleed.com/
[^8]: https://meltdownattack.com/
[^9]: https://nvd.nist.gov/vuln/detail/CVE-2017-5753