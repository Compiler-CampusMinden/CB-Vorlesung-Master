---
type: lecture-bc
title: "Syntaxanalyse: LR-Parser"
menuTitle: "LR-Parser"
author: "BC George (FH Bielefeld)"
weight: 4
readings:
  - key: "Aho2008"
    comment: "Kapitel 4.5 bis 4.8"
  - key: "aho2013compilers"
  - key: "hopcroft2003"
  - key: "Kunert2018"
  - key: "Wagenknecht2014"
---


# Wiederholung
<!-- 10 Minuten: 1 Folie -->

![Ein PDA für $L=\{ww^{R}\mid w\in \{a,b\}^{\ast}\}$](images/pda.png){width="60%"}

## Top-Down-Analyse

*   Baumaufbau von oben nach unten
*   die Grammatik muss reduziert sein
*   recursive-descent parser
*   *First-* und *Follow*-Mengen bestimmen Wahl der Ableitungen
*   tabellengesteuert
*   nicht mehr rekursiv, sondern mit PDA



# Motivation
<!-- 5 Minuten -->

## *LL* ist nicht alles

Die Menge der *LL*-Sprachen ist eine echte Teilmenge der deterministisch kontextfreien Sprachen. Wir brauchen ein Verfahren, mit dem man alle deterministisch kontextfreien Sprachen parsen kann.


# Bottom-Up-Analyse
<!-- 70 Minuten: 57 Folien (inkl. Diskussion) -->
<!-- XXX GTB, Kap. 1 und 2 -->

## Von unten nach oben

Bei $LL$-Sprachen muss man nach den ersten $k$ Eingabezeichen entscheiden, welche Ableitung ganz oben im Baum als erste durchgeführt wird, also eine, die im Syntaxbaum ganz weit weg ist von den Terminalen, die die Entschiedung bestimmen.Es gibt deterministisch kontextfreie Sprachen, die nicht $LL(k)$ sind für irgendein *k*.

Bei der Bottom-Up-Analyse geht man den umgekehrten Weg. Der Parse Tree wird von unten nach oben aufgebaut, die Entscheidung, welche Produktion angewandt wird, erfolgt "näher" am Terminal. Mit Hilfe der Produktionen und der Vorschautoken werden die Ableitungen "rückwärts" angewandt und "Reduktionen" genannt.

Fehlermeldungen können näher am Programmtext erfolgen.


## Baumaufbau von unten

:::notes
Hier entsteht ein Tafelbild.
:::


## Kann ein Stack helfen?

:::notes
Hier entsteht ein Tafelbild.
:::


## Probleme damit?

:::notes
Hier entsteht ein Tafelbild.
:::

# Konfliktfälle

## Mehrdeutigkeiten = Konflikte beim Parsen

Es gibt Grammatiken, bei denen nicht aus dem Inhalt des Stacks und dem Eingabezeichen entschieden werden kann, wie fortgefahren wird, auch nicht, wenn man, wie auch schon im Fall $LL$, eine feste Zahl $k$ von Vorschautoken berücksichtigt. Diese Grammatiken können mehrdeutig sein.

Folgen von falschen Entscheidungen:

*   falscher Baum, falsche Bäume
*   kein Baum


## Mögliche Konflikte

*   Reduce-Reduce-Konflikt: Es sind zwei oder mehr verschiedene Reduktionen möglich
*   Shift-Reduce-Konflikt: Es kann nicht entschieden werden, ob eine Reduktion oder ein Shift durchgeführt werden soll.

Shiften bedeutet, das nächste Eingabesymbol miteinbeziehen.



# LR-Parsing

## Da wollen wir hin

![Parser-Automat](images/Parser-Automat.png){width="80%"}


## So geht es

Der Stack enthält Zustände, keine Terminals oder Nonterminals.

Der Top-of-Stack ist immer der aktuelle Zustand, am Anfang
 $I_0$. Im Stack steht $I_0\ \bot$.


Vorgehen:
Im aktuellen Zustand nachschauen, ob das Eingabezeichen auf einem Pfeil steht.

* ja: Shiften, d. h. dem Pfeil folgen und den Zustand am Ende des Pfeils pushen. Dort weiter.

* nein: Reduzieren nach der Regel aus dem aktuellen Zustand mit dem Punkt hinten, d. h. so viele Zustände poppen, wie die Regel Elemente auf der rechten Seite hat. Der Zustand darunter wird aktuell, dem Pfeil mit dem zu reduzierenden Nonterminal der linken Seite der Regel folgen und pushen.

Am Schluss kann nur noch mit $\bot$ akzeptiert werden.


## Beispiel

:::notes
Hier entsteht ein Tafelbild.
:::


## Definitionen

**Def.:** Bei einer kontextfreien Grammatik *G* ist die *Rechtsableitung* von $\alpha \in (N \cup T)^{\ast}$ die Ableitung, die man erhält, wenn das am weitesten rechts stehende Nichtterminal in $\alpha$ abgeleitet wird. Man schreibt $\alpha \overset{\ast}{\Rightarrow}_r \beta$.

**Def.:** Eine *Rechtssatzform*  $\alpha$ einer Grammatik *G* ist ein Element aus
    $(N \cup T)^{\ast}$ mit $S \overset{\ast}{\Rightarrow}_r \alpha$.

**Def.:** In dem Syntaxbaum von $S \overset{\ast}{\Rightarrow}_r \alpha\ A\ w  \Rightarrow_r \alpha\ \beta\ w$ einer kontextfreien Grammatik ist $\beta$ ein *Handle* von der Produktion $A \rightarrow \beta$.


## LR-Parsing

Bei der *LR*-Analyse eines Wortes *w* wird *w* von links nach rechts gelesen, dabei wird die Rechtsableitung von *w* in *G* von unten nach oben aufgebaut.
Man spricht nicht nicht mehr von Ableitungen, sondern von Reduktionen.

Mehrdeutige Grammatiken können nicht *LR* sein.

*   Vor der Konstruktion des Automaten wird die Grammatik um eine neues Nonterminal $S'$ und die neue Produktion $S' \rightarrow S$ erweitert. $S'$ ist dann Startsymbol.
*   Es wird ein Automat erstellt (s.o.)
*   Es wird eine Parse Table aus dem Automaten erstellt, die den Parse-Vorgang steuert, mit Aktionsteil und Sprungteil.


## Steuerung des Parsens mittels der Parse Table

![Parser Schema](images/ParserProgram.png){width="80%"}


## Arbeitsweise

Im Stack stehen nur Zustandsnummern, am Anfang die Nummer des Startzustandes (+ Bottomzeichen, oft auch $\$$). Es ist nicht nötig, Symbole zu stacken.

*   Lesen des obersten Stackelements ergibt Zustand *q*
*   Lesen des nächsten Eingabezeichens ergibt Zeichen *a*
*   Nachschlagen der Reaktion auf $(q, a)$ in der Parse Table
*   Durchführung der Reaktion


## Mögliche "Actions" ohne Berücksichtigung von Vorschautoken

*   Shift: Schiebe logisch das nächste Eingabesymbol auf den Stack (in Wirklichkeit Zustandsnummern)
*   Reduce: (Identifiziere ein Handle oben auf dem Stack und ersetze es durch das Nichtterminal der dazugehörigen Produktion.) Das ist gleichbedeutend mit: Entferne so viele Zustände vom Stack wie die rechte Seite der zu reduzierenden Regel Elemente hat, und schreibe den Zustand, der im Goto-Teil für $(q, a)$ steht, auf den Stack.
*   Accept: Beende das Parsen erfolgreich
*   Reagiere auf einen Syntaxfehler


# 0 Vorschautoken = LR(0)-Parsing

## LR-Parsing ohne Vorschautoken

Wichtig: Das Handle, d. h. die rechte Seite einer zu reduzierenden Regel, erscheint oben auf dem Stack, nie weiter unten.

Je nach Anwendungsfall müssen beim Reduzieren von Handles weitere Aktionen ausgeführt werden: z. B. Syntaxbäume aufgebaut, Werte in Tabellen geschrieben werden, usw. Nicht alle rechten Seiten von Produktionen, die oben auf dem Stack stehen, sind auch Handles, manchmal muss nur geshiftet werden.

Bsp: Steht bei der Beispielgrammatik von Folie 4 oben auf dem Stack ein $T$ mit dem nächsten  Eingabezeichen $\ast$, darf $T$ nicht zu $E$ reduziert werden.

Lösung: Der Parser merkt sich, wo er steht in noch nicht komplett reduzierten Regeln. Dazu benutzt er sogenannte $Items$ oder $LR(0)-Items$, auch $dotted\ Items$ oder $(kanonische)\ LR(0)-Elemente$.


## Items

**Def.:** Ein *Item* einer Grammatik *G* ist eine Produktion von *G* mit einem Punkt auf der rechten Seite der Regel vor, zwischen oder nach den Elementen.

Bsp.:

Zu der Produktion $A \rightarrow BC$ gehören die Items:

$[A\rightarrow \cdot B C]$

$[A\rightarrow B \cdot C$]

$[A\rightarrow B C \cdot]$

Das zu $A \rightarrow \epsilon$ gehörende Item ist $[A \rightarrow \cdot]$


## Was bedeuten die Items?

:::notes
Hier entsteht ein Tafelbild.
:::

## Berechnung der *Closure_0* von einer Menge *I* von Items

1. füge $I$ zu $CLOSURE_0 (I)$ hinzu

2. gibt es ein Item $[A \rightarrow \alpha \cdot B\beta]$ aus $CLOSURE_0 (I)$ und eine Produktion $(B \rightarrow \gamma)$, füge $[B \rightarrow \cdot \gamma]$ zu $CLOSURE_0 (I)$ hinzu


## Berechnung der *GOTO_0*-Sprungmarken

$GOTO_0(I, X) = CLOSURE_0(\lbrace[A \rightarrow \alpha X \cdot \beta] \mid [A \rightarrow \alpha \cdot X \beta] \in I\rbrace)$

für eine Itemmenge *I* und $X \in N \cup T, A \in N, \alpha, \beta \in (N \cup T)^{\ast}$.


## Konstruktion des $LR(0)$ - Automaten

1. Bilde die Hülle von $S' \rightarrow S$ und mache sie zum ersten Zustand.

2. Für jedes noch nicht betrachtete $\cdot X, X \in (N \cup T)$ in einem Zustand $q$ des Automaten berechne $GOTO_0(q, X)$ und mache $GOTO_0(q, X)$ zu einem neuen Zustand $r$. Verbinde $q$ mit einem Pfeil mit $r$ und schreibe $X$ an den Pfeil. Ist ein zu $r$ identischer Zustand schon vorhanden, wird $p$ mit diesem verbunden und kein neuer erzeugt.


## Konstruktion der Parse Table

1. Erstelle eine leere Tabelle mit den Zuständen als Zeilenüberschriften. Für den Aktionstabellenteil überschreibe die Spalten mit den Terminalen, für den Sprungtabellenteil mit den Nonterminals.

2. Shift: Für jeden mit einem Terminal beschrifteten Pfeil aus einem Zustand erstelle in der Aktionstabelle die Aktion shift mit der Nummer des Zustands, auf den der Pfeil zeigt. Für Pfeile mit Nonterminals schreibe in die Sprungtabelle nur die Nummer des Folgezustands.

3. Schreibe beim Zustand $[S' \rightarrow S \cdot]$ ein $accept$ bei dem Symbol $\bot$.

4. Für jedes Item mit $[A \rightarrow \beta \cdot]$ aus allen Zuständen schreibe für alle Terminals $reduce$ und die Nummer der entsprechenden Grammatikregel in die Tabelle.


## Und wenn in einer Zelle schon ein Eintrag ist?

:::notes
Hier entsteht ein Tafelbild.
:::

## Die Beispielgrammatik G1

(0) $S^{'} \rightarrow S$

(1) $S     \rightarrow a A b S c S$

(2) $S     \rightarrow a A b S$

(3) $S     \rightarrow d$

(4) $A     \rightarrow e$


## Der LR(0)-Automat zu G1

![LR(0)-Automat](images/LR_0-SLR_1-Automat.png)


## Die LR(0)-Parsertabelle zu G1

![LR(0)-Parsertabelle](images/LR_0-Table.png){width="80%"}



# 1 Vorschautoken = LR(1)-Parsing

## LR-Parsen mit Vorschautoken

Ist eine Grammatik nicht LR(0), kann sie vielleicht mit einem Vorschautoken geparst werden. Hier gibt es drei Verfahren:

*   SLR(1)-Parsing
*   (kanonisches) LR(1)-Parsing
*   LALR(1)-Parsing


# SLR

## Simple LR(1) = (SLR)-Parsing

$A \rightarrow \beta$ wird nur reduziert, wenn das Vorschautoken in der $FOLLOW$-Menge von $A$ ist.

$\Rightarrow$ Es ändert sich nur die Parse Table:

Bei allen LR(0)-Items in der Tabelle, die einen Punkt am Ende der
rechten Seite stehen haben, trage in der
Aktionstabelle beim zugehörigen Zustand die Reduktion mittels der zugehörigen
Regel bei allen Terminals ein, die in der FOLLOW-Menge des Nonterminals auf der linken Seite der Regel enthalten sind.


## Der SLR-Automat der Grammatik G1:

![SLR(1)-Automat](images/LR_0-SLR_1-Automat.png)


## Die SLR-Parsertabelle der Grammatik G1

![SLR(1)-Parsertabelle](images/SLR_1-Table.png){width="80%"}



# Kanonische LR(1)-Syntaxanalyse

## Mehr geht nicht: Kanonische LR(1)-Syntaxanalyse = LR-Analyse

Beim SLR-Verfahren wird nach $A \rightarrow \beta$ reduziert, wenn das Vorschautoken in $Follow(A)$ liegt. Dabei kann es vorkommen, dass das Vorschautoken ein Element davon ist, aber genau bei dieser Regel kann es nicht dem *A* folgen. Es wird also falsch reduziert, und es entstehen zu viele Einträge in der Tabelle (Konflikte!).

Jetzt werden nicht Follow-Mengen von Nichtterminalen, sondern LOOKAHEAD-Mengen von Produktionen berechnet.


## Die LR(1)-Items

Zu jedem LR(0)-Item (hier auch $Kern$ genannt) wird eine $LOOKAHEAD$ - Menge $L$ hinzugefügt, die angibt, welche Terminals dem Symbol auf der linken Seite folgen können.

z. B. $[S' \rightarrow \cdot S, \lbrace \bot \rbrace ]$


## Die Hülle $CLOSURE_1$

1. füge $I$ zu $CLOSURE_1 (I)$ hinzu

2. gibt es ein LR(1) - Item $[A \rightarrow \alpha \cdot B \beta,\ L]$ aus $CLOSURE_1 (I)$ und eine Produktion $(B \rightarrow \gamma)$, füge $[B \rightarrow \cdot \gamma, FIRST(\beta\ L)]$ zu $CLOSURE_1 (I)$ hinzu \\($\alpha, \beta$ dürfen $\epsilon$ sein).


## $Goto_1$

$GOTO_1(I, X) =$ eine Produktion

$CLOSURE_1(\lbrace[A \rightarrow \alpha X \cdot \beta, \ L] \mid [A \rightarrow \alpha \cdot X \beta,\ L] \in I\rbrace)$

für eine Itemmenge $I$ und $X \in N \cup T, A \in N, \alpha, \beta \in (N \cup T)^{\ast}$.


## Der LR(1)-Automat

Der Automat wird analog zum LR(0)-Automaten erstellt mit dem Startzustand

$[S' \rightarrow \cdot S, \lbrace \bot \rbrace ]$

Die Tabelle unterscheidet sich nur bei der Reduktion von der LR(0)-Tabelle:

Reduktionsoperationen werden in den Spalten der
Terminals eingetragen, die in der LOOKAHEAD-Menge der entsprechenden Regel enthalten sind.

## Die Beispielgrammatik G2

(0) $S^{'} \rightarrow S$

(1) $S \rightarrow NN$

(2) $N \rightarrow 0N$

(3) $N \rightarrow 1$


## Der LR(1)-Automat der Grammatik G2

![LR(1)-Automat](images/LR_1-Automat.png)


## Die LR(1)-Parsertabelle der Grammatik G2

![LR(1)-Parsertabelle](images/LR_1-Table.png){width="55%"}



# Lookahead-LR = LALR

## LALR(1)

Zusammenfassung aller LR(1)-Zustände, die sich nur in den LOOKAHEAD-Mengen unterscheiden

Parsergeneratoren generieren oft direkt aus einem LR(0)- einen LALR(1)-Zustands-
Übergangsgraphen durch Hinzufügen der LOOKAHEAD-Mengen.


## Der LALR-Automat der Grammatik G2

![LALR(1)-Automat](images/LALR-Automat.png)


## Die LALR-Parsertabelle der Grammatik G2

![LALR(1)-Parsertabelle](images/LALR-Table.png){width="80%"}



# $k \geq 2$ Vorschautoken

## Hierarachie

Zu jeder LR(k)-Sprache gibt es eine LR(1)-Grammatik.



# Mehrdeutige Grammatiken

## Es gibt auch Auswege

Mehrdeutige Grammatiken sind oft leichter zu lesen und kleiner als die Grammatiken, die man erhält, wenn man die Mehrdeutigkeit auflöst, sofern möglich.
Also die Grammatik mehrdeutig lassen!

Folgendes kann trotzdem helfen:

*   Angabe von Vorrangregeln
*   Angabe von Assoziativität
*   Voreinstellung des Parsergenearators: z. B. Shiften bei Shift-Reduce-Konflikten
*   Voreinstellung des Parsergenearators: z. B. Reduzieren nach der Regel, die in der Grammatik zuerst kommt bei Reduce-Reduce-Konflikten


# Hierarchie der kontextfreien Sprachen

![Sprachenhierarchie](images/CFG-Hierarchy.png){width="80%"}



# Wrap-Up

## Wrap-Up

*   mit Bottom-Up-Parsing LR(1) kann man alle deterministisch kontextfreien Sprachen parsen

*   ein Vorschautoken genügt

*   LR(0)-, SLR- und LALR- Parsing sind vereinfachte  Verfahren für Teilmengen der LR-Sprachen







<!-- DO NOT REMOVE - THIS IS A LAST SLIDE TO INDICATE THE LICENSE AND POSSIBLE EXCEPTIONS (IMAGES, ...). -->
::: slides
## LICENSE
![](https://licensebuttons.net/l/by-sa/4.0/88x31.png)

Unless otherwise noted, this work is licensed under CC BY-SA 4.0.
:::
