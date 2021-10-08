---
type: lecture-cg
title: "Lexer: Tabellenbasierte Implementierung"
menuTitle: "Tabellenbasierte Implementierung"
author: "Carsten Gips (FH Bielefeld)"
weight: 2
readings:
  - key: "Aho2008"
    comment: " Abschnitt 2.6 und Kapitel 3"
  - key: "Torczon2012"
    comment: "Kapitel 2"
  - key: "Mogensen2017"
    comment: "Kapitel 1 (insbesondere Abschnitt 1.8)"
assignments:
  - topic: sheet01
youtube:
  - id: 2GeEaU3qB6c
fhmedia:
  - link: "https://www.fh-bielefeld.de/medienportal/m/36f62768351b19aa6453c819afa64cf2cc9ac698d3cf29137f3c7a5aeb5229de7c1102b8cf87981c27cbc1b250f03f1572e690dc96fb69e89a982f8200d54eb2"
    name: "Direktlink FH-Medienportal: CB Tabellenbasierte Scanner"
---


## Lexer: Erzeugen eines Token-Stroms aus einem Zeichenstrom

\vspace{-20mm}

[Aus dem Eingabe(-quell-)text]{.notes}

```c
/* demo */
a= [5  , 6]     ;
```

[erstellt der Lexer (oder auch Scanner genannt) eine Sequenz von Token:]{.notes}

\pause
\bigskip
\bigskip

```
<ID, "a"> <ASSIGN> <LBRACK> <NUM, 5> <COMMA> <NUM, 6> <RBRACK> <SEMICOL>
```

::: notes
*   Input: Zeichenstrom (Eingabedatei o.ä.)
*   Verarbeitung: Finden sinnvoller Sequenzen im Zeichenstrom ("Lexeme"),
    Einteilung in Kategorien und Erzeugen von Token (Paare: Typ/Name, Wert)
*   Ausgabe: Tokenstrom

Normalerweise werden für spätere Phasen unwichtige Elemente wie White-Space
oder Kommentare entfernt.

Durch diese Vorverarbeitung wird eine höhere Abstraktionsstufe erreicht und es
können erste grobe Fehler gefunden werden. Dadurch kann der Parser auf einer
abstrakteren Stufe arbeiten und muss nicht mehr den gesamten ursprünglichen
Zeichenstrom verarbeiten.


*Anmerkung*: In dieser Phase steht die Geschwindigkeit stark im Vordergrund:
Der Lexer "sieht" *alle* Zeichen im Input. Deshalb findet man häufig von
Hand kodierte Lexer, obwohl die Erstellung der Lexer auch durch Generatoren
erledigt werden könnte ...


*Anmerkung*: Die Token sind die Terminalsymbole in den Parserregeln (Grammatik).
:::


## Definition wichtiger Begriffe

*   **Token**: Tupel (Tokenname, optional: Wert)

    ::: notes
    Der Tokenname ist ein abstraktes Symbol, welches eine lexikalische
    Einheit repräsentiert (Kategorie). Die Tokennamen sind die Eingabesymbole
    für den Parser.

    Token werden i.d.R. einfach über ihren Namen referenziert. Token werden
    häufig zur Unterscheidung von anderen Symbolen in der Grammatik in
    Fettschrift oder mit großen Anfangsbuchstaben geschrieben.

    Ein Token kann einen Wert haben, etwa eine Zahl oder einen Bezeichner, der
    auf das zum Token gehörende Pattern gematcht hatte (also das Lexem). Wenn
    der Wert des Tokens eindeutig über den Namen bestimmt ist (im Beispiel oben
    beim Komma oder den Klammern), dann wird häufig auf den Wert verzichtet.
    :::

\smallskip

*   **Lexeme**: Sequenz von Zeichen im Eingabestrom, die auf ein Tokenpattern
    matcht und vom Lexer als Instanz dieses Tokens identifiziert wird.

\smallskip

*   **Pattern**: Beschreibung der Form eines Lexems

    ::: notes
    Bei Schlüsselwörtern oder Klammern etc. sind dies die Schlüsselwörter oder
    Klammern selbst. Bei Zahlen oder Bezeichnern (Namen) werden i.d.R.
    reguläre Ausdrücke zur Beschreibung der Form des Lexems formuliert.
    :::


## Erkennung mit RE und DFA

![](images/lexer.png)

::: notes
Die obige Skizze ist eine Kurzzusammenfassung der Theorie-Vorlesung in der
letzten Woche und stellt die Verbindung zur heutigen Vorlesung her:

Die Lexeme werden mit Hilfe von *DFA* bestimmt. Die Formulierung der DFA ist
eher komplex (zumindest sehr umständlich), weshalb man die Pattern für die
Lexeme ersatzweise mit Hilfe von *Regulären Ausdrücken* ("*RE*") formuliert.

Mit Hilfe der *Thompson's Construction* kann man diese in äquivalente *NFA*
umformen. Über die *Subset Construction* kann man daraus *DFA* erzeugen, die
wiederum mit Hilfe des *Hopcroft's Algorithm* minimiert werden.

Diese DFA erkennen die selbe Sprache wie die ursprünglichen REs. Man könnte
also durch Simulation der DFA die Lexeme erkennen und die Token bilden. Dabei
würde pro Eingabezeichen ein Übergang im DFA stattfinden und bei Erreichen
eines akzeptierenden Zustandes hätte man das durch diesen DFA (bzw. dessen
ursprünglichen RE) beschriebene Lexem identifiziert.

Falls mehrere REs matchen, muss man in geeigneter Weise entscheiden. I.d.R.
nimmt man den längsten Match. Zusätzlich wird eine Reihenfolge unter den REs
festgelegt, um bei mehreren gleich langen Matches ein Token bestimmen zu
können.

In der Praxis werden die DFA als Ausgangspunkt für die Implementierung des
Lexers genutzt (ob nun bei einer "handgeklöppelten" Implementierung oder beim
Einsatz eines Lexer-Generators). Als typische Implementierungsansätze sollen
nachfolgend die *tabellenbasierte Implementierung* sowie als etwas schnellere
Variante die *direkt codierte Implementierung* betrachtet werden. Während diese
beiden Varianten noch sehr nah an der Simulation eines DFA sind, ist die
*manuelle Implementierung*
(vgl. `["Handcodierte Implementierung"]({{<ref "/lexing/recursive" >}})`{=markdown})
noch einfacher in bestehenden Code zu integrieren (zum Preis einer erschwerten
Änderbarkeit).

Über die *Kleene's Construction* könnte man aus den DFA wieder *RE* erzeugen
und damit den Kreis schließen :-)
:::


## Erkennen von Zeichenketten für Strickmuster: "10LRL"

::: center
![](images/dfa.png){width="45%"}
:::

::: notes
DFA zur Erkennung von Strickanweisungen: Das erste Zeichen muss ein
Digit im Bereich 1..9 sein, gefolgt von weiteren Digits, gefolgt von
einer Anweisung für linke Maschen ("L") oder rechte Maschen ("R").

Ein passender regulärer Ausdruck dafür wäre "`[1-9][0-9]*[LR]+`".

Die Eingabezeichen werden in relevante Kategorien sortiert. Dabei
werden nur die für die Aufgabe interessanten Zeichen ("R" bzw. "L"
und die Ziffern) einer konkreten Kategorie zugewiesen, der Rest wird
als "`*`" zusammengefasst.
:::

\bigskip
\bigskip
\pause

::: center
![](images/delta.png){width="40%"}
:::

::: notes
Für jeden Zustand wird in der Tabelle vermerkt, in welchen Folgezustand beim
Auftreten eines Zeichens einer bestimmten Kategorie gewechselt werden soll.
Dies ist eine alternative Darstellung des DFA in der obigen Darstellung.

Die Zustände des DFA werden den Tokentypen zugeordnet. Alle Zustände außer
"`s2`" entsprechen keinem gültigen Token, dies könnte man etwa als Token-Typ
"`invalid`" realisieren.

*Anmerkung*: "`se`" ist ein Fehlerzustand, der im Automaten oben nicht
dargestellt ist und der dazu dient, falsche Zeichen zu erkennen und
entsprechend zu antworten.
:::


## Tabellenbasierte Implementierung


```python
def nextToken():
    state = s0; lexeme = ""; stack = Stack()

    while (state != se):
        consume()       # hole nächstes Zeichen (peek)
        lexeme += peek
        stack.push(state)
        state = TransitionTable[state, peek]

    while (state != s2 and stack.notEmpty()):
        state = stack.pop(); putBack(lexeme.truncate())

    if state == s2: return s2(lexeme)
    else: return invalid()
```

::: notes
Der dargestellte Code implementiert direkt den DFA zur Erkennung von
Register-Namen unter Nutzung der Tabellen aus dem letzten Abschnitt.


Die Funktion `consume()` "verbraucht" das aktuelle Zeichen "`peek`" und
holt das nächste Zeichen aus dem Eingabestrom:

```python
def consume():
    peek = nextChar()
```


Nach einer Initialisierung wird in der Hauptschleife nach dem nächsten
Zeichen im Eingabestrom gefragt und das Lexem erweitert. Anschließend
wird der aktuelle Zustand auf dem Stack gesichert und mit Hilfe der
Transitionstabelle und des aktuellen Zustands sowie des aktuellen Zeichens
`peek` der Folgezustand bestimmt. Sobald der Fehlerzustand "`se`" erreicht
wird, bricht die Schleife ab.

*Anmerkung*: Wenn wir in "`s2`" sind, wird so lange nach weiteren Buchstaben
"L" oder "R" gesucht, bis im Strom irgendetwas anderes auftaucht und wir
entsprechend in "`se`" landen.

In der zweiten Schleife wird der Stack aufgerollt, um zu schauen, ob wir
früher bereits in "`s2`" waren oder nicht. Das erste Element wird vom Stack
genommen, das Lexem wird um das letzte Zeichen gekürzt und dieses letzte
Zeichen wird mit `putBack()` in den Eingabestrom zurückgelegt. Falls wir
früher bereits in "`s2`" waren, wird dieser Zustand irgendwann vom Stack
genommen. Anderenfalls ist der Stack irgendwann leer.

Falls "`s2`" erreicht wurde, wird ein neues "`s2`"-Token generiert und das
Lexem wird als Attribut direkt gesetzt. Anderenfalls lag ein Fehler vor.


*Anmerkung*: Diese Implementierung ist generisch: Wenn man im Code die
direkte Nennung des akzeptierenden Zustands "`s2`" durch einen Vergleich
mit einer Menge aller akzeptierender Zustände ersetzt ("`state == s2`"
=> "`state in acceptedStates`"), bestimmen nur die Tabellen die
konkrete Funktionsweise.

Die Tabellen können allerdings schnell sehr groß werden, insbesondere
die Zustandsübergangstabelle!
:::

[[Hinweis: Direkt codierte Implementierung]{.bsp}]{.slides}


::: notes
## Direkt codierte Implementierung

Die Implementierung über die Tabellen ist sowohl generisch als auch effizient.
Allerdings kostet jeder Zugriff auf die Tabelle konstanten Aufwand (Erinnerung:
Zugriff auf Arrays, Pointerarithmetik), der sich in der Praxis deutlich
summieren kann. Außerdem müssen der Stack gepflegt (erweitert und später wieder
reduziert) werden und Objekte für die Zustände angelegt werden.

Die Lösung: Aufrollen der `while`-Schleife und direkt Umsetzung der Tabelle im
Code mit Sprungbefehlen ("`goto`"):

```python
def nextToken():
    lexeme = ""; stack = Stack()
    goto s0

s0:
    consume()       # hole nächstes Zeichen (peek)
    lexeme += peek
    stack.push(s0)
    if peek == '1' || ... || peek == "9":
        goto s1
    else:
        goto se

...
```

Durch die direkte Kodierung der Tabellen in Form von Sprungzielen für
`goto`-Befehle spart man sich die Formulierung der Tabellen und den Zugriff
auf die Inhalte. Allerdings ist der Code deutlich schwerer lesbar und auch
deutlich schwerer an eine andere Sprache anpassbar. Dies stellt aber keinen
echten Nachteil dar, wenn er durch einen Generator aus einer Grammatik o.ä.
erzeugt wird.
:::


## Wrap-Up

*   Zusammenhang DFA, RE und Lexer

\smallskip

*   Implementierungsansatz: Tabellenbasiert (DFA-Tabellen)







<!-- DO NOT REMOVE - THIS IS A LAST SLIDE TO INDICATE THE LICENSE AND POSSIBLE EXCEPTIONS (IMAGES, ...). -->
::: slides
## LICENSE
![](https://licensebuttons.net/l/by-sa/4.0/88x31.png)

Unless otherwise noted, this work is licensed under CC BY-SA 4.0.
:::
