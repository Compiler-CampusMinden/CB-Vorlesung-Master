---
type: lecture-bc
title: "Typen und Attributierte Grammatiken"
menuTitle: "Attributierte Grammatiken"
author: "BC George (FH Bielefeld)"
weight: 2
readings:
  - key: "Aho2008"
    comment: "Kapitel 2.3 und 5"
  - key: "Levine2009"
outcomes:
  - k2: "Konzept der attributierten Grammatiken: Anreicherung mit Attributen und semantischen Regeln"
  - k2: "Unterschied zwischen geerbten und berechneten Attributen"
  - k2: "Umsetzung von SDD mit Hilfe von SDT"
  - k3: "Einfache semantische Analyse mit Hilfe von attributierten Grammatiken"
---

# Motivation

## Ist das alles erlaubt?

Operation erlaubt?

Zuweisung erlaubt?

Welcher Ausdruck hat welchen Typ?

(Welcher Code muss dafür erzeugt werden?)

*   a = b
*   a = f(b)
*   a = b + c
*   a = b + o.nummer
*   if (f(a) == f(b))


## Taschenrechner: Parsen von Ausdrücken wie `3*5+4`

```
expr : expr '+' term
     | term
     ;
term : term '*' DIGIT
     | DIGIT
     ;

DIGIT : [0-9] ;
```

=> Wie den Ausdruck **ausrechnen**?

::: notes

*Anmerkung*: Heute geht es um die einfachste Form der semantischen Analyse: Anreichern einer Grammatik um
Attribute und Aktionen, die während des Parsens oder bei der Traversierung des Parse-Trees ausgewertet
werden.

:::


# Semantische Analyse: Die Symboltabellen nutzen

## Das haben wir bis jetzt (1/2)

Wir haben Einträge in den Symboltabellen angelegt und dafür gesorgt, dass wir in den richtigen Scopes Definitionen in der richtigen Reihenfolge suchen können.

Zum Auflösen von Deklarationen und Zuordnen von Objekten zu Klassen ist mindestens ein zweiter Lauf über Syntaxbaum und/oder Symboltabellen.

Der Parse Tree enthält bei allen Namen Verweise in die Symboltabellen.
Die Symboltabelleneinträge für Variablen und Objekte enthalten jetzt die Typen der Variablen und Objekte, bzw. Verweise auf ihre Typen in den Symboltabellen.


## Das haben wir bis jetzt (2/2)

Dabei konnten schon einige semantische Eigenschaften des zu übersetzenden Programms überprüft werden, falls erforderlich z. B.:

*   Wurden alle Variablen / Objekte vor ihrer Verwendung definiert oder deklariert?
*   Wurden keine Elemente mehrfach definiert?
*   Wurden alle Funktionen / Methoden mit der richtigen Anzahl Parameter aufgerufen? (Nicht in allen Fällen schon prüfbar)
*   Haben Arrayzugriffe auch keine zu hohe Dimension?
*   Werden auch keine Namen benutzt, für die es keine Definition / Deklaration gibt?


## Was fehlt jetzt noch?

Es müssen kontextsensitive Analysen durchgeführt werden, allen voran Typanalysen. Damit der "richtige" (Zwischen-) Code entsprechend den beteiligten Datentypen erzeugt werden kann, muss mit Hilfe des Typsystems der Sprache (aus der Sprachdefinition) überprüft werden, ob alle Operationen nur mit den korrekten Datentypen benutzt werden. Dazu gehört auch, dass nicht nur Typen von z. B. Variablen, sondern von ganzen Ausdrücken betrachtet, bzw. bestimmt werden. Damit kann dann für die Codeerzeugung festgelegt werden, welcher Operator realisiert werden muss (Überladung).



# Analyse von Datentypen

## Typisierung

*   stark oder statisch typisierte Sprachen: Alle oder fast alle Typüberprüfungen finden in der semantischen Analyse statt (C, C++, Java)
*   schwach oder dynamisch typisierte Sprachen: Alle oder fast alle Typüberprüfungen finden zur Laufzeit statt (Python, Lisp, Perl)
*   untypisierte Sprachen: keinerlei Typüberprüfungen (Maschinensprache)


## Ausdrücke

Jetzt muss für jeden Ausdruck im weitesten Sinne sein Typ bestimmt werden.

Ausdrücke können hier sein:

*   rechte Seiten von Zuweisungen
*   linke Seiten von Zuweisungen
*   Funktions- und Methodenaufrufe
*   jeder einzelne aktuelle Parameter in Funktions- und Methodenaufrufen
*   Bedingungen in Kontrollstrukturen



## Statische Typprüfungen

**Bsp.:** Der + - Operator:

| Typ 1. Operand | Typ 2. Operand | Ergebnistyp |
|:--------------:|:--------------:|:-----------:|
| int            | int            | int         |
| float          | float          | float       |
| int            | float          | float       |
| float          | int            | float       |
| string         | string         | string      |


## Typkonvertierungen

*   Der Compiler kann implizite Typkonvertierungen vornehmen, um einen Ausdruck zu verifizieren (siehe Sprachdefiniton).

*   In der Regel sind dies Typerweiterungen, z.B. von *int* nach *float*.

*   Manchmal muss zu zwei Typen der kleinste Typ gefunden werden, der beide vorhandenen Typen umschließt.

*   Explizite Typkonvertierungen heißen auch *Type Casts*.


## Nicht grundsätzlich statisch mögliche Typprüfungen

**Bsp.:** Der \^\ - Operator $(a^b)$:

| Typ 1. Operand | Typ 2. Operand | Ergebnistyp |
|:--------------:|:--------------:|:-----------:|
| int            | int $\geq$ 0   | int         |
| int            | int < 0        | float       |
| int            | float          | float       |
| $\ldots$       | $\ldots$       | $\ldots$    |



# Attributierte Grammatiken

## Was man damit macht

Die Syntaxanalyse kann keine kontextsensitiven Analysen durchführen.

*   Kontextsensitive Grammatiken benutzen: Laufzeitprobleme, das Parsen von cs-Grammatiken ist $PSPACE-complete$.

*   Der Parsergenerator *Bison* generiert LALR(1)-Parser, aber auch sog. *Generalized LR (GLR) Parser*, die bei nichtlösbaren Konflikten in der Grammatik (Reduce/Reduce oder Shift/Reduce) parallel den Input mit jede der Möglichkeiten   weiterparsen.

*   Ein weiterer Ansatz, kontextsensitive Abhängigkeiten zu berücksichtigen, ist der Einsatz von attributierten Grammatiken, nicht nur zur Typanalyse, sondern evtl. auch zur Codegenerierung.



# Syntax-gesteuerte Übersetzung: Attribute und Aktionen

<!-- 40 Minuten: 12 Folien (3.0 Min/Folie; inkl. Diskussion) -->

## Berechnen der Ausdrücke

```
expr : expr '+' term ;
```

\bigskip

```
translate expr ;
translate term ;
handle + ;
```


## Attributierte Grammatiken (SDD)

auch "*syntax-directed definition*"

Anreichern einer CFG:

*   Zuordnung einer Menge von Attributen zu den Symbolen (Terminal- und Nicht-Terminal-Symbole)
*   Zuordnung einer Menge von *semantischen Regeln* (Evaluationsregeln) zu den Produktionen


## Definition: Attributierte Grammatik

Eine *attributierte Grammatik* *AG = (G,A,R)* besteht aus folgenden Komponenten:

*   *G = (N, T, P, S)* ist eine cf-Grammatik

*   A = $\bigcup\limits_{X \in (T \cup N)} A(X)$ mit $A(X) \cap A(Y) \neq \emptyset \Rightarrow X = Y$

*   R = $\bigcup\limits_{p \in P} R(p)$ mit $R(p) = \{X_i.a = f(\ldots) \vert p : X_0 \rightarrow X_1 \ldots X_n \in P, X_i.a \in A(X_i), 0 \leq i \leq n\}$


## Abgeleitete und ererbte Attribute

Die in einer Produktion definierten Attribute sind

*AF(P)* = $\{X_i.a \ \vert\  p : X_0 \rightarrow X_1 \ldots X_n \in P,  0 \leq i \leq n, X_i.a = f(\ldots) \in R(p)\}$

Wir betrachten Grammatiken mit zwei disjunkten Teilmengen, den abgeleiteten (synthesized) Attributen *AS(X)* und den ererbten (inherited) Attributen *AI(X)*:

*AS(X)* = $\{X.a\ \vert \ \exists p : X \rightarrow X_1 \ldots X_n \in P, X.a \in AF(p)\}$

*AI(X)* = $\{X.a\ \vert \ \exists q : Y \rightarrow uXv \in P, X.a\in AF(q)\}$


Abgeleitete Attribute geben Informationen von unten nach oben weiter, geerbte von oben nach unten.

Die Abhängigkeiten der Attribute lassen sich im sog. *Abhängigkeitsgraphen* darstellen.

## Beispiel: Attributgrammatiken

| Produktion       | Semantische Regel           |
| :--------------- | :-------------------------- |
| `e : e1 '+' t ;` | `e.val = e1.val + t.val`    |
| `e : t ;`        | `e.val = t.val`             |
| `t : t1 '*' D ;` | `t.val = t1.val * D.lexval` |
| `t : D ;`        | `t.val = D.lexval`          |


| Produktion              | Semantische Regel             |
| :---------------------- | :---------------------------- |
| `t : D t' ;`            | `t'.inh = D.lexval`           |
|                         | `t.syn = t'.syn`              |
| `t' : '*' D t'1 ;`      | `t'1.inh = t'.inh * D.lexval` |
|                         | `t'.syn = t'1.syn`            |
| `t' :` $\epsilon$ `;`   | `t'.syn = t'.inh`             |


Wenn ein Nichtterminal mehr als einmal in einer Produktion vorkommt, werden die Vorkommen nummeriert. (t, t1; t', t'1)








# Syntax-gesteuerte Übersetzung (SDT)

## Erweiterung attributierter Grammatiken

*Syntax-directed translation scheme*:

Zu den Attributen kommen **Semantische Aktionen**: Code-Fragmente als zusätzliche Knoten im Parse Tree an beliebigen Stellen in einer Produktion, die, wenn möglich, während des Parsens, ansonsten in weiteren Baumdurchläufen ausgeführt werden.

```
e : e1  {print e1.val;}
    '+' {print "+";}
    t   {e.val = e1.val + t.val; print(e.val);}
  ;
```


## L-attributierte SDD, LL-Grammatik: Top-Down-Parsierbar (1/2)

| Produktion              | Semantische Regel             |
| :---------------------- | :---------------------------- |
| `t : D t' ;`            | `t'.inh = D.lexval`           |
|                         | `t.syn = t'.syn`              |
| `t' : '*' D t'1 ;`      | `t'1.inh = t'.inh * D.lexval` |
|                         | `t'.syn = t'1.syn`            |
| `t' :` $\epsilon$ `;`   | `t'.syn = t'.inh`             |


```
t  : D {t'.inh = D.lexval;} t' {t.syn = t'.syn;} ;
t' : '*' D {t'1.inh = t'.inh * D.lexval;} t'1 {t'.syn = t'1.syn;} ;
t' : e {t'.syn = t'.inh;} ;
```


## L-attributierte SDD, LL-Grammatik: Top-Down-Parsierbar (2/2)

*   LL-Grammatik: Jede L-attributierte SDD direkt während des Top-Down-Parsens implementierbar/berechenbar

* SDT dazu:
    *   Aktionen, die ein berechnetes Attribut des Kopfes einer Produktion berechnen, an das Ende der Produktion anfügen
    *   Aktionen, die geerbte Attribute für ein Nicht-Terminalsymbol $A$ berechnen, direkt vor dem Auftreten von $A$ im Körper der Produktion eingefügen

*   Implementierung im rekursiven Abstieg:
    *   Geerbte Attribute sind Parameter für die Funktionen für die Nicht-Terminalsymbole
    *   berechnete Attribute sind Rückgabewerte dieser Funktionen.

\smallskip

```c
T t'(T inh) {
    match('*');
    T t1inh = inh * match(D);
    return t'(t1inh);
}
```



<!-- ADD Content copied from old session "LL-Parser: Fortgeschrittene Techniken"

## Semantische Prädikate

Problem in Java: `enum` ab Java5 Schlüsselwort [(vorher als Identifier-Name verwendbar)]{.notes}

```yacc
prog : (enumDecl | stat)+ ;
stat : ... ;

enumDecl : ENUM id '{' id (',' id)* '}' ;
```

::: notes
Wie kann ich eine Grammatik bauen, die sowohl für Java5 und später als auch für die Vorgänger
von Java5 funktioniert?

Angenommen, man hätte eine Hilfsfunktion ("Prädikat"), mit denen man aus dem Kontext heraus
die Unterscheidung treffen kann, dann würde die Umsetzung der Regel ungefähr so aussehen:
:::

\bigskip
\pause

```python
def prog():
    if lookahead(1) == ENUM and java5: enumDecl()
    else: stat()
```


## Semantische Prädikate in ANTLR

::: notes
### Semantische Prädikate in Parser-Regeln
:::

```yacc
@parser::members {public static boolean java5;}

prog : ({java5}? enumDecl | stat)+ ;
stat : ... ;

enumDecl : ENUM id '{' id (',' id)* '}' ;
```

::: notes
Prädikate in Parser-Regeln aktivieren bzw. deaktivieren alles, was nach der Abfrage
des Prädikats gematcht werden könnte.

### Semantische Prädikate in Lexer-Regeln

Alternativ für Lexer-Regeln:
:::

```yacc
ENUM : 'enum' {java5}? ;
ID   : [a-zA-Z]+ ;
```

::: notes
Bei Token kommt das Prädikat erst am rechten Ende einer Lexer-Regel vor, da der Lexer keine
Vorhersage macht, sondern nach dem längsten Match sucht und die Entscheidung erst trifft,
wenn das ganze Token gesehen wurde. Bei Parser-Regeln steht das Prädikat links vor der
entsprechenden Alternative, da der Parser mit Hilfe des Lookaheads Vorhersagen trifft, welche
Regel/Alternative zutrifft.

*Anmerkung*: Hier wurden nur Variablen eingesetzt, es können aber auch Methoden/Funktionen
genutzt werden. In Verbindung mit einer Symboltabelle (["Symboltabellen"](cb_symboltabellen1.html))
und/oder mit Attributen und Aktionen in der Grammatik (["Attribute"](cb_attribute.html) und
["Interpreter: Attribute+Aktionen"](cb_interpreter2.html)) hat man hier ein mächtiges Hilfswerkzeug!
:::
-->


# Wrap-Up

## Wrap-Up

*   Die Typinferenz benötigt Informationen aus der Symboltabelle

*   Einfache semantische Analyse: Attribute und semantische Regeln (SDD)

*   Umsetzung mit SDT: Attribute und eingebettete Aktionen

*   Reihenfolge der Auswertung u.U. schwierig

    Bestimmte SDT-Klassen können direkt beim Parsing abgearbeitet werden:

    *   S-attributierte SDD, LR-Grammatik: Bottom-Up-Parsierbar
    *   L-attributierte SDD, LL-Grammatik: Top-Down-Parsierbar

    Ansonsten werden die Attribute und eingebetteten Aktionen in den Parse-Tree
    integriert und bei einer (späteren) Traversierung abgearbeitet.







<!-- DO NOT REMOVE - THIS IS A LAST SLIDE TO INDICATE THE LICENSE AND POSSIBLE EXCEPTIONS (IMAGES, ...). -->
::: slides
## LICENSE
![](https://licensebuttons.net/l/by-sa/4.0/88x31.png)

Unless otherwise noted, this work is licensed under CC BY-SA 4.0.
:::
