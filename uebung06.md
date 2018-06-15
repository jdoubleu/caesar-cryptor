# Uebung 6

## Aufgabe 6.1

Hilfe
```
k=2

----A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
A B C D E F G H I J K L M N O P Q R S T U V W X Y Z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
1020304050607080910111213141516171819202122232425262728293031
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
| PLAINTEXT | 01011 \| 11 \| I | 10000 \| 16 \| T | 10011 \| 19 \| S | 01011 \| 11 \| I | 00011 \| 03 \| C | 01000 \| 08 \| H | 00101 \| 05 \| E | 10010 \| 18 \| R | 01000 \| 08 \| H | 00101 \| 05 \| E | 01011 \| 11 \| I | 10000 \| 16 \| T |
| INPUT     |        ⊕         |        ⊕         |        ⊕         |         ⊕        |         ⊕        |         ⊕        |         ⊕        |         ⊕        |         ⊕        |         ⊕        |         ⊕        |         ⊕        |
|         L | 00100 \| 04 \| ? | 10001 \| 17 \| ? | 00011 \| 03 \| ? | 10010 \| 18 \| ? | 00001 \| 01 \| ? | 00100 \| 04 \| ? | 01110 \| 14 \| ? | 01101 \| 13 \| ? | 00110 \| 06 \| ? | 10000 \| 16 \| ? | 10111 \| 23 \| ? | 00100 \| 04 \| ? |
|         = | 01111 \| 15 \| O | 00001 \| 01 \| A | 10000 \| 16 \| P | 11001 \| 25 \| Y | 00010 \| 02 \| B | 01100 \| 12 \| L | 01011 \| 11 \| K | 11111 \| 31 \| E | 01110 \| 14 \| N | 10101 \| 21 \| U | 11100 \| 28 \| B | 10100 \| 20 \| T |
| OUTPUT    | 10001 \| 17 \| Q | 00011 \| 03 \| C | 10010 \| 18 \| R | 00001 \| 01 \| A | 00100 \| 04 \| D | 01110 \| 14 \| N | 01101 \| 13 \| M | 00111 \| 07 \| G | 10000 \| 16 \| P | 10111 \| 23 \| W | 00100 \| 04 \| D | 10110 \| 22 \| V |
| CIPHER    | 10001 \| 17 \| Q | 00011 \| 03 \| C | 10010 \| 18 \| R | 00001 \| 01 \| A | 00100 \| 04 \| D | 01110 \| 14 \| N | 01101 \| 13 \| M | 00111 \| 07 \| G | 10000 \| 16 \| P | 10111 \| 23 \| W | 00100 \| 04 \| D | 10110 \| 22 \| V |

CIPHERTEXT: QCRADNMGPWDV

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