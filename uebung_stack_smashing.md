# Uebung Stack Smashing

## Aufgabe 1
### d)
Folgende Eingaben bewirken `1337` als Ausgabe:
* `123/00«00337`
* `12300000337`
* `123/00«0/1337`
* `12300001337000337`

Theoretisch lassen sich unendlich viele Eingaben konstruieren, die `1337` als Ausgabe zur Folge haben.

```
1 2 3 -1

0 0 0 0
  ^   ^
 *1   *2
3 3 7

*1 int[6] array zuende
*2 relativer ptr a
```

next frame
```
1 3 3 7

0 0 0 0
```