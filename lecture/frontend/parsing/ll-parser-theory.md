---
archetype: lecture-bc
title: "LL-Parser (Theorie)"
author: "BC George (HSBI)"
readings:
  - key: "aho2013compilers"
  - key: "hopcroft2003"
outcomes:
  - k1: "Top-Down-Analyse"
  - k1: "Recursive-Descent-Parser"
  - k1: "First- und Follow-Mengen"
  - k1: "LL-Parser"
  - k2: "Zusammenhang zwischen PDAs und kontextfreien Grammatiken"
  - k2: "Schreiben von LL-Parsern"
  - k3: "Top-Down Analyse programmieren"
attachments:
  - link: "https://raw.githubusercontent.com/Compiler-CampusMinden/AnnotatedSlides/master/ll-parser-theory.ann.ma.pdf"
    name: "Annotierte Folien: LL-Parser (Theorie)"
---





# Wiederholung

## PDAs und kontextfreie Grammatiken

*   Warum reichen uns DFAs nicht zum Matchen von Eingabezeichen?
*   Wie könnnen wir sie minimal erweitern?
*   Sind PDAs deterministisch?
*   Wie sind kontextfreie Grammatiken definiert?
*   Sind kontextfreie Grammatiken eindeutig?


# Motivation

## Was brauchen wir für die Syntaxanalyse von Programmen?

*   einen Grammatiktypen, aus dem sich manuell oder automatisiert ein Programm zur deterministischen Syntaxanalyse erstellen lässt
*   einen Algorithmus zum sog. Parsen von Programmen mit Hilfe einer solchen Grammatik


## Themen für heute

*   Arten der Syntaxanlyse
*   mehrdeutige Sprachen
*   Top-down-Analyse
*   LL(k)-Grammtiken


# Syntaxanalyse

## Syntax

Wir verstehen unter Syntax eine Menge von Regeln, die die Struktur von Daten (z. B. Programmen) bestimmen.

Syntaxanalyse ist die Bestimmung, ob Eingabedaten einer vorgegebenen Syntax entsprechen.

Diese vorgegebene Syntax wird im Compilerbau mit einer Grammatik beschrieben.

## Ziele der Syntaxanalyse

*   aussagekräftige Fehlermeldungen, wenn ein Eingabeprogramm syntaktisch nicht korrekt ist
*   evtl. Fehlerkorrektur
*   Bestimmung der syntaktischen Struktur eines Programms
*   Erstellung des AST (abstrakter Syntaxbaum): Der Parse Tree ohne Symbole, die nach der Syntaxanalyse inhaltlich irrelevant sind (z. B. Semikolons, manche Schlüsselwörter)
*   die Symboltablelle(n) mit Informationen bzgl. Bezeichner (Variable, Funktionen und Methoden, Klassen, benutzerdefinierte Typen, Parameter, ...), aber auch die Gültigkeitsbereiche.


## Arten der Syntaxanalyse

Die Syntax bezieht sich auf die Struktur der zu analysierenden Eingabe, z. B. einem Computerprogramm in einer Hochsprache. Diese Struktur wird mit formalen Grammatiken beschrieben. Einsetzbar sind Grammatiken, die deterministisch kontextfreie Sprachen erzeugen.

*   Top-Down-Analyse: Aufbau des Parse trees von oben
    *   Parsen durch rekursiven Abstieg
    *   LL-Parsing
*   Bottom-Up-Analyse: LR-Parsing


## Mehrdeutigkeiten

Wir können nur mit eindeutigen Grammatiken arbeiten, aber:

**Def.:**  Eine formale Sprache  L heißt *inhärent mehrdeutige Sprache*, wenn jede formale Grammatik *G* mit $L(G) = L$ mehrdeutig ist.

Das heißt, solche Grammatiken existieren.

$\Rightarrow$ Es gibt keinen generellen Algorithmus, um Grammatiken eindeutig zu machen.


## Bevor wir richtig anfangen...

**Def.:** Ein Nichtterminal *A* einer kontextfreien Grammatik *G* heißt *unerreichbar*, falls es kein $a,b \in {(N \cup T)}^{\ast}$ gibt mit $S \overset{\ast}{\Rightarrow} aAb$. Ein Nichtterminal *A* einer Grammatik *G* heißt *nutzlos*, wenn es kein Wort  $w \in T^{\ast}$ gibt mit $A \overset{\ast}{\Rightarrow} w$.

**Def.:** Eine kontextfreie Grammatik $G=(N, T, P, S)$ heißt *reduziert*, wenn es keine nutzlosen oder unerreichbaren Nichtterminale in *N* gibt.

Bevor mit einer Grammatik weitergearbeitet wird, müssen erst alle nutzlosen und dann alle unerreichbaren Symbole eliminiert werden. Wir betrachten ab jetzt nur reduzierte Grammatiken.


# Top-Down-Analyse

## Wie würden Sie manuell parsen?



##  Algorithmus: Rekursiver Abstieg

Hier ist ein einfacher Algorithmus, der (indeterministisch) einen Ableitungsbaum vom Nonterminal *X* von oben nach unten aufbaut:

**Eingabe:** Ein Nichtterminal $X$ und das nächste zu verarbeitende Eingabezeichen $a$.

![Recursive Descent-Algorithmus](images/recursive_descent.png){width="55%"}


## Grenzen des Algorithmus

Was ist mit

1) $X \rightarrow a \alpha \mid b \beta$
2) $X \rightarrow B\alpha \mid C \beta$
3) $X \rightarrow B \alpha \mid B \beta$
4) $X \rightarrow  B \alpha \mid C \beta$ und $C\rightarrow B$
5) $X \rightarrow X \beta$
6) $X \rightarrow B \alpha$ und $B \rightarrow X \beta$

\vspace{2cm}

$X, B, C, D \in N^{\ast};  a, b, c, d \in T^{\ast};  \beta$, $\alpha, \beta \in (N \cup T)^{\ast}$


## Linksfaktorisierung
$X \rightarrow BC\  \vert \  BD$
\vfill
\vfill

:::notes
Hier entsteht ein Tafelbild.
:::


##  Algorithmus: Linksfaktorisierung

**Eingabe:** Eine  Grammatik G = (N, T, P, S)

**Ausgabe:** Eine äquivalente links-faktorisierte Grammatik $G'$

![Algorithmus zur Linksfaktorisierung](images/Linksfaktorisierung.png){width="85%"}



## Linksrekursion

**Def.:** Eine Grammatik $G=(N, T, P, S)$ heißt *linksrekursiv*, wenn sie ein Nichtterminal *X* hat, für das es eine Ableitung $X \overset{+}{\Rightarrow} X\ \alpha$ für ein $\alpha \in (N \cup T)^{\ast}$ gibt.

Linksrekursion gibt es

*direkt*: $X \rightarrow X \alpha$

und

*indirekt*: $X \rightarrow \ldots \rightarrow \ldots \rightarrow X \alpha$

##  Algorithmus: Entfernung von direkter Linksrekursion {.fragile}

**Eingabe:** Eine  Grammatik G = (N, T, P, S)

**Ausgabe:** Eine äquivalente Grammatik $G'$ ohne direkte Linksrekursion

![Algorithmus zur Entfernung direkter Linksrekursion](images/direkte_Linksrekursion_Elim.png){width="55%"}


##  Algorithmus: Entfernung von indirekter Linksrekursion {.fragile}

**Eingabe:** Eine  Grammatik G = (N, T, P, S)  mit $N= \lbrace X_1, X_2, \ldots X_n\rbrace$ ohne $\epsilon$-Regeln oder Zyklen der Form $X_1 \rightarrow X_2, X_2 \rightarrow X_3, \ldots X_{m-1} \rightarrow X_m, X_m \rightarrow X_1$

**Ausgabe:** Eine äquivalente Grammatik $G'$ ohne Linksrekursion

![Algorithmus zur Entfernung indirekter Linksrekursion](images/indirekte_Linksrekursion_Elim.png){width="60%"}



# Arbeiten mit generierten Parsern: LL(k)-Grammatiken

## First-Mengen

$S \rightarrow A \ \vert \ B \ \vert \ C$

Welche Produktion nehmen?

Wir brauchen die "terminalen k-Anfänge" von Ableitungen von Nichtterminalen, um eindeutig die nächste zu benutzende Produktion festzulegen. $k$ ist dabei die Anzahl der Vorschautoken.

**Def.:** Wir definieren $First$ - Mengen einer Grammatik wie folgt:

*   $a \in T^\ast, |a| \leq k: {First}_k (a) = \lbrace a\rbrace$
*   $a \in T^\ast, |a| > k: {First}_k (a) = \lbrace v \in T^\ast \mid a = vw, |v| = k\rbrace$
*   $\alpha \in (N \cup T)^\ast \backslash T^\ast: {First}_k (\alpha) = \lbrace v \in T^\ast \mid  \alpha \overset{\ast}{\Rightarrow} w,\text{mit}\ w \in T^\ast, First_k(w) = \lbrace v \rbrace \rbrace$


## Linksableitungen

**Def.:** Bei einer kontextfreien Grammatik $G$ ist die *Linksableitung* von $\alpha \in (N \cup T)^{\ast}$ die Ableitung, die man erhält, wenn in jedem Schritt das am weitesten links stehende Nichtterminal in $\alpha$ abgeleitet wird.

Man schreibt $\alpha \overset{\ast}{\Rightarrow}_l \beta.$


## Follow-Mengen

Manchmal müssen wir wissen, welche terminalen Zeichen hinter einem Nichtterminal stehen können.

**Def.** Wir definieren *Follow* - Mengen einer Grammatik wie folgt:


$\forall \beta \in (N \cup T)^*:$

$$Follow_k(\beta) = \lbrace w \in T^\ast \mid \exists \alpha, \gamma \in  (N \cup T)^\ast\ \text{ mit }\ S \overset{\ast}{\Rightarrow}_l \alpha \beta \gamma\ \text{ und }\ w \in First_k(\gamma) \rbrace$$


## LL(k)-Grammatiken

**Def.:** Eine kontextfreie Grammatik *G = (N, T, P, S)* ist genau dann eine *LL(k)*-Grammatik, wenn für alle Linksableitungen der Form:

$S \overset{\ast}{\Rightarrow}_l\ wA \gamma\ {\Rightarrow}_l\ w\alpha\gamma \overset{\ast}{\Rightarrow}_l wx$

und

$S \overset{\ast}{\Rightarrow}_l wA \gamma {\Rightarrow}_l w\beta\gamma \overset{\ast}{\Rightarrow}_l wy$


mit $(w, x, y \in T^\ast, \alpha, \beta, \gamma \in (N \cup T)^\ast, A \in N)$ und $First_k(x) = First_k(y)$
gilt:

$\alpha = \beta$



## LL(k)-Grammatiken

Das hilft manchmal:

Für $k = 1$:
G ist $LL(1): \forall A \rightarrow \alpha, A \rightarrow \beta \in P, \alpha \neq \beta$ gilt:

1.  $\lnot \exists a \in T: \alpha  \overset{\ast}{\Rightarrow}_l  a\alpha_1$ und $\beta \overset{\ast}{\Rightarrow}_l a\beta_1$
2.  $((\alpha \overset{\ast}{\Rightarrow}_l \epsilon) \Rightarrow (\lnot (\beta \overset{\ast}{\Rightarrow}_l \epsilon)))$ und $((\beta \overset{\ast}{\Rightarrow}_l \epsilon) \Rightarrow (\lnot (\alpha\overset{\ast}{\Rightarrow}_l \epsilon)))$
3.  $((\beta \overset{\ast}{\Rightarrow}_l \epsilon)$ und $(\alpha \overset{\ast}{\Rightarrow}_l a\alpha_1)) \Rightarrow a \notin Follow(A)$
4.  $((\alpha \overset{\ast}{\Rightarrow}_l \epsilon)$ und $(\beta \overset{\ast}{\Rightarrow}_l a\beta_1)) \Rightarrow a \notin Follow(A)$

\bigskip

Die ersten beiden  Zeilen bedeuten:

$\alpha$ und $\beta$ können nicht beide $\epsilon$ ableiten,  $First_1(\alpha) \cap First_1(\beta) = \emptyset$

Die dritte und vierte Zeile bedeuten:

$(\epsilon \in First_1(\beta)) \Rightarrow (First_1(\alpha) \cap Follow_1(A) = \emptyset)$

$(\epsilon \in First_1(\alpha)) \Rightarrow (First_1(\beta) \cap Follow_1(A) = \emptyset)$


## LL(1)-Grammatiken


## LL(k)-Sprachen

Die von *LL(k)*-Grammatiken erzeugten Sprachen sind eine echte Teilmenge der deterministisch parsbaren Sprachen.

Die von *LL(k)*-Grammatiken erzeugten Sprachen sind eine echte Teilmenge der von *LL(k+1)*-Grammatiken erzeugten Sprachen.

Für eine kontextfreie Grammatik *G* ist nicht entscheidbar, ob es eine *LL(1)* - Grammatik *G'* gibt mit $L(G) = L(G')$.

In der Praxis reichen $LL(1)$ - Grammatiken oft. Hier gibt es effiziente Parsergeneratoren, deren Eingabe eine LL(k)- (meist LL(1)-) Grammatik ist, und die als Ausgabe den Quellcode eines (effizienten) tabellengesteuerten Parsers generieren.


##  Algorithmus: Konstruktion einer LL-Parsertabelle {.fragile}

**Eingabe:** Eine  Grammatik G = (N, T, P, S)

**Ausgabe:** Eine Parsertabelle *P*

![Algorithmus zur Generierung einer LL-Parsertabelle](images/LL-Parsertabelle.png){width="60%"}

Hier ist $\perp$ das Endezeichen des Inputs.
Statt $First_1(\alpha)$ und $Follow_1(\alpha)$ wird oft nur $First(\alpha)$ und $Follow(\alpha)$ geschrieben.

## LL-Parsertabellen

:::notes
Hier entsteht ein Tafelbild.
:::

## LL-Parsertabellen

Rekursive Programmierung bedeutet, dass das Laufzeitsystem einen Stack benutzt (bei einem Recursive-Descent-Parser, aber auch bei der Parsertabelle). Diesen Stack kann man auch "selbst programmieren", d. h. einen PDA implementieren. Dabei wird ebenfalls die oben genannte Tabelle zur Bestimmung der nächsten anzuwendenden Produktion benutzt. Der Stack enthält die zu erwartenden Eingabezeichen, wenn immer eine Linksableitung gebildet wird. Diese Zeichen im Stack werden mit dem Input gematcht.

## Algorithmus: Tabellengesteuertes LL-Parsen mit einem PDA {.fragile}

**Eingabe:** Eine  Grammatik G = (N, T, P, S), eine Parsertabelle *P* mit $w\perp$ als initialem Kellerinhalt

**Ausgabe:** Wenn $w \in L(G)$,  eine Linksableitung von $w$, Fehler sonst

![Algorithmus zum tabellengesteuerten LL-Parsen](images/LL-Parser.png){width="50%"}


Der Eingabestring sei $w\perp$, der initiale Kellerinhalt sei $\perp$.



## Wrap-Up

*   Syntaxanalyse wird mit deterministisch kontextfreien Grammatiken durchgeführt.
*   Eine Teilmenge der dazu gehörigen Sprachen lässt sich top-down parsen.
*   Ein einfacher Recursive-Descent-Parser arbeitet mit Backtracking.
*   Ein effizienter LL(k)-Parser realisiert einen DPDA und kann automatisch aus einer LL(k)-Grammatik generiert werden.
*   Der Parser liefert in der Regel einen abstrakten Syntaxbaum.






<!-- DO NOT REMOVE - THIS IS A LAST SLIDE TO INDICATE THE LICENSE AND POSSIBLE EXCEPTIONS (IMAGES, ...). -->
::: slides
## LICENSE
![](https://licensebuttons.net/l/by-sa/4.0/88x31.png)

Unless otherwise noted, this work is licensed under CC BY-SA 4.0.
:::
