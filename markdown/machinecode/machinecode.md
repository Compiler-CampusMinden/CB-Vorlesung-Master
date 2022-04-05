---
type: lecture-cg
title: "Generierung von Maschinencode (Skizze)"
menuTitle: "Maschinencode"
author: "Carsten Gips (FH Bielefeld)"
weight: 1
readings:
  - key: "Mogensen2017"
    comment: "Kapitel 7 Machine-Code Generation"
tldr: |
  Dies ist ein Ausblick und soll die Erzeugung von Maschinencode skizzieren.

  Die Erzeugung von Maschinencode ist der Erzeugung von Bytecode relativ ähnlich, allerdings muss
  man die Eigenschaften der Zielhardware (Register, Maschinenbefehle, ...) beachten. Insbesondere
  muss man ein Text-Segment erstellen, welches die aus dem Zwischencode übersetzten Maschinenbefehle
  enthält. Ähnlich wie beim Bytecode werden Konstanten und Literale am Ende vom Text-Segment
  gesammelt.

  Ein wichtiger (und schwieriger) Schritt ist die Zuordnung von Variablen und Daten zu Registern
  oder Adressen. Auch für Sprünge o.ä. müssen immer wieder Adressen berechnet werden.

  Der Aufruf von Funktionen funktioniert ähnlich wie bei der stackbasierten VM: Die Codegenerierung
  muss dafür sorgen, dass für einen Funktionsaufruf der passende *Stack-Frame* erzeugt wird und
  der Prozessor bei der Ausführung in das richtige Code-Segment springt (bei der VM war das einfach:
  Die Pointer auf den Byte-Code und der Instruction-Pointer wurden einfach passend "umgebogen"). Für
  den Rücksprung muss der Instruction-Pointer mit auf dem Stack abgelegt werden.
outcomes:
  - k3: "Code-Generierung (Maschinencode) erfordert Auflösung von Speicheradressen und -breiten"
youtube:
  - link: "https://youtu.be/R2anlIWZqGY"
    name: "VL Maschinencode"
fhmedia:
  - link: "https://www.fh-bielefeld.de/medienportal/m/3321732b51dab72206dd0f6ee1d07449b80c37c2e0880192b38f1e835d10e2c7aea5e75632ea174d44d4d5dbb6864910990cfef160dedd06213ee8ffdf0c9a36"
    name: "VL Maschinencode"
---


## Einordnung

![](https://raw.githubusercontent.com/munificent/craftinginterpreters/master/site/image/a-map-of-the-territory/mountain.png)

[Quelle: ["A Map of the Territory (mountain.png)"](https://github.com/munificent/craftinginterpreters/blob/master/site/image/a-map-of-the-territory/mountain.png) by [Bob Nystrom](https://github.com/munificent), licensed under [MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE)]{.origin}

::: notes
Die Erzeugung von Maschinencode ist in gewisser Weise ein "Parallelweg" zum Erzeugen von
Bytecode. Die Schwierigkeit liegt darin, die **technischen Besonderheiten** der
**Zielplattform** (Register, Maschinenbefehle) gut zu kennen und sinnvoll zu nutzen.

Häufig nutzt man als Ausgangsbasis den Drei-Adressen-Code als IR, der strukturell dem zu
erzeugenden Maschinencode bereits recht ähnlich ist. Oder man macht sich die Sache einfach
und generiert LLVM IR und lässt die LLVM-Toolchain übernehmen ;-)

Hier der Vollständigkeit halber ein Ausblick ...
:::


## Prozessorarchitektur

<!-- TODO Image stopped working w/ Pandoc/Beamer (Slides) -->
<!--
![](https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Intel_i80286_arch.svg/1024px-Intel_i80286_arch.svg.png){width="80%"}
-->

[Quelle: ["Intel i80286 arch"](https://commons.wikimedia.org/wiki/File:Intel_i80286_arch.svg) by [Appaloosa](https://commons.wikimedia.org/wiki/User:Appaloosa), licensed under [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0)]{.origin}

::: notes
Am Beispiel der noch übersichtlichen Struktur des Intel i80286 lassen sich verschiedene
Grundbausteine eines Prozessors identifizieren.

Zunächst hat man eine Ausführungseinheit (*Execution Unit*), die sich vor allem aus
verschiedenen Registern und der Recheneinheit (*ALU*) zusammen setzen. Hier kann man
Adressen berechnen oder eben auch Dinge wie Addition ...

Über die Register wird auch die Adressierung des Speichers vorgenommen. Aus Sicht eines
Prozesses greift dieser auf einen zusammenhängenden, linearen Speicher zu ("Virtueller
Speicher", siehe nächste Folie). Dieser setzt sich in der Realität aus verschiedenen
Segmenten zusammen, die auch auf unterschiedliche Speichertypen (RAM, Cache, SSD, ...)
verteilt sein können. In der *Address Unit* werden aus *logischen* Adressen die konkreten
*physikalischen* Adressen berechnet.

Über die *Bus Unit* erfolgt der physikalische Zugriff auf die konkrete Hardware.

In der *Instruction Unit* wird der nächste Befehl geholt und dekodiert und zur Ausführung
gebracht.
:::


## Virtueller Speicher

:::::: center
![](images/virtueller-speicher.png){width="40%"}
::::::


::::::::: notes
*   Kernel weist jedem Prozess seinen eigenen virtuellen Speicher zu \
    Linearer Adressbereich, beginnend mit Adresse 0 bis zu einer
    maximalen Adresse
*   Verwaltung durch MMU (*Memory Management Unit*) \
    MMU bildet logische Adressen aus virtuellem Speicher auf den
    physikalischen Speicher ab (transparent für den Prozess)

### Segmente des virtuellen Speichers: Text

*   **Text Segment** (read-only)
    *   Programm Code
    *   Konstanten, String Literale
*   Bereich initialisierter Daten
    *   globale und static Variablen (explizit initialisiert)
*   Bereich uninitialisierter Daten
    *   globale und static Variablen (uninitialisiert) => Wert 0

**ACHTUNG**: Bereich (un-) initialisierter Daten nicht in Abbildung dargestellt!

### Segmente des virtuellen Speichers: Stack

*   Stackframe je Funktionsaufruf:
    *   Lokale Variablen ("automatische" Variablen)
    *   Argumente und Return-Werte
*   Dynamisch wachsend und schrumpfend
*   [Automatische]{.alert} Pflege
    *   Nach Funktionsrückkehr wird der Stackpointer ("Top of Stack") weiter gesetzt
    *   Dadurch "Bereinigung": Speicher der lokalen Variablen wird freigegeben

### Segmente des virtuellen Speichers: Data (Heap)

*   Bereich für dynamischen Speicher (Allokation während der Laufzeit)
*   Dynamisch wachsend und schrumpfend
*   Zugriff und Verwaltung aus [laufendem]{.alert} Programm  => **Pointer**
    *   `malloc()`/`calloc()`/`free()` (C)
    *   `new`/`delete` (C++)
    *   typischerweise [**Pointer**]{.alert}
:::::::::


## Befehlszyklus (von-Neumann-Architektur)

```python
op = read_next_op(pc)
decode(op)
pc += 1

args = nil
if operands_needed(op):
    args = read_operands(pc)
    pc += 1

execute(op, args)
```

::: notes
Typischerweise hat man neben dem Stack und dem Heap noch diverse Register auf dem Prozessor,
die man wie (schnelle Hardware-) Variablen nutzen kann. Es gibt normalerweise einige spezielle
Register:

*   Program Counter (*PC*): Zeigt auf die Stelle im Textsegment, die gerade ausgeführt wird
*   Stack Pointer (*SP*): Zeigt auf den nächsten freien Stackeintrag
*   Frame Pointer (*FP*): Zeigt auf die Rücksprungadresse auf dem Stack
*   Akkumulator: Speichern von Rechenergebnissen

Der Prozessor holt sich die Maschinenbefehle, auf die der PC aktuell zeigt und dekodiert sie,
d.h. holt sich die Operanden, und führt die Anweisung aus. Danach wird der PC entsprechend
erhöht und der *Fetch-Decode-Execute*-Zyklus startet erneut. (OK, diese Darstellung ist stark
vereinfacht und lässt beispielsweise *Pipelining* außen vor ...)

*Anmerkung*: In der obigen Skizze wird der *PC* für jede Instruktion oder jeden Operanden
um 1 erhöht. Dies soll andeuten, dass man die nächste Instruktion lesen möchte. In der Realität
muss hier auf die nächste relevante Speicheradresse gezeigt werden, d.h. das Inkrement muss
die Breite eines Op-Codes etc. berücksichtigen.

Ein Sprung bzw. Funktionsaufruf kann erreicht werden, in dem der *PC* auf die Startadresse der
Funktion gesetzt wird.

Je nach Architektur sind die Register, Adressen und Instruktionen 4 Bytes (32 Bit) oder 8 Bytes
(64 Bit) "breit".
:::


## Aufgaben bei der Erzeugung von Maschinen-Code

::: notes
Relativ ähnlich wie bei der Erzeugung von Bytecode, nur muss diesmal die Zielhardware
(Register, Maschinenbefehle, ...) beachtet werden:
:::

*   Übersetzen des Zwischencodes in Maschinenbefehle [für die jeweilige Zielhardware]{.notes}
*   Sammeln von Konstanten und Literalen am Ende vom Text-Segment

\smallskip

*   Auflösen von Adressen:
    *   Sprünge: relativ [(um wie viele Bytes soll gesprungen werden)]{.notes} oder
        absolut [(Adresse, zu der gesprungen werden soll)]{.notes}
    *   Strukturen (Arrays, Structs)[ haben ein Speicherlayout]{.notes}: Zugriff
        auf Elemente/Felder über Adresse [(muss berechnet werden)]{.notes}
    *   Zugriffe auf Konstanten oder Literalen: [Muss ersetzt werden durch]{.notes}
        Zugriff auf Text-Segment

\smallskip

*   Zuordnung der Variablen und Daten zu Registern oder Adressen
*   Aufruf von Funktionen: Anlegen der *Stack-Frames* [(auch *Activation Record* genannt)]{.notes}

\smallskip

*   Aufbau des Binärformats und Linking auf der Zielmaschine (auch Betriebssystem) beachten


## Übersetzen von Zwischencode in Maschinencode

::: notes
Für diese Aufgabe muss man den genauen Befehlssatz für den Zielprozessor kennen.
Im einfachsten Fall kann man jede Zeile im Zwischencode mit Hilfe von Tabellen
und Pattern Matching direkt in den passenden Maschinencode übertragen. Beispiel
vgl. Tabelle 7.1 in [@Mogensen2017, S.162].

Je nach Architektur sind die Register, Adressen und Instruktionen 4 Bytes (32 Bit)
oder 8 Bytes (64 Bit) "breit".

Da in einer Instruktion wie `ldr r0, x` die Adresse von `x` mit codiert werden
muss, hat man hier nur einen eingeschränkten Wertebereich. Üblicherweise ist dies
relativ zum *PC* zu betrachten, d.h. beispielsweise `ldr r0, #4[pc]` (4 Byte plus *PC*).
Dadurch kann man mit *PC-relativer Adressierung*  dennoch größere Adressbereiche
erreichen. Alternativ muss man mit indirekter Adressierung arbeiten und im Textsegment
die Adresse der Variablen im Datensegment ablegen: `ldr r0, ax`, wobei `ax` eine
mit *PC-relativer Adressierung* erreichbare Adresse im Textsegment ist, wo die
Adresse der Variablen `x` im Datensegment hinterlegt ist. Anschließend kann man
dann `x` laden: `ldr ro, [ro]`.

Ähnliches gilt für Konstanten: Wenn diese direkt geladen werden sollen, steht
quasi nur der "Rest" der Bytes vom Opcode zur Verfügung. Deshalb sammelt man die
Konstanten am Ende vom Text-Segment und ruft sie von dort ab.
:::

::::::::: columns
:::::: {.column width="30%"}

::: notes
**Beispiel**

In dem kurzen IR-Snippet soll zum Label "L" verweigt werden, wenn ein Wert x kleiner
ein anderer Wert v ist.
:::

```
L:  ...
    ...
    if x < v goto L
```

::::::
:::::: {.column width="65%"}

\pause

::: notes
Bei der Erzeugung des Maschinencodes wird das Label "L" an einer konkreten Adresse
im Text-Segment angesiedelt, beispielsweise bei 1000. Für die If-Abfrage müssen
zunächst die beiden Werte in Register geladen werden und die Register subtrahiert
werden. Anschließend kann man in dem angenommenen Op-Code `bltz` ("branch if less
than zero") zur Adresse 1000 springen, wenn der Wert in Register R0 kleiner als Null
ist. Anderenfalls würde einfach hinter der Adresse 1108 weiter gemacht.
:::

```
1000: ...               ;; L
      ...
1080: ldr   r0, x       ;; R0 = x
1088: ldr   r1, v       ;; R1 = v
1096: sub   r0, r0, r1  ;; R0 = R0-R1
1108: bltz  r0, 1000    ;; if R0<0 jump to 1000 (L)
```

::: notes
*Anmerkungen*: In der Skizze hier stehen `x` und `v` für die Adressen, wo die
Werte von `x` und `v` gespeichert werden. D.h. im Maschinencode steht nicht
`x`, sondern die Adresse von `x`.

Beachten Sie auch die unterschiedlichen Adressen: Im Beispiel wurde für `ldr r0`
ein 4 Byte großer Op-Code angenommen plus 4 Byte für die Adresse `x`. Für das `sub`
wurden dagegen 3x 4 Byte gebraucht (Op-Code, R0, R1).
:::

::::::
:::::::::


## Aufruf von Funktionen

::: notes
Es soll Maschinencode für den folgenden Funktionsaufruf erzeugt werden:
:::

```
x = f(p1, ..., pn)
```

::: notes
Dies könnte sich ungefähr in folgenden (fiktiven) Assembler-Code übersetzen lassen:
:::

:::::: columns
::: {.column width="80%"}

```{size="footnotesize"}
    FP = SP             ;; Framepointer auf aktuellen Stackpointer setzen
    Stack[SP] = R       ;; Rücksprungadresse auf Stack
    Stack[SP-4] = p1    ;; Parameter p1 auf Stack
    ...
    Stack[SP-4*n] = pn  ;; Parameter pn auf Stack
    SP = SP - 4*(n+1)   ;; Stackpointer auf nächste freie Stelle
    Goto f              ;; Setze den PC auf die Adresse von f im Textsegment
R:  x = Stack[SP+4]     ;; Hole Rückgabewert
    SP = SP + 4         ;; Stackpointer auf nächste freie Stelle
```

:::
::: {.column width="20%"}

::: slides
![](images/f-stackframe.png)
:::
::: notes
![](images/f-stackframe.png){width="30%"}
:::

:::
::::::

::: notes
### Funktionsaufruf

Ein Funktionsaufruf entspricht einem Sprung an die Stelle im
Textsegment, wo der Funktionscode abgelegt ist. Dies erreicht man, in
dem man diese Adresse in den *PC* schreibt. Bei einem `return` muss
man wieder zum ursprünglichen Programmcode zurückspringen, weshalb man
diese Adresse auf dem Stack hinterlegt.

### Parameter

Zusätzlich müssen Parameter für die Funktion auf dem Stack abgelegt
werden, damit die Funktion auf diese zugreifen kann. Im Funktionscode
greift man dann statt auf die Variablen auf die konkreten Adressen im
Stack-Frame zu. Dazu verwendet man den *Framepointer* bzw. *FP*, der
auf die Adresse des ersten Parameters, d.h. auf die Adresse *hinter*
der Rücksprungadresse, zeigt. Die Parameter sind dann je Funktion über
konstante Offsets relativ zum *FP* erreichbar. Ähnlich wie die
Rücksprungadresse muss der *FP* des aufrufenden Kontexts im Stack-Frame
der aufgerufenen Funktion gesichert werden (in der Skizze nicht dargestellt)
und am Ende des Aufrufs wieder hergestellt werden.

### Lokale Variablen

Lokale Variablen einer Funktion werden ebenfalls auf dem Stack
angelegt, falls nicht genügend Register zur Verfügung stehen, und
relativ zum *FP* adressiert. Die Größe des dafür verwendeten Speichers
wird oft als *Framesize* oder *Rahmengröße* bezeichnet. Am Ende eines
Funktionsaufrufs wird dieser Speicher freigegeben indem der
*Stackpointer* bzw. *SP* auf den *FP* zurückgesetzt wird.

Die Adressierung von Parametern und Variablen kann auch relativ zum
*SP* erfolgen, so dass kein *FP* benötigt wird. Der dazu erzeugte
Maschinencode kann aber deutlich komplexer sein, da Stack und *SP*
auch für arithmetische Berechnungen verwendet werden und der *SP*
somit für die Dauer eines Funktionsaufrufs nicht zwingend konstant
ist.

### Rückgabewerte

Falls eine Funktion Rückgabewerte hat, werden diese ebenfalls auf dem
Stack abgelegt (Überschreiben der ursprünglichen Parameter).

Zusammengefasst gibt es für jeden Funktionsaufruf die in der obigen
Skizze dargestellte Struktur ("Stack Frame" oder auch "Activation
Record" genannt):

*   Funktionsparameter (falls vorhanden)
*   Rücksprungadresse (d.h. aktueller *PC*)
*   Lokale Variablen der Funktion (falls vorhanden)

### Sichern von lokalen Variablen der "alten" Funktion

-   Vor Funktionsaufrufen müssen aktuell verwendete Register (lokale Variablen) gesichert werden
-   Register werden in den Speicher (Stack) ausgelagert
-   Sicherung kann durch aufrufende Funktion (*Caller-Saves*) oder aufgerufene Funktion (*Callee-Saves*) erfolgen
    -   Caller-Safes: nur "lebende" Register müssen gesichert werden
    -   Callee-Safes: nur tatsächlich verwendete Register müssen gesichert werden
-   Nachteile: unnötiges Sichern von Registern bei beiden Varianten möglich
-   In der Praxis daher meist gemischter Ansatz aus Caller-Saves und Callee-Saves Registern
:::


## Funktionsaufruf: Prolog

```
f:  ...                 ;; Label f: hier startet die Funktion
    p1 = Stack[SP+4*n]  ;; Zugriff auf p1 (per SP)
    p1 = Stack[FP-4]    ;; Zugriff auf p1 (per FP)
    ...                 ;; hier Funktionskram
```

::: notes
Die Parameter einer Funktion werden vom aufrufenden Kontext auf dem Stack abgelegt. Nach dem Sprung
in die Funktion kann über den Stack-Pointer oder den Frame-Pointer darauf zugegriffen werden. Alternativ
könnte man die Parameter auch in vorhandene Register laden und entsprechend den *SP* hochzählen.
:::


## Funktionsaufruf: Epilog


:::::: columns
::: {.column width="80%"}

```{size="footnotesize"}
    SP = FP - 4             ;; Position über Rücksprungadresse auf Stack
    FP = Stack[FP]          ;; Sichere Rücksprungadresse (R)
    Stack[SP+4] = Ergebnis  ;; Ergebnis auf Stack (statt Rücksprung-Adresse)
    Goto FP                 ;; Setze den PC auf die Rücksprung-Adresse
```

:::
::: {.column width="20%"}

::: slides
![](images/f-epilog.png)
:::
::: notes
![](images/f-epilog.png){width="30%"}
:::

:::
::::::

::: notes
Beim Rücksprung aus einer Funktion wird der Rückgabewert an die Stelle der Rücksprungadresse
geschrieben und der restliche Stack freigegeben.

Der Rückgabewert wird dann vom Aufrufer an der Stelle `Stack[SP+4]` abgerufen und freigegeben
(siehe Beispiel oben).

*Anmerkung*: Das Handling des *FP* ist im obigen Beispiel nicht konsistent bzw. vollständig.
Nach dem Rücksprung in den Aufrufer muss der *FP* auf die Speicheradresse im Stack zeigen, wo
die Rücksprungadresse dessen Aufrufers steht ...
:::


## Wrap-Up

Skizze zur Erzeugung von Assembler-Code

\bigskip

*   Relativ ähnlich wie die Erzeugung von Bytecode
*   Beachtung der Eigenschaften der Zielhardware (Register, Maschinenbefehle, ...)
    *   Übersetzen des Zwischencodes in Maschinenbefehle
    *   Sammeln von Konstanten und Literalen am Ende vom Text-Segment
    *   Auflösen von Adressen
    *   Zuordnung der Variablen und Daten zu Registern oder Adressen
    *   Aufruf von Funktionen: Op-Codes zum Anlegen der *Stack-Frames*





<!-- DO NOT REMOVE - THIS IS A LAST SLIDE TO INDICATE THE LICENSE AND POSSIBLE EXCEPTIONS (IMAGES, ...). -->
::: slides
## LICENSE
![](https://licensebuttons.net/l/by-sa/4.0/88x31.png)

Unless otherwise noted, this work is licensed under CC BY-SA 4.0.

### Exceptions
*   Image ["A Map of the Territory (mountain.png)"](https://github.com/munificent/craftinginterpreters/blob/master/site/image/a-map-of-the-territory/mountain.png)
    (https://github.com/munificent/craftinginterpreters/blob/master/site/image/a-map-of-the-territory/mountain.png),
    by [Bob Nystrom](https://github.com/munificent), licensed under [MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE)
*   Image ["Intel i80286 arch"](https://commons.wikimedia.org/wiki/File:Intel_i80286_arch.svg)
    (https://commons.wikimedia.org/wiki/File:Intel_i80286_arch.svg), by [Appaloosa](https://commons.wikimedia.org/wiki/User:Appaloosa), licensed
    under [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0)
:::
