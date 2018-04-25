# Uebung 1

## Aufgabe 2.1
### a, b und c)
Siehe `$PWD/projects/uebung02/`.

### d)
Nein, siehe [*gcc 4.4.2 docs*](https://gcc.gnu.org/onlinedocs/gcc-4.4.2/gcc/Optimize-Options.html).
Er muss explizit mit `-fstack-protector` bzw. `-fstack-protector-all` aktiviert werden.

Einige Linux Distributionen jedoch haben gcc mit standardmäßig aktiviertem Stack-protector kompiliert (vgl. [^1], [^2]).
Hier muss `-fno-stack-protector` explizit verwendet werden, um es auszuschalten.

[^1]: https://www.gentoo.org/support/news-items/2014-06-15-gcc48_ssp.html
[^2]: http://manpages.ubuntu.com/manpages/trusty/man1/gcc.1.html

# Aufgabe 2.2
Schritt | Sicherheitsziele | Asset | Parteien
--- | --- | --- | ---
(1) | I, A | Website (mit Forumlar) | Bank, Kunde
(2) | C, I, A | Überweisungsdetails | Bank, Kunde
(3) | C, I, A | Selektor für TAN | Bank, Kunde
(4) | C, I, A | TAN (Eingabe) | Bank, Kunde
(5) | C, I, A | Quittung | Bank, Kunde