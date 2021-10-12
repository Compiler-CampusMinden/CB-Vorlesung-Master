---
type: lecture-bc
title: "Reguläre Sprachen, Ausdrucksstärke"
menuTitle: "Reguläre Sprachen"
author: "BC George (FH Bielefeld)"
weight: 1
readings:
  - key: "aho2013compilers"
    comment: "Abschnitt 2.6 und Kapitel 3"
  - key: "Torczon2012"
    comment: "Kapitel 2"
  - key: "Parr2014"
attachments:
  - link: "https://github.com/Compilerbau/AnnotatedSlides/blob/a5f6c9f70413034acabfc9e81c108fdec193f006/lexing_regular.ann.pdf"
    name: "Annotierte Folien: Reguläre Sprachen, Ausdrucksstärke"
---



# Motivation

## Was muss ein Compiler wohl als erstes tun?

## Themen für heute
- Endliche Automaten
- Reguläre Ausdrücke



# Endliche Automaten

## Alphabete

**Def.:** Ein *Alphabet* $\Sigma$ ist eine endliche, nicht-leere Menge von  Symbolen. Die Symbole eines Alphabets heißen *Buchstaben*.

**Def.:** Ein _Wort_ $w$ _über einem Alphabet_ $\Sigma$ ist eine endliche Folge von Symbolen aus $\Sigma$.
$\epsilon$ ist das leere Wort.
Die _Länge_ $\vert w \vert$ eines Wortes $w$ ist die Anzahl von Buchstaben, die es enthält (Kardinalität).

**Def.:**
$\Sigma^k = \{w\ \text{über}\ \Sigma\ \vert\ \vert w \vert = k \}$

$\Sigma^{\ast} = \bigcup\limits_{i \in \mathbb{N}_0} \Sigma^i$ (die Kleene-Hülle von $\Sigma$)

$\Sigma^+ = \bigcup\limits_{i \in \mathbb{N}} \Sigma^i$

## Sprachen über Alphabete

**Def.:** Seien $x = a_1 a_2 \ \ldots  \ a_n$ und $y = b_1b_2 \  \ldots  \  b_m$ Wörter. Wir nennen $xy = x \circ y = a_1 \  \ldots \  a_nb_1 \ \ldots \ b_m$ die *Konkatenation* von $x$ und $y$.

**Def.:** *Eine Sprache $L$ über einem Alphabet $\Sigma$* ist eine Teilmenge von $\Sigma^{\ast} :\ L \subseteq\Sigma^{\ast}$


## Deterministische endliche Automaten

**Def.:** Ein *deterministischer endlicher Automat* (DFA) ist ein 5-Tupel
$A = (Q, \Sigma, \delta, q_0, F)$ mit

* $Q$ : eine endliche Menge von Zuständen
* $\Sigma$ : ein Alphabet von Eingabesymbolen
* $\delta$ : die Übergangsfunktion $(Q \times \Sigma) \rightarrow Q,
  \delta$ kann partiell sein
* $q_0 \in Q$ : der Startzustand
* $F \subseteq Q$ : die Menge der Endzustände


## Die Übergangsfunktion

 **Def.:** Wir definieren  $\delta^{\ast}: (Q \times \Sigma^{\ast}) \rightarrow Q$: induktiv wie folgt:

* Basis: $\delta^{\ast}(q, \epsilon) = q\ \forall q \in Q$
* Induktion: $\delta^{\ast}(q, a_1, \ldots, a_n) = \delta(\delta^{\ast}(q, a_1, \ldots , a_{n-1}), a_n)$

 **Def.:** Ein DFA akzeptiert ein Wort $w \in \Sigma^{\ast}$ genau dann, wenn $\delta^{\ast}(q_0, w) \in F.$

 **Def.:** Die Sprache eines DFA $A\ L(A)$ ist definiert durch:

$L(A) =\{w\ \vert \delta^{\ast}(q_0, w) \in F \}$

## Beispiel


## Nichtdeterministische endliche Automaten

 **Def.:** Ein *nichtdeterministischer endlicher Automat* (NFA) ist ein 5-Tupel
    $A = (Q, \Sigma, \delta, q_0, F)$ mit

* $Q$: eine endliche Menge von Zuständen
* $\Sigma$: ein Alphabet von Eingabesymbolen
* $\delta$: die Übergangsfunktion  $(Q \times \Sigma) \rightarrow \mathcal{P}(Q)$
* $q_0 \in Q$: der Startzustand
* $F \subseteq Q$: die Menge der Endzustände


## Die Übergangsfunktion eines NFAs

 **Def.:** Wir definieren  $\delta^{\ast}: (Q \times \Sigma) \rightarrow \mathcal{P}(Q):$
    induktiv wie folgt:

* Basis: $\delta^{\ast}(q, \epsilon) = q\ \forall q \in Q$
* Induktion: Sei $w \in \Sigma^{\ast}, w = xa, x \in \Sigma^{\ast}, a \in \Sigma$ mit

     $\delta^{\ast}(q, x) =  \{ p_1,\ \ldots,\  p_k \}, p_i \in Q$, sei

     $A = \bigcup\limits_{i = 1}^k \delta(p_i, a) = \{r_1, \ldots r_m \}, r_j \in Q$.

     Dann ist $\delta^{\ast}(q, w) = \{r_1,\  \ldots\ , r_m\}$.


## Wozu NFAs im Compilerbau?

Pattern Matching geht mit NFAs.

NFAs sind so nicht zu programmieren, aber:

 **Satz:** Eine Sprache $L$ wird von einem NFA akzeptiert  $\Leftrightarrow L$ wird von einem DFA akzeptiert.


## Konvertierung eines NFAs in einen DFA

Gegeben: Ein NFA $A = (Q, \Sigma, \delta, q_0, F)$

Wir konstruieren einen DFA $A' =  (Q', \Sigma, \delta ', q_0, F')$ wie folgt:

\bigskip

![Konvertierung NFA in DFA](images/nfa2dfa.png){width="45%"}



## Beispiel

$\delta$          |     a     |        b
-----------------:|:---------:|:--------------:
$\rightarrow q_0$ | $\{q_0\}$ | $\{q_1, q_2\}$
            $q_1$ | $\{q_2\}$ | $\{q_1\}$
           *$q_2$ |     -     | $\{q_0, q_2\}$



$\delta$'               | a              | b
:-----------------------|:---------------|:-------------------
$\rightarrow$ $\{q_0\}$ | $\{q_0\}$      | $\{q_1,q_2\}$
*$\{q_1 q_2\}$          | $\{q_2\}$      | $\{q_0, q_1, q_2\}$
*$\{q_2\}$              | -              | $\{q_0,q_2\}$
*$\{q_0, q_2\}$         | $\{q_0\}$      | $\{q_0, q_1, q_2\}$
*$\{q_0, q_1, q_2\}$    | $\{q_0, q_2\}$ | $\{q_0, q_1, q_2\}$


## Minimierung eines DFAs

Ist ist der DFA $A$ nicht vollständig, wird ein Fehlerzustand $q_e$, der kein Endzustand ist, hinzugefügt und in alle leeren Tabellenfelder eingetragen.

Dann wird eine Matrix generiert, die für alle Zustandspaare sagt, ob die beiden Zustände zu einem verschmelzen können.

![DFA Minimierung](images/minimize_dfa.png){width="50%"}

# Reguläre Ausdrücke

## Operatoren auf Sprachen

 **Def.:** Seien *L* und *M* Sprachen.

*    $L \cup M = \{w \mid w \in L \vee w \in M \}$
*    $LM = L \cdot M = L \circ M = \{vw \mid v \in L \land w \in M\}$
*    Die Kleene-Hülle einer Sprache:
        *    Basis: $L^0 = \{\epsilon\}$
        *    Induktion: $L^i = \{xw\mid x \in L^{i-1}, w \in L, i >
             0\}$, \newline $L^{\ast} = \bigcup\limits_{i \ge 0}L^i$, \newline $L^+ = \bigcup\limits_{i > 0}L^i$


## Reguläre Ausdrücke

 **Def.:** Induktive Definition von regulären Ausdrücken (*regex*) und der von ihnen repräsentierten Sprache:

*    Basis:
     *    $\epsilon$ und $\emptyset$ sind reguläre Ausdrücke mit $L(\epsilon) =
            \{\epsilon\}$, $L(\emptyset)=\emptyset$
     *    Sei $a$ ein Symbol $\Rightarrow$ $a$ ist ein regex mit $L(a) = \{a\}$
*    Induktion: Seien $E,\ F$ reguläre Ausdrücke. Dann gilt:
     *    $E+F$ ist ein regex und bezeichnet die Vereinigung $L(E + F) = L(E)\cup L(F)$
     *    $EF$ ist ein regex und bezeichnet die Konkatenation $L(EF) = L(E)L(F)$
     *    $E^{\ast}$ ist ein regex und bezeichnet die Kleene-Hülle $L(E^{\ast})=(L(E))^{\ast}$
     *    $(E)$ ist ein regex mit $L((E)) = L(E)$

Vorrangregeln der Operatoren für reguläre Ausdrücke: *, Konkatenation, +


## Wichtige Identitäten

**Satz:** Sei $A$ ein DFA $\Rightarrow \exists$ regex $R$ mit $L(A) = L(R)$.

**Satz:** Sei $E$ ein regex $\Rightarrow \exists$ DFA $A$ mit $L(E) = L(A)$.

## Beispiel: Umwandlung eines regex in einen NFA



## Formale Grammatiken

**Def.:** Eine *formale Grammatik* ist ein 4-Tupel $G=(N,T,P,S)$ aus

*    $N$: einer endlichen Menge von $Nichtterminalen$
*    *T*: einer endlichen Menge von *Terminalen*, $N \cap T = \emptyset$
*    $S \in N$: dem *Startsymbol*
*    *P*: einer endlichen Menge von *Produktionen* der Form: $X \rightarrow Y$ mit $X \in (N \cup T)^{\ast} N  (N \cup T)^{\ast}, Y \in (N \cup T)^{\ast}$


## Ableitungen

**Def.:** Sei $G = (N, T, P, S)$ eine Grammatik, sei $\alpha A \beta$ eine Zeichenkette über
$(N \cup T)^{\ast}$ und sei $A$ $\rightarrow \gamma$ eine Produktion von $G$.

Wir sagen:
$\alpha A \beta \Rightarrow \alpha \gamma \beta$ ($\alpha A \beta$ leitet $\alpha \gamma \beta$ ab).

**Def.:** Wir definieren die Relation $\overset{\ast}{\Rightarrow}$ induktiv wie folgt:

*    Basis: $\forall \alpha \in (N \cup T)^{\ast} \alpha \overset{\ast}{\Rightarrow} \alpha$ (Jede Zeichenkette leitet sich selbst ab.)
*    Induktion: Wenn $\alpha \overset{\ast}{\Rightarrow} \beta$ und
        $\beta\Rightarrow \gamma$ dann $\alpha \overset{\ast}{\Rightarrow} \gamma$

**Def.:** {Sei $G = (N, T ,P, S)$ eine formale Grammatik.
    Dann ist $L(G) = \{w \in T^{\ast} \mid S \overset{\ast}{\Rightarrow} w\}$ die von $G$ erzeugte Sprache.


## Reguläre Grammatiken

**Def.:** Eine *reguläre (oder type-3-) Grammatik* ist eine formale Grammatik mit den folgenden Einschränkungen:

*    Alle Produktionen sind entweder von der Form

     *    $X \to aY$  mit $X \in N, a \in T, Y \in N$ (*rechtsreguläre* Grammatik) oder
     *    $X \to Ya$  mit $X \in N, a \in T, Y \in N$ ($linksreguläre$ Grammatik)

*    $X\rightarrow\epsilon$ ist in beiden Fällen erlaubt.


## Reguläre Sprachen

**Satz:** Die von rechtsregulären Grammatiken erzeugten Sprachen sind genau die von linksregulären Grammatiken erzeugten Sprachen. Beide werden $reguläre$ Sprachen genannt.

**Satz:** Die von regulären Ausdrücken beschriebenen Sprachen sind die regulären Sprachen.


## Das Pumping Lemma für reguläre Sprachen

**Satz:** Das \textit{Pumping Lemma für reguläre Sprachen}:

Sei $L$ eine reguläre Sprache.

$\Rightarrow \exists$ Konstante $n \in \mathbb{N}$:

$\underset{\underset{|w| \geq n} {w \in L}}\forall \exists x, y, z \in \Sigma^{*}$ mit $w = xyz, y \neq \epsilon, |xy| \leq n:$

$\underset{k \geq 0} \forall xy^{k}z \in L$


## Abschlusseigenschaften regulärer Sprachen

Die Klasse der regulären Sprachen ist abgeschlossen unter

*   Vereinigung
*   Konkatenation
*   Kleene-Stern
*   Komplementbildung
*   Durchschnitt


## Entscheidbarkeit für reguläre Sprachen

**Satz:** Es ist entscheidbar,

*    ob eine gegebene reguläre Sprache leer ist
*    ob $w \in \Sigma^{\ast}$ in einer gegebenen regulären Sprache enthalten ist (Das "Wort-Problem")
*    ob zwei reguläre Sprachen äquivalent sind


## Grenzen der regulären Sprachen

Reguläre Sprachen sind von ihrer Struktur her einfach. Schon Sprachen, in denen etwas "gematcht" werden muss, lassen sich nicht mehr regulär beschreiben, weil z. B.  die fixe Anzahl von Zuständen eines DFAs die Erkennung solcher Sprachen verhindert.


## Wozu das Ganze?

Im Compilerbau werden reguläre Ausdrücke benutzt, um die Schlüsselwörter und weitere Symbole der zu erkennenden Sprache anzugeben. Daraus wird mit Hilfe eines Generators, der aus den regulären Ausdrücken DFAs (oder einen großen DFA) macht, der sog. Scanner oder Lexer genannt, generiert. Seine Aufgabe ist es, die Folge von Zeichen in der Quelldatei in eine Folge von sog. Token umzuwandeln. Z. B. wird so aus den Zeichen des Schlüsselwortes *while* im Programmtext das Token für *while* gemacht, das in der Syntaxanalyse weiterverarbeitet wird. Die Tokenfolge eines Programms ist ein Wort einer Sprache, die der Parser erkennt. Jedes vom Lexer erkannte Token ist dort also ein terminales Symbol.


## Ein Lexer ist mehr als ein DFA

Was ist zu beachten:

*   Man braucht mindestens eine Liste von Paaren aus regulären Ausdrücken und Tokennamen.
*   Neben den Schlüsselwörtern und Symbolen wie (,), *, $\ldots$ müssen auch Namen für Variablen, Funktionen, Klassen, Methoden, $\ldots$ (sog. Identifier) erkannt werden
*   Namen haben meist eine gewisse Struktur, die sich mit regulären Ausdrücken beschreiben lassen.
*   Erlaubte Token sind in der Grammatik des Parsers beschrieben, d. h. für literale Namen, Strings, Zahlen liefert der Scanner  zwei Werte:

	*  z. B. <ID, "radius">, <Integerzahl, 558>
*   Kommentare und Strings müssen richtig erkannt werden. (Schachtelungen)

Man kann natürlich auch einen Lexer selbst programmieren, d. h. die DFAs für die regulären Ausdrücke implementieren.


## Automatisch oder händisch



# Wrap-Up
## Wrap-Up

-   Definition und Aufgaben von Lexern
-   DFAs und  NFAs
-   Reguläre Ausdrücke
-   Reguläre Grammatiken
-   Zusammenhänge zwischen diesen Mechanismen und Lexern, bzw. Lexergeneratoren








<!-- DO NOT REMOVE - THIS IS A LAST SLIDE TO INDICATE THE LICENSE AND POSSIBLE EXCEPTIONS (IMAGES, ...). -->
::: slides
## LICENSE
![](https://licensebuttons.net/l/by-sa/4.0/88x31.png)

Unless otherwise noted, this work is licensed under CC BY-SA 4.0.

:::
