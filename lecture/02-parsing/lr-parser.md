# Syntaxanalyse: LR-Parser (LR(0), LALR)

> [!TIP]
>
> <details open>
> <summary><strong>🖇 Weitere Unterlagen</strong></summary>
>
> -   [Annotierte Folien: LR-Parser](https://github.com/Compiler-CampusMinden/AnnotatedSlides/blob/master/lr-parser.ann.ma.pdf)
>
> </details>

## Wiederholung

### Top-Down-Analyse

-   Baumaufbau von oben nach unten

-   eine Möglichkeit: recursive-descent parser

-   alternativ: tabellengesteuerter Parser

-   *First-* und *Follow*-Mengen bestimmen Wahl der Ableitungen

-   nicht mehr rekursiv, sondern mit PDA

## Motivation

### *LL* ist nicht alles

Die Menge der *LL*-Sprachen ist eine echte Teilmenge der deterministisch kontextfreien Sprachen.

Bei $LL$-Sprachen muss man nach den ersten $k$ Eingabezeichen entscheiden, welche Ableitung ganz oben im Baum als erste durchgeführt wird, also eine, die im Baum ganz weit weg ist von den Terminalen, die die Entscheidung bestimmen. Das ist nicht bei allen deterministisch parsebaren Grammatiken möglich und erschwert die Fehlerbehandlung.

## Von unten nach oben

### Von unten nach oben

Bei der Bottom-Up-Analyse wird der Parse Tree wird von unten nach oben aufgebaut, von links nach rechts. Dabei entsteht eine *Rechtsableitung*.

**Def.:** Bei einer kontextfreien Grammatik $G$ ist die *Rechtsableitung* von $\alpha \in (N \cup T)^{\ast}$ die Ableitung, die man erhält, wenn das am weitesten rechts stehende Nichtterminal in $\alpha$ abgeleitet wird. Man schreibt $\alpha \overset{\ast}{\Rightarrow}_r \beta$.

Mit Hilfe der Produktionen und der Vorschautoken werden die Ableitungen "rückwärts" angewandt und "Reduktionen" genannt.

### Versuchen wir es einmal

Hier entsteht ein Tafelbild.

### Kann ein Stack helfen?

Hier entsteht ein Tafelbild.

### So geht es vielleicht

Hier entsteht ein Tafelbild.

### Da wollen wir hin

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/Parser-Automat_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/Parser-Automat.png" width="80%" /></picture></p><p align="center">Parser-Automat</p>

## Theorie: LR(0)

### Arbeitsweise

Im Stack stehen nur Zustandsnummern, am Anfang die Nummer des Startzustandes (+ Bottomzeichen, oft auch $\$$).

-   Lesen des obersten Stackelements ergibt Zustand $q$

-   Lesen des nächsten Eingabezeichens ergibt Zeichen $a$

-   Nachschlagen der Reaktion auf $(q, a)$ in der Parse Table

-   Durchführung der Reaktion

### Mögliche "Actions" ohne Berücksichtigung von Vorschautoken

-   Shift: Schiebe logisch das nächste Eingabesymbol auf den Stack (in Wirklichkeit Zustandsnummern)

-   Reduce: (Identifiziere ein Handle oben auf dem Stack und ersetze es durch das Nichtterminal der dazugehörigen Produktion.) Das ist gleichbedeutend mit: Entferne so viele Zustände vom Stack wie die rechte Seite der zu reduzierenden Regel Elemente hat, und schreibe den Zustand, der im Goto-Teil für $(q, a)$ steht, auf den Stack.

-   Accept: Beende das Parsen erfolgreich

-   Reagiere auf einen Syntaxfehler

### Berechnung der Zustände: Items

**Def.:** Ein *(dotted) Item* einer Grammatik $G$ ist eine Produktion von $G$ mit einem Punkt auf der rechten Seite der Regel vor, zwischen oder nach den Elementen.

Bsp.:

Zu der Produktion $A \rightarrow BC$ gehören die Items:

$[A\rightarrow \cdot B C]$

$[A\rightarrow B \cdot C$\]

$[A\rightarrow B C \cdot]$

Das zu $A \rightarrow \epsilon$ gehörende Item ist $[A \rightarrow \cdot]$

### Berechnung der *Closure_0* von einer Menge *I* von Items

1.  füge $I$ zu $CLOSURE_0 (I)$ hinzu

2.  gibt es ein Item $[A \rightarrow \alpha \cdot B\beta]$ aus $CLOSURE_0 (I)$ und eine Produktion $(B \rightarrow \gamma)$, füge $[B \rightarrow \cdot \gamma]$ zu $CLOSURE_0 (I)$ hinzu

### Berechnung der *GOTO_0*-Sprungmarken

$GOTO_0(I, X) = CLOSURE_0(\lbrace[A \rightarrow \alpha X \cdot \beta] \mid [A \rightarrow \alpha \cdot X \beta] \in I\rbrace)$

für eine Itemmenge $I$ und $X \in N \cup T, A \in N, \alpha, \beta \in (N \cup T)^{\ast}$.

### Konstruktion des $LR(0)$ - Automaten

1.  Bilde die Hülle von $S' \rightarrow S$ und mache sie zum ersten Zustand.

2.  Für jedes noch nicht betrachtete $\cdot X, X \in (N \cup T)$ in einem Zustand $q$ des Automaten berechne $GOTO_0(q, X)$ und mache $GOTO_0(q, X)$ zu einem neuen Zustand $r$. Verbinde $q$ mit einem Pfeil mit $r$ und schreibe $X$ an den Pfeil. Ist ein zu $r$ identischer Zustand schon vorhanden, wird $p$ mit diesem verbunden und kein neuer erzeugt.

### Konstruktion der Parse Table

1.  Erstelle eine leere Tabelle mit den Zuständen als Zeilenüberschriften. Für den Aktionstabellenteil überschreibe die Spalten mit den Terminalen, für den Sprungtabellenteil mit den Nonterminals.

2.  Shift: Für jeden mit einem Terminal beschrifteten Pfeil aus einem Zustand erstelle in der Aktionstabelle die Aktion shift mit der Nummer des Zustands, auf den der Pfeil zeigt. Für Pfeile mit Nonterminals schreibe in die Sprungtabelle nur die Nummer des Folgezustands.

3.  Schreibe beim Zustand $[S' \rightarrow S \cdot]$ ein $accept$ bei dem Symbol $\bot$.

4.  Für jedes Item mit $[A \rightarrow \beta \cdot]$ aus allen Zuständen schreibe für alle Terminals $reduce$ und die Nummer der entsprechenden Grammatikregel in die Tabelle.

### Ein Beispiel zum Nachvollziehen

(0) $S^{'} \rightarrow S$

(1) $S     \rightarrow a A b S c S$

(2) $S     \rightarrow a A b S$

(3) $S     \rightarrow d$

(4) $A     \rightarrow e$

### Der LR(0)-Automat zu G1

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/LR_0-SLR_1-Automat_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/LR_0-SLR_1-Automat.png"  /></picture></p><p align="center">LR(0)-Automat</p>

### Die LR(0)-Parsertabelle zu G1

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/LR_0-Table_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/LR_0-Table.png" width="45%" /></picture></p><p align="center">LR(0)-Parsertabelle</p>

## Und was gibt es noch?

### Wenn LR(0) nicht reicht

Zunächst: Zu jeder LR(k)-Sprache gibt es eine LR(1)-Grammatik.

Ist eine Grammatik nicht LR(0), müssen nichtdeterminsistische Tabelleneinträge verhindert werden:

-   SLR(1)-Parsing ($A \rightarrow \beta$ wird nur reduziert, wenn das Vorschautoken in der $FOLLOW$-Menge von $A$ ist.)

-   (kanonisches) LR(1)-Parsing (wie LR(0) mit einem Vorschautoken)

-   LALR(1)-Parsing (Zusammenfassung aller LR(1)-Zustände, die sich nur in den LOOKAHEAD-Mengen unterscheiden)

## Mehrdeutige Grammatiken

### Es gibt auch Auswege

Mehrdeutige Grammatiken sind oft leichter zu lesen und kleiner als die Grammatiken, die man erhält, wenn man die Mehrdeutigkeit auflöst, sofern möglich.

Folgendes kann bei Mehrdeutigkeiten helfen:

-   Angabe von Vorrangregeln

-   Angabe von Assoziativität

-   Voreinstellung des Parsergenearators: z. B. Shiften bei Shift-Reduce-Konflikten

-   Voreinstellung des Parsergenearators: z. B. Reduzieren nach der Regel, die in der Grammatik zuerst kommt bei Reduce-Reduce-Konflikten

## Hierarchie der kontextfreien Sprachen

### Hierarchie der kontextfreien Sprachen

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/CFG-Hierarchy_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/CFG-Hierarchy.png" width="60%" /></picture></p><p align="center">Sprachenhierarchie</p>

## Wrap-Up

### Wrap-Up

-   LR-Analyse baut den Ableitungbaum von unten nach oben auf

-   es wird ein DFA benutzt zusammen mit einem Stack, der Zustände speichert

-   eine Parse-Tabelle steuert über Aktions- und Sprungbefehle das Verhalten des Parsers

-   die Tabelle wird mit (dotted) Items und Closures konstruiert

-   mit Bottom-Up-Parsing LR(1) kann man alle deterministisch kontextfreien Sprachen parsen

-   LR(0)-, SLR- und LALR- Parsing sind vereinfachte Verfahren für Teilmengen der LR-Sprachen

> [!TIP]
>
> <details open>
> <summary><strong>📖 Zum Nachlesen</strong></summary>
>
> -   Aho u. a. ([2023](#ref-Aho2023)): Kapitel 4.5 bis 4.8
> -   Aho u. a. ([2023](#ref-Aho2023))
> -   Hopcroft u. a. ([2003](#ref-hopcroft2003))
> -   Kunert ([2018](#ref-Kunert2018))
> -   Wagenknecht und Hielscher ([2014](#ref-Wagenknecht2014))
>
> </details>

> [!NOTE]
>
> <details >
> <summary><strong>✅ Lernziele</strong></summary>
>
> -   k1: Ich kenne die Prinzipien der Bottom-Up-Analyse
> -   k1: Ich kenne die Begriffe Item, Closure und Parse Table
> -   k2: Ich kann LR(0)-Parsing an einem Beispiel erklären
> -   k3: Ich kann die Konstruktion der Parse Tables durchführen
> -   k3: Ich kann das Parsen mit einem LR(0)-Parser durchführen
>
> </details>

------------------------------------------------------------------------

> [!NOTE]
>
> <details >
> <summary><strong>👀 Quellen</strong></summary>
>
> <div id="refs" class="references csl-bib-body hanging-indent">
>
> <div id="ref-Aho2023" class="csl-entry">
>
> Aho, A. V., M. S. Lam, R. Sethi, J. D. Ullman, und S. Bansal. 2023. *Compilers: Principles, Techniques, and Tools, Updated 2nd Edition by Pearson*. Pearson India. <https://learning.oreilly.com/library/view/compilers-principles-techniques/9789357054881/>.
>
> </div>
>
> <div id="ref-hopcroft2003" class="csl-entry">
>
> Hopcroft, J. E., R. Motwani, und J. D. Ullman. 2003. *Einführung in die Automatentheorie, formale Sprachen und Komplexitätstheorie*. I theoretische informatik. Pearson Education Deutschland GmbH.
>
> </div>
>
> <div id="ref-Kunert2018" class="csl-entry">
>
> Kunert, A. 2018. „LR(k)-Analyse für Pragmatiker". <http://amor.cms.hu-berlin.de/~kunert/papers/lr-analyse/lr.pdf>.
>
> </div>
>
> <div id="ref-Wagenknecht2014" class="csl-entry">
>
> Wagenknecht, C., und M. Hielscher. 2014. *Formale Sprachen, abstrakte Automaten und Compiler*. Springer Fachmedien Wiesbaden. <https://doi.org/10.1007/978-3-658-02692-9>.
>
> </div>
>
> </div>
>
> </details>

------------------------------------------------------------------------

<p align="center"><img src="https://licensebuttons.net/l/by-sa/4.0/88x31.png"  /></p>

Unless otherwise noted, this work is licensed under CC BY-SA 4.0.

<blockquote><p><sup><sub><strong>Last modified:</strong> 8c8a8d6 2025-10-20 lecture: fix slide level (LR Parser)<br></sub></sup></p></blockquote>
