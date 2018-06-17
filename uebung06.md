# Uebung 6

## Aufgabe 6.1

Hilfe
```
k=2

----A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
A B C D E F G H I J K L M N O P Q R S T U V W X Y Z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
001020304050607080910111213141516171819202122232425262728293031
```

### a)
Caesar-EBC,
k=2

PLAINTEXT: ITSICHERHEIT
INPUT:     ITSICHERHEIT
OUTPUT:    KVUKEJGTJGKV
CIPHER:    KVUKEJGTJGKV

#### 1)
Es sind Muster erkennbar. "K", "V", "J" kommen häufig vor.

#### 2)
Über Buchstabenhäufigkeiten kann die Nachricht entschlüsselt werden.

### b)
Caesar-CBC,
k=2,
IV = 4

| BLOCK     | 1                | 2                | 3                | 4                | 5                | 6                | 7                | 8                | 9                | 10               | 11               | 12               |
| --------: | :--------------: | :--------------: | :--------------: | :--------------: | :--------------: | :--------------: | :--------------: | :--------------: | :--------------: | :--------------: | :--------------: | :--------------: |
| PLAINTEXT | 01000 \| 08 \| I | 10011 \| 19 \| T | 10010 \| 18 \| S | 01000 \| 08 \| I | 00010 \| 02 \| C | 00111 \| 07 \| H | 00100 \| 04 \| E | 10001 \| 17 \| R | 00111 \| 07 \| H | 00100 \| 04 \| E | 01000 \| 08 \| I | 10011 \| 19 \| T |
| INPUT  ⊕  | 00100 \| 04 \| ? | 01110 \| 14 \| ? | 00101 \| 05 \| ? | 11001 \| 25 \| ? | 10011 \| 19 \| ? | 10011 \| 19 \| ? | 10110 \| 22 \| ? | 10100 \| 20 \| ? | 00111 \| 07 \| ? | 00010 \| 02 \| ? | 01000 \| 08 \| ? | 00010 \| 02 \| ? |
|         = | 01100 \| 12 \| M | 11101 \| 29 \| D | 10111 \| 23 \| X | 10001 \| 17 \| R | 10001 \| 17 \| R | 10100 \| 20 \| U | 10010 \| 18 \| S | 00101 \| 05 \| F | 00000 \| 00 \| A | 00110 \| 06 \| G | 00000 \| 00 \| A | 10001 \| 17 \| R |
| OUTPUT    | 01110 \| 14 \| O | 00101 \| 05 \| F | 11001 \| 25 \| Z | 10011 \| 19 \| T | 10011 \| 19 \| T | 10110 \| 22 \| W | 10100 \| 20 \| U | 00111 \| 07 \| H | 00010 \| 02 \| C | 01000 \| 08 \| I | 00010 \| 02 \| C | 10011 \| 19 \| T |
| CIPHER    | 01110 \| 14 \| O | 00101 \| 05 \| F | 11001 \| 25 \| Z | 10011 \| 19 \| T | 10011 \| 19 \| T | 10110 \| 22 \| W | 10100 \| 20 \| U | 00111 \| 07 \| H | 00010 \| 02 \| C | 01000 \| 08 \| I | 00010 \| 02 \| C | 10011 \| 19 \| T |

CIPHERTEXT: OFZTTWUHCICT
Für A=1: OCRCBLKAKPAW

#### 1)

#### 2)
```
m_i = d(c_i mod 26, k + c_i-1)
```

### c)
Der Vorteil an ROT13 ist, dass zum Ent- und Verschlüsseln der gleiche Algorithmus verwendet werden kann, da 26/2 = 13.

Verschlüsselt man zwei mal mit ROT13 hat man effektiv eine Ver- und wieder Entschlüsselung durchgeführt.
Das Ergebnis wäre also der Klartext.

### d)
Dies würde nur höheren Aufwand bedeuten, da
```
∀ k1,k2 ∈ [1,26] ∃ k1 + k2 = 'k
```