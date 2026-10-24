# MIF 1.5: Concepts of Programming Languages (Winter 2026/27)

<a id="id-da39a3ee5e6b4b0d3255bfef95601890afd80709"></a>

## Syllabus

### Syllabus

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/admin/images/architektur_cb_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/admin/images/architektur_cb.png" width="80%" /></picture></p>

#### Kursbeschreibung

Der Compiler ist das wichtigste Werkzeug in der Informatik. In der Königsdisziplin der Informatik schließt sich der Kreis, hier kommen die unterschiedlichen Algorithmen und Datenstrukturen und Programmiersprachenkonzepte zur Anwendung.

In diesem Modul geht es um ein fortgeschrittenes Verständnis für interessante Konzepte im Compilerbau sowie um grundlegende Konzepte von Programmiersprachen und -paradigmen. Wir schauen uns dazu relevante aktuelle Tools und Frameworks an und setzen diese bei der Erstellung eines Bytecode-Compilers für unterschiedliche Programmiersprachen für die Java-VM oder WASM ein.

#### Überblick Modulinhalte

1.  Lexikalische Analyse: Scanner/Lexer
    -   Reguläre Sprachen
    -   Manuelle Implementierung, Parsergeneratoren (ANTLR, Flex, ...)
2.  Syntaxanalyse: Parser
    -   Kontextfreie Grammatiken (CFG), Chomsky
    -   LL-Parser (Top-Down-Parser)
    -   LR-Parser (Bottom-Up-Parser)
    -   Manuelle Implementierung, Parsergeneratoren (ANTLR, Bison, ...)
3.  Semantische Analyse und Optimierungen
    -   Symboltabellen
    -   Typen, Typ-Inferenz, Type Checking
    -   Datenfluss- und Kontrollfluss-Analyse
    -   Optimierungen: Peephole u.a.
4.  Zwischencode: Intermediate Representation (IR), LLVM-IR
5.  Interpreter: AST-Traversierung vs. Bytecode/VM, Garbage Collection
6.  Code-Generierung
7.  Programmiersprachen-Konzepte: OOP, FP, LP, CP u.a. und die Auswirkungen auf Compiler/Interpreter und Laufzeitumgebung

#### Team

-   [BC George](https://www.hsbi.de/minden/ueber-uns/personenverzeichnis/birgit-christina-george)
-   [Carsten Gips](https://www.hsbi.de/minden/ueber-uns/personenverzeichnis/carsten-gips) (Sprechstunde nach Vereinbarung)

#### Kursformat

| Seminaristischer Unterricht (2 SWS) | Praktikum (3 SWS)            |
|:------------------------------------|:-----------------------------|
| Fr, 08:45 - 10:15 Uhr (Zoom)        | Fr, 10:30 - 12:45 Uhr (Zoom) |

Durchführung des seminaristischen Unterrichts als *Flipped Classroom* (Carsten) bzw. als *reguläre Vorlesung* (BC). **Zugangsdaten Zoom siehe [ILIAS](https://www.hsbi.de/elearning/goto.php/crs/1702087)**.

#### Fahrplan

| Monat | Woche (Fr) | Seminaristischer Unterricht | Praktikum | Edmonton/Minden-Meetings |
|----|:---|:-------------------------------|:-----------------|:--------------|
| Oktober | 16.10. | Orga \|\| [Überblick](#id-1df70a478502c95d7f7d1fa78f328a16640b3907) \| [Sprachen](#id-55cceb8d95eb4d3a67a6a18eb0e778b5695106a3) \| [Anwendungen](#id-315c4a6ad46ecd3cdd06bff39540497383b62904) | \- |  |
|  | 23.10. | [Reguläre Sprachen](#id-fedfa58fd303fd06c064c79ac0a840c098df4d4f) | [CFG](#id-ed1ca9f1d126c913f7ce93106335deafa8e5a251) |  |
|  | 30.10. | [LL-Parser (Theorie)](#id-07a415053a63f15160a328d38fe730bbd2c78148) | [Lexer (Implementierung)](#id-e459a0cea34b59c5b39e4a2e10ea30c515eba6b0) \| [LL-Parser (Implementierung)](#id-8f9ad51b1fa5549b458757512a9b2c5b7e30f08e) |  |
| November | 06.11. | [LR-Parser](#id-cbdc409a00759785c1751b366323dc17dddf7a1a) | **Vortrag**: Parsergeneratoren (ANTLR, Treesitter, Flex&Bison, ...) | **Di, 03.11., 17:00 - 18:00 Uhr (online): ANTLR + Live-Coding** |
|  | 13.11. | Semantische Analyse: [Intro](#id-b03cfb7bbd7121b294faa1cf2cb22d2a4851d02c) \| [Scopes](#id-322952562f00e1604c311da17b6a5207045e2ab1) \| [Funktionen](#id-33adf70dd90f23c46f778c96105777a5280a334c) \| [Klassen](#id-c6b409593a5212956e56ab3ed20b74aa86f4c204) | **Vortrag**: LALR, PEG, Pratt, Combinators |  |
|  | 20.11. | **Vortrag**: Type Checking, Hindley-Milner | **Pitch DSL-Projekt** |  |
|  | 27.11. | **Kurzvortrag**: OOP (Gabbrielli & Martini, Kap. 10) | **Kurzvortrag**: FP (Gabbrielli & Martini, Kap. 11) |  |
| Dezember | 04.12. | [Interpreter 1](#id-1ef3437e88d6d165c0cf233b6df46f1189d6d4b6) \| [Interpreter 2](#id-153937d8c8cfae4b7b9338d8dee2ea9c18a24ebf) | \- | **Mo, 30.11., 17:00 - 18:00 Uhr (online): Minden Presentations**: **Vorstellung "DSL-Projekt"** |
|  | 11.12. | **Vortrag**: VM & Bytecode | **Kurzvortrag**: LP (Gabbrielli & Martini, Kap. 12) | **Mo, 07.12., 17:00 - 18:00 Uhr (online): Edmonton Presentations** |
|  | 18.12. | [Optimierung und Datenfluss- und Kontrollflussanalyse](#id-8517cc4b94e74e2d9db32a91d3b1c7960002a981) | **Kurzvortrag**: CP (Gabbrielli & Martini, Kap. 13) |  |
|  | *25.12.* | ***Weihnachtspause*** | \- |  |
|  | *01.01.* | ***Weihnachtspause*** | \- |  |
| Januar | 08.01. | **Vortrag**: Garbage Collection | **Vortrag**: JIT |  |
|  | 15.01. | **Kurzvortrag**: Borrow Checking und Lifetimes (Rust) | **Kurzvortrag**: Dependent Type Systems (Idris) |  |
|  | 22.01. | *Sprechstunde* | *Freies Arbeiten* |  |
|  | 29.01. | **Vorträge DSL-Projekt** | **Vorträge DSL-Projekt** |  |

-   [Zu den Talks ...](#id-a73470af5aac0f6102a1f24e33280ebad2acc29d)
-   [Zum DSL-Projekt ...](#id-441c6299f10fc33707a0080c5fef11dc5a486466)

#### Prüfungsform, Note und Credits

**Mündliche Prüfung plus Studienleistung (Portfolio)**, 10 ECTS

##### **Studienleistung**: "Portfolio"

Die Studienleistung ist eine unbenotete Leistung und setzt sich aus mehreren Komponenten zusammen:

1.  **Projekt-Pitch** (Vorstellung der Konzepte für das DSL-Projekt): Freitag, 20.11., ca. 20 Minuten (pro Team); **Exposé** (s.u.) bis zum 19.11.
2.  Teilnahme an **mind. zwei Edmonton/Minden-Terminen** mit aktiver Beteiligung, pro Team ist am zweiten Treffen ein Vortrag zum DSL-Projekt ca. 45 Minuten zu halten (Englisch!)
    -   Termin 1: Dienstag, 03.11., 17:00 - 18:00 Uhr (online)
    -   **Termin 2**: Montag, 30.11., 17:00 - 18:00 Uhr (online): **Vorstellung der DSL-Projekte** (Projektvortrag 1), ca. 40-45 Minuten pro Team (**Englisch**)
    -   Termin 3: Montag, 07.12., 17:00 - 18:00 Uhr (online)
3.  **Kurzvortrag** "PL Features" ca. 20 Minuten (pro Team) plus Diskussionsleitung
4.  **Fachvortrag** "Compiler" ca. 60 Minuten (pro Team)
5.  **Abschlusspräsentation** zum DSL-Projekt (Projektvortrag 2) am Semesterende (Freitag, 29.01.) ca. 30 Minuten (pro Team)

Zu diesen Leistungen soll ein **Lerntagebuch** (s.u.) geführt und abgegeben werden (**jede Person individuell**).

Das Exposé, die Slides (Edmonton-Talk, Kurzvortrag, Fachvortrag, Abschlusspräsentation), das Projekt (via GitHub-Link im Lerntagebuch) und das Lerntagebuch sind im **[ILIAS](https://www.hsbi.de/elearning/goto.php/exc/1738006)** als PDF abzugeben. Bitte beachtet die jeweiligen Abgabefristen im ILIAS!

##### **Gesamtnote**: Mündliche Prüfung (einzeln, ca. 45 Minuten)

Die Modul-Note ergibt sich aus der Leistung in der mündlichen Prüfung.

Sie können die Prüfung in der ersten oder in der zweiten Prüfungsphase ablegen. Die mündliche Prüfung wird über Zoom durchgeführt und dauert ca. 45 Minuten.

##### Hinweise

-   Die mündliche Prüfung und die Studienleistung sind zwei unabhängige Prüfungsleistungen und werden separat im CAT angemeldet. Die Studienleistung schaltet die Credits für das Modul frei, die mündliche Prüfung ergibt die Modulnote. Die Studienleistung ist **keine** Vorleistung für die mündliche Prüfung.
-   Die Bearbeitung der Leistungen erfolgt im Team.
-   Ein Team umfasst 3 Personen.
-   Es gibt keine Aufgabenblätter. Stattdessen haben wir verschiedene Vorträge und das DSL-Projekt.
-   Das Lerntagebuch ist individuell zu erstellen und abzugeben.
-   "Aktive Beteiligung" umfasst Anwesenheit und sachbezogene Beiträge; Anwesenheit/Beteiligung werden dokumentiert.

<!-- -->

-   **Exposé** (pro Team)

    -   Umfang: 150-400 Wörter
    -   Struktur:
        1.  Was wollt ihr machen?
        2.  Warum ist das spannend?
        3.  Wie werdet ihr das umsetzen?
        4.  Wie könnt ihr euren Erfolg empirisch bewerten?
        5.  Wer ist alles im Team?

    Bitte beschreiben Sie die einzelnen Punkte so ausführlich wie nötig, um nachvollziehbar zu sein.

    Abgabe als PDF im [ILIAS](https://www.hsbi.de/elearning/goto.php/exc/1738006), spätestens einen Tag vor der internen Projektvorstellung.

<!-- -->

-   **Lerntagebuch**: Jede Person beschreibt individuell(!) die Bearbeitung der Studienleistung (auch die Teilnahme an den Edmonton/Minden-Meetings) zurückblickend mit mind. 750 bis max. 2000 Wörtern (Nutzlast! Überschriften und Links zählen nicht mit). Gehen Sie dabei aussagekräftig und nachvollziehbar auf folgende Punkte ein:

    1.  **Zusammenfassung**: Was wurde gemacht bzw. was wurde auf dem Meeting besprochen?
    2.  **Details**: Kurze Beschreibung besonders interessanter Aspekte.
    3.  **Reflexion**: Was war der schwierigste Teil? Wie haben Sie dieses Problem gelöst?
    4.  **Reflexion**: Was haben Sie gelernt oder (besser) verstanden?
    5.  **Team**: Mit wem haben Sie zusammengearbeitet?
    6.  **Link zu Ihrem Repo** mit den relevanten Artefakten (Lösung, Slides für den Vortrag, ...).

    Für die Edmonton/Minden-Meetings passen Sie bitte die Punkte (1) bis (4) und (5) entsprechend inhaltlich an, (6) entfällt.

    Das Lerntagebuch geben Sie bitte pro Person bis spätestens zur letzten gemeinsamen Sitzung im [ILIAS](https://www.hsbi.de/elearning/goto.php/exc/1738006) ab.

#### Materialien

1.  ["**Compilers: Principles, Techniques, and Tools**"](https://learning.oreilly.com/library/view/compilers-principles-techniques/9789357054881/). Aho, A. V. und Lam, M. S. und Sethi, R. und Ullman, J. D. and Bansal, S., Pearson India, 2023. ISBN [978-9-3570-5488-1](https://fhb-bielefeld.digibib.net/openurl?isbn=978-9-3570-5488-1). [Online](https://learning.oreilly.com/library/view/compilers-principles-techniques/9789357054881/) über die [O'Reilly-Lernplattform](https://www.oreilly.com/library-access/).
2.  ["**Crafting Interpreters**"](https://github.com/munificent/craftinginterpreters). Nystrom, R., Genever Benning, 2021. ISBN [978-0-9905829-3-9](https://fhb-bielefeld.digibib.net/openurl?isbn=978-0-9905829-3-9). [Online](https://www.craftinginterpreters.com/).
3.  ["**Engineering a Compiler**"](https://learning.oreilly.com/library/view/engineering-a-compiler/9780080916613/). Torczon, L. und Cooper, K., Morgan Kaufmann, 2012. ISBN [978-0-1208-8478-0](https://fhb-bielefeld.digibib.net/openurl?isbn=978-0-1208-8478-0). [Online](https://learning.oreilly.com/library/view/engineering-a-compiler/9780080916613/) über die [O'Reilly-Lernplattform](https://www.oreilly.com/library-access/).
4.  ["Introduction to Compilers and Language Design"](https://www3.nd.edu/~dthain/compilerbook/). Thain, D., 2023. ISBN [979-8-655-18026-0](https://fhb-bielefeld.digibib.net/openurl?isbn=979-8-655-18026-0). [Online](https://www3.nd.edu/~dthain/compilerbook/).
5.  ["Writing a C Compiler"](https://learning.oreilly.com/library/view/writing-a-c/9781098182229/). Sandler, N., No Starch Press, 2024. ISBN [978-1-0981-8222-9](https://fhb-bielefeld.digibib.net/openurl?isbn=978-1-0981-8222-9). [Online](https://learning.oreilly.com/library/view/writing-a-c/9781098182229/) über die [O'Reilly-Lernplattform](https://www.oreilly.com/library-access/).
6.  ["**Seven Languages in Seven Weeks**"](https://learning.oreilly.com/library/view/seven-languages-in/9781680500059/). Tate, B.A., Pragmatic Bookshelf, 2010. ISBN [978-1-93435-659-3](https://fhb-bielefeld.digibib.net/openurl?isbn=978-1-93435-659-3). [Online](https://learning.oreilly.com/library/view/seven-languages-in/9781680500059/) über die [O'Reilly-Lernplattform](https://www.oreilly.com/library-access/).

#### Förderungen und Kooperationen

##### Kooperation mit University of Alberta, Edmonton (Kanada)

Über das Projekt ["We CAN virtuOWL"](https://www.uni-bielefeld.de/international/profil/netzwerk/alberta-owl/we-can-virtuowl/) der Fachhochschule Bielefeld ist im Frühjahr 2021 eine Kooperation mit der [University of Alberta](https://www.hsbi.de/en/international-office/alberta-owl-cooperation) (Edmonton/Alberta, Kanada) im Modul "Compilerbau" gestartet.

Wir freuen uns, auch in diesem Semester wieder drei gemeinsame Sitzungen für beide Hochschulen anbieten zu können. (Diese Termine werden in englischer Sprache durchgeführt.)

------------------------------------------------------------------------

#### LICENSE

<p align="center"><img src="https://licensebuttons.net/l/by-sa/4.0/88x31.png"  /></p>

Unless otherwise noted, [this work](https://github.com/Compiler-CampusMinden/CPL-Vorlesung-Master) by [BC George](https://github.com/bcg7), [Carsten Gips](https://github.com/cagix) and [contributors](https://github.com/Compiler-CampusMinden/CPL-Vorlesung-Master/graphs/contributors) is licensed under [CC BY-SA 4.0](https://github.com/Compiler-CampusMinden/CPL-Vorlesung-Master/blob/master/LICENSE.md). See the [credits](https://github.com/Compiler-CampusMinden/CPL-Vorlesung-Master/blob/master/CREDITS.md) for a detailed list of contributing projects.

<a id="id-af09e2fcaf4589921086150d991647b7b52abd03"></a>

## Vorlesungsunterlagen

<a id="id-352b1e776856b1ada7109fc42e5a89b3d7f98605"></a>

### Überblick

Was ist ein Compiler? Welche Bausteine lassen sich identifizieren, welche Aufgaben haben diese?

<a id="id-1df70a478502c95d7f7d1fa78f328a16640b3907"></a>

#### Struktur eines Compilers

> [!IMPORTANT]
>
> <details open>
> <summary><strong>🎯 TL;DR</strong></summary>
>
> Compiler übersetzen (formalen) Text in ein anderes Format.
>
> Typischerweise kann man diesen Prozess in verschiedene Stufen/Phasen einteilen. Dabei verarbeitet jede Phase den Output der vorangegangenen Phase und erzeugt ein (kompakteres) Ergebnis, welches an die nächste Phase weitergereicht wird. Dabei nimmt die Abstraktion von Stufe zu Stufe zu: Der ursprüngliche Input ist ein Strom von Zeichen, daraus wird ein Strom von Wörtern (Token), daraus ein Baum (Parse Tree), Zwischencode (IC), ...
>
> <p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/00-intro/images/architektur_cb_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/00-intro/images/architektur_cb.png"  /></picture></p>
>
> Die gezeigten Phasen werden traditionell unterschieden. Je nach Aufgabe können verschiedene Stufen zusammengefasst werden oder sogar gar nicht auftreten.
>
> </details>

> [!TIP]
>
> <details open>
> <summary><strong>🎦 Videos</strong></summary>
>
> Vorlesung \[[YT](https://youtu.be/bFFvdMDvhYQ)\], \[[HSBI](https://www.hsbi.de/medienportal/album/video/cpl-struktur-eines-compilers/72b12f8f1e84ea7980179adb5d067ac2/254)\]
>
> </details>

##### Sprachen verstehen, Texte transformieren

> The cat runs quickly.

=\> Struktur? Bedeutung?

Wir können hier (mit steigender Abstraktionsstufe) unterscheiden:

-   Sequenz von Zeichen

-   Wörter: Zeichenketten mit bestimmten Buchstaben, getrennt durch bestimmte andere Zeichen; Wörter könnten im Wörterbuch nachgeschlagen werden

-   Sätze: Anordnung von Wörtern nach einer bestimmten Grammatik, Grenze: Satzzeichen

    Hier (vereinfacht): Ein Satz besteht aus Subjekt und Prädikat. Das Subjekt besteht aus einem oder keinen Artikel und einem Substantiv. Das Prädikat besteht aus einem Verb und einem oder keinem Adverb.

-   Sprache: Die Menge der in einer Grammatik erlaubten Sätze

##### Compiler: Big Picture

<p align="center"><img src="https://github.com/munificent/craftinginterpreters/blob/master/site/image/a-map-of-the-territory/mountain.png?raw=true" width="80%" /></p>

Quelle: [A Map of the Territory (mountain.png)](https://github.com/munificent/craftinginterpreters/blob/master/site/image/a-map-of-the-territory/mountain.png) by [Bob Nystrom](https://github.com/munificent) on Github.com ([MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE))

**Begriffe und Phasen**

Die obige Bergsteige-Metapher kann man in ein nüchternes Ablaufdiagramm mit verschiedenen Stufen und den zwischen den Stufen ausgetauschten Artefakten übersetzen:

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/00-intro/images/architektur_cb_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/00-intro/images/architektur_cb.png" width="70%" /></picture></p>

###### Frontend, Analyse

Die ersten Stufen eines Compilers, die mit der **Analyse** des Inputs beschäftigt sind. Dies sind in der Regel der Scanner, der Parser und die semantische Analyse.

-   Scanner, Lexer, Tokenizer, Lexikalische Analyse

    Zerteilt den Zeichenstrom in eine Folge von Wörtern. Mit regulären Ausdrücken kann definiert werden, was Klassen gültiger Wörter ("Token") sind. Ein Token hat i.d.R. einen Namen und einen Wert.

-   Parser, Syntaxanalyse

    Der Parser erhält als Eingabe die Folge der Token und versucht mit Hilfe einer Grammatik zu bestimmen, ob es sich bei der Tokensequenz um gültige Sätze im Sinne der Grammatik handelt. Hier gibt es viele Algorithmen, die im Wesentlichen in die Klassen "top-down" und "bottom-up" fallen.

-   Semantische Analyse, Kontexthandling

    In den vorigen Stufen wurde eher lokal gearbeitet. Hier wird über den gesamten Baum und die Symboltabelle hinweg geprüft, ob beispielsweise Typen korrekt verwendet wurden, in welchen Scope ein Name gehört etc. Mit diesen Informationen wird der AST angereichert.

-   Symboltabellen

    Datenstrukturen, um Namen, Werte, Scopes und weitere Informationen zu speichern. Die Symboltabellen werden vor allem beim Parsen befüllt und bei der semantischen Analyse gelesen, aber auch der Lexer benötigt u.U. diese Informationen.

###### Backend, Synthese

Die hinteren Stufen eines Compilers, die mit der **Synthese** der Ausgabe beschäftigt sind. Dies sind in der Regel verschiedene Optimierungen und letztlich die Code-Generierung

-   Codegenerierung

    Erzeugung des Zielprogramms aus der (optimierten) Zwischendarstellung. Dies ist oft Maschinencode, kann aber auch C-Code oder eine andere Ziel-Sprache sein.

-   Optimierung

    Diverse Maßnahmen, um den resultierenden Code kleiner und/oder schneller zu gestalten.

-   Symboltabellen

    Datenstrukturen, um Namen, Werte, Scopes und weitere Informationen zu speichern. Die Symboltabellen werden vor allem beim Parsen befüllt und bei der semantischen Analyse gelesen, aber auch der Lexer benötigt u.U. diese Informationen.

###### Weitere Begriffe

-   Parse Tree, Concrete Syntax Tree

    Repräsentiert die Struktur eines Satzes, wobei jeder Knoten dem Namen einer Regel der Grammatik entspricht. Die Blätter bestehen aus den Token samt ihren Werten.

-   AST, (Abstract) Syntax Tree

    Vereinfachte Form des Parse Tree, wobei der Bezug auf die Element der Grammatik (mehr oder weniger) weggelassen wird.

-   Annotierter AST

    Anmerkungen am AST, die für spätere Verarbeitungsstufen interessant sein könnten: Typ-Informationen, Optimierungsinformationen, ...

-   Zwischen-Code, IC

    Zwischensprache, die abstrakter ist als die dem AST zugrunde liegenden Konstrukte der Ausgangssprache. Beispielsweise könnten `while`-Schleifen durch entsprechende Label und Sprünge ersetzt werden. Wie genau dieser Zwischen-Code aussieht, muss der Compilerdesigner entscheiden. Oft findet man den Assembler-ähnlichen "3-Adressen-Code".

-   Sprache

    Eine Sprache ist eine Menge gültiger Sätze. Die Sätze werden aus Wörtern gebildet, diese wiederum aus Zeichenfolgen.

-   Grammatik

    Eine Grammatik beschreibt formal die Syntaxregeln für eine Sprache. Jede Regel in der Grammatik beschreibt dabei die Struktur eines Satzes oder einer Phrase.

##### Lexikalische Analyse: Wörter ("*Token*") erkennen

Die lexikalische Analyse (auch *Scanner* oder *Lexer* oder *Tokenizer* genannt) zerteilt den Zeichenstrom in eine Folge von Wörtern ("*Token*"). Die geschieht i.d.R. mit Hilfe von *regulären Ausdrücken*.

Dabei müssen unsinnige/nicht erlaubte Wörter erkannt werden.

Überflüssige Zeichen (etwa Leerzeichen) werden i.d.R. entfernt.

    sp = 100;

    <ID, sp>, <OP, =>, <INT, 100>, <SEM>

*Anmerkung*: In der obigen Darstellung werden die Werte der Token ("*Lexeme*") zusammen mit den Token "gespeichert". Alternativ können die Werte der Token auch direkt in der Symboltabelle gespeichert werden und in den Token nur der Verweis auf den jeweiligen Eintrag in der Tabelle.

##### Syntaxanalyse: Sätze erkennen

In der Syntaxanalyse (auch *Parser* genannt) wird die Tokensequenz in gültige Sätze unterteilt. Dazu werden in der Regel *kontextfreie Grammatiken* und unterschiedliche Parsing-Methoden (*top-down*, *bottom-up*) genutzt.

Dabei müssen nicht erlaubte Sätze erkannt werden.

    <ID, sp>, <OP, =>, <INT, 100>, <SEM>

``` lex
statement : assign SEM ;
assign : ID OP INT ;
```

                       statement                  =
                       /       \                 / \
                   assign      SEM             sp  100
                 /   |   \      |
               ID    OP  INT    ;
               |     |    |
               sp    =   100

Mit Hilfe der Produktionsregeln der Grammatik wird versucht, die Tokensequenz zu erzeugen. Wenn dies gelingt, ist der Satz (also die Tokensequenz) ein gültiger Satz im Sinne der Grammatik. Dabei sind die Token aus der lexikalischen Analyse die hier betrachteten Wörter!

Dabei entsteht ein sogenannter *Parse-Tree* (oder auch "*Syntax Tree*"; in der obigen Darstellung der linke Baum). In diesen Bäumen spiegeln sich die Regeln der Grammatik wider, d.h. zu einem Satz kann es durchaus verschiedene Parse-Trees geben.

Beim *AST* ("*Abstract Syntax Tree*") werden die Knoten um alle später nicht mehr benötigten Informationen bereinigt (in der obigen Darstellung der rechte Baum).

*Anmerkung*: Die Begriffe werden oft nicht eindeutig verwendet. Je nach Anwendung ist das Ergebnis des Parsers ein AST oder ein Parse-Tree.

*Anmerkung*: Man könnte statt `OP` auch etwa ein `ASSIGN` nutzen und müsste dann das "`=`" nicht extra als Inhalt speichern, d.h. man würde die Information im Token-Typ kodieren.

##### Vorschau: Parser implementieren

``` lex
stat : assign | ifstat | ... ;
assign : ID '=' expr ';' ;
```

``` java
void stat() {
    switch (<<current token>>) {
        case ID : assign(); break;
        case IF : ifstat(); break;
        ...
        default : <<raise exception>>
    }
}
void assign() {
    match(ID);
    match('=');
    expr();
    match(';');
}
```

Der gezeigte Parser ist ein sogenannter "LL(1)"-Parser und geht von oben nach unten vor, d.h. ist ein Top-Down-Parser.

Nach dem Betrachten des aktuellen Tokens wird entschieden, welche Alternative vorliegt und in die jeweilige Methode gesprungen.

Die `match()`-Methode entspricht dabei dem Erzeugen von Blättern, d.h. hier werden letztlich die Token der Grammatik erkannt.

##### Semantische Analyse: Bedeutung erkennen

In der semantischen Analyse (auch *Context Handling* genannt) wird der AST zusammen mit der Symboltabelle geprüft. Dabei spielen Probleme wie Scopes, Namen und Typen eine wichtige Rolle.

Die semantische Analyse ist direkt vom Programmierparadigma der zu übersetzenden Sprache abhängig, d.h. müssen wir beispielsweise das Konzept von Klassen verstehen?

Als Ergebnis dieser Phase entsteht typischerweise ein *annotierter AST*.

``` c
{
    int x = 42;
    {
        int x = 7;
        x += 3;    // ???
    }
}
```

                                                  = {type: real, loc: tmp1}
    sp = 100;                                    / \
                                                /   \
                                              sp     inttofloat
                                      {type: real,       |
                                       loc: var b}      100

##### Zwischencode generieren

Aus dem annotierten AST wird in der Regel ein Zwischencode ("*Intermediate Code*", auch "IC") generiert. oft findet man hier den Assembler-ähnlichen "3-Adressen-Code", in manchen Compilern wird als IC aber auch der AST selbst genutzt.

                     = {type: real, loc: tmp1}
                    / \
                   /   \
                 sp     inttofloat
         {type: real,       |
          loc: var b}      100

=\> `t1 = inttofloat(100)`

##### Code optimieren

An dieser Stelle verlassen wir das Compiler-Frontend und begeben uns in das sogenannte *Backend*. Die Optimierung des Codes kann sehr unterschiedlich ausfallen, beispielsweise kann man den Zwischencode selbst optimieren, dann nach sogenanntem "Targetcode" übersetzen und diesen weiter optimieren, bevor das Ergebnis im letzten Schritt in Maschinencode übersetzt wird.

Die Optimierungsphase ist sehr stark abhängig von der Zielhardware. Hier kommen fortgeschrittene Mengen- und Graphalgorithmen zur Anwendung. Die Optimierung stellt den wichtigsten Teil aktueller Compiler dar.

Aus zeitlichen und didaktischen Gründen werden wir in dieser Veranstaltung den Fokus auf die Frontend-Phasen legen und die Optimierung nur grob streifen.

`t1 = inttofloat(100)` =\> `t1 = 100.0`

`x = y*0;` =\> `x = 0;`

##### Code generieren

-   Maschinencode:

    ``` gnuassembler
    STD  t1, 100.0
    ```

<!-- -->

-   Andere Sprache:
    -   Bytecode
    -   C
    -   ...

##### Probleme

    5*4+3

**AST**?

Problem: Vorrang von Operatoren

-   Variante 1: `+(*(5, 4), 3)`
-   Variante 2: `*(5, +(4, 3))`

``` lex
stat : expr ';'
     | ID '(' ')' ';'
     ;
expr : ID '(' ')'
     | INT
     ;
```

##### Unbedingt lesenswert

Sie sollten diese beiden Paper unbedingt als Einstieg in das Modul lesen:

1.  [Programming Language Semantics](https://www.cs.nott.ac.uk/~pszgmh/123.pdf)
2.  [An Incremental Approach to Compiler Construction](http://scheme2006.cs.uchicago.edu/11-ghuloum.pdf)

##### Wrap-Up

-   Compiler übersetzen Text in ein anderes Format

<!-- -->

-   Typische Phasen:
    1.  Lexikalische Analyse
    2.  Syntaxanalyse
    3.  Semantische Analyse
    4.  Generierung von Zwischencode
    5.  Optimierung des (Zwischen-) Codes
    6.  Codegenerierung

> [!TIP]
>
> <details open>
> <summary><strong>📖 Zum Nachlesen</strong></summary>
>
> -   Aho u. a. ([2023](#ref-Aho2023)): Kapitel 1 Introduction
> -   Grune u. a. ([2012](#ref-Grune2012)): Kapitel 1 Introduction
>
> </details>

> [!NOTE]
>
> <details >
> <summary><strong>✅ Lernziele</strong></summary>
>
> -   k2: Ich kann die Struktur eines Compilers und die verschiedenen Phasen und deren Aufgaben erklären
>
> </details>

<a id="id-55cceb8d95eb4d3a67a6a18eb0e778b5695106a3"></a>

#### Bandbreite der Programmiersprachen

> [!IMPORTANT]
>
> <details open>
> <summary><strong>🎯 TL;DR</strong></summary>
>
> Am Beispiel des Abzählreims "99 Bottles of Beer" werden (ganz kurz) verschiedene Programmiersprachen betrachtet. Jede der Sprachen hat ihr eigenes Sprachkonzept (Programmierparadigma) und auch ein eigenes Typ-System sowie ihre eigene Strategie zur Speicherverwaltung und Abarbeitung.
>
> Auch wenn die Darstellung längst nicht vollständig ist, macht sie doch deutlich, dass Compiler teilweise sehr unterschiedliche Konzepte "verstehen" müssen.
>
> </details>

> [!TIP]
>
> <details open>
> <summary><strong>🎦 Videos</strong></summary>
>
> Vorlesung \[[YT](https://youtu.be/HQfAV_TvhYc)\], \[[HSBI](https://www.hsbi.de/medienportal/album/video/cpl-bandbreite-der-programmiersprachen/5665e9e636e9c84c6ce5dd8de78340c1/254)\]
>
> </details>

##### 99 Bottles of Beer

> 99 bottles of beer on the wall, 99 bottles of beer. Take one down and pass it around, 98 bottles of beer on the wall.
>
> 98 bottles of beer on the wall, 98 bottles of beer. Take one down and pass it around, 97 bottles of beer on the wall.
>
> \[...\]
>
> 2 bottles of beer on the wall, 2 bottles of beer. Take one down and pass it around, 1 bottle of beer on the wall.
>
> 1 bottle of beer on the wall, 1 bottle of beer. Take one down and pass it around, no more bottles of beer on the wall.
>
> No more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more, 99 bottles of beer on the wall.

Quelle: Abzählreim "99 Bottles of Beer" nach ["Lyrics of the song 99 Bottles of Beer"](https://www.99-bottles-of-beer.net/lyrics.html) on 99-bottles-of-beer.net

##### Imperativ, Hardwarenah: C

``` {.c size="footnotesize"}
 #define MAXBEER (99)
 void chug(int beers);
 main() {
    register beers;
    for(beers = MAXBEER; beers; chug(beers--))  puts("");
    puts("\nTime to buy more beer!\n");
 }
 void chug(register beers) {
    char howmany[8], *s;
    s = beers != 1 ? "s" : "";
    printf("%d bottle%s of beer on the wall,\n", beers, s);
    printf("%d bottle%s of beeeeer . . . ,\n", beers, s);
    printf("Take one down, pass it around,\n");
    if(--beers) sprintf(howmany, "%d", beers); else strcpy(howmany, "No more");
    s = beers != 1 ? "s" : "";
    printf("%s bottle%s of beer on the wall.\n", howmany, s);
 }
```

Quelle: ["Language C"](https://www.99-bottles-of-beer.net/language-c-116.html) by Bill Wein on 99-bottles-of-beer.net

-   Imperativ

-   Procedural

-   Statisches Typsystem

-   Resourcenschonend, aber "unsicher": Programmierer muss wissen, was er tut

-   Relativ hardwarenah

-   Einsatz: Betriebssysteme, Systemprogrammierung

##### Imperativ, Objektorientiert: Java

``` java
class bottles {
    public static void main(String args[]) {
        String s = "s";
        for (int beers=99; beers>-1;) {
            System.out.print(beers + " bottle" + s + " of beer on the wall, ");
            System.out.println(beers + " bottle" + s + " of beer, ");
            if (beers==0) {
                System.out.print("Go to the store, buy some more, ");
                System.out.println("99 bottles of beer on the wall.\n");
                System.exit(0);
            } else
                System.out.print("Take one down, pass it around, ");
            s = (--beers == 1)?"":"s";
            System.out.println(beers + " bottle" + s + " of beer on the wall.\n");
        }
    }
}
```

Quelle: ["Language Java"](https://www.99-bottles-of-beer.net/language-java-4.html) by Sean Russell on 99-bottles-of-beer.net

-   Imperativ

-   Objektorientiert

-   Multi-Threading

-   Basiert auf C/C++

-   Statisches Typsystem

-   Automatische Garbage Collection

-   "Sichere" Architektur: Laufzeitumgebung fängt viele Probleme ab

-   Architekturneutral: Nutzt Bytecode und eine JVM

-   Einsatz: High-Level All-Purpose Language

##### Logisch: Prolog

``` prolog
bottles :-
    bottles(99).

bottles(1) :-
    write('1 bottle of beer on the wall, 1 bottle of beer,'), nl,
    write('Take one down, and pass it around,'), nl,
    write('Now they are all gone.'), nl,!.
bottles(X) :-
    write(X), write(' bottles of beer on the wall,'), nl,
    write(X), write(' bottles of beer,'), nl,
    write('Take one down and pass it around,'), nl,
    NX is X - 1,
    write(NX), write(' bottles of beer on the wall.'), nl, nl,
    bottles(NX).
```

Quelle: ["Language Prolog"](https://www.99-bottles-of-beer.net/language-prolog-965.html) by M@ on 99-bottles-of-beer.net

-   Deklarativ

-   Logisch: Definition von Fakten und Regeln; eingebautes Beweissystem

-   Einsatz: Theorem-Beweisen, Natural Language Programming (NLP), Expertensysteme, ...

##### Funktional: Haskell

``` haskell
bottles 0 = "no more bottles"
bottles 1 = "1 bottle"
bottles n = show n ++ " bottles"

verse 0   = "No more bottles of beer on the wall, no more bottles of beer.\n"
         ++ "Go to the store and buy some more, 99 bottles of beer on the wall."

verse n   = bottles n ++ " of beer on the wall, " ++ bottles n ++ " of beer.\n"
         ++ "Take one down and pass it around, " ++ bottles (n-1)
                                                 ++ " of beer on the wall.\n"

main      = mapM (putStrLn . verse) [99,98..0]
```

Quelle: ["Language Haskell"](https://www.99-bottles-of-beer.net/language-haskell-1070.html) by Iavor on 99-bottles-of-beer.net

-   Deklarativ

-   Funktional

-   Lazy, pure

-   Statisches Typsystem

-   Typinferenz

-   Algebraische Datentypen, Patternmatching

-   Einsatz: Compiler, DSL, Forschung

##### Brainfuck

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/00-intro/images/screenshot_brainfuck_99bottles_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/00-intro/images/screenshot_brainfuck_99bottles.png" width="15%" /></picture></p>

Quelle: Screenshot of ["Language Brainfuck"](https://99-bottles-of-beer.net/language-brainfuck-2542.html) by Michal Wojciech Tarnowski on 99-bottles-of-beer.net

-   Imperativ

-   Feldbasiert (analog zum Band der Turingmaschine)

-   8 Befehle: Zeiger und Zellen inkrementieren/dekrementieren, Aus- und Eingabe, Sprungbefehle

##### Programmiersprache Lox

    fun fib(x) {
        if (x == 0) {
            return 0;
        } else {
            if (x == 1) {
                return 1;
            } else {
                fib(x - 1) + fib(x - 2);
            }
        }
    }

    var wuppie = fib;
    wuppie(4);

-   Die Sprache "Lox" finden Sie hier: [craftinginterpreters.com/the-lox-language.html](https://www.craftinginterpreters.com/the-lox-language.html)

-   C-ähnliche Syntax

-   Imperativ, objektorientiert, Funktionen als *First Class Citizens*, Closures

-   Dynamisch typisiert

-   Garbage Collector

-   Statements und Expressions

-   (Kleine) Standardbibliothek eingebaut

Die Sprache ähnelt stark anderen modernen Sprachen und ist gut geeignet, um an ihrem Beispiel Themen wie Scanner/Parser/AST, Interpreter, Object Code und VM zu studieren :)

##### Wrap-Up

-   Compiler übersetzen formalen Text in ein anderes Format

<!-- -->

-   Berücksichtigung von unterschiedlichen
    -   Sprachkonzepten (Programmierparadigmen)
    -   Typ-Systemen
    -   Speicherverwaltungsstrategien
    -   Abarbeitungsstrategien

> [!TIP]
>
> <details open>
> <summary><strong>📖 Zum Nachlesen</strong></summary>
>
> -   Aho u. a. ([2023](#ref-Aho2023)): Kapitel 1 Introduction
> -   Grune u. a. ([2012](#ref-Grune2012)): Kapitel 1 Introduction
>
> </details>

> [!NOTE]
>
> <details >
> <summary><strong>✅ Lernziele</strong></summary>
>
> -   k1: Ich kenne verschiedene Beispiele für verschiedene Programmiersprachen und Paradigmen
>
> </details>

<a id="id-315c4a6ad46ecd3cdd06bff39540497383b62904"></a>

#### Anwendungen

> [!IMPORTANT]
>
> <details open>
> <summary><strong>🎯 TL;DR</strong></summary>
>
> Es gibt verschiedene Anwendungsmöglichkeiten für Compiler. Je nach Bedarf wird dabei die komplette Toolchain durchlaufen oder es werden Stufen ausgelassen. Häufig genutzte Varianten sind dabei:
>
> -   "Echte" Compiler: Übersetzen Sourcecode nach ausführbarem Maschinencode
> -   Interpreter: Interaktive Ausführung von Sourcecode
> -   Virtuelle Maschinen als Zwischending zwischen Compiler und Interpreter
> -   Transpiler: Übersetzen formalen Text nach formalem Text
> -   Analysetools: Parsen den Sourcecode, werten die Strukturen aus
>
> </details>

> [!TIP]
>
> <details open>
> <summary><strong>🎦 Videos</strong></summary>
>
> Vorlesung \[[YT](https://youtu.be/msqlU1MJgTw)\], \[[HSBI](https://www.hsbi.de/medienportal/album/video/cpl-anwendungen-compiler/6e4dbb655d0cff20ea2544b7d96e9370/254)\]
>
> </details>

##### Anwendung: Compiler

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/00-intro/images/compiler_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/00-intro/images/compiler.png"  /></picture></p>

Wie oben diskutiert: Der Sourcecode durchläuft alle Phasen des Compilers, am Ende fällt ein ausführbares Programm heraus. Dieses kann man starten und ggf. mit Inputdaten versehen und erhält den entsprechenden Output. Das erzeugte Programm läuft i.d.R. nur auf einer bestimmten Plattform.

Beispiele: gcc, clang, ...

##### Anwendung: Interpreter

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/00-intro/images/interpreter_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/00-intro/images/interpreter.png"  /></picture></p>

Beim Interpreter durchläuft der Sourcecode nur das Frontend, also die Analyse. Es wird kein Code erzeugt, stattdessen führt der Interpreter die Anweisungen im AST bzw. IC aus. Dazu muss der Interpreter mit den Eingabedaten beschickt werden. Typischerweise hat man hier eine "Read-Eval-Print-Loop" (*REPL*).

Beispiele: Python

##### Anwendung: Virtuelle Maschinen

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/00-intro/images/virtualmachine_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/00-intro/images/virtualmachine.png"  /></picture></p>

Hier liegt eine Art Mischform aus Compiler und Interpreter vor: Der Compiler übersetzt den Quellcode in ein maschinenunabhängiges Zwischenformat ("Byte-Code"). Dieser wird von der virtuellen Maschine ("VM") gelesen und ausgeführt. Die VM kann also als Interpreter für Byte-Code betrachtet werden.

Beispiel: Java mit seiner JVM

##### Anwendung: C-Toolchain

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/00-intro/images/c-toolchain_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/00-intro/images/c-toolchain.png" width="70%" /></picture></p>

Erinnern Sie sich an die LV "Systemprogrammierung" im dritten Semester :-)

Auch wenn es so aussieht, als würde der C-Compiler aus dem Quelltext direkt das ausführbare Programm erzeugen, finden hier dennoch verschiedene Stufen statt. Zuerst läuft ein Präprozessor über den Quelltext und ersetzt alle `#include` und `#define` etc., danach arbeitet der C-Compiler, dessen Ausgabe wiederum durch einen Assembler zu ausführbarem Maschinencode transformiert wird.

Beispiele: gcc, clang, ...

##### Anwendung: C++-Compiler

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/00-intro/images/cpp-toolchain_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/00-intro/images/cpp-toolchain.png" width="60%" /></picture></p>

C++ hat meist keinen eigenen (vollständigen) Compiler :-)

In der Regel werden die C++-Konstrukte durch `cfront` nach C übersetzt, so dass man anschließend auf die etablierten Tools zurückgreifen kann.

Dieses Vorgehen werden Sie relativ häufig finden. Vielleicht sogar in Ihrem Projekt ...

Beispiel: g++

##### Anwendung: Bugfinder

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/00-intro/images/findbugs_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/00-intro/images/findbugs.png" width="60%" /></picture></p>

Tools wie FindBugs analysieren den (Java-) Quellcode und suchen nach bekannten Fehlermustern. Dazu benötigen sie nur den Analyse-Teil eines Compilers!

Auf dem AST kann dann nach vorab definierten Fehlermustern gesucht werden (Stichwort "Graphmatching"). Dazu fällt die semantische Analyse entsprechend umfangreicher aus als normal.

Zusätzlich wird noch eine Reporting-Komponente benötigt, da die normalen durch die Analysekette erzeugten Fehlermeldungen nicht helfen (bzw. sofern der Quellcode wohlgeformter Code ist, würden ja keine Fehlermeldungen durch die Analyseeinheit generiert).

Beispiele: SpotBugs, Checkstyle, ESLint, ...

##### Anwendung: Pandoc

[Pandoc](https://pandoc.org/) ist ein universeller und modular aufgebauter Textkonverter, der mit Hilfe verschiedener *Reader* unterschiedliche Textformate einlesen und in ein Zwischenformat (hier JSON) transformieren kann. Über verschiedene *Writer* können aus dem Zwischenformat dann Dokumente in den gewünschten Zielformaten erzeugt werden.

Die Reader entsprechen der Analyse-Phase und die Writer der Synthese-Phase eines Compilers. Anstelle eines ausführbaren Programms (Maschinencode) wird ein anderes Textformat erstellt/ausgegeben.

Beispielsweise wird aus diesem Markdown-Schnipsel ...

    Dies ist ein Satz mit
    *  einem Stichpunkt, und
    *  einem zweiten Stichpunkt.

... dieses Zwischenformat erzeugt, ...

``` json
{"blocks":[{"t":"Para","c":[{"t":"Str","c":"Dies"},{"t":"Space"},
           {"t":"Str","c":"ist"},{"t":"Space"},{"t":"Str","c":"ein"},
           {"t":"Space"},{"t":"Str","c":"Satz"},{"t":"Space"},
           {"t":"Str","c":"mit"}]},
           {"t":"BulletList","c":[[{"t":"Plain","c":[{"t":"Str","c":"einem"},{"t":"Space"},{"t":"Str","c":"Stichpunkt,"},{"t":"Space"},{"t":"Str","c":"und"}]}],[{"t":"Plain","c":[{"t":"Str","c":"einem"},{"t":"Space"},{"t":"Str","c":"zweiten"},{"t":"Space"},{"t":"Str","c":"Stichpunkt."}]}]]}],"pandoc-api-version":[1,17,0,4],"meta":{}}
```

... und daraus schließlich dieser TeX-Code.

``` latex
Dies ist ein Satz mit
\begin{itemize}
\tightlist
\item einem Stichpunkt, und
\item einem zweiten Stichpunkt.
\end{itemize}
```

Im Prinzip ist Pandoc damit ein Beispiel für Compiler, die aus einem formalen Text nicht ein ausführbares Programm erzeugen (Maschinencode), sondern einen anderen formalen Text. Dieser werden häufig auch "Transpiler" genannt.

Weitere Beispiele:

-   Lexer-/Parser-Generatoren: ANTLR, Flex, Bison, ...: formale Grammatik nach Sourcecode
-   CoffeeScript: CoffeeScript (eine Art "JavaScript light") nach JavaScript
-   Emscripten: C/C++ nach LLVM nach WebAssembly (tatsächlich kann LLVM-IR auch direkt als Input verwendet werden)
-   Fitnesse: Word/Wiki nach ausführbare Unit-Tests

##### Was bringt mir das?

<div data-align="center">

**Beschäftigung mit dem schönsten Thema in der Informatik ;-)**

</div>

###### Auswahl einiger Gründe für den Besuch des Moduls "Compilerbau"

-   Erstellung eigener kleiner Interpreter/Compiler
    -   Einlesen von komplexen Daten
    -   DSL als Brücke zwischen Stakeholdern
    -   DSL zum schnelleren Programmieren (denken Sie etwa an [CoffeeScript](http://coffeescript.org/) ...)
-   Wie funktionieren FindBugs, Lint und ähnliche Tools?
    -   Statische Codeanalyse: Dead code elimination
-   Language-theoretic Security: [LangSec](http://langsec.org/)
-   Verständnis für bestimmte Sprachkonstrukte und -konzepte (etwa `virtual` in C++)
-   Vertiefung durch Besuch "echter" Compilerbau-Veranstaltungen an Uni möglich :-)
-   Wie funktioniert:
    -   ein Python-Interpreter?
    -   das Syntaxhighlighting in einem Editor oder in Doxygen?
    -   ein Hardwarecompiler (etwa VHDL)?
    -   ein Text-Formatierer (TeX, LaTeX, ...)?
    -   CoffeeScript oder Emscripten?
-   Wie kann man einen eigenen Compiler/Interpreter basteln, etwa für
    -   MiniJava (mit C-Backend)
    -   Brainfuck
    -   Übersetzung von JSON nach XML
-   Um eine profundes Kenntnis von Programmiersprachen zu erlangen, ist eine Beschäftigung mit ihrer Implementierung unerlässlich.
-   Viele Grundtechniken der Informatik und elementare Datenstrukturen wie Keller, Listen, Abbildungen, Bäume, Graphen, Automaten etc. finden im Compilerbau Anwendung. Dadurch schließt sich in gewisser Weise der Kreis in der Informatikausbildung ...
-   Aufgrund seiner Reife gibt es hervorragende Beispiele von formaler Spezifikation im Compilerbau.
-   Mit dem Gebiet der formalen Sprachen berührt der Compilerbau interessante Aspekte moderner Linguistik. Damit ergibt sich letztlich eine Verbindung zur KI ...
-   Die Unterscheidung von Syntax und Semantik ist eine grundlegende Technik in fast allen formalen Systeme.

###### Parser-Generatoren (Auswahl)

Diese Tools könnte man beispielsweise nutzen, um seine eigene Sprache zu basteln.

-   ANTLR (ANother Tool for Language Recognition) is a powerful parser generator for reading, processing, executing, or translating structured text or binary files: [github.com/antlr/antlr4](https://github.com/antlr/antlr4)
-   Grammars written for ANTLR v4; expectation that the grammars are free of actions: [github.com/antlr/grammars-v4](https://github.com/antlr/grammars-v4)
-   An incremental parsing system for programmings tools: [github.com/tree-sitter/tree-sitter](https://github.com/tree-sitter/tree-sitter)
-   Flex, the Fast Lexical Analyzer - scanner generator for lexing in C and C++: [github.com/westes/flex](https://github.com/westes/flex)
-   Bison is a general-purpose parser generator that converts an annotated context-free grammar into a deterministic LR or generalized LR (GLR) parser employing LALR(1) parser tables: [gnu.org/software/bison](https://www.gnu.org/software/bison/)
-   Parser combinators for binary formats, in C: [github.com/UpstandingHackers/hammer](https://github.com/UpstandingHackers/hammer)
-   Eclipse Xtext is a language development framework: [github.com/eclipse/xtext](https://github.com/eclipse/xtext)

###### Statische Analyse, Type-Checking und Linter

Als Startpunkt für eigene Ideen. Oder Verbessern/Erweitern der Projekte ...

-   Pluggable type-checking for Java: [github.com/typetools/checker-framework](https://github.com/typetools/checker-framework)
-   SpotBugs is FindBugs' successor. A tool for static analysis to look for bugs in Java code: [github.com/spotbugs/spotbugs](https://github.com/spotbugs/spotbugs)
-   An extensible cross-language static code analyzer: [github.com/pmd/pmd](https://github.com/pmd/pmd)
-   Checkstyle is a development tool to help programmers write Java code that adheres to a coding standard: [github.com/checkstyle/checkstyle](https://github.com/checkstyle/checkstyle)
-   JaCoCo - Java Code Coverage Library: [github.com/jacoco/jacoco](https://github.com/jacoco/jacoco)
-   Sanitizers: memory error detector: [github.com/google/sanitizers](https://github.com/google/sanitizers)
-   JSHint is a tool that helps to detect errors and potential problems in your JavaScript code: [github.com/jshint/jshint](https://github.com/jshint/jshint)
-   Haskell source code suggestions: [github.com/ndmitchell/hlint](https://github.com/ndmitchell/hlint)
-   Syntax checking hacks for vim: [github.com/vim-syntastic/syntastic](https://github.com/vim-syntastic/syntastic)

###### DSL (Domain Specific Language)

-   NVIDIA Material Definition Language SDK: [github.com/NVIDIA/MDL-SDK](https://github.com/NVIDIA/MDL-SDK)
-   FitNesse -- The Acceptance Test Wiki: [github.com/unclebob/fitnesse](https://github.com/unclebob/fitnesse)

Hier noch ein Framework, welches auf das Erstellen von DSL spezialisiert ist:

-   Eclipse Xtext is a language development framework: [github.com/eclipse/xtext](https://github.com/eclipse/xtext)

###### Konverter von X nach Y

-   Emscripten: An LLVM-to-JavaScript Compiler: [github.com/kripken/emscripten](https://github.com/kripken/emscripten)
-   "Unfancy JavaScript": [github.com/jashkenas/coffeescript](https://github.com/jashkenas/coffeescript)
-   Universal markup converter: [github.com/jgm/pandoc](https://github.com/jgm/pandoc)
-   Übersetzung von JSON nach XML

###### Odds and Ends

-   How to write your own compiler: [staff.polito.it/silvano.rivoira/HowToWriteYourOwnCompiler.htm](http://staff.polito.it/silvano.rivoira/HowToWriteYourOwnCompiler.htm)
-   Building a modern functional compiler from first principles: [github.com/sdiehl/write-you-a-haskell](https://github.com/sdiehl/write-you-a-haskell)
-   Language-theoretic Security: [LangSec](http://langsec.org/)
-   Generierung von automatisierten Tests mit [Esprima](http://esprima.org/): [heise.de/-4129726](https://www.heise.de/developer/artikel/Generierung-von-automatisierten-Tests-mit-Esprima-4129726.html?view=print)
-   Eigener kleiner Compiler/Interpreter, etwa für
    -   MiniJava mit C-Backend oder sogar [LLVM](http://llvm.org/)-Backend
    -   Brainfuck

###### Als weitere Anregung: Themen der Mini-Projekte im W17

-   Java2UMLet
-   JavaDoc-to-Markdown
-   Validierung und Übersetzung von Google Protocol Buffers v3 nach JSON
-   svg2tikz
-   SwaggerLang -- Schreiben wie im Tagebuch
-   Markdown zu LaTeX
-   JavaDocToLaTeX
-   MySQL2REDIS-Parser

##### Wrap-Up

-   Compiler übersetzen formalen Text in ein anderes Format

<!-- -->

-   Nicht alle Stufen kommen immer vor =\> unterschiedliche Anwendungen
    -   "Echte" Compiler: Sourcecode nach Maschinencode
    -   Interpreter: Interaktive Ausführung
    -   Virtuelle Maschinen als Zwischending zwischen Compiler und Interpreter
    -   Transpiler: formaler Text nach formalem Text
    -   Analysetools: Parsen den Sourcecode, werten die Strukturen aus

> [!TIP]
>
> <details open>
> <summary><strong>📖 Zum Nachlesen</strong></summary>
>
> -   Aho u. a. ([2023](#ref-Aho2023)): Kapitel 1 Introduction
> -   Grune u. a. ([2012](#ref-Grune2012)): Kapitel 1 Introduction
>
> </details>

> [!NOTE]
>
> <details >
> <summary><strong>✅ Lernziele</strong></summary>
>
> -   k1: Ich kenne verschiedene Anwendungen für Compiler durch Einsatz bestimmter Stufen der Compiler-Pipeline
>
> </details>

<a id="id-5ba813f3272c7a3032533eb3123c86099ee6c775"></a>

### Lexikalische Analyse

In der lexikalischen Analyse soll ein Lexer (auch "Scanner") den Zeichenstrom in eine Folge von Token zerlegen. Zur Spezifikation der Token werden in der Regel reguläre Ausdrücke verwendet.

<a id="id-fedfa58fd303fd06c064c79ac0a840c098df4d4f"></a>

#### Reguläre Sprachen, Ausdrucksstärke

> [!TIP]
>
> <details open>
> <summary><strong>🖇 Weitere Unterlagen</strong></summary>
>
> -   [Annotierte Folien: Reguläre Sprachen, Ausdrucksstärke](https://github.com/Compiler-CampusMinden/AnnotatedSlides/blob/master/lexing_regular.ann.ma.pdf)
>
> </details>

##### Motivation

###### Was muss ein Compiler wohl als erstes tun?

Hier entsteht ein Tafelbild.

###### Themen für heute

-   Endliche Automaten
-   Reguläre Sprachen

##### Endliche Automaten

###### Deterministische endliche Automaten

**Def.:** Ein **deterministischer endlicher Automat** (DFA) ist ein 5-Tupel $A = (Q, \Sigma, \delta, q_0, F)$ mit

-   $Q$ : endliche Menge von **Zuständen**

-   $\Sigma$ : Alphabet von **Eingabesymbolen**

-   $\delta$ : die (eventuell partielle) **Übergangsfunktion** $(Q \times \Sigma) \rightarrow Q,
    \delta$ kann partiell sein

-   $q_0 \in Q$ : der **Startzustand**

-   $F \subseteq Q$ : die Menge der **Endzustände**

###### Nichtdeterministische endliche Automaten

**Def.:** Ein **nichtdeterministischer endlicher Automat** (NFA) ist ein 5-Tupel $A = (Q, \Sigma, \delta, q_0, F)$ mit

-   $Q$ : endliche Menge von **Zuständen**

-   $\Sigma$ : Alphabet von **Eingabesymbolen**

-   $\delta$ : die (eventuell partielle) Übergangsfunktion $(Q \times \Sigma) \rightarrow Q$

-   $q_0 \in Q$ : der **Startzustand**

-   $F \subseteq Q$ : die Menge der **Endzustände**

###### Akzeptierte Sprachen

**Def.:** Sei A ein DFA oder ein NFA. Dann ist **L(A)** die von A akzeptierte Sprache, d. h.

$L(A) = \lbrace\text{Wörter}\ w\ |\ \delta^*(q_0, w) \in F\rbrace$

###### Wozu NFAs im Compilerbau?

Pattern Matching (Erkennung von Schlüsselwörtern, Bezeichnern, ...) geht mit NFAs.

NFAs sind so nicht zu programmieren, aber:

**Satz:** Eine Sprache $L$ wird von einem NFA akzeptiert $\Leftrightarrow L$ wird von einem DFA akzeptiert.

D. h. es existieren Algorithmen zur

-   Umwandlung von NFAs in DFAS
-   Minimierung von DFAs

##### Reguläre Sprachen

###### Reguläre Ausdrücke

**Def.:** Induktive Definition von **regulären Ausdrücken** (regex) und der von ihnen repräsentierten Sprache **L**:

-   Basis:

    -   $\epsilon$ und $\emptyset$ sind reguläre Ausdrücke mit $L(\epsilon) =
          \lbrace \epsilon\rbrace$, $L(\emptyset)=\emptyset$
    -   Sei $a$ ein Symbol $\Rightarrow a$ ist ein regex mit $L(a) = \lbrace a\rbrace$

-   Induktion: Seien $E,\ F$ reguläre Ausdrücke. Dann gilt:

    -   $E+F$ ist ein regex und bezeichnet die Vereinigung $L(E + F) = L(E)\cup L(F)$
    -   $EF$ ist ein regex und bezeichnet die Konkatenation $L(EF) = L(E)L(F)$
    -   $E^{\ast}$ ist ein regex und bezeichnet die Kleene-Hülle $L(E^{\ast})=(L(E))^{\ast}$
    -   $(E)$ ist ein regex mit $L((E)) = L(E)$

Vorrangregeln der Operatoren für reguläre Ausdrücke: \*, Konkatenation, +

###### Formale Grammatiken

**Def.:** Eine *formale Grammatik* ist ein 4-Tupel $G=(N,T,P,S)$ aus

-   $N$: endliche Menge von **Nichtterminalen**

-   *T*: endliche Menge von **Terminalen**, $N \cap T = \emptyset$

-   $S \in N$: **Startsymbol**

-   *P*: endliche Menge von **Produktionen** der Form

$\qquad X \rightarrow Y\ \text{mit}\ X \in (N \cup T)^{\ast} N  (N \cup T)^{\ast}, Y \in (N \cup T)^{\ast}$

###### Ableitungen

**Def.:** Sei $G = (N, T, P, S)$ eine Grammatik, sei $\alpha A \beta$ eine Zeichenkette über $(N \cup T)^{\ast}$ und sei $A \rightarrow \gamma$ eine Produktion von $G$.

Wir schreiben: $\alpha A \beta \Rightarrow \alpha \gamma \beta$ ($\alpha A \beta$ leitet $\alpha \gamma \beta$ ab).

**Def.:** Wir definieren die Relation $\overset{\ast}{\Rightarrow}$ induktiv wie folgt:

-   Basis: $\forall \alpha \in (N \cup T)^{\ast} \alpha \overset{\ast}{\Rightarrow} \alpha$ (Jede Zeichenkette leitet sich selbst ab.)

-   Induktion: Wenn $\alpha \overset{\ast}{\Rightarrow} \beta$ und $\beta\Rightarrow \gamma$ dann $\alpha \overset{\ast}{\Rightarrow} \gamma$

**Def.:** Sei $G = (N, T ,P, S)$ eine formale Grammatik. Dann ist $L(G) = \lbrace\text{Wörter}\ w\ \text{über}\ T \mid S \overset{\ast}{\Rightarrow} w\rbrace$ die von $G$ erzeugte Sprache.

###### Reguläre Grammatiken

**Def.:** Eine **reguläre (oder type-3-) Grammatik** ist eine formale Grammatik mit den folgenden Einschränkungen:

-   Alle Produktionen sind entweder von der Form

    -   $X \to aY$ mit $X \in N, a \in T, Y \in N$ (*rechtsreguläre* Grammatik) oder
    -   $X \to Ya$ mit $X \in N, a \in T, Y \in N$ (*linksreguläre* Grammatik)

-   $X\rightarrow\epsilon$ ist erlaubt

###### Reguläre Sprachen und ihre Grenzen

**Satz:** Die von endlichen Automaten akzeptiert Sprachklasse, die von regulären Ausdrücken beschriebene Sprachklasse und die von regulären Grammatiken erzeugte Sprachklasse sind identisch und heißen **reguläre Sprachen**.

**Reguläre Sprachen**

-   einfache Struktur
-   Matchen von Symbolen (z. B. Klammern) nicht möglich, da die fixe Anzahl von Zuständen eines DFAs die Erkennung solcher Sprachen verhindert.

###### Wozu reguläre Sprachen im Compilerbau?

-   Reguläre Ausdrücke

    -   definieren Schlüsselwörter und alle weiteren Symbole einer Programmiersprache, z. B. den Aufbau von Gleitkommazahlen
    -   werden (oft von einem Generator) in DFAs umgewandelt
    -   sind die Basis des *Scanners* oder *Lexers*

###### Ein Lexer ist mehr als ein DFA

-   Ein **Lexer**

    -   wandelt mittels DFAs aus regulären Ausdrücken die Folge von Zeichen der Quelldatei in eine Folge von sog. Token um

    -   bekommt als Input eine Liste von Paaren aus regulären Ausdrücken und Tokennamen, z. B. ("while", WHILE)

    -   Kommentare und Strings müssen richtig erkannt werden. (Schachtelungen)

    -   liefert Paare von Token und deren Werte, sofern benötigt, z. B. (WHILE, \_), oder (IDENTIFIER, "radius") oder (INTEGERZAHL, "334")

###### Wie geht es weiter?

-   Ein **Parser**

    -   führt mit Hilfe des Tokenstreams vom Lexer die Syntaxanalyse durch

    -   basiert auf einer sog. kontextfreien Grammatik, deren Terminale die Token sind

    -   liefert die syntaktische Struktur in Form eines Ableitungsbaums (**syntax tree**, **parse tree**), bzw. einen **AST** (abstract syntax tree) ohne redundante Informationen im Ableitungsbaum (z. B. Semikolons)

    -   liefert evtl. Fehlermeldungen

##### Wrap-Up

###### Wrap-Up

-   Definition und Aufgaben von Lexern
-   DFAs und NFAs
-   Reguläre Ausdrücke
-   Reguläre Grammatiken
-   Zusammenhänge zwischen diesen Mechanismen und Lexern, bzw. Lexergeneratoren

> [!TIP]
>
> <details open>
> <summary><strong>📖 Zum Nachlesen</strong></summary>
>
> -   Aho u. a. ([2023](#ref-Aho2023)): Abschnitt 2.6 und Kapitel 3
> -   Torczon und Cooper ([2012](#ref-Torczon2012)): Kapitel 2
> -   Parr ([2014](#ref-Parr2014))
>
> </details>

> [!NOTE]
>
> <details >
> <summary><strong>✅ Lernziele</strong></summary>
>
> -   k1: Ich kenne DFAs
> -   k1: Ich kenne NFAs
> -   k1: Ich kenne reguläre Ausdrücke
> -   k1: Ich kenne reguläre Grammatiken
> -   k2: Ich kann die Zusammenhänge und Gesetzmäßigkeiten bzgl. der oben genannten Konstrukte an einem Beispiel erklären
> -   k3: Ich kann für eine Fragestellung DFAs, NFAs, reguläre Ausdrücke, reguläre Grammatiken entwickeln
> -   k3: Ich kann herausfinden, ob eine Sprache regulär ist
> -   k3: Ich kann einen DFA entwickeln, der alle Schlüsselwörter, Namen und weitere Symbole einer Programmiersprache akzeptiert
>
> </details>

<a id="id-e459a0cea34b59c5b39e4a2e10ea30c515eba6b0"></a>

#### Lexer: Handcodierte Implementierung

> [!IMPORTANT]
>
> <details open>
> <summary><strong>🎯 TL;DR</strong></summary>
>
> <p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/01-lexing/images/architektur_cb_lexer_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/01-lexing/images/architektur_cb_lexer.png"  /></picture></p>
>
> Der Lexer (auch "Scanner") soll den Zeichenstrom in eine Folge von Token zerlegen. Zur Spezifikation der Token werden reguläre Ausdrücke verwendet.
>
> Von Hand implementierte Lexer arbeiten üblicherweise rekursiv und verarbeiten immer das nächste Zeichen im Eingabestrom. Die Arbeitsweise erinnert an LL-Parser (vgl. [LL-Parser](#id-8f9ad51b1fa5549b458757512a9b2c5b7e30f08e)).
>
> Lexer müssen sehr effizient sein, da sie noch direkt auf der niedrigsten Abstraktionsstufe arbeiten und u.U. oft durchlaufen werden. Deshalb setzt man hier gern spezielle Techniken wie Puffern von Zeichen über einen Doppel-Puffer ein.
>
> Die Palette an Fehlerbehandlungsstrategien im Lexer reichen von "aufgeben" über den "Panic Mode" ("gobbeln" von Zeichen, bis wieder eines passt) und Ein-Schritt-Transformationen bis hin zu speziellen Lexer-Regeln, die beispielsweise besonders häufige Typos abfangen.
>
> </details>

> [!TIP]
>
> <details open>
> <summary><strong>🎦 Videos</strong></summary>
>
> Vorlesung \[[YT](https://youtu.be/uUVEtKqqkqQ)\], \[[HSBI](https://www.hsbi.de/medienportal/album/video/cpl-lexer-handcodierte-implementierung/7451fe5237190e44817c3243b13b1ac7/254)\]
>
> </details>

##### Lexer: Erzeugen eines Token-Stroms aus einem Zeichenstrom

Aus dem Eingabe(-quell-)text

``` c
/* demo */
a= [5  , 6]     ;
```

erstellt der Lexer (oder auch Scanner genannt) eine Sequenz von Token:

    <ID, "a"> <ASSIGN> <LBRACK> <NUM, 5> <COMMA> <NUM, 6> <RBRACK> <SEMICOL>

##### Manuelle Implementierung: Rekursiver Abstieg

``` python
def nextToken():
    while (peek != EOF):  # globale Variable, über consume()
        switch (peek):
            case ' ': case '\t': case '\n': WS(); continue
            case '[': consume(); return Token(LBRACK, '[')
            ...
            default:
                if isLetter(peek): return NAME()
                raise Error("invalid character: "+peek)
    return Token(EOF_Type, "<EOF>")

def WS():
    while (peek == ' ' || peek == '\t' || ...): consume()

def NAME():
    buf = StringBuilder()
    do { buf.append(peek); consume(); } while (isLetter(peek))
    return Token(NAME, buf.toString())
```

Die manuelle Implementierung "denkt" nicht in den Zuständen des DFA, sondern orientiert sich immer am aktuellen Zeichen "`peek`". Abhängig von dessen Ausprägung wird entweder direkt ein Token erzeugt und das Zeichen aus dem Eingabestrom entfernt sowie das nächste Zeichen eingelesen (mittels der Funktion `consume()`, nicht dargestellt im Beispiel), oder man ruft weitere Funktionen auf, die das Gewünschte erledigen, beispielsweise um White-Spaces zu entfernen oder um einen Namen einzulesen: Nach einem Buchstaben werden alle folgenden Buchstaben dem Namen (Bezeichner) hinzugefügt. Sobald ein anderes Zeichen im Eingabestrom erscheint, wird das Namen-Token erzeugt.

Die Funktion `consume()` "verbraucht" das aktuelle Zeichen "`peek`" und holt das nächste Zeichen aus dem Eingabestrom.

*Anmerkung*: Häufig findet man im Lexer keinen "schönen" objektorientierten Ansatz. Dies ist i.d.R. Geschwindigkeitsgründen geschuldet ...

##### Read-Ahead: Unterscheiden von "*\<*" und "*\<=*"

``` python
def nextToken():
    while (peek != EOF):  # globale Variable
        switch (peek):
            case '<':
                if match('='): consume(); return Token(LE, "<=")
                else: consume(); return Token(LESS, '<')
            ...
    return Token(EOF_Type, "<EOF>")

def match(c):   # Lookahead: Ein Zeichen
    consume()
    if (peek == c): return True
    else: rollBack(); return False
```

Um die Token "`<`" und "`<=`" unterscheiden zu können, müssen wir ein Zeichen vorausschauen: Wenn nach dem "`<`" noch ein "`=`" kommt, ist es "`<=`", sonst "`<`".

Erinnerung: Die Funktion `consume()` liest das nächste Zeichen aus dem Eingabestrom und speichert den Wert in der globalen Variable `peek`.

Für das Read-Ahead wird die Funktion `match()` definiert, die zunächst das bereits bekannte Zeichen, in diesem Fall das "`<`" durch das nächste Zeichen im Eingabestrom ersetzt (Aufruf von `consume()`). Falls der Vergleich des Lookahead-Zeichens mit dem gesuchten Zeichen erfolgreich ist, liegt das "größere" Token vor, also "`<=`". Dann wird noch das "`=`" durch das nächste Zeichen ersetzt und das Token `LE` gebildet. Anderenfalls muss das zuviel gelesene Zeichen wieder in den Eingabestrom zurückgelegt werden (`rollBack()`).

##### Puffern des Input-Stroms: Double Buffering

Das Einlesen einzelner Zeichen führt zwar zu eleganten algorithmischen Lösungen, ist aber zur Laufzeit deutlich "teurer" als das Einlesen mit gepufferten I/O-Operationen, die eine ganze Folge von Zeichen einlesen (typischerweise einen ganzen Disk-Block, beispielsweise 4096 Zeichen).

Dazu kann man einen Ringpuffer nutzen, den man mit Hilfe von zwei gleich großen `char`-Puffern mit jeweils der Länge $N$ simulieren kann. ($N$ sollte dann der Länge eines Disk-Blocks entsprechen.)

Vergleiche auch [Wikipedia: "Circular Buffer"](https://en.wikipedia.org/wiki/Circular_buffer).

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/01-lexing/images/doublebuffer_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/01-lexing/images/doublebuffer.png" width="65%" /></picture></p>

``` python
start = 0; end = 0; fill(buffer[0:n])

def consume():
    peek = buffer[start]
    start = (start+1) mod 2n
    if (start mod n == 0):
        fill(buffer[start:start+n-1])
        end = (start+n) mod 2n

def rollBack():
    if (start == end): raise Error("roll back error")
    start = (start-1) mod 2n
```

Zunächst wird nur der vordere Pufferteil durch einen passenden Systemaufruf gefüllt.

Beim Weiterschalten im simulierten DFA oder im manuell kodierten Lexer (Funktionsaufruf von `consume()`) wird das nächste Zeichen aus dem vorderen Pufferteil zurückgeliefert. Über die Modulo-Operation bleibt der Pointer `start` immer im Speicherbereich der beiden Puffer.

Wenn man das Ende des vorderen Puffers erreicht, wird der hintere Puffer mit einem Systemaufruf gefüllt. Gleichzeitig wird ein Hilfspointer `end` auf den Anfang des vorderen Puffers gesetzt, um Fehler beim Roll-Back zu erkennen.

Wenn man das Ende des hinteren Puffers erreicht, wird der vordere Puffer nachgeladen und der Hilfspointer auf den Anfang des hinteren Puffers gesetzt.

Im Grunde ist also immer ein Puffer der "Arbeitspuffer" und der andere enthält die bereits gelesene (verarbeitete) Zeichenkette. Wenn beim Nachladen weniger als $N$ Zeichen gelesen werden, liefert der Systemaufruf als letztes "Zeichen" ein `EOF`. Beim Verarbeiten wird `peek` entsprechend diesen Wert bekommen und der Lexer muss diesen Wert abfragen und berücksichtigen.

Für das Roll-Back wird der `start`-Pointer einfach dekrementiert (und mit einer Modulo-Operation auf den Speicherbereich der beiden Puffer begrenzt). Falls dabei der `end`-Pointer "eingeholt" wird, ist der `start`-Pointer durch beide Puffer zurückgelaufen und es gibt keinen früheren Input mehr. In diesem Fall wird entsprechend ein Fehler gemeldet.

*Anmerkung*: In der Regel sind die Lexeme kurz und man muss man nur ein bis zwei Zeichen im Voraus lesen. Dann ist eine Puffergröße von 4096 Zeichen mehr als ausreichend groß und man sollte nicht in Probleme laufen. Wenn der nötige Look-Ahead aber beliebig groß werden kann, etwa bei Sprachen ohne reservierte Schlüsselwörtern oder bei Kontext-sensitiven Lexer-Grammatiken (denken Sie etwa an die Einrücktiefe bei Python), muss man andere Strategien verwenden. ANTLR beispielsweise vergrößert in diesem Fall den Puffer dynamisch, alternativ könnte man die Auflösung zwischen Schlüsselwörtern und Bezeichnern dem Parser überlassen.

##### Typische Muster für Erstellung von Token

1.  Schlüsselwörter

    -   Ein eigenes Token (RE/DFA) für jedes Schlüsselwort, oder
    -   Erkennung als Name (`ID`) und nachträglich Vergleich mit Wörterbuch sowie Korrektur des Tokentyps

    Wenn Schlüsselwörter über je ein eigenes Token abgebildet werden, benötigt man für jedes Schlüsselwort einen eigenen RE bzw. DFA. Die Erkennung als Bezeichner und das Nachschlagen in einem Wörterbuch (geeignete Hashtabelle) sowie die entsprechende nachträgliche Korrektur des Tokentyps kann die Anzahl der Zustände im Lexer signifikant reduzieren!

2.  Operatoren

    -   Ein eigenes Token für jeden Operator, oder
    -   Gemeinsames Token für jede Operatoren-Klasse

3.  Bezeichner: Ein gemeinsames Token für alle Namen

4.  Zahlen: Ein gemeinsames Token für alle numerischen Konstante (ggf. Integer und Float unterscheiden)

    Für Zahlen führt man oft ein Token "`NUM`" ein. Als Attribut speichert man das Lexem i.d.R. als String. Alternativ kann man (zusätzlich) das Lexem in eine Zahl konvertieren und als (zusätzliches) Attribut speichern. Dies kann in späteren Stufen viel Arbeit sparen.

5.  String-Literale: Ein gemeinsames Token

6.  Komma, Semikolon, Klammern, ...: Je ein eigenes Token

7.  Regeln für White-Space und Kommentare etc. ...

    Normalerweise benötigt man Kommentare und White-Spaces in den folgenden Stufen nicht und entfernt diese deshalb aus dem Eingabestrom. Dabei könnte man etwa White-Spaces in den Pattern der restlichen Token berücksichtigen, was die Pattern aber sehr komplex macht. Die Alternative sind zusätzliche Pattern, die auf die White-Space und anderen nicht benötigten Inhalt matchen und diesen "geräuschlos" entfernen. Mit diesen Pattern werden keine Token erzeugt, d.h. der Parser und die anderen Stufen bemerken nichts von diesem Inhalt.

    Gelegentlich benötigt man aber auch Informationen über White-Spaces, beispielsweise in Python. Dann müssen diese Token wie normale Token an den Parser weitergereicht werden.

Jedes Token hat i.d.R. ein Attribut, in dem das Lexem gespeichert wird. Bei eindeutigen Token (etwa bei eigenen Token je Schlüsselwort oder bei den Interpunktions-Token) kann man sich das Attribut auch sparen, da das Lexem durch den Tokennamen eindeutig rekonstruierbar ist.

| Token | Beschreibung | Beispiel-Lexeme |
|:---------------|:------------------------------------|:------------------|
| `if` | Zeichen `i` und `f` | `if` |
| `relop` | `<` oder `>` oder `<=` oder `>=` oder `==` oder `!=` | `<`, `<=` |
| `id` | Buchstabe, gefolgt von Buchstaben oder Ziffern | `pi`, `count`, `x3` |
| `num` | Numerische Konstante | `42`, `3.14159`, `0` |
| `literal` | Alle Zeichen außer `"`, in `"` eingeschlossen | `"core dumped"` |

*Anmerkung*: Wenn es mehrere matchende REs gibt, wird in der Regel das längste Lexem bevorzugt. Wenn es mehrere gleich lange Alternativen gibt, muss man mit Vorrangregeln bzgl. der Token arbeiten.

##### Fehler bei der Lexikalischen Analyse

Problem: Eingabestrom sieht so aus: `fi (a==42) { ... }`

Der Lexer kann nicht erkennen, ob es sich bei `fi` um ein vertipptes Schlüsselwort handelt oder um einen Bezeichner: Es könnte sich um einen Funktionsaufruf der Funktion `fi()` handeln ... Dieses Problem kann erst in der nächsten Stufe sinnvoll erkannt und behoben werden.

=\> Was tun, wenn keines der Pattern auf den Anfang des Eingabestroms passt?

Optionen:

-   Aufgeben ...

    Eventuell vielleicht sogar die beste und einfachste Variante :-)

<!-- -->

-   "Panic Mode": Entferne so lange Zeichen, bis ein Pattern passt.

    Das verwirrt u.U. den Parser, kann aber insbesondere in interaktiven Umgebungen hilfreich sein. Ggf. kann man dem Parser auch signalisieren, dass hier ein Problem vorlag.

<!-- -->

-   Ein-Schritt-Transformationen:
    -   Füge fehlendes Zeichen in Eingabestrom ein.
    -   Entferne ein Zeichen aus Eingabestrom.
    -   Vertausche ein Zeichen:
        -   Ersetze ein Zeichen durch ein anderes.
        -   Vertausche zwei benachbarte Zeichen.

    Diese Transformationen versuchen, den Input in einem Schritt zu reparieren. Das ist durchaus sinnvoll, da in der Praxis die meisten Fehler in dieser Stufe durch ein einzelnes Zeichen hervorgerufen werden: Es fehlt ein Zeichen oder es ist eines zuviel im Input. Es liegt ein falsches Zeichen vor (Tippfehler) oder zwei benachbarte Zeichen wurden verdreht ...

    Im Prinzip könnte man auch eine allgemeinere Strategie versuchen, indem man diejenige Transformation mit der *kleinsten Anzahl von Schritten* zur Fehlerbehebung bestimmt. Beispiele dafür finden sich im Bereich Natural Language Processing (*NLP*), etwa die Levenshtein-Distanz oder der SoundEx-Algorithmus oder sogar Hidden-Markov-Modelle. Allerdings muss man sich in Erinnerung rufen, dass gerade in dieser ersten Phase eines Compilers die Geschwindigkeit stark im Fokus steht und eine ausgefeilte Fehlerkorrekturstrategie die vielen kleinen Optimierungen schnell wieder zunichte machen kann.

<!-- -->

-   Fehler-Regeln: Matche typische Typos

    Gelegentlich findet man in den Grammatiken für den Lexer extra Regeln, die häufige bzw. typische Typos matchen und dann passend darauf reagieren.

##### Wrap-Up

-   Zusammenhang DFA, RE und Lexer

<!-- -->

-   Implementierungsansatz: Manuell codiert (rekursiver Abstieg)

<!-- -->

-   Read-Ahead
-   Puffern mit Doppel-Puffer-Strategie

<!-- -->

-   Typische Fehler beim Scannen

> [!TIP]
>
> <details open>
> <summary><strong>📖 Zum Nachlesen</strong></summary>
>
> -   Nystrom ([2021](#ref-Nystrom2021)): Kapitel 4
> -   Parr ([2010](#ref-Parr2010)): Kapitel 2 ("Pattern 2: LL(1) Recursive-Decent Lexer")
>
> </details>

> [!NOTE]
>
> <details >
> <summary><strong>✅ Lernziele</strong></summary>
>
> -   k1: Ich kenne die Aufgaben eines Lexers
> -   k2: Ich kann die manuelle Implementierung eines Lexers mit Hilfe von rekursivem Abstieg erklären
> -   k2: Ich kann den Umgang mit dem Doppel-Puffer erklären
> -   k2: Ich kann die Varianten bei der Erkennung von Schlüsselwörtern an einem Beispiel verdeutlichen
> -   k2: Ich kann typische Fehler und Lösungsansätze in der lexikalischen Analyse erklären
> -   k3: Ich kann für ein Problem eine typische Einteilung von Token vornehmen
> -   k3: Ich kann einen Top-Down-Lexer mit Read-Ahead und intelligenter Pufferung implementieren
>
> </details>

> [!IMPORTANT]
>
> <details open>
> <summary><strong>🏅 Challenges</strong></summary>
>
> **Manuell implementierter Lexer**
>
> Betrachten Sie die folgende einfache Sprache:
>
>     a = 10 - 5     # Zuweisung des Ausdruckes 10-5 (Integer-Wert 5) an Variable a
>     b = a + 2 * 3  # Zuweisung von 16 an Variable b
>     c = a != b     # Zuweisung eines boolschen Werts an c
>
> Es gibt nur Statements und Expressions:
>
> -   Statement: Zuweisung; jedes Statement endet mit einem NL
> -   Expression: Zahl, Variable, Addition, Subtraktion, Multiplikation (mit üblichem Vorrang), Vergleich
>
> **Aufgaben**:
>
> -   Geben Sie eine ANTLR-Grammatik für diese Sprache an.
> -   Implementieren Sie analog zum Vorgehen in der Vorlesung einen Lexer für diese Sprache. (Nur den Lexer, den Parser besprechen wir in einer anderen [Sitzung](#id-8f9ad51b1fa5549b458757512a9b2c5b7e30f08e).)
>
> </details>

<a id="id-208bd9b4194c2c79688c8354df6850e6040cdef7"></a>

### Syntaktische Analyse

In der syntaktischen Analyse arbeitet ein Parser mit dem Tokenstrom, der vom Lexer kommt. Mit Hilfe einer Grammatik wird geprüft, ob gültige Sätze im Sinne der Sprache/Grammatik gebildet wurden. Der Parser erzeugt dabei den Parse-Tree. Man kann verschiedene Parser unterscheiden, beispielsweise die LL- und die LR-Parser.

<a id="id-ed1ca9f1d126c913f7ce93106335deafa8e5a251"></a>

#### CFG

> [!TIP]
>
> <details open>
> <summary><strong>🖇 Weitere Unterlagen</strong></summary>
>
> -   [Annotierte Folien: CFG, LL-Parser](https://github.com/Compiler-CampusMinden/AnnotatedSlides/blob/master/frontend_parsing_cfg.ann.ma.pdf)
>
> </details>

##### Wiederholung

###### Endliche Automaten, reguläre Ausdrücke, reguläre Grammatiken, reguläre Sprachen

-   Wie sind DFAs und NFAs definiert?
-   Was sind reguläre Ausdrücke?
-   Was sind formale und reguläre Grammatiken?
-   In welchem Zusammenhang stehen all diese Begriffe?
-   Wie werden DFAs und reguläre Ausdrücke im Compilerbau eingesetzt?

##### Motivation

###### Wofür reichen reguläre Sprachen nicht?

Für z. B. alle Sprachen, in deren Wörtern Zeichen über eine Konstante hinaus gezählt werden müssen. Diese Sprachen lassen sich oft mit Variablen im Exponenten beschreiben, die unendlich viele Werte annehmen können.

-   $a^ib^{2*i}$ ist nicht regulär

-   $a^ib^{2*i}$ für $0 \leq i \leq 3$ ist regulär

-   Wo finden sich die oben genannten Variablen bei einem DFA wieder?

-   Warum ist die erste Sprache oben nicht regulär, die zweite aber?

###### Themen für heute

-   PDAs: mächtiger als DFAs, NFAs
-   kontextfreie Grammatiken und Sprachen: mächtiger als reguläre Grammatiken und Sprachen
-   DPDAs und deterministisch kontextfreie Grammatiken: die Grundlage der Syntaxanalyse im Compilerbau

##### Kellerautomaten (Push-Down-Automata, PDAs)

###### Kellerautomaten (Push-Down-Automata, PDAs)

Einordnung: Erweiterung der Automatenklasse DFA um einen Stack

**Def.:** Ein **Kellerautomat** (PDA) $P = (Q,\ \Sigma,\ \Gamma,\  \delta,\ q_0,\ \perp,\ F)$ ist ein Septupel aus

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/Def_PDA_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/Def_PDA.png" width="60%" /></picture></p><p align="center">Definition eines PDAs</p>

Ein PDA ist per Definition nichtdeterministisch und kann spontane Zustandsübergänge durchführen.

###### Was kann man damit akzeptieren?

Strukturen mit paarweise zu matchenden Symbolen.

Bei jedem Zustandsübergang wird ein Zeichen (oder $\epsilon$) aus der Eingabe gelesen, ein Symbol von Keller genommen. Diese und das Eingabezeichen bestimmen den Folgezustand und eine Zeichenfolge, die auf den Stack gepackt wird. Dabei wird ein Symbol, das später mit einem Eingabesymbol zu matchen ist, auf den Stack gepackt.

Soll das automatisch vom Stack genommene Symbol auf dem Stack bleiben, muss es wieder gepusht werden.

###### Beispiel

Ein PDA für $L=\lbrace ww^{R}\mid w\in \lbrace a,b\rbrace^{\ast}\rbrace$:

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/pda2_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/pda2.png" width="45%" /></picture></p>

###### Deterministische PDAs

**Def.** Ein PDA $P = (Q, \Sigma, \Gamma, \delta, q_0, \perp, F)$ ist *deterministisch* $: \Leftrightarrow$

-   $\delta(q, a, X)$ hat höchstens ein Element für jedes $q \in Q, a \in\Sigma$ oder $(a = \epsilon$ und $X \in \Gamma)$.
-   Wenn $\delta (q, a, X)$ nicht leer ist für ein $a \in \Sigma$, dann muss $\delta (q, \epsilon, X)$ leer sein.

Deterministische PDAs werden auch *DPDAs* genannt.

###### Der kleine Unterschied

**Satz:** Die von DPDAs akzeptierten Sprachen sind eine echte Teilmenge der von PDAs akzeptierten Sprachen.

Reguläre Sprachen sind eine echte Teilmenge der von DPDAs akzeptierten Sprachen.

##### Kontextfreie Grammatiken und Sprachen

###### Kontextfreie Grammatiken

**Def.** Eine *kontextfreie (cf-)* Grammatik ist ein 4-Tupel $G = (N, T, P, S)$ mit *N, T, S* wie in (formalen) Grammatiken und *P* ist eine endliche Menge von Produktionen der Form:

$X \rightarrow Y$ mit $X \in N, Y \in {(N \cup T)}^{\ast}$.

$\Rightarrow, \overset{\ast}{\Rightarrow}$ sind definiert wie bei regulären Sprachen.

###### Nicht jede kontextfreie Grammatik ist eindeutig

**Def.:** Gibt es in einer von einer kontextfreien Grammatik erzeugten Sprache ein Wort, für das mehr als ein Ableitungsbaum existiert, so heißt diese Grammatik *mehrdeutig*. Anderenfalls heißt sie *eindeutig*.

**Satz:** Es ist nicht entscheidbar, ob eine gegebene kontextfreie Grammatik eindeutig ist.

**Satz:** Es gibt kontextfreie Sprachen, für die keine eindeutige Grammatik existiert.

###### Kontextfreie Grammatiken und PDAs

**Satz:** Die kontextfreien Sprachen und die Sprachen, die von PDAs akzeptiert werden, sind dieselbe Sprachklasse.

**Satz:** Eine von einem DPDA akzeptierte Sprache hat eine eindeutige Grammatik.

**Def.:** Die Klasse der Sprachen, die von einem DPDA akzeptiert werden, heißt Klasse der *deterministisch kontextfreien (oder LR(k)-) Sprachen*.

Vorgehensweise im Compilerbau: Eine Grammatik für die gewünschte Sprache definieren und schauen, ob sich daraus ein DPDA generieren lässt (automatisch).

##### Wrap-Up

###### Das sollen Sie mitnehmen

-   Die Struktur von gängigen Programmiersprachen lässt sich nicht mit regulären Ausdrücken beschreiben und damit nicht mit DFAs akzeptieren.
-   Das Automatenmodell der DFAs wird um einen endlosen Stack erweitert, das ergibt PDAs.
-   Kontextfreie Grammatiken (CFGs) erweitern die regulären Grammatiken.
-   Deterministisch parsebare Sprachen haben eine eindeutige kontextfreie Grammatik.
-   Es ist nicht entscheidbar, ob eine gegebene kontextfreie Grammatik eindeutig ist.
-   Von DPDAs akzeptierte Sprachen haben eindeutige Grammatiken.

> [!TIP]
>
> <details open>
> <summary><strong>📖 Zum Nachlesen</strong></summary>
>
> -   Aho u. a. ([2023](#ref-Aho2023))
> -   Hopcroft u. a. ([2003](#ref-hopcroft2003))
>
> </details>

> [!NOTE]
>
> <details >
> <summary><strong>✅ Lernziele</strong></summary>
>
> -   k1: Ich kenne PDAs
> -   k1: Ich kenne deterministische PDAs
> -   k1: Ich kenne kontextfreie Grammatiken
> -   k1: Ich kenne deterministisch kontextfreie Grammatiken
> -   k2: Ich kann den Zusammenhang zwischen PDAs und kontextfreien Grammatiken an einem Beispiel erklären
>
> </details>

<a id="id-07a415053a63f15160a328d38fe730bbd2c78148"></a>

#### LL-Parser

> [!TIP]
>
> <details open>
> <summary><strong>🖇 Weitere Unterlagen</strong></summary>
>
> -   [Annotierte Folien: LL-Parser (Theorie)](https://github.com/Compiler-CampusMinden/AnnotatedSlides/blob/master/ll-parser-theory.ann.ma.pdf)
>
> </details>

##### Wiederholung

###### PDAs und kontextfreie Grammatiken

-   Warum reichen uns DFAs nicht zum Matchen von Eingabezeichen?
-   Wie könnnen wir sie minimal erweitern?
-   Sind PDAs deterministisch?
-   Wie sind kontextfreie Grammatiken definiert?
-   Sind kontextfreie Grammatiken eindeutig?

##### Motivation

###### Was brauchen wir für die Syntaxanalyse von Programmen?

-   einen Grammatiktypen, aus dem sich manuell oder automatisiert ein Programm zur deterministischen Syntaxanalyse erstellen lässt
-   einen Algorithmus zum sog. Parsen von Programmen mit Hilfe einer solchen Grammatik

###### Themen für heute

-   Syntaxanalyse
-   Top-down-Analyse
-   rekursiver Abstieg
-   LL(k)-Analyse

##### Syntaxanalyse

###### Ziele der Syntaxanalyse

-   Auffinden von Syntaxfehlern mit möglichst genauer Fehlerangabe
-   evtl. Vorschläge zur Fehlerbehebung
-   Erstellen eines AST (abstract parse trees) zur semantischen Analyse = Ableitungsbaum ohne strukturell überflüssige Token (Semikolons, geschweifte Klammern, ...)

###### Arten der Syntaxanalyse

Die Syntax bezieht sich auf die Struktur der zu analysierenden Eingabe, z. B. einem Computerprogramm in einer Hochsprache. Diese Struktur wird mit formalen Grammatiken beschrieben. Einsetzbar sind Grammatiken, die deterministisch kontextfreie Sprachen erzeugen.

-   Top-Down-Analyse: Aufbau des Parse trees von oben nach unten
    -   Parsen durch rekursiven Abstieg
    -   tabellengesteuertes LL-Parsing
-   Bottom-Up-Analyse: LR-Parsing

###### Bevor wir richtig anfangen...

**Def.:** Ein Nichtterminal *A* einer kontextfreien Grammatik *G* heißt *unerreichbar*, falls es kein $a,b \in {(N \cup T)}^{\ast}$ gibt mit $S \overset{\ast}{\Rightarrow} aAb$. Ein Nichtterminal *A* einer Grammatik *G* heißt *nutzlos*, wenn es kein Wort $w \in T^{\ast}$ gibt mit $A \overset{\ast}{\Rightarrow} w$.

**Def.:** Eine kontextfreie Grammatik $G=(N, T, P, S)$ heißt *reduziert*, wenn es keine nutzlosen oder unerreichbaren Nichtterminale in *N* gibt.

Bevor mit einer Grammatik weitergearbeitet wird, müssen erst alle nutzlosen und dann alle unerreichbaren Symbole eliminiert werden. Wir betrachten ab jetzt nur reduzierte Grammatiken.

##### Algorithmus: Rekursiver Abstieg

###### Algorithmus: Rekursiver Abstieg

Hier ist ein einfacher Algorithmus, der (indeterministisch) top-down Ableitungen vom Nonterminal *X* aufbaut:

**Eingabe:** Ein Nichtterminal $X$ und das nächste zu verarbeitende Eingabezeichen $a$.

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/recursive_descent_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/recursive_descent.png" width="55%" /></picture></p><p align="center">Recursive Descent-Algorithmus</p>

###### Wann scheitert das Verfahren?

Hier entsteht eine Tafelskizze ...

##### Tabellengesteuerte Parser: LL(k)-Grammatiken

###### First-Mengen

$S \rightarrow A \ \vert \ B \ \vert \ C$

Welche Produktion nehmen?

Wir brauchen die "terminalen k-Anfänge" von Ableitungen von Nichtterminalen, um eindeutig die nächste zu benutzende Produktion festzulegen. $k$ ist dabei die Anzahl der sog. *Vorschautoken*.

**Def.:** Wir definieren $First$ - Mengen einer Grammatik wie folgt:

-   $a \in T^\ast, |a| \leq k: {First}_k (a) = \lbrace a\rbrace$

-   $a \in T^\ast, |a| > k: {First}_k (a) = \lbrace v \in T^\ast \mid a = vw, |v| = k\rbrace$

-   $\alpha \in (N \cup T)^\ast \backslash T^\ast: {First}_k (\alpha) = \lbrace v \in T^\ast \mid  \alpha
    \overset{\ast}{\Rightarrow} w,\text{mit}\ w \in T^\ast, First_k(w) = \lbrace v \rbrace \rbrace$

###### Linksableitungen

**Def.:** Bei einer kontextfreien Grammatik $G$ ist die *Linksableitung* von $\alpha \in (N \cup T)^{\ast}$ die Ableitung, die man erhält, wenn in jedem Schritt das am weitesten links stehende Nichtterminal in $\alpha$ abgeleitet wird.

Man schreibt $\alpha \overset{\ast}{\Rightarrow}_l \beta.$

###### Follow-Mengen

Manchmal müssen wir wissen, welche terminalen Zeichen hinter einem Nichtterminal stehen können.

**Def.** Wir definieren *Follow* - Mengen einer Grammatik wie folgt:

$\forall \beta \in (N \cup T)^*:$

$$Follow_k(\beta) = \lbrace w \in T^\ast \mid \exists \alpha, \gamma \in  (N \cup T)^\ast\ \text{ mit }\ S \overset{\ast}{\Rightarrow}_l \alpha \beta \gamma\ \text{ und }\ w \in First_k(\gamma) \rbrace$$

###### LL(k)-Grammatiken

**Def.:** Eine kontextfreie Grammatik *G = (N, T, P, S)* ist genau dann eine *LL(k)*-Grammatik, wenn für alle Linksableitungen der Form:

$S \overset{\ast}{\Rightarrow}_l\ wA \gamma\ {\Rightarrow}_l\ w\alpha\gamma \overset{\ast}{\Rightarrow}_l wx$

und

$S \overset{\ast}{\Rightarrow}_l wA \gamma {\Rightarrow}_l w\beta\gamma \overset{\ast}{\Rightarrow}_l wy$

mit $(w, x, y \in T^\ast, \alpha, \beta, \gamma \in (N \cup T)^\ast, A \in N)$ und $First_k(x) = First_k(y)$ gilt:

$\alpha = \beta$

###### LL(1)-Grammatiken

Das hilft manchmal:

Für $k = 1$: G ist $LL(1): \forall A \rightarrow \alpha, A \rightarrow \beta \in P, \alpha \neq \beta$ gilt:

1.  $\lnot \exists a \in T: \alpha  \overset{\ast}{\Rightarrow}_l  a\alpha_1$ und $\beta \overset{\ast}{\Rightarrow}_l a\beta_1$
2.  $((\alpha \overset{\ast}{\Rightarrow}_l \epsilon) \Rightarrow (\lnot (\beta \overset{\ast}{\Rightarrow}_l \epsilon)))$ und $((\beta \overset{\ast}{\Rightarrow}_l \epsilon) \Rightarrow (\lnot (\alpha\overset{\ast}{\Rightarrow}_l \epsilon)))$
3.  $((\beta \overset{\ast}{\Rightarrow}_l \epsilon)$ und $(\alpha \overset{\ast}{\Rightarrow}_l a\alpha_1)) \Rightarrow a \notin Follow(A)$
4.  $((\alpha \overset{\ast}{\Rightarrow}_l \epsilon)$ und $(\beta \overset{\ast}{\Rightarrow}_l a\beta_1)) \Rightarrow a \notin Follow(A)$

Die ersten beiden Zeilen bedeuten:

$\alpha$ und $\beta$ können nicht beide $\epsilon$ ableiten, $First_1(\alpha) \cap First_1(\beta) = \emptyset$

Die dritte und vierte Zeile bedeuten:

$(\epsilon \in First_1(\beta)) \Rightarrow (First_1(\alpha) \cap Follow_1(A) = \emptyset)$

$(\epsilon \in First_1(\alpha)) \Rightarrow (First_1(\beta) \cap Follow_1(A) = \emptyset)$

###### LL(k)-Sprachen

Die von *LL(k)*-Grammatiken erzeugten Sprachen sind eine echte Teilmenge der deterministisch parsbaren Sprachen.

Die von *LL(k)*-Grammatiken erzeugten Sprachen sind eine echte Teilmenge der von *LL(k+1)*-Grammatiken erzeugten Sprachen.

Für eine kontextfreie Grammatik *G* ist nicht entscheidbar, ob es eine *LL(1)* - Grammatik *G'* gibt mit $L(G) = L(G')$.

In der Praxis reichen $LL(1)$ - Grammatiken oft. Hier gibt es effiziente Parsergeneratoren, deren Eingabe eine LL(k)- (meist LL(1)-) Grammatik ist, und die als Ausgabe den Quellcode eines (effizienten) tabellengesteuerten Parsers generieren.

###### Algorithmus: Konstruktion einer LL-Parsertabelle

**Eingabe:** Eine Grammatik G = (N, T, P, S) mit $\perp \in T$ als Endezeichen

**Ausgabe:** Eine Parsertabelle *P*

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/LL-Parsertabelle_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/LL-Parsertabelle.png" width="60%" /></picture></p><p align="center">Algorithmus zur Generierung einer LL-Parsertabelle</p>

Statt $First_1(\alpha)$ und $Follow_1(\alpha)$ wird oft nur $First(\alpha)$ und $Follow(\alpha)$ geschrieben.

###### LL-Parsertabellen

Rekursive Programmierung bedeutet, dass das Laufzeitsystem einen Stack benutzt (bei einem Recursive-Descent-Parser, aber auch bei der Parsertabelle). Diesen Stack kann man auch "selbst programmieren", d. h. einen PDA implementieren. Dabei wird ebenfalls die oben genannte Tabelle zur Bestimmung der nächsten anzuwendenden Produktion benutzt. Der Stack enthält die zu erwartenden Eingabezeichen, wenn immer eine Linksableitung gebildet wird. Diese Zeichen im Stack werden mit dem Input gematcht.

###### Algorithmus: Tabellengesteuertes LL-Parsen mit einem PDA

**Eingabe:** Eine Grammatik G = (N, T, P, S), eine Parsertabelle *P* mit $w\perp$ als initialem Kellerinhalt

**Ausgabe:** Wenn $w \in L(G)$, eine Linksableitung von $w$, Fehler sonst

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/LL-Parser_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/LL-Parser.png" width="49%" /></picture></p><p align="center">Algorithmus zum tabellengesteuerten LL-Parsen</p>

##### Wrap-Up

###### Wrap-Up

-   Syntaxanalyse wird mit deterministisch kontextfreien Grammatiken durchgeführt.
-   Eine Teilmenge der dazu gehörigen Sprachen lässt sich top-down parsen.
-   Ein einfacher Recursive-Descent-Parser arbeitet mit Backtracking.
-   Ein effizienter LL(k)-Parser realisiert einen DPDA und kann automatisch aus einer LL(k)-Grammatik generiert werden.
-   Der Parser liefert in der Regel einen abstrakten Syntaxbaum (AST).

> [!TIP]
>
> <details open>
> <summary><strong>📖 Zum Nachlesen</strong></summary>
>
> -   Aho u. a. ([2023](#ref-Aho2023))
> -   Hopcroft u. a. ([2003](#ref-hopcroft2003))
>
> </details>

> [!NOTE]
>
> <details >
> <summary><strong>✅ Lernziele</strong></summary>
>
> -   k1: Ich kenne die Top-Down-Analyse
> -   k1: Ich kenne Recursive-Descent-Parser
> -   k1: Ich kenne First- und Follow-Mengen
> -   k1: Ich kenne LL-Parser
> -   k2: Ich kann den Zusammenhang zwischen PDAs und kontextfreien Grammatiken an einem Beispiel erklären
> -   k2: Ich kann den algorithmischen Ablauf von LL-Parsern an einem Beispiel erklären
>
> </details>

<a id="id-8f9ad51b1fa5549b458757512a9b2c5b7e30f08e"></a>

#### LL-Parser selbst implementiert

> [!IMPORTANT]
>
> <details open>
> <summary><strong>🎯 TL;DR</strong></summary>
>
> <p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/architektur_cb_parser_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/architektur_cb_parser.png"  /></picture></p>
>
> LL-Parser können über einen "rekursiven Abstieg" direkt aus einer Grammatik implementiert werden:
>
> -   Zu jeder Produktionsregel erstellt man eine gleichnamige Funktion.
> -   Wenn in der Produktionsregel andere Regeln "aufgerufen" werden, erfolgt in der Funktion an dieser Stelle der entsprechende Funktionsaufruf.
> -   Bei Terminalsymbolen wird das erwartete Token geprüft.
>
> Dabei findet man wie bereits im Lexer die Funktionen `match` und `consume`, die sich hier aber auf den Tokenstrom beziehen. LL(1)-Parser schauen dabei immer das nächste Token an, LL(k) haben ein entsprechendes Look-Ahead von $k$ Token. Dies kann man mit einem Ringpuffer für die Token realisieren.
>
> Zur Beachtung der Vorrang- und Assoziativitätsregeln muss die Grammatik entsprechend umgebaut werden. LL-Parser haben durch die Betrachtung des aktuellen Vorschau-Tokens ein Problem mit Linksrekursion in der Grammatik, diese muss zunächst beseitigt werden. (ANTLR bietet hier gewisse Vereinfachungen an, kann aber mit indirekter Linksrekursion auch nicht umgehen.)
>
> Eine gute Darstellung, die sich am zeichen- bzw. tokenweisen Einlesen orientiert, finden Sie in ([Parr 2010](#ref-Parr2010)) (Kapitel 2). Eine weitere sehr gut lesbare Darstellung ist in ([Nystrom 2021](#ref-Nystrom2021)) (Kapitel 4, 5 und 6) zu finden. Dort wird die Eingabe komplett eingelesen und daraus eine Liste aller Token erzeugt, auf der der Parser operiert. Der Beispiel-Code in dieser Vorlesung orientiert sich an der zeichenweisen bzw. tokenweisen Verarbeitung.
>
> </details>

> [!TIP]
>
> <details open>
> <summary><strong>🎦 Videos</strong></summary>
>
> Vorlesung \[[YT](https://youtu.be/p8yFdXhaDyg)\], \[[HSBI](https://www.hsbi.de/medienportal/album/video/cpl-ll-parser-selbst-implementiert/6928d27b9f8d43287b445766dd30a3ba/254)\]
>
> </details>

##### Erinnerung Lexer: Zeichenstrom =\> Tokenstrom

``` {.python size="footnotesize"}
def nextToken():
    while (peek != EOF):  # globale Variable, über consume()
        switch (peek):
            case ' ': case '\t': case '\n': WS(); continue
            case '[': consume(); return Token(LBRACK, '[')
            ...
            default: raise Error("invalid character: "+peek)
    return Token(EOF_Type, "<EOF>")

def match(c):   # Lookahead: Ein Zeichen
    consume()
    if (peek == c): return True
    else: rollBack(); return False

def consume():
    peek = buffer[start]
    start = (start+1) mod 2n
    if (start mod n == 0):
        fill(buffer[start:start+n-1])
        end = (start+n) mod 2n
```

Erinnerung: Der Lexer arbeitet direkt auf dem Zeichenstrom und versucht über längste Matches daraus einen Tokenstrom zu erzeugen. Dabei wird immer das nächste Zeichen angeschaut (Funktion `match`) und mit `consume` das aktuelle Zeichen "verbraucht" und das nächste Zeichen geladen. Hier kann man über die Doppel-Puffer-Strategie das Einlesen einzelner Zeichen aus einer Datei vermeiden und immer blockweise in den Puffer einlesen.

##### Grundidee LL-Parser

Grammatik:

``` antlr
r : X s ;
```

LL-Implementierung:

``` python
def r():
    match(X)
    s()
```

-   Für jede Regel in der Grammatik wird eine Methode/Funktion mit dem selben Namen definiert
-   Referenzen auf ein Token `T` werden durch den Aufruf der Methode `match(T)` aufgelöst
    -   `match(T)` "konsumiert" das aktuelle Token, falls dieses mit `T` übereinstimmt
    -   Anderenfalls löst `match()` eine Exception aus
-   Referenzen auf Regeln `s` werden durch Methodenaufrufe `s()` aufgelöst

*Erinnerung*: In ANTLR werden Parser-Regeln (non-Terminale) mit einem kleinen und Lexer-Regeln (Terminale/Token) mit einem großen Anfangsbuchstaben geschrieben.

##### Alternative Subregeln

    a | b | c

kann zu einem `switch`-Konstrukt aufgelöst werden:

``` python
switch (lookahead):
    case predicting_a:
        a(); break;
    case predicting_b:
        b(); break;
    ...
    default: raise Error()
```

Dabei ist `lookahead` eine globale Variable, die das zu betrachtende Token enthält (vergleichbar mit `peek` beim Lexer).

Das Prädikat `predicting_a` soll andeuten, dass man mit dem aktuellen Token eine Vorhersage für die Regel `a` versucht (hier kommen die FIRST- und FOLLOW-Mengen ins Spiel ...). Wenn das der Fall ist, springt man entsprechend in die Funktion bzw. Methode `a()`.

##### Optionale Subregeln: Eins oder keins

    (T)?

wird zu einem `if` ohne `else`-Teil:

``` python
if lookahead.predicting_T: match(T)
```

##### Optionale Subregeln: Mindestens eins

    (T)+

wird zu einer `do-while`-Schleife (mind. ein Durchlauf):

``` python
while True:
    match(T)
    if not lookahead.predicting_T: break
```

##### LL(1)-Parser

Beispiel: Parsen von Listen, also Sequenzen wie `[1,2,3,4]`:

``` antlr
list     : '[' elements ']' ;
elements : INT (',' INT)* ;

INT      : ('0'..'9')+ ;
```

Formal berechnet man die Lookahead-Mengen mit `FIRST` und `FOLLOW`, um eine Entscheidung für die nächste Regel zu treffen. Praktisch betrachtet kann man sich fragen, welche(s) Token eine Phrase in der aktuellen Alternative starten können.

Für LL(1)-Parser betrachtet man immer das **aktuelle** Token (**genau *EIN* Lookahead-Token**), um eine Entscheidung zu treffen.

``` python
def list():
    match(LBRACK); elements(); match(RBRACK);

def elements():
    match(INT)
    while lookahead == COMMA:  # globale Variable, über consume()
        match(COMMA); match(INT)
```

##### Detail: *match()* und *consume()*

``` python
def match(x):
    if lookahead == x: consume()
    else: raise Exception()

def consume():
    lookahead = lexer.nextToken()
```

Quelle: Eigener Code basierend auf einer Idee nach ([Parr 2010](#ref-Parr2010), p. 43)

Dabei setzt man in der Klasse `Parser` zwei Attribute voraus:

``` python
class Parser:
    Lexer lexer
    Token lookahead
```

Starten würde man den Parser nach dem Erzeugen einer Instanz (dabei wird ein Lexer mit durchgereicht) über den Aufruf der Start-Regel, also beispielsweise `parser.list()`.

*Anmerkung*: Mit dem generierten Parse-Tree bzw. *AST* beschäftigen wir uns später (=\> [AST-basierte Interpreter](#id-1ef3437e88d6d165c0cf233b6df46f1189d6d4b6)).

##### Vorrangregeln

    1+2*3 == 1+(2*3) != (1+2)*3

Die Eingabe `1+2*3` muss als `1+(2*3)` interpretiert werden, da `*` Vorrang vor `+` hat.

Dies formuliert man üblicherweise in der Grammatik:

``` antlr
expr : expr '+' term
     | term
     ;
term : term '*' INT
     | INT
     ;
```

ANTLR nutzt die Strategie des ["*precedence climbing*"](https://www.antlr.org/papers/Clarke-expr-parsing-1986.pdf) und löst nach der *Reihenfolge der Alternativen* in einer Regel auf. Entsprechend könnte man die obige Grammatik unter Beibehaltung der Vorrangregeln so in ANTLR (v4) formulieren:

``` antlr
expr : expr '*' expr
     | expr '+' expr
     | INT
     ;
```

##### Linksrekursion

Normalerweise sind linksrekursive Grammatiken nicht mit einem LL-Parser behandelbar. Man muss die Linksrekursion manuell auflösen und die Grammatik umschreiben.

**Beispiel**:

``` antlr
expr : expr '*' expr | expr '+' expr | INT ;
```

Diese linksrekursive Grammatik könnte man (unter Beachtung der Vorrangregeln) etwa so umformulieren:

``` antlr
expr     : addExpr ;
addExpr  : multExpr ('+' multExpr)* ;
multExpr : INT ('*' INT)* ;
```

ANTLR (v4) kann Grammatiken mit *direkter* Linksrekursion auflösen. Für frühere Versionen von ANTLR muss man die Rekursion manuell beseitigen.

Vergleiche ["ALL(\*)" bzw. "Adaptive LL(\*)"](https://www.antlr.org/papers/allstar-techreport.pdf).

**Achtung**: Mit *indirekter* Linksrekursion kann ANTLR (v4) *nicht* umgehen:

``` antlr
expr : expM | ... ;
expM : expr '*' expr ;
```

=\> *Nicht* erlaubt!

##### Assoziativität

Die Eingabe `2^3^4` sollte als `2^(3^4)` geparst werden. Analog sollte `a=b=c` in C als `a=(b=c)` verstanden werden.

Per Default werden Operatoren wie `+` in ANTLR *links-assoziativ* behandelt, d.h. die Eingabe `1+2+3` wird als `(1+2)+3` gelesen. Für *rechts-assoziative* Operatoren muss man ANTLR dies in der Grammatik mitteilen:

``` antlr
expr : expr '^'<assoc=right> expr
     | INT
     ;
```

*Anmerkung*: Laut [Doku](https://github.com/antlr/antlr4/blob/master/doc/left-recursion.md) gilt die Angabe `<assoc=right>` immer für die jeweilige Alternative und muss seit Version 4.2 an den Alternativen-Operator `|` geschrieben werden. In der Übergangsphase sei die Annotation an Tokenreferenzen noch zulässig, würde aber ignoriert?!

##### LL(k)-Parser

``` antlr
expr : ID '++'    // x++
     | ID '--'    // x--
     ;
```

Die obige Regel ist für einen LL(1)-Parser nicht deterministisch behandelbar, da die Alternativen mit dem selben Token beginnen (die Lookahead-Mengen überlappen sich). Entweder benötigt man zwei Lookahead-Tokens, also einen LL(2)-Parser, oder man muss die Regel in eine äquivalente LL(1)-Grammatik umschreiben:

``` antlr
expr : ID ('++' | '--') ;    // x++ oder x--
```

##### LL(k)-Parser: Implementierung mit Ringpuffer

Für einen größeren Lookahead benötigt man einen Puffer für die Token. Für einen Lookahead von $k$ Token (also einen LL(k)-Parser) würde man einen Puffer mit $k$ Plätzen anlegen und diesen wie einen Ringpuffer benutzen. Dabei ist `start` der Index des aktuellen Lookahead-Tokens. Über die neue Funktion `lookahead(1)` ist dieses aktuelle Lookahead-Token abrufbar.

``` python
class Parser:
    Lexer lexer
    k = 3               # Lookahead: 3 Token => LL(3)
    start = 0           # aktuelle Tokenposition im Ringpuffer
    Token[k] lookahead  # Ringpuffer mit k Plätzen (vorbefüllt via Konstruktor)
```

``` python
def match(x):
    if lookahead(1) == x: consume()
    else: raise Exception()

def consume():
    lookahead[start] = lexer.nextToken()
    start = (start+1) % k

def lookahead(i):
    return lookahead[(start+i-1) % k]  # i==1: start
```

Quelle: Eigener Code basierend auf einer Idee nach ([Parr 2010](#ref-Parr2010), p. 47)

##### Wrap-Up

-   LL(1) und LL(k) mit festem Lookahead
-   Implementierung von Vorrang- und Assoziativitätsregeln
-   Beachtung und Auflösung von Linksrekursion

> [!TIP]
>
> <details open>
> <summary><strong>📖 Zum Nachlesen</strong></summary>
>
> -   Nystrom ([2021](#ref-Nystrom2021)): Kapitel 5 und 6
> -   Parr ([2010](#ref-Parr2010)): Kapitel 2 ("Pattern 3: LL(1) Recursive-Decent Parser")
>
> </details>

> [!NOTE]
>
> <details >
> <summary><strong>✅ Lernziele</strong></summary>
>
> -   k2: Ich kann den prinzipiellen Aufbau von LL-Parsern am Beispiel erklären
> -   k3: Ich kann LL(1)- und LL(k)-Parser implementieren
> -   k3: Ich kann Vorrang und Assoziativität bei der Implementierung korrekt umsetzen
> -   k3: Ich kann mit Linksrekursion umgehen und diese ggf. auflösen
>
> </details>

> [!IMPORTANT]
>
> <details open>
> <summary><strong>🏅 Challenges</strong></summary>
>
> **Quizzfragen**:
>
> -   Wie kann man aus einer LL(1)-Grammatik einen LL(1)-Parser mit rekursivem Abstieg implementieren? Wie "übersetzt" man dabei Token und Regeln?
> -   Wie geht man mit Alternativen um? Wie mit optionalen Subregeln?
> -   Warum ist Linksrekursion i.A. bei LL-Parsern nicht erlaubt? Wie kann man Linksrekursion beseitigen?
> -   Wie kann man Vorrangregeln implementieren?
> -   Wann braucht man mehr als ein Token Lookahead? Geben Sie ein Beispiel an.
>
> **Manuell implementierter Parser**
>
> Betrachten Sie erneut die folgende einfache Sprache:
>
>     a = 10 - 5     # Zuweisung des Ausdruckes 10-5 (Integer-Wert 5) an Variable a
>     b = a + 2 * 3  # Zuweisung von 16 an Variable b
>     c = a != b     # Zuweisung eines boolschen Werts an c
>
> Es gibt nur Statements und Expressions:
>
> -   Statement: Zuweisung; jedes Statement endet mit einem NL
> -   Expression: Zahl, Variable, Addition, Subtraktion, Multiplikation (mit üblichem Vorrang), Vergleich
>
> **Aufgaben**:
>
> In den Challenges von [LL Lexer](#id-e459a0cea34b59c5b39e4a2e10ea30c515eba6b0) haben Sie eine Grammatik definiert und einen Lexer implementiert.
>
> -   Geben Sie nun geeignete Datenstrukturen für den AST an.
> -   Implementieren Sie analog zum Vorgehen in der Vorlesung einen Parser mit *recursive descent* für diese Sprache.
> -   Was müssten Sie anpassen bzw. ergänzen, wenn Sie beispielsweise weitere Statements wie eine `if`-Abfrage oder eine `while`-Schleife mit einbauen wollten?
>
> </details>

<a id="id-cbdc409a00759785c1751b366323dc17dddf7a1a"></a>

#### Syntaxanalyse: LR-Parser (LR(0), LALR)

> [!TIP]
>
> <details open>
> <summary><strong>🖇 Weitere Unterlagen</strong></summary>
>
> -   [Annotierte Folien: LR-Parser](https://github.com/Compiler-CampusMinden/AnnotatedSlides/blob/master/lr-parser.ann.ma.pdf)
>
> </details>

##### Wiederholung

###### Top-Down-Analyse

-   Baumaufbau von oben nach unten

-   eine Möglichkeit: recursive-descent parser

-   alternativ: tabellengesteuerter Parser

-   *First-* und *Follow*-Mengen bestimmen Wahl der Ableitungen

-   nicht mehr rekursiv, sondern mit PDA

##### Motivation

###### *LL* ist nicht alles

Die Menge der *LL*-Sprachen ist eine echte Teilmenge der deterministisch kontextfreien Sprachen.

Bei $LL$-Sprachen muss man nach den ersten $k$ Eingabezeichen entscheiden, welche Ableitung ganz oben im Baum als erste durchgeführt wird, also eine, die im Baum ganz weit weg ist von den Terminalen, die die Entscheidung bestimmen. Das ist nicht bei allen deterministisch parsebaren Grammatiken möglich und erschwert die Fehlerbehandlung.

##### Von unten nach oben

###### Von unten nach oben

Bei der Bottom-Up-Analyse wird der Parse Tree wird von unten nach oben aufgebaut, von links nach rechts. Dabei entsteht eine *Rechtsableitung*.

**Def.:** Bei einer kontextfreien Grammatik $G$ ist die *Rechtsableitung* von $\alpha \in (N \cup T)^{\ast}$ die Ableitung, die man erhält, wenn das am weitesten rechts stehende Nichtterminal in $\alpha$ abgeleitet wird. Man schreibt $\alpha \overset{\ast}{\Rightarrow}_r \beta$.

Mit Hilfe der Produktionen und der Vorschautoken werden die Ableitungen "rückwärts" angewandt und "Reduktionen" genannt.

###### Versuchen wir es einmal

Hier entsteht ein Tafelbild.

###### Kann ein Stack helfen?

Hier entsteht ein Tafelbild.

###### So geht es vielleicht

Hier entsteht ein Tafelbild.

###### Da wollen wir hin

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/Parser-Automat_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/Parser-Automat.png" width="80%" /></picture></p><p align="center">Parser-Automat</p>

##### Theorie: LR(0)

###### Arbeitsweise

Im Stack stehen nur Zustandsnummern, am Anfang die Nummer des Startzustandes (+ Bottomzeichen, oft auch $\$$).

-   Lesen des obersten Stackelements ergibt Zustand $q$

-   Lesen des nächsten Eingabezeichens ergibt Zeichen $a$

-   Nachschlagen der Reaktion auf $(q, a)$ in der Parse Table

-   Durchführung der Reaktion

###### Mögliche "Actions" ohne Berücksichtigung von Vorschautoken

-   Shift: Schiebe logisch das nächste Eingabesymbol auf den Stack (in Wirklichkeit Zustandsnummern)

-   Reduce: (Identifiziere ein Handle oben auf dem Stack und ersetze es durch das Nichtterminal der dazugehörigen Produktion.) Das ist gleichbedeutend mit: Entferne so viele Zustände vom Stack wie die rechte Seite der zu reduzierenden Regel Elemente hat, und schreibe den Zustand, der im Goto-Teil für $(q, a)$ steht, auf den Stack.

-   Accept: Beende das Parsen erfolgreich

-   Reagiere auf einen Syntaxfehler

###### Berechnung der Zustände: Items

**Def.:** Ein *(dotted) Item* einer Grammatik $G$ ist eine Produktion von $G$ mit einem Punkt auf der rechten Seite der Regel vor, zwischen oder nach den Elementen.

Bsp.:

Zu der Produktion $A \rightarrow BC$ gehören die Items:

$[A\rightarrow \cdot B C]$

$[A\rightarrow B \cdot C$\]

$[A\rightarrow B C \cdot]$

Das zu $A \rightarrow \epsilon$ gehörende Item ist $[A \rightarrow \cdot]$

###### Berechnung der *Closure_0* von einer Menge *I* von Items

1.  füge $I$ zu $CLOSURE_0 (I)$ hinzu

2.  gibt es ein Item $[A \rightarrow \alpha \cdot B\beta]$ aus $CLOSURE_0 (I)$ und eine Produktion $(B \rightarrow \gamma)$, füge $[B \rightarrow \cdot \gamma]$ zu $CLOSURE_0 (I)$ hinzu

###### Berechnung der *GOTO_0*-Sprungmarken

$GOTO_0(I, X) = CLOSURE_0(\lbrace[A \rightarrow \alpha X \cdot \beta] \mid [A \rightarrow \alpha \cdot X \beta] \in I\rbrace)$

für eine Itemmenge $I$ und $X \in N \cup T, A \in N, \alpha, \beta \in (N \cup T)^{\ast}$.

###### Konstruktion des $LR(0)$ - Automaten

1.  Bilde die Hülle von $S' \rightarrow S$ und mache sie zum ersten Zustand.

2.  Für jedes noch nicht betrachtete $\cdot X, X \in (N \cup T)$ in einem Zustand $q$ des Automaten berechne $GOTO_0(q, X)$ und mache $GOTO_0(q, X)$ zu einem neuen Zustand $r$. Verbinde $q$ mit einem Pfeil mit $r$ und schreibe $X$ an den Pfeil. Ist ein zu $r$ identischer Zustand schon vorhanden, wird $p$ mit diesem verbunden und kein neuer erzeugt.

###### Konstruktion der Parse Table

1.  Erstelle eine leere Tabelle mit den Zuständen als Zeilenüberschriften. Für den Aktionstabellenteil überschreibe die Spalten mit den Terminalen, für den Sprungtabellenteil mit den Nonterminals.

2.  Shift: Für jeden mit einem Terminal beschrifteten Pfeil aus einem Zustand erstelle in der Aktionstabelle die Aktion shift mit der Nummer des Zustands, auf den der Pfeil zeigt. Für Pfeile mit Nonterminals schreibe in die Sprungtabelle nur die Nummer des Folgezustands.

3.  Schreibe beim Zustand $[S' \rightarrow S \cdot]$ ein $accept$ bei dem Symbol $\bot$.

4.  Für jedes Item mit $[A \rightarrow \beta \cdot]$ aus allen Zuständen schreibe für alle Terminals $reduce$ und die Nummer der entsprechenden Grammatikregel in die Tabelle.

###### Ein Beispiel zum Nachvollziehen

(0) $S^{'} \rightarrow S$

(1) $S     \rightarrow a A b S c S$

(2) $S     \rightarrow a A b S$

(3) $S     \rightarrow d$

(4) $A     \rightarrow e$

###### Der LR(0)-Automat zu G1

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/LR_0-SLR_1-Automat_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/LR_0-SLR_1-Automat.png"  /></picture></p><p align="center">LR(0)-Automat</p>

###### Die LR(0)-Parsertabelle zu G1

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/LR_0-Table_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/LR_0-Table.png" width="45%" /></picture></p><p align="center">LR(0)-Parsertabelle</p>

##### Und was gibt es noch?

###### Wenn LR(0) nicht reicht

Zunächst: Zu jeder LR(k)-Sprache gibt es eine LR(1)-Grammatik.

Ist eine Grammatik nicht LR(0), müssen nichtdeterminsistische Tabelleneinträge verhindert werden:

-   SLR(1)-Parsing ($A \rightarrow \beta$ wird nur reduziert, wenn das Vorschautoken in der $FOLLOW$-Menge von $A$ ist.)

-   (kanonisches) LR(1)-Parsing (wie LR(0) mit einem Vorschautoken)

-   LALR(1)-Parsing (Zusammenfassung aller LR(1)-Zustände, die sich nur in den LOOKAHEAD-Mengen unterscheiden)

##### Mehrdeutige Grammatiken

###### Es gibt auch Auswege

Mehrdeutige Grammatiken sind oft leichter zu lesen und kleiner als die Grammatiken, die man erhält, wenn man die Mehrdeutigkeit auflöst, sofern möglich.

Folgendes kann bei Mehrdeutigkeiten helfen:

-   Angabe von Vorrangregeln

-   Angabe von Assoziativität

-   Voreinstellung des Parsergenearators: z. B. Shiften bei Shift-Reduce-Konflikten

-   Voreinstellung des Parsergenearators: z. B. Reduzieren nach der Regel, die in der Grammatik zuerst kommt bei Reduce-Reduce-Konflikten

##### Hierarchie der kontextfreien Sprachen

###### Hierarchie der kontextfreien Sprachen

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/CFG-Hierarchy_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/02-parsing/images/CFG-Hierarchy.png" width="60%" /></picture></p><p align="center">Sprachenhierarchie</p>

##### Wrap-Up

###### Wrap-Up

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

<a id="id-11b297f55f8b514c4669c3cc9d49f563d7c04db9"></a>

### Semantische Analyse

Auf die lexikalische Analyse und die Syntaxanalyse folgt die semantische Analyse. Nach dem Parsen steht fest, dass ein Programm syntaktisch korrekt ist. Nun muss geprüft werden, ob es auch semantisch korrekt ist. Dazu gehören u.a. die Identifikation und Sammlung von Bezeichnern und die Zuordnung zur richtigen Ebene (Scopes) sowie die die Typ-Prüfung und -Inferenz.

In dieser Phase zeigen sich die Eigenschaften der zu verarbeitenden Sprache sehr deutlich, beispielsweise müssen Bezeichner deklariert sein vor der ersten Benutzung, welche Art von Scopes soll es geben, gibt es Klassen und Vererbung ...

Da hier der Kontext der Symbole eine Rolle spielt, wird diese Phase oft auch "Context Handling" oder "Kontext Analyse" bezeichnet. Neben attributierten Grammatiken sind die Symboltabellen wichtige Werkzeuge.

<a id="id-b03cfb7bbd7121b294faa1cf2cb22d2a4851d02c"></a>

#### SymbTab0: Überblick Symboltabellen

> [!IMPORTANT]
>
> <details open>
> <summary><strong>🎯 TL;DR</strong></summary>
>
> Auf die lexikalische Analyse und die Syntaxanalyse folgt die semantische Analyse. Nach dem Parsen steht fest, dass ein Programm syntaktisch korrekt ist. Nun muss geprüft werden, ob es auch semantisch korrekt ist. Dies umfasst in der Regel die Identifikation und Sammlung von Bezeichnern und die Zuordnung zur richtigen Ebene (Scopes). Außerdem muss die Nutzung von Symbolen validiert werden: Je nach Sprache müssen beispielsweise Variablen und Funktionen vor ihrer Benutzung zumindest deklariert sein; Funktionen sollten sich nicht wie Variablen benutzen lassen, ...
>
> Als Werkzeug werden (hierarchische) Tabellen eingesetzt, um die verschiedenen Symbole und Informationen darüber zu verwalten. Dabei werden die Symboltabelleneinträge oft an verschiedenen Stellen im Compiler generiert und benutzt.
>
> </details>

> [!TIP]
>
> <details open>
> <summary><strong>🎦 Videos</strong></summary>
>
> Vorlesung \[[YT](https://youtu.be/ZuTl8cuG0BA)\], \[[HSBI](https://www.hsbi.de/medienportal/album/video/cpl-symbtab0-berblick-symboltabellen/a68a24ee485352900f89916ebf20f5d1/254)\]
>
> </details>

##### Was passiert nach der Syntaxanalyse?

``` {.c size="footnotesize"}
int x = 42;
int f(int x) {
    int y = 9;
    return y+x;
}

x = f(x);
```

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/parsetree_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/parsetree.png" width="70%" /></picture></p>

Nach der Syntaxanalyse braucht der Compiler für die darauf folgenden Phasen **semantische Analyse**, Optimierung und Codegenerierung **Informationen über Bezeichner**, z.B.

-   Welcher Bezeichner ist gemeint?
-   Welchen Typ hat ein Bezeichner?

Auf dem Weg zum Interpreter/Compiler müssen die Symbole im AST korrekt zugeordnet werden. Dies geschieht über Symboltabellen. Im Folgenden werden wir verschiedene Aspekte von Symboltabellen betrachten und eine mögliche Implementierung erarbeiten, bevor wir uns (in [Interpreter](#id-84a69271af7716588de35dde4268e581639912d3)) um die Auswertung (Interpretation) des AST kümmern können.

###### Logische Compilierungsphasen

-   Die lexikalische Analyse generiert eine Folge von Token.
-   Die Syntaxanalyse generiert einen Parse Tree.

<!-- -->

-   Die semantische Analyse macht folgendes:
    -   Der Parse Tree wird in einen abstrakten Syntaxbaum (AST) umgewandelt.
    -   Dieser wird häufig mit Attributen annotiert.
    -   Dabei sind oft mehrere Baumdurchläufe nötig (z.B. wegen der Abhängigkeiten der Attribute).

<!-- -->

-   Nachfolgende Stufen:
    -   Der AST wird in einen Zwischencode umgewandelt mit Registern und virtuellen Adressen.
    -   Der Zwischencode wird optimiert.
    -   Aus dem optimierten Zwischencode wird der endgültige Code, aber immer noch mit virtuellen Adressen, generiert.
    -   Der generierte Code wird nachoptimiert.
    -   Der Linker ersetzt die virtuellen Adressen durch reale Adressen.

###### Abgrenzung der Phasen

Diese Phasen sind oft nicht klar unterscheidbar. Schon allein zur Verbesserung der Laufzeit baut der Parser oft schon den abstrakten Syntaxbaum auf, der Lexer trägt schon Bezeichner in Symboltabellen ein, der Parser berechnet beim Baumaufbau schon Attribute, ...

Oft werden gar nicht alle Phasen und alle Zwischendarstellungen benötigt.

##### Semantische Analyse und Symboltabellen

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/architektur_cb_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/architektur_cb.png" width="60%" /></picture></p>

##### Syntax und Semantik

-   **Syntaxregeln**: Formaler Aufbau eines Programms

<!-- -->

-   **Semantik**: Bedeutung eines (syntaktisch korrekten) Programms

=\> Keine Codegenerierung für syntaktisch/semantisch inkorrekte Programme!

Zur Erinnerung: Die *Syntaxregeln* einer Programmiersprache bestimmen den formalen Aufbau eines zu übersetzenden Programms. Die *Semantik* gibt die Bedeutung eines syntaktisch richtigen Programms an.

Lexikalische und syntaktische Analyse können formalisiert mit regulären Ausdrücken und endlichen Automaten, sowie mit CFG und Parsern durchgeführt werden.

Die Durchführung der semantischen Analyse ist stark von den Eigenschaften der zu übersetzenden Sprache, sowie der Zielsprache abhängig und kann hier nur beispielhaft für einige Eigenschaften erklärt werden.

Es darf kein lauffähiges Programm erstellt werden können, dass nicht syntaktisch und semantisch korrekt ist. Ein lauffähiges Programm muss syntaktisch und semantisch korrekt sein!

##### Aufgaben der semantischen Analyse

-   Identifikation und Sammlung der Bezeichner
-   Zuordnung zur richtigen Ebene (Scopes)

<!-- -->

-   Typ-Inferenz
-   Typkonsistenz (Ausdrücke, Funktionsaufrufe, ...)

<!-- -->

-   Validieren der Nutzung von Symbolen
    -   Vermeidung von Mehrfachdefinition
    -   Zugriff auf nicht definierte Bezeichner
    -   (Lesender) Zugriff auf nicht initialisierte Bezeichner
    -   Funktionen werden nicht als Variablen genutzt
    -   ...

Die semantische Analyse überprüft die Gültigkeit eines syntaktisch korrekten Programms bzgl. statischer semantischer Eigenschaften und liefert die Grundlage für die (Zwischen-) Codeerzeugung und -optimierung. Insbesondere wird hier die Typkonsistenz (in Ausdrücken, von Parametern, ...) überprüft, und implizite Typumwandlungen werden vorgenommen. Oft müssen Typen automatisch bestimmt werden (z.B. bei Polymorphie, Typinferenz). Damit Typen bestimmt oder angepasst werden können, müssen Bezeichner zunächst identifiziert werden, d.h. bei namensgleichen Bezeichnern der richtige Bezug bestimmt werden.

Zu Annotationen/Attributen, Typen und Type-Checks siehe VL [Typprüfungen, Attributgrammatiken](#id-aa1387a168900a8112482255228e763ff6c0d4d2)

=\> Ein wichtiges Hilfsmittel dazu sind **Symboltabellen**

###### Identifizierung von Objekten

Beim Compiliervorgang müssen Namen immer wieder den dazugehörigen Definitionen zugeordnet, ihre Eigenschaften gesammelt und geprüft und darauf zugegriffen werden. Symboltabellen werden im Compiler fast überall gebraucht (siehe Abbildung unter "Einordnung").

Welche Informationen zu einem Bezeichner gespeichert und ermittelt werden, ist dann abhängig von der Klasse des Bezeichners.

###### Validieren der Nutzung von Symbolen

Hier sind unendlich viele Möglichkeiten denkbar. Dies reicht von den unten aufgeführten Basisprüfungen bis hin zum Prüfen der Typkompatibilität bei arithmetischen Operationen. Dabei müssen für alle Ausdrücke die Ergebnistypen berechnet werden und ggf. automatische Konvertierungen vorgenommen werden, etwa bei `3+4.1` ...

-   Zugriff auf Variablen: Müssen sichtbar sein
-   Zugriff auf Funktionen: Vorwärtsreferenzen sind OK
-   Variablen werden nicht als Funktionen genutzt
-   Funktionen werden nicht als Variablen genutzt

=\> Verweis auf VL [Typprüfungen, Attributgrammatiken](#id-aa1387a168900a8112482255228e763ff6c0d4d2)

Da Funktionen bereits vor dem Bekanntmachen der Definition aufgerufen werden dürfen, bietet sich ein **zweimaliger Durchlauf** (*pass*) an: Beim ersten Traversieren des AST werden alle Definitionen in der Symboltabelle gesammelt. Beim zweiten Durchlauf werden dann die Referenzen aufgelöst.

###### Das Mittel der Wahl: Tabellen für die Symbole (= Bezeichner)

**Def.:** *Symboltabellen* sind die zentrale Datenstruktur zur Identifizierung und Verwaltung von bezeichneten Elementen.

Die Organisation der Symboltabellen ist stark anwendungsabhängig. Je nach Sprachkonzept gibt es eine oder mehrere Symboltabellen, deren Einträge vom Lexer oder Parser angelegt werden. Die jeweiligen Inhalte jedes einzelnen Eintrags kommen aus den verschiedenen Phasen der Compilierung. Symboltabellen werden oft als Hashtables oder auch als Bäume implementiert, manchmal als verkettete Listen. In seltenen Fällen kommt man auch mit einem Stack aus.

Eine Symboltabelle enthält benutzerdefinierte Bezeichner (oder Verweise in eine Hashtable mit allen vorkommenden Namen), manchmal auch die Schlüsselwörter der Programmiersprache. Die einzelnen Felder eines Eintrags variieren stark, abhängig vom Typ des Bezeichners (= Bezeichnerklasse).

Manchmal gibt es für Datentypen eine Extra-Tabelle, ebenso eine für die Werte von Konstanten.

Manchmal werden die Namen selbst in eine (Hash-) Tabelle geschrieben. Die Symboltabelle enthält dann statt der Namen Verweise in diese (Hash-) Tabelle.

##### Einfache Verwaltung von Variablen primitiven Typs

``` c
int x = 0;
int i = 0;

for (i=0; i<10; i++) {
    x++;
}
```

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/simpletable_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/simpletable.png" width="10%" /></picture></p>

**Bsp.:** Die zu übersetzende Sprache hat nur einen (den globalen) Scope und kennt nur Bezeichner für Variablen.

-   **Eine** Symboltabelle für **alle** Bezeichner
-   Jeder Bezeichner ist der Name einer Variablen
-   Symboltabelle wird evtl. mit Einträgen aller Schlüsselwörter initialisiert -- warum?
-   Scanner erkennt Bezeichner und sucht ihn in der Symboltabelle
-   Ist der Bezeichner nicht vorhanden, wird ein (bis auf den Namen leerer) Eintrag angelegt
-   Scanner übergibt dem Parser das erkannte Token und einen Verweis auf den Symboltabelleneintrag

Die Symboltabelle könnte hier eine (Hash-) Tabelle oder eine einfache verkettete Liste sein.

##### Was kann jetzt weiter passieren?

``` c
int x = 0;
int i = 0;

for (i=0; i<10; i++) {
    x++;
}

a = 42;
```

In vielen Sprachen muss überprüft werden, ob es ein definierendes Vorkommen des Bezeichners oder ein angewandtes Vorkommen ist.

###### Definitionen und Deklarationen von Bezeichnern

**Def.:** Die *Definition* eines (bisher nicht existenten) Bezeichners in einem Programm generiert einen neuen Bezeichner und legt für ihn seinem Typ entsprechend Speicherplatz an.

**Def.:** Unter der *Deklaration* eines (bereits existierenden) Bezeichners verstehen wir seine Bekanntmachung, damit er benutzt werden kann. Er ist oft in einem anderen Scope definiert und bekommt dort Speicherplatz zugeteilt.

Insbesondere werden auch Typen deklariert. Hier gibt es in der Regel gar keine Speicherplatzzuweisung.

Ein Bezeichner kann beliebig oft deklariert werden, während er in einem Programm nur einmal definiert werden kann. Oft wird bei der Deklarationen eines Elements sein Namensraum mit angegeben.

**Vorsicht**: Die Begriffe werden auch anders verwendet. Z.B. findet sich in der Java-Literatur der Begriff *Deklaration* anstelle von *Definition*.

**Anmerkung**: Deklarationen beziehen sich auf Definitionen, die woanders in einer Symboltabelle stehen, evtl. in einer anderen Datei, also in diesem Compilerlauf nicht zugänglich sind und erst von Linker aufgelöst werden können. Beim Auftreten einer Deklaration muss die dazugehörige Definition gesucht werden,und wenn vorhanden, im Symboltabelleneintrag für den deklarierten Bezeichner festgehalten werden. Hier ist evtl. ein zweiter Baumdurchlauf nötig, um alle offenen Deklarationen, die sich auf Definitionen in derselben Datei beziehen, aufzulösen.

Wird bei objektorientierten Sprachen ein Objekt definiert, dessen Klassendefinition in einer anderen Datei liegt, kann man die Definition des Objekts gleichzeitig als Deklaration der Klasse auffassen (Java).

##### Wo werden Verweise in Symboltabellen gebraucht?

=\> Parse Tree und AST enthalten Verweise auf Symboltabelleneinträge

-   Im Parse Tree enthält der Knoten für einen Bezeichner einen Verweis auf den Symboltabelleneintrag.
-   Parser und semantische Analyse (AST) vervollständigen die Einträge.
-   Attribute des AST können Feldern der Symboltabelle entsprechen, bzw. sich aus ihnen berechnen.
-   Für Debugging-Zwecke können die Symboltabellen die ganze Compilierung und das Linken überleben.

##### Grenzen der semantischen Analyse

**Welche semantischen Eigenschaften einer Sprache kann die semantische Analyse nicht überprüfen?**

-   Wer ist dann dafür verantwortlich?
-   Wie äußert sich das im Fehlerfall?

Dinge, die erst durch eine Ausführung/Interpretation eines Programms berechnet werden können.

Beispielsweise können Werte von Ausdrücken oft erst zur Laufzeit bestimmt werden. Insbesondere kann die semantische Analyse in der Regel nicht feststellen, ob ein Null-Pointer übergeben wird und anschließend dereferenziert wird.

##### Wrap-Up

-   Semantische Analyse:
    -   Identifikation und Sammlung der Bezeichner
    -   Zuordnung zur richtigen Ebene (Scopes)
    -   Validieren der Nutzung von Symbolen
    -   Typ-Inferenz
    -   Typkonsistenz (Ausdrücke, Funktionsaufrufe, ...)

<!-- -->

-   Symboltabellen: Verwaltung von Symbolen und Typen (Informationen über Bezeichner)
-   Symboltabelleneinträge werden an verschiedenen Stellen des Compilers generiert und benutzt

> [!TIP]
>
> <details open>
> <summary><strong>📖 Zum Nachlesen</strong></summary>
>
> -   Mogensen ([2017](#ref-Mogensen2017)): Kapitel 3
> -   Parr ([2014](#ref-Parr2014)): Kapitel 6.4 und 8.4
> -   Parr ([2010](#ref-Parr2010)): Kapitel 6, 7 und 8
>
> </details>

> [!NOTE]
>
> <details >
> <summary><strong>✅ Lernziele</strong></summary>
>
> -   k2: Ich kann die Aufgaben der semantischen Analyse an einem Beispiel erklären
> -   k2: Ich kann die Bedeutung von Symboltabellen erklären und die Aufgaben und Verbindung zu den Compiler-Phasen verdeutlichen
>
> </details>

<a id="id-322952562f00e1604c311da17b6a5207045e2ab1"></a>

#### SymbTab1: Nested Scopes

> [!IMPORTANT]
>
> <details open>
> <summary><strong>🎯 TL;DR</strong></summary>
>
> In Symboltabellen werden Informationen über Bezeichner verwaltet. Wenn es in der zu übersetzenden Sprache *Nested Scopes* gibt, spiegelt sich dies in den Symboltabellen wider: Auch hier wird eine entsprechende hierarchische Organisation notwendig. In der Regel nutzt man Tabellen, die untereinander verlinkt sind.
>
> Eine wichtige Aufgabe ist das Binden von Bezeichner gleichen Namens an ihren jeweiligen Scope =\> `bind()`. Zusätzlich müssen Symboltabellen auch das Abrufen von Bezeichnern aus dem aktuellen Scope oder den Elternscopes unterstützen =\> `resolve()`.
>
> </details>

> [!TIP]
>
> <details open>
> <summary><strong>🎦 Videos</strong></summary>
>
> Vorlesung \[[YT](https://youtu.be/W2BJqSuGh3g)\], \[[HSBI](https://www.hsbi.de/medienportal/album/video/cpl-symbtab1-nested-scopes/0b1b9519ca20436309120bc6fb8ce84c/254)\]
>
> </details>

##### Scopes und Name Spaces

**Def.:** Unter dem *Gültigkeitsbereich* (Sichtbarkeitsbereich, Scope) eines Bezeichners versteht man den Programmabschnitt, in dem der Bezeichner sichtbar und nutzbar ist. Das ist oft der kleinste umgebende Block, außer darin enthaltene Scopes, die ein eigenes Element dieses Namens benutzen.

Scopes sind fast immer hierarchisch angeordnet.

**Def.:** Unter einem *Namensraum* (name space) versteht man die Menge der zu einem Zeitpunkt sichtbaren Bezeichner.

Es gibt Sprachen, in denen man eigene Namensräume explizit definieren kann (z.B. C++).

Vorsicht: Diese Begriffe werden nicht immer gleich definiert und auch gerne verwechselt.

##### Symbole und (nested) Scopes

``` c
int x = 42;
float y;
{
    int x;
    x = 1;
    y = 2;
    { int y = x; }
}
```

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/nestedscopes_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/nestedscopes.png"  /></picture></p>

**Aufgaben**:

-   `bind()`: Symbole im Scope definieren
-   `resolve()`: Symbole aus Scope oder Eltern-Scope abrufen

###### Hinzunahme von Scopes

**Bsp.:** Die zu übersetzende Sprache ist scope-basiert und kennt nur Bezeichner für Variablen

Scopes können ineinander verschachtelt sein. Die Spezifikation der zu übersetzenden Sprache legt fest, in welcher Reihenfolge Scopes zu durchsuchen sind, wenn auf einen Bezeichner Bezug genommen wird, der nicht im aktuellen Scope definiert ist.

Insgesamt bilden die Scopes oft eine Baumstruktur, wobei jeder Knoten einen Scope repräsentiert und seine Kinder die direkt in ihm enthaltenen Scopes sind. Dabei ist es in der Regel so, dass Scopes sich entweder vollständig überlappen oder gar nicht. Wenn ein Bezeichner nicht im aktuellen Scope vorhanden ist, muss er in der Regel in umschließenden Scopes gesucht werden. Hier kann ein Stack aller "offenen" Scopes benutzt werden.

###### Grundlegendes Vorgehen

Das Element, das einen neuen Scope definiert, steht selbst in dem aktuell behandelten Scope. Wenn dieses Element selbst ein Bezeichner ist, gehört dieser in den aktuellen Scope. Nur das, was nur innerhalb des oben genannten Elements oder Bezeichners definiert wird, gehört in den Scope des Elements oder Bezeichners.

##### Nested Scopes: Symbole und Scopes

###### Implementierung mit hierarchischen (verketteten) Tabellen

Pro Scope wird eine Symboltabelle angelegt, dabei enthält jede Symboltabelle zusätzlich einen Verweis auf ihre Vorgängersymboltabelle für den umgebenden Scope. Die globale Symboltabelle wird typischerweise mit allen Schlüsselwörtern initialisiert.

-   Wenn ein neuer Scope betreten wird, wird eine neue Symboltabelle erzeugt.
-   Scanner: Erkennt Bezeichner und sucht ihn in der Symboltabelle des aktuellen Scopes bzw. trägt ihn dort ein und übergibt dem Parser das erkannte Token und einen Verweis auf den Symboltabelleneintrag (**Erinnerung**: Der Scanner wird i.d.R. vom Parser aus aufgerufen, d.h. der Parser setzt den aktuellen Scope!)
-   Parser:
    -   Wird ein neues Element (ein Bezeichner) definiert, muss bestimmt werden, ob es einen eigenen Scope hat. Wenn ja, wird eine neue Symboltabelle für den Scope angelegt. Sie enthält alle Definitionen von Elementen, die in diesem Scope liegen. Der Bezeichner selbst wird in die aktuelle Symboltabelle eingetragen mit einem Verweis auf die neue Tabelle, die all die Bezeichner beinhaltet, die außerhalb dieses Scopes nicht sichtbar sein sollen. Die Tabellen werden untereinander verzeigert.
    -   Wird ein Element deklariert oder benutzt, muss sein Eintrag in allen sichtbaren Scopes in der richtigen Reihenfolge entlang der Verzeigerung gesucht (und je nach Sprachdefinition auch gefunden) werden.
-   Der Parse-Tree enthält im Knoten für den Bezeichner den Verweis in die Symboltabelle

###### Klassenhierarchie für Scopes

Für die Scopes wird eine Klasse `Scope` definiert mit den Methoden `bind()` (zum Definieren von Symbolen im Scope) und `resolve()` (zum Abrufen von Symbolen aus dem Scope oder dem umgebenden Scope).

Für lokale Scopes wird eine Instanz dieser Klasse angelegt, die eine Referenz auf den einschließenden Scope im Attribut `enclosingScope` hält. Für den globalen Scope ist diese Referenz einfach leer (`None`).

###### Klassen und Interfaces für Symbole

Für die Symbole gibt es die Klasse `Symbol`, wo für jedes Symbol Name und Typ gespeichert wird. Variablensymbole leiten direkt von dieser Klasse ab. Für die eingebauten Typen wird ein "Marker-Interface" `Type` erstellt, um Variablen- und Typ-Symbole unterscheiden zu können.

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/nestedscopesuml_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/nestedscopesuml.png" width="60%" /></picture></p>

Quelle: Nested Scopes: Eigene Modellierung nach einer Idee in ([Parr 2010](#ref-Parr2010), p. 142)

###### Alternative Implementierung über einen Stack

-   Der Parse Tree bzw. der AST enthalten an den Knoten, die jeweils einen ganzen Scope repräsentieren, einen Verweis auf die Symboltabelle dieses Scopes.
-   Die Scopes werden in einem Stack verwaltet.
-   Wird ein Scope betreten beim Baumdurchlauf, wird ein Verweis auf seine Symboltabelle auf den Stack gepackt.
-   Die Suche von Bezeichnern in umliegenden Scopes erfordert ein Durchsuchen des Stacks von oben nach unten.
-   Beim Verlassen eines Scopes beim Baumdurchlauf wird der Scope vom Stack entfernt.

##### Nested Scopes: Definieren und Auflösen von Namen

``` python
class Scope:
    Scope enclosingScope    # None if global (outermost) scope
    Symbol<String, Symbol> symbols

    def resolve(name):
        # do we know "name" here?
        if symbols[name]: return symbols[name]
        # if not here, check any enclosing scope
        if enclosingScope: return enclosingScope.resolve(name)
        else: return None     # not found

    def bind(symbol):
        symbols[symbol.name] = symbol
        symbol.scope = self     # track the scope in each symbol
```

Quelle: Nested Scopes: Eigene Implementierung nach einer Idee in ([Parr 2010](#ref-Parr2010), p. 169)

**Anmerkung**: In der Klasse `Symbol` kann man ein Feld `scope` vom Typ `Scope` implementieren. Damit "weiss" jedes Symbol, in welchem Scope es definiert ist und man muss sich auf der Suche nach dem Scope eines Symbols ggf. nicht erst durch die Baumstruktur hangeln. Aus technischer Sicht verhindert das Attribut das Aufräumen eines lokalen Scopes durch den Garbage Collector, wenn man den lokalen Scope wieder verlässt: Jeder Scope hat eine Referenz auf den umgebenden (Eltern-) Scope (Feld `enclosingScope`). Wenn man den aktuellen Scope "nach oben" verlässt, würde der eben verlassene lokale Scope bei nächster Gelegenheit aufgeräumt, wenn es keine weiteren Referenzen auf diesen gäbe. Da nun aber die Symbole, die in diesem Scope definiert wurden, auf diesen verweisen, passiert das nicht :)

##### Nested Scopes: Listener

Mit einem passenden Listener kann man damit die nötigen Scopes aufbauen:

-   `enterStart`:
    -   erzeuge neuen globalen Scope
    -   definiere und pushe die eingebauten Typen
-   `exitVarDecl`:
    -   löse den Typ der Variablen im aktuellen Scope auf
    -   definiere ein neues Variablensymbol im aktuellen Scope
-   `exitVar`:
    -   löse die Variable im aktuellen Scope auf
-   `enterBlock`:
    -   erzeuge neuen lokalen Scope, wobei der aktuelle Scope der Elternscope ist
    -   ersetze den aktuellen Scope durch den lokalen Scope
-   `exitBlock`:
    -   ersetze den aktuellen Scope durch dessen Elternscope

``` {.yacc size="footnotesize"}
start   :   stat+ ;

stat    : block | varDecl | expr ';' ;
block   : '{' stat* '}' ;

varDecl : type ID ('=' expr)? ';' ;
expr    : var '=' INT ;

var     : ID ;
type    : 'float' | 'int' ;
```

Relevanter Ausschnitt aus der Grammatik

``` {.c size="footnotesize"}
int x = 42;

{ int y = 9; x = 7; }
```

``` {.python size="footnotesize"}
class MyListener(BaseListener):
    Scope scope

    def enterStart(Parser.FileContext ctx):
        globals = Scope()
        globals.bind(BuiltIn("int"))
        globals.bind(BuiltIn("float"))
        scope = globals

    def enterBlock(Parser.BlockContext ctx):
        scope = Scope(scope)
    def exitBlock(Parser.BlockContext ctx):
        scope = scope.enclosingScope

    def exitVarDecl(Parser.VarDeclContext ctx):
        t = scope.resolve(ctx.type().getText())
        var = Variable(ctx.ID().getText(), t)
        scope.bind(var)
    def exitVar(Parser.VarContext ctx):
        name = ctx.ID().getText()
        var = scope.resolve(name)
        if var == None: error("no such var: " + name)
```

*Anmerkung*: Um den Code auf die Folie zu bekommen, ist dies ein Mix aus Java und Python geworden. Sry ;)

In der Methode `exitVar()` wird das Variablensymbol beim Ablaufen des AST lediglich aufgelöst und ein Fehler geworfen, wenn das Variablensymbol (noch) nicht bekannt ist. Hier könnte man weiteres Type-Checking und/oder -Propagation ansetzen.

Später im Interpreter muss an dieser Stelle dann aber auch der **Wert** der Variablen abgerufen werden ...

##### Löschen von Symboltabellen

Möglicherweise sind die Symboltabellen nach der Identifizierungsphase der Elemente überflüssig, weil die zusammengetragenen Informationen als Attribute im AST stehen. Die Knoten enthalten dann Verweise auf definierende Knoten von Elementen, nicht mehr auf Einträge in den Symboltabellen. In diesem Fall können die Symboltabellen nach der Identifizierung gelöscht werden, wenn sie nicht z.B. für einen symbolischen Debugger noch gebraucht werden.

##### Wrap-Up

-   Symboltabellen: Verwaltung von Symbolen und Typen (Informationen über Bezeichner)

<!-- -->

-   Blöcke: Nested Scopes =\> hierarchische Organisation
-   Binden von Bezeichner gleichen Namens an ihren jeweiligen Scope =\> `bind()`
-   Abrufen von Bezeichnern aus dem aktuellen Scope oder den Elternscopes =\> `resolve()`

> [!TIP]
>
> <details open>
> <summary><strong>📖 Zum Nachlesen</strong></summary>
>
> -   Mogensen ([2017](#ref-Mogensen2017)): Kapitel 3
> -   Parr ([2014](#ref-Parr2014)): Kapitel 6.4 und 8.4
> -   Parr ([2010](#ref-Parr2010)): Kapitel 6, 7 und 8
>
> </details>

> [!NOTE]
>
> <details >
> <summary><strong>✅ Lernziele</strong></summary>
>
> -   k3: Ich kann Symboltabellen für Nested Scopes implementieren unter Nutzung von passenden Strukturen/Klassen und einem Listener
> -   k3: Ich kann Symbole über die Scopes auflösen
> -   k3: Ich kann einfache statische Prüfungen anhand der Symboltabellen durchführen
>
> </details>

<a id="id-33adf70dd90f23c46f778c96105777a5280a334c"></a>

#### SymbTab2: Funktionen

> [!IMPORTANT]
>
> <details open>
> <summary><strong>🎯 TL;DR</strong></summary>
>
> Eine Funktion sind selbst ein Symbol, welches in einem Scope gilt und entsprechend in der Symboltabelle eingetragen wird. Darüber hinaus bildet sie einen neuen verschachtelten Scope, in dem die Funktionsparameter und der Funktionskörper definiert werden müssen.
>
> Entsprechend müssen die Strukturen für die Symboltabellen sowie das Eintragen und das Auflösen von Symbolen erweitert werden.
>
> </details>

> [!TIP]
>
> <details open>
> <summary><strong>🎦 Videos</strong></summary>
>
> Vorlesung \[[YT](https://youtu.be/2eVsgOwfoXw)\], \[[HSBI](https://www.hsbi.de/medienportal/album/video/cpl-symbtab2-funktionen/47fb53a87c68a0973f40876c83e99ede/254)\]
>
> </details>

##### Funktionen und Scopes

``` c
int x = 42;
int y;
void f() {
    int x;
    x = 1;
    y = 2;
    { int y = x; }
}
void g(int z){}
```

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/functionscopes_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/functionscopes.png"  /></picture></p>

###### Behandlung von Funktionsdefinitionen

-   Jeder Symboltabelleneintrag braucht ein Feld, das angibt, ob es sich um eine Variable, eine Funktion, ... handelt. Alternativ eine eigene Klasse ableiten ...
-   Der Name der Funktion steht als Bezeichner in der Symboltabelle des Scopes, in dem die Funktion definiert wird.
-   Der Symboltabelleneintrag für den Funktionsnamen enthält Verweise auf die Parameter.
-   Der Symboltabelleneintrag für den Funktionsnamen enthält Angaben über den Rückgabetypen.
-   Jede Funktion wird grundsätzlich wie ein neuer Scope behandelt.
-   Die formalen Parameter werden als Einträge in der Symboltabelle für den Scope der Funktion angelegt and entsprechend als Parameter gekennzeichnet.

###### Behandlung von Funktionsaufrufen

-   Der Name der Funktion steht als Bezeichner in der Symboltabelle des Scopes, in dem die Funktion aufgerufen wird und wird als Aufruf gekennzeichnet.
-   Der Symboltabelleneintrag für den Funktionsnamen enthält Verweise auf die aktuellen Parameter.
-   Die Definition der Funktion wird in den zugänglichen Scopes gesucht (wie oben) und ein Verweis darauf in der Symboltabelle gespeichert.

##### Erweiterung des Klassendiagramms für Funktions-Scopes

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/functionscopesuml_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/functionscopesuml.png" width="65%" /></picture></p>

Quelle: Funktions-Scopes: Eigene Modellierung nach einer Idee in ([Parr 2010](#ref-Parr2010), p. 147)

##### Funktionen sind Symbole *und* Scopes

``` python
class Function(Scope, Symbol):
    def __init__(name, retType, enclScope):
        Symbol.__init__(name, retType)      # we are "Symbol" ...
        enclosingScope = enclScope          # ... and "Scope"
```

##### Funktionen: Listener

Den Listener zum Aufbau der Scopes könnte man entsprechend erweitern:

-   `enterFuncDecl`:
    -   löse den Typ der Funktion im aktuellen Scope auf
    -   lege neues Funktionssymbol an, wobei der aktuelle Scope der Elternscope ist
    -   definiere das Funktionssymbol im aktuellen Scope
    -   ersetze den aktuellen Scope durch das Funktionssymbol
-   `exitFuncDecl`:
    -   ersetze den aktuellen Scope durch dessen Elternscope
-   `exitParam`: analog zu `exitVarDecl`
    -   löse den Typ der Variablen im aktuellen Scope auf
    -   definiere ein neues Variablensymbol im aktuellen Scope
-   `exitCall`: analog zu `exitVar`
    -   löse das Funktionssymbol (und die Argumente) im aktuellen Scope auf

``` {.yacc size="footnotesize"}
funcDecl : type ID '(' params? ')' block ;
params   : param (',' param)* ;
param    : type ID ;

call     : ID '(' exprList? ')' ;
exprList : expr (',' expr)* ;
```

Relevanter Ausschnitt aus der Grammatik

``` {.c size="footnotesize"}
int f(int x) {
    int y = 9;
}

int x = f(x);
```

``` {.python size="footnotesize"}
def enterFuncDecl(Parser.FuncDeclContext ctx):
    name = ctx.ID().getText()
    type = scope.resolve(ctx.type().getText())
    func = Function(name, type, scope)
    scope.bind(func)
    # change current scope to function scope
    scope = func

def exitFuncDecl(Parser.FuncDeclContext ctx):
    scope = scope.enclosingScope
def exitParam(Parser.ParamContext ctx):
    t = scope.resolve(ctx.type().getText())
    var = Variable(ctx.ID().getText(), t)
    scope.bind(var)

def exitCall(Parser.CallContext ctx):
    name = ctx.ID().getText()
    func = scope.resolve(name)
    if func == None:
        error("no such function: " + name)
    if func.type == Variable:
        error(name + " is not a function")
```

*Anmerkung*: Um den Code auf die Folie zu bekommen, ist dies wieder ein Mix aus Java und Python geworden. Sry ;)

Im Vergleich zu den einfachen *nested scopes* kommt hier nur ein weiterer Scope für den Funktionskopf dazu. Dieser spielt eine Doppelrolle: Er ist sowohl ein Symbol (welches im Elternscope bekannt ist) als auch ein eigener (lokaler) Scope für die Funktionsparameter.

Um später im Interpreter eine Funktion tatsächlich auswerten zu können, muss im Scope der Funktion zusätzlich der AST-Knoten der Funktionsdefinition gespeichert werden (weiteres Feld/Attribut in `Function`)!

##### Wrap-Up

-   Symboltabellen: Verwaltung von Symbolen und Typen (Informationen über Bezeichner)

<!-- -->

-   Funktionen: Nested Scopes =\> hierarchische Organisation
-   Umgang mit dem Funktionsnamen, den Parametern und dem Funktionskörper

> [!TIP]
>
> <details open>
> <summary><strong>📖 Zum Nachlesen</strong></summary>
>
> -   Mogensen ([2017](#ref-Mogensen2017)): Kapitel 3
> -   Parr ([2014](#ref-Parr2014)): Kapitel 6.4 und 8.4
> -   Parr ([2010](#ref-Parr2010)): Kapitel 6, 7 und 8
>
> </details>

> [!NOTE]
>
> <details >
> <summary><strong>✅ Lernziele</strong></summary>
>
> -   k3: Ich kann Symboltabellen für Nested Scopes implementieren unter Nutzung von passenden Strukturen/Klassen und einem Listener
> -   k3: Ich kann Parameter und lokale Variablen von Funktionen auflösen
>
> </details>

> [!IMPORTANT]
>
> <details open>
> <summary><strong>🏅 Challenges</strong></summary>
>
> Diskutieren Sie folgende Fragen:
>
> -   Warum werden überhaupt Symboltabellen eingesetzt?
> -   Warum muss man zwischen Deklaration und Definition unterscheiden?
> -   Erklären Sie die Verbindung einer Symboltabelle zu den einzelnen Phasen einer Compiler-Pipeline.
> -   Wo liegen die Grenzen der semantischen Analyse?
> -   Warum kann man im Allgemeinen nicht die Symboltabellen nutzen, um die Werte von Symbolen mit zu speichern?
> -   Wieso sind Funktionen Scope und Symbol gleichzeitig?
> -   Skizzieren Sie für eine Funktionsdeklaration mit Parametern die resultierende Symboltabelle.
> -   Erklären Sie, wie man beim Funktionsaufruf vorgehen würde. Werden dabei Einträge in der Symboltabelle erzeugt?
>
> </details>

<a id="id-c6b409593a5212956e56ab3ed20b74aa86f4c204"></a>

#### SymbTab3: Strukturen und Klassen

> [!IMPORTANT]
>
> <details open>
> <summary><strong>🎯 TL;DR</strong></summary>
>
> Strukturen und Klassen bilden jeweils einen eigenen verschachtelten Scope, worin die Attribute und Methoden definiert werden.
>
> Bei der Namensauflösung muss man dies beachten und darf beim Zugriff auf Attribute und Methoden nicht einfach in den übergeordneten Scope schauen. Zusätzlich müssen hier Vererbungshierarchien in der Struktur der Symboltabelle berücksichtigt werden.
>
> </details>

> [!TIP]
>
> <details open>
> <summary><strong>🎦 Videos</strong></summary>
>
> Vorlesung \[[YT](https://youtu.be/GQj76LlTAzY)\], \[[HSBI](https://www.hsbi.de/medienportal/album/video/cpl-symbtab3-strukturen-und-klassen/22592c83b6275e326ba611778cf39916/254)\]
>
> </details>

##### Strukturen

``` c
struct A {
    int x;
    struct B {int x;};
    B b;
    struct C {int z;};
};
A a;
void f() {
    A a;
    a.b.x = 42;
}
```

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/structscopes_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/structscopes.png"  /></picture></p>

##### Strukturen: Erweiterung der Symbole und Scopes

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/structscopesuml_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/structscopesuml.png" width="80%" /></picture></p>

Quelle: Structs: Eigene Modellierung nach einer Idee in ([Parr 2010](#ref-Parr2010), p. 162)

Strukturen stellen wie Funktionen sowohl einen Scope als auch ein Symbol dar.

Zusätzlich stellt eine Struktur (-definition) aber auch einen neuen Typ dar, weshalb `Struct` auch noch das Interface `Type` "implementiert".

##### Strukturen: Auflösen von Namen

``` python
class Struct(Scope, Symbol, Type):
    def resolveMember(name):
        return symbols[name]
```

=\> Auflösen von "`a.b`"(im Listener in `exitMember()`):

-   `a` im "normalen" Modus mit `resolve()` über den aktuellen Scope
-   Typ von `a` ist `Struct` mit Verweis auf den eigenen Scope
-   `b` nur innerhalb des `Struct`-Scopes mit `resolveMember()`

In der Grammatik würde es eine Regel `member` geben, die auf eine Struktur der Art `ID.ID` anspricht (d.h. eigentlich den Teil `.ID`), und entsprechend zu Methoden `enterMember()` und `exitMember()` im Listener führt.

Das Symbol für `a` hat als `type`-Attribut eine Referenz auf die `Struct`, die ja einen eigenen Scope hat (`symbols`-Map). Darin muss dann `b` aufgelöst werden.

##### Klassen

``` cpp
class A {
public:
    int x;
    void foo() { ; }
};
class B : public A {
public
    int y;
    void foo() {
        int z = x+y;
    }
};
```

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/classscopes_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/classscopes.png"  /></picture></p>

##### Klassen: Erweiterung der Symbole und Scopes

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/classscopesuml_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/classscopesuml.png" width="80%" /></picture></p>

Quelle: Klassen: Eigene Modellierung nach einer Idee in ([Parr 2010](#ref-Parr2010), p. 167)

Bei Klassen kommt in den Tabellen ein weiterer Pointer `parentClazz` auf die Elternklasse hinzu (in der Superklasse ist der Wert `None`).

##### Klassen: Auflösen von Namen

``` {.python size="footnotesize"}
class Clazz(Struct):
    Clazz parentClazz   # None if base class

    def resolve(name):
        # do we know "name" here?
        if symbols[name]: return symbols[name]
        # NEW: if not here, check any parent class ...
        if parentClazz and parentClazz.resolve(name): return parentClazz.resolve(name)
        else:
            # ... or enclosing scope if base class
            if enclosingScope: return enclosingScope.resolve(name)
            else: return None     # not found

    def resolveMember(name):
        if symbols[name]: return symbols[name]
        # NEW: check parent class
        if parentClazz: return parentClazz.resolveMember(name)
        else: return None
```

Quelle: Klassen: Eigene Implementierung nach einer Idee in ([Parr 2010](#ref-Parr2010), p. 172)

**Hinweis**: Die obige Implementierungsskizze soll vor allem das Prinzip demonstrieren - sie ist aus Gründen der Lesbarkeit nicht besonders effizient: beispielsweise wird `parentClazz.resolve(name)` mehrfach evaluiert ...

Beim Auflösen von Attributen oder Methoden muss zunächst in der Klasse selbst gesucht werden, anschließend in der Elternklasse.

Beispiel (mit den obigen Klassen `A` und `B`):

``` cpp
B foo;
foo.x = 42;
```

Hier wird analog zu den Structs zuerst `foo` mit `resolve()` im lokalen Scope aufgelöst. Der Typ des Symbols `foo` ist ein `Clazz`, was zugleich ein Scope ist. In diesem Scope wird nun mit `resolveMember()` nach dem Symbol `x` gesucht. Falls es hier nicht gefunden werden kann, wird in der Elternklasse (sofern vorhanden) weiter mit`resolveMember()` gesucht.

Die normale Namensauflösung wird ebenfalls erweitert um die Auflösung in der Elternklasse.

Beispiel:

``` cpp
int wuppie;
class A {
public:
    int x;
    void foo() { ; }
};
class B : public A {
public
    int y;
    void foo() {
        int z = x+y+wuppie;
    }
};
```

Hier würde `wuppie` als Symbol im globalen Scope definiert werden. Beim Verarbeiten von `int z = x+y+wuppie;` würde mit `resolve()` nach `wuppie` gesucht: Zuerst im lokalen Scope unterhalb der Funktion, dann im Funktions-Scope, dann im Klassen-Scope von `B`. Hier sucht `resolve()` auch zunächst lokal, geht dann aber die Vererbungshierarchie entlang (sofern wie hier vorhanden). Erst in der Superklasse (wenn der `parentClazz`-Zeiger `None` ist), löst `resolve()` wieder normal auf und sucht um umgebenden Scope. Auf diese Weise kann man wie gezeigt in Klassen (Methoden) auf globale Variablen verweisen ...

*Anmerkung*: Durch dieses Vorgehen wird im Prinzip in Methoden aus dem Zugriff auf ein Feld `x` implizit ein `this.x` aufgelöst, wobei `this` die Klasse auflöst und `x` als Attribut darin.

##### Wrap-Up

-   Symboltabellen: Verwaltung von Symbolen und Typen (Informationen über Bezeichner)

<!-- -->

-   Strukturen und Klassen bilden eigenen Scope
-   Strukturen/Klassen lösen etwas anders auf: Zugriff auf Attribute und Methoden

> [!TIP]
>
> <details open>
> <summary><strong>📖 Zum Nachlesen</strong></summary>
>
> -   Mogensen ([2017](#ref-Mogensen2017)): Kapitel 3
> -   Parr ([2014](#ref-Parr2014)): Kapitel 6.4 und 8.4
> -   Parr ([2010](#ref-Parr2010)): Kapitel 6, 7 und 8
>
> </details>

> [!NOTE]
>
> <details >
> <summary><strong>✅ Lernziele</strong></summary>
>
> -   k3: Ich kann Symboltabellen für Nested Scopes implementieren unter Nutzung von passenden Strukturen/Klassen und einem Listener
> -   k3: Ich kann Attribute von Klassen und Strukturen auflösen
>
> </details>

> [!IMPORTANT]
>
> <details open>
> <summary><strong>🏅 Challenges</strong></summary>
>
> **Symboltabellen praktisch**
>
> Betrachten Sie folgenden Java-Code:
>
> 1.  Umkreisen Sie alle Symbole.
> 2.  Zeichen Sie Pfeile von Symbol-Referenzen zur jeweiligen Definition (falls vorhanden).
> 3.  Identifizieren Sie alle benannten Scopes.
> 4.  Identifizieren Sie alle anonymen Scopes.
> 5.  Geben Sie die resultierende Symboltabelle an (Strukturen wie in VL besprochen).
>
> ``` java
> package a.b;
>
> import u.Y;
>
> class X extends Y {
>     int f(int x) {
>         int x,y;
>         { int x; x - y + 1; }
>         x = y + 1;
>     }
> }
>
> class Z {
>     class W extends X {
>         int x;
>         void foo() { f(34); }
>     }
>     int x,z;
>     int f(int x) {
>         int y;
>         y = x;
>         z = x;
>     }
> }
> ```
>
> </details>

<a id="id-aa1387a168900a8112482255228e763ff6c0d4d2"></a>

#### Typen, Type Checking und Attributierte Grammatiken

> [!TIP]
>
> <details open>
> <summary><strong>🖇 Weitere Unterlagen</strong></summary>
>
> -   [Annotierte Folien: Typen, Type Checking und attributierte Grammatiken](https://github.com/Compiler-CampusMinden/AnnotatedSlides/blob/master/semantics_attribgrammars.ann.ma.pdf)
>
> </details>

##### Motivation

###### Ist das alles erlaubt?

Operation erlaubt?

Zuweisung erlaubt?

Welcher Ausdruck hat welchen Typ?

(Welcher Code muss dafür erzeugt werden?)

-   a = b
-   a = f(b)
-   a = b + c
-   a = b + o.nummer
-   if (f(a) == f(b))

###### Taschenrechner: Parsen von Ausdrücken wie `3*5+4`

    expr : expr '+' term
         | term
         ;
    term : term '*' DIGIT
         | DIGIT
         ;

    DIGIT : [0-9] ;

=\> Wie den Ausdruck **ausrechnen**?

*Anmerkung*: Heute geht es um die einfachste Form der semantischen Analyse: Anreichern einer Grammatik um Attribute und Aktionen, die während des Parsens oder bei der Traversierung des Parse-Trees ausgewertet werden.

##### Semantische Analyse

###### Das haben wir bis jetzt

Wir haben den AST vorliegen.

Idealerweise enthält er bei jedem Bezeichner einen Verweis in sogenannte Symboltabellen (siehe spätere Veranstaltung).

###### Was kann beim Parsen schon überprüft / bestimmt werden?

Hier entsteht ein Tafelbild.

###### Was fehlt jetzt noch?

Kontextsensitive Analysen

Hier entsteht ein Tafelbild.

##### Analyse von Datentypen

###### Typisierung

-   stark oder statisch typisierte Sprachen: Alle oder fast alle Typüberprüfungen finden in der semantischen Analyse statt (C, C++, Java)

-   schwach oder dynamisch typisierte Sprachen: Alle oder fast alle Typüberprüfungen finden zur Laufzeit statt (Python, Lisp, Perl)

-   untypisierte Sprachen: keinerlei Typüberprüfungen (Maschinensprache)

###### Ausdrücke

Jetzt muss für jeden Ausdruck im weitesten Sinne sein Typ bestimmt werden.

Ausdrücke können hier sein:

-   rechte Seiten von Zuweisungen

-   linke Seiten von Zuweisungen

-   Funktions- und Methodenaufrufe

-   jeder einzelne aktuelle Parameter in Funktions- und Methodenaufrufen

-   Bedingungen in Kontrollstrukturen

###### Typinferenz

**Def.:** *Typinferenz* ist die Bestimmung des Datentyps jedes Bezeichners und jedes Ausdrucks im Code.

-   Die Typen von Unterausdrücken bestimmen den Typ eines Ausdrucks

-   Kalkül mit sog. Inferenzregeln der Form

    $$\frac{f:s \rightarrow t\ \ \ \ \ x:s}{f(x) : t}$$

    *(Wenn f den Typ $s \rightarrow t$ hat und x den Typ s, dann hat der Ausdruck f(x) den Typ t.)*

-   z\. B. zur Auflösung von Überladung und Polymorphie zur Laufzeit

###### Statische Typprüfungen

**Bsp.:** Der + - Operator:

| Typ 1. Operand | Typ 2. Operand | Ergebnistyp |
|:--------------:|:--------------:|:-----------:|
|      int       |      int       |     int     |
|     float      |     float      |    float    |
|      int       |     float      |    float    |
|     float      |      int       |    float    |
|     string     |     string     |   string    |

###### Typkonvertierungen

-   Der Compiler kann implizite Typkonvertierungen vornehmen, um einen Ausdruck zu verifizieren (siehe Sprachdefiniton)

-   Typerweiterungen, z.B. von *int* nach *float* oder

-   Bestimmung des kleinsten umschließenden Typ vorliegender Typen

-   *Type Casts*: explizite Typkonvertiereungen

###### Nicht grundsätzlich statisch mögliche Typprüfungen

**Bsp.:** Der `^`-Operator $(a^b)$:

| Typ 1. Operand | Typ 2. Operand | Ergebnistyp |
|:--------------:|:--------------:|:-----------:|
|      int       |  int $\geq$ 0  |     int     |
|      int       |    int \< 0    |    float    |
|      int       |     float      |    float    |
|    $\ldots$    |    $\ldots$    |  $\ldots$   |

##### Attributierte Grammatiken

###### Was man damit macht

Die Syntaxanalyse kann keine kontextsensitiven Analysen durchführen

-   Kontextsensitive Grammatiken benutzen: Laufzeitprobleme, das Parsen von cs-Grammatiken ist *PSPACE-complete*

-   Parsergenerator *Bison*: generiert LALR(1)-Parser, aber auch sog. *Generalized LR (GLR) Parser*, die bei nichtlösbaren Konflikten in der Grammatik (Reduce/Reduce oder Shift/Reduce) parallel den Input mit jede der Möglichkeiten weiterparsen

-   Anderer Ansatz: Berücksichtigung kontextsensitiver Abhängigkeiten mit Hilfe attributierter Grammatiken, zur Typanalyse, auch zur Codegenerierung

-   Weitergabe von Informationen im Baum

##### Syntax-gesteuerte Übersetzung: Attribute und Aktionen

###### Berechnen der Ausdrücke

    expr : expr '+' term ;

    translate expr ;
    translate term ;
    handle + ;

###### Attributierte Grammatiken (SDD)

auch "*syntax-directed definition*"

Anreichern einer CFG:

-   Zuordnung einer Menge von Attributen zu den Symbolen (Terminal- und Nicht-Terminal-Symbole)

-   Zuordnung einer Menge von *semantischen Regeln* (Evaluationsregeln) zu den Produktionen

###### Definition: Attributierte Grammatik

Eine *attributierte Grammatik* *AG = (G,A,R)* besteht aus folgenden Komponenten:

-   Mengen A(X) der Attribute eines Nonterminals X

-   *G = (N, T, P, S)* ist eine cf-Grammatik

-   A = $\bigcup\limits_{X \in (T \cup N)} A(X)$ mit $A(X) \cap A(Y) \neq \emptyset \Rightarrow X = Y$

-   R = $\bigcup\limits_{p \in P} R(p)$ mit $R(p) = \lbrace X_i.a = f(\ldots) \vert p : X_0 \rightarrow X_1 \ldots X_n \in P, X_i.a \in A(X_i), 0 \leq i \leq n\rbrace$

###### Abgeleitete und ererbte Attribute

Die in einer Produktion p definierten Attribute sind

*AF(p)* = $\lbrace X_i.a \ \vert\  p : X_0 \rightarrow X_1 \ldots X_n \in P,  0 \leq i \leq n, X_i.a = f(\ldots) \in R(p)\rbrace$

Disjunkte Teilmengen der Attribute: abgeleitete (synthesized) Attributen *AS(X)* und ererbte (inherited) Attributen *AI(X)*:

-   *AS(X)* = $\lbrace X.a\ \vert \ \exists p : X \rightarrow X_1 \ldots X_n \in P, X.a \in AF(p)\rbrace$

-   *AI(X)* = $\lbrace X.a\ \vert \ \exists q : Y \rightarrow uXv \in P, X.a\in AF(q)\rbrace$

Abgeleitete Attribute geben Informationen von unten nach oben weiter, geerbte von oben nach unten.

*Abhängigkeitsgraphen* stellen die Abhängigkeiten der Attribute dar.

###### Beispiel: Attributgrammatiken

| Produktion       | Semantische Regel           |
|:-----------------|:----------------------------|
| `e : e1 '+' t ;` | `e.val = e1.val + t.val`    |
| `e : t ;`        | `e.val = t.val`             |
| `t : t1 '*' D ;` | `t.val = t1.val * D.lexval` |
| `t : D ;`        | `t.val = D.lexval`          |

| Produktion            | Semantische Regel             |
|:----------------------|:------------------------------|
| `t : D t' ;`          | `t'.inh = D.lexval`           |
|                       | `t.syn = t'.syn`              |
| `t' : '*' D t'1 ;`    | `t'1.inh = t'.inh * D.lexval` |
|                       | `t'.syn = t'1.syn`            |
| `t' :` $\epsilon$ `;` | `t'.syn = t'.inh`             |

Wenn ein Nichtterminal mehr als einmal in einer Produktion vorkommt, werden die Vorkommen nummeriert. (t, t1; t', t'1)

##### S-Attributgrammatiken und L-Attributgrammatiken

###### S-Attributgrammatiken

*S-Attributgrammatiken*: Grammatiken mit nur abgeleiteten Attributen, lassen sich während des Parsens mit LR-Parsern beim Reduzieren berechnen (Tiefensuche mit Postorder-Evaluation):

``` python
def visit(N):
    for each child C of N (from left to right):
        visit(C)
    eval(N)     # evaluate attributes of N
```

###### L-Attributgrammatiken

-   Grammatiken, deren geerbte Atribute nur von einem Elternknoten oder einem linken Geschwisterknoten abhängig sind

-   können während des Parsens mit LL-Parsern berechnet werden

-   alle Kanten im Abhängigkeitsgraphen gehen nur von links nach rechts

-   ein Links-Nach-Rechts-Durchlauf ist ausreichend

-   S-attributierte SDD sind eine Teilmenge von L-attributierten SDD

###### Beispiel: S-Attributgrammatik

| Produktion       | Semantische Regel           |
|:-----------------|:----------------------------|
| `e : e1 '+' t ;` | `e.val = e1.val + t.val`    |
| `e : t ;`        | `e.val = t.val`             |
| `t : t1 '*' D ;` | `t.val = t1.val * D.lexval` |
| `t : D ;`        | `t.val = D.lexval`          |

###### Beispiel: Annotierter Syntaxbaum für `5*8+2`

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/annotatedparsetree_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/annotatedparsetree.png" width="40%" /></picture></p><p align="center">Annotierter Parse-Tree</p>

###### Erzeugung des AST aus dem Parse-Tree für `5*8+2`

| Produktion | Semantische Regel |
|:------------------|:----------------------------------------------------|
| `e : e1 '+' t ;` | `e.node = new Node('+', e1.node, t.node)` |
| `e : t ;` | `e.node = t.node` |
| `t : t1 '*' D ;` | `t.node = new Node('*', t1.node, new Leaf(D, D.lexval));` |
| `t : D ;` | `t.node = new Leaf(D, D.lexval);` |

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/ast_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/ast.png" width="20%" /></picture></p><p align="center">AST</p>

###### Beispiel: L-Attributgrammatik, berechnete u. geerbte Attribute, ohne Links-Rekursion

Teil der vorigen SDD zum Parsen und Berechnen von Ausdrücken wie `5*8+2`, hier umformuliert ohne Links-Rekursion und mit berechneten und geerbten Attributen:

<div data-align="center">

| Produktion            | Semantische Regel             |
|:----------------------|:------------------------------|
| `t : D t' ;`          | `t'.inh = D.lexval`           |
|                       | `t.syn = t'.syn`              |
| `t' : '*' D t'1 ;`    | `t'1.inh = t'.inh * D.lexval` |
|                       | `t'.syn = t'1.syn`            |
| `t' :` $\epsilon$ `;` | `t'.syn = t'.inh`             |

</div>

<div data-align="center">

**`5*8`** =\>

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/annotatedparsetree2_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/03-semantics/images/annotatedparsetree2.png" width="40%" /></picture></p><p align="center">Annotierter Parse-Tree mit berechneten und geerbten Attributen (nur Multiplikation)</p>

</div>

*Vorgriff*: Dies ist ein Beispiel für eine "L-attributierte SDD".

###### Beispiel: Typinferenz für `3+7+9` oder `"hello"+"world"`

| Produktion       | Semantische Regel             |
|:-----------------|:------------------------------|
| `e : e1 '+' t ;` | `e.type = f(e1.type, t.type)` |
| `e : t ;`        | `e.type = t.type`             |
| `t : NUM ;`      | `t.type = "int"`              |
| `t : NAME ;`     | `t.type = "string"`           |

##### Syntax-gesteuerte Übersetzung (SDT)

###### Erweiterung attributierter Grammatiken

*Syntax-directed translation scheme*:

Zu den Attributen kommen **Semantische Aktionen**: Code-Fragmente als zusätzliche Knoten im Parse Tree an beliebigen Stellen in einer Produktion, die, wenn möglich, während des Parsens, ansonsten in weiteren Baumdurchläufen ausgeführt werden.

    e : e1  {print e1.val;}
        '+' {print "+";}
        t   {e.val = e1.val + t.val; print(e.val);}
      ;

###### S-attributierte SDD, LR-Grammatik: Bottom-Up-Parsierbar

Die Aktionen werden am Ende jeder Produktion eingefügt ("postfix SDT").

| Produktion       | Semantische Regel           |
|:-----------------|:----------------------------|
| `e : e1 '+' t ;` | `e.val = e1.val + t.val`    |
| `e : t ;`        | `e.val = t.val`             |
| `t : t1 '*' D ;` | `t.val = t1.val * D.lexval` |
| `t : D ;`        | `t.val = D.lexval`          |

    e : e1 '+' t  {e.val = e1.val + t.val; print(e.val);} ;
    e : t         {e.val = t.val;} ;
    t : t1 '*' D  {t.val = t1.val * D.lexval;} ;
    t : D         {t.val = D.lexval;} ;

###### L-attributierte SDD, LL-Grammatik: top-down-parsebar (1/2)

| Produktion            | Semantische Regel             |
|:----------------------|:------------------------------|
| `t : D t' ;`          | `t'.inh = D.lexval`           |
|                       | `t.syn = t'.syn`              |
| `t' : '*' D t'1 ;`    | `t'1.inh = t'.inh * D.lexval` |
|                       | `t'.syn = t'1.syn`            |
| `t' :` $\epsilon$ `;` | `t'.syn = t'.inh`             |

    t  : D {t'.inh = D.lexval;} t' {t.syn = t'.syn;} ;
    t' : '*' D {t'1.inh = t'.inh * D.lexval;} t'1 {t'.syn = t'1.syn;} ;
    t' : e {t'.syn = t'.inh;} ;

###### L-attributierte SDD, LL-Grammatik: Top-Down-Parsierbar (2/2)

-   LL-Grammatik: Jede L-attributierte SDD direkt während des Top-Down-Parsens implementierbar/berechenbar

-   SDT dazu:

    -   Aktionen, die ein berechnetes Attribut des Kopfes einer Produktion berechnen, an das Ende der Produktion anfügen

    -   Aktionen, die geerbte Attribute für ein Nicht-Terminalsymbol $A$ berechnen, direkt vor dem Auftreten von $A$ im Körper der Produktion eingefügen

##### Implementierung im rekursiven Abstieg

###### Implementierung im rekursiven Abstieg

-   Geerbte Attribute sind Parameter für die Funktionen für die Nicht-Terminalsymbole

-   berechnete Attribute sind Rückgabewerte dieser Funktionen.

``` c
T t'(T inh) {
    match('*');
    T t1inh = inh * match(D);
    return t'(t1inh);
}
```

##### Wrap-Up

###### Wrap-Up

-   Die Typinferenz benötigt Informationen aus der Symboltabelle

-   Einfache semantische Analyse: Attribute und semantische Regeln (SDD)

-   Umsetzung mit SDT: Attribute und eingebettete Aktionen

-   Reihenfolge der Auswertung u.U. schwierig

    Bestimmte SDT-Klassen können direkt beim Parsing abgearbeitet werden:

    -   S-attributierte SDD, LR-Grammatik: bottom-up-parsebar

    -   L-attributierte SDD, LL-Grammatik: top-down-parsebar

    Ansonsten werden die Attribute und eingebetteten Aktionen in den Parse-Tree, bzw. AST, integriert und bei einer (späteren) Traversierung abgearbeitet.

> [!TIP]
>
> <details open>
> <summary><strong>📖 Zum Nachlesen</strong></summary>
>
> -   Aho u. a. ([2023](#ref-Aho2023)): Kapitel 2.3 und 5
> -   Levine ([2009](#ref-Levine2009))
>
> </details>

> [!NOTE]
>
> <details >
> <summary><strong>✅ Lernziele</strong></summary>
>
> -   k2: Ich kann das Konzept der attributierten Grammatiken erklären und in einem Beispiel die Anreicherung mit Attributen und semantischen Regeln demonstrieren
> -   k2: Ich kann den Unterschied zwischen geerbten und berechneten Attributen erklären
> -   k2: Ich kann die Umsetzung von SDD mit Hilfe von SDT erklären
> -   k3: Ich kann eine einfache semantische Analyse mit Hilfe von attributierten Grammatiken durchführen
>
> </details>

<a id="id-2ca9d930d2912c11008217d56a7a7b8806e01e13"></a>

### Interpreter

Ein Interpreter erzeugt keinen Code, sondern führt Source-Code (interaktiv) aus. Die einfachste Möglichkeit ist der Einsatz von attributierten Grammatiken, wo der Code bereits beim Parsen ausgeführt wird ("syntaxgesteuerte Interpretation"). Mehr Möglichkeiten hat man dagegen bei der Traversierung des AST, beispielsweise mit dem Visitor-Pattern. Auch die Abarbeitung von Bytecode in einer Virtuellen Maschine (VM) zählt zur Interpretation.

(Register- und Stack-basierte Interpreter betrachten wir im Rahmen der Veranstaltung aktuell nicht.)

<a id="id-1ef3437e88d6d165c0cf233b6df46f1189d6d4b6"></a>

#### AST-basierte Interpreter: Basics

> [!IMPORTANT]
>
> <details open>
> <summary><strong>🎯 TL;DR</strong></summary>
>
> Ein AST-basierter Interpreter besteht oft aus einem "Visitor-Dispatcher": Man traversiert mit einer `eval()`-Funktion den AST und ruft je nach Knotentyp die passende Funktion auf. Dabei werden bei Ausdrücken (*Expressions*) Werte berechnet und zurückgegeben, d.h. hier hat man einen Rückgabewert und ein entsprechendes `return` im `switch`/`case`, während man bei Anweisungen (*Statements*) keinen Rückgabewert hat.
>
> Der Wert von Literalen ergibt sich direkt durch die Übersetzung des jeweiligen Werts in den passenden Typ der Implementierungssprache. Bei einfachen Ausdrücken kann man auf das in [Syntaxgesteuerte Interpreter](#id-84a69271af7716588de35dde4268e581639912d3) demonstrierte Vorgehen zurückgreifen: Man interpretiert zunächst die Teilausdrücke durch den Aufruf von `eval()` für die jeweiligen AST-Kindknoten und berechnet daraus das gewünschte Ergebnis.
>
> Für Blöcke und Variablen muss man analog zum Aufbau von Symboltabellen wieder Scopes berücksichtigen, d.h. man benötigt Strukturen ähnlich zu den Symboltabellen (hier "Umgebung" (*Environment*) genannt). Es gibt eine globale Umgebung, und mit dem Betreten eines neuen Blocks wird eine neue Umgebung aufgemacht, deren Eltern-Umgebung die bisherige Umgebung ist.
>
> Zu jedem Namen kann man in einer Umgebung einen Wert definieren bzw. abrufen. Dabei muss man je nach Semantik der zu interpretierenden Sprache unterscheiden zwischen der "Definition" und der "Zuweisung" einer Variablen: Die Definition erfolgt i.d.R. in der aktuellen Umgebung, bei der Zuweisung sucht man ausgehend von der aktuellen Umgebung bis hoch zur globalen Umgebung nach dem ersten Vorkommen der Variablen und setzt den Wert in der gefundenen Umgebung. Bei Sprachen, die Variablen beim ersten Zugriff definieren, muss man dieses Verhalten entsprechend anpassen.
>
> </details>

> [!TIP]
>
> <details open>
> <summary><strong>🎦 Videos</strong></summary>
>
> Vorlesung \[[YT](https://youtu.be/zwD1QolJa3M)\], \[[HSBI](https://www.hsbi.de/medienportal/album/video/cpl-ast-basierte-interpreter1-basics/c09c15d33e293a6430746ac60f57585b/254)\]
>
> </details>

##### Aufgaben im Interpreter

Im Allgemeinen reichen einfache syntaxgesteuerte Interpreter nicht aus. Normalerweise simuliert ein Interpreter die Ausführung eines Programms durch den Computer. D.h. der Interpreter muss über die entsprechenden Eigenschaften verfügen: Prozessor, Code-Speicher, Datenspeicher, Stack ...

``` c
int x = 42;
int f(int x) {
    int y = 9;
    return y+x;
}

x = f(x);
```

-   Aufbauen des AST ... =\> Lexer+Parser
-   Auflösen von Symbolen/Namen ... =\> Symboltabellen, Resolving
-   Type-Checking und -Inference ... =\> Semantische Analyse (auf Symboltabellen)

<!-- -->

-   Speichern von Daten: Name+Wert vs. Adresse+Wert (Erinnerung: Data-Segment und Stack im virtuellen Speicher)
-   Ausführen von Anweisungen Text-Segment im virtuellen Speicher; hier über den AST
-   Aufruf von Funktionen und Methoden Kontextwechsel nötig: Was ist von wo aus sichtbar?

##### AST-basierte Interpreter: Visitor-Dispatcher

``` python
def eval(self, AST t):
    if   t.type == Parser.BLOCK  : block(t)
    elif t.type == Parser.ASSIGN : assign(t)
    elif t.type == Parser.RETURN : ret(t)
    elif t.type == Parser.IF     : ifstat(t)
    elif t.type == Parser.CALL   : return call(t)
    elif t.type == Parser.ADD    : return add(t)
    elif t.type == Parser.MUL    : return mul(t)
    elif t.type == Parser.INT    : return Integer.parseInt(t.getText())
    elif t.type == Parser.ID     : return load(t)
    else : ...  # catch unhandled node types
    return None;
```

Nach dem Aufbau des AST durch Scanner und Parser und der semantischen Analyse anhand der Symboltabellen müssen die Ausdrücke (*expressions*) und Anweisungen (*statements*) durch den Interpreter ausgewertet werden. Eine Möglichkeit dazu ist das Traversieren des AST mit dem Visitor-Pattern. Basierend auf dem Typ des aktuell betrachteten AST-Knotens wird entschieden, wie damit umgegangen werden soll. Dies erinnert an den Aufbau der Symboltabellen ...

> [!TIP]
>
> **Exkurs Expressions (Ausdrücke) vs. Statements (Anweisungen)**
>
> In Programmiersprachen unterscheiden wir häufig **Expressions** (*Ausdrücke*) und **Statements** (*Anweisungen*).
>
> Expressions sind dabei syntaktische Konstrukte einer Programmiersprache, die (in einem gegebenen Kontext) zu einem Wert **evaluiert** werden können. Typische Expressions sind beispielsweise Ausdrücke wie `2*3` oder `foo(42);`... In manchen Sprachen sind beispielsweise auch Zuweisungen Expressions: `v = 42 + 7;` würde in C der Variablen `v` den Wert 49 zuweisen, dies ist gleichzeitig auch der Wert des gesamten Ausdrucks. Man könnte in C also Dinge formulieren wie `if (v = 42 + 7) ...` (wobei das Interpretieren eines Integers in einem bool'schen Kontext nochmal ein anderes Problem ist).
>
> Statements sind syntaktische Konstrukte in Programmiersprachen, die **ausgeführt** werden können und dabei in der Regel einen Zustand im Programm verändern, also einen Seiteneffekt haben. Die Ausführung eines Statements hat normalerweise keinen Wert an sich. Typische Beispiele sind Zuweisungen `v = 7`, Kontrollfluss `if (...) then {...} else {...}`, Schleifen `for x in foo: ...`, `switch/case`-Statements. (Es gibt aber auch Programmiersprachen, wo ein `if/then/else`-Konstrukt eine Expression ist, also bei der Ausführung einen Wert ergibt.) In den meisten Programmiersprachen können Expressions Teile von Statements bilden: In `v = 42 + 7` ist die gesamte Zuweisung eine Anweisung (Seiteneffekt: die Variable `v` hat danach einen anderen Zustand), und der Teil `42 + 7` ist ein Ausdruck, der ausgewertet werden kann und üblicherweise den Wert 49 ergibt (außer man beauftragt ein LLM mit der Auswertung). In C-ähnlichen Sprachen kann durch Hinzufügen eines Semikolons aus dem Ausdruck `42 +7` eine Anweisung gemacht werden...
>
> Vergleiche auch Nystrom ([2021](#ref-Nystrom2021)), Kapitel 6 "Parsing Expressions", Kapitel 7 "Evaluating Expressions" und Kapitel 8 "Statements and State", aber auch [Wikipedia: Expression](https://en.wikipedia.org/wiki/Expression_(computer_science)) und [Wikipedia: Statement](https://en.wikipedia.org/wiki/Statement_(computer_science)).

Die `eval()`-Methode bildet das Kernstück des (AST-traversierenden) Interpreters. Hier wird passend zum aktuellen AST-Knoten die passende Methode des Interpreters aufgerufen.

**Hinweis**: Im obigen Beispiel wird nicht zwischen der Auswertung von Ausdrücken und Anweisungen unterschieden, es wird die selbe Methode `eval()` genutzt. Allerdings liefern Ausdrücke einen Wert zurück (erkennbar am `return` im jeweiligen `switch/case`-Zweig), während Anweisungen keinen Wert liefern.

In den folgenden Beispielen wird davon ausgegangen, dass ein komplettes Programm eingelesen, geparst, vorverarbeitet und dann interpretiert wird.

Für einen interaktiven Interpreter würde man in einer Schleife die Eingaben lesen, parsen und vorverarbeiten und dann interpretieren. Dabei würde jeweils der AST und die Symboltabelle *ergänzt*, damit die neuen Eingaben auf frühere verarbeitete Eingaben zurückgreifen können. Durch die Form der Schleife "Einlesen -- Verarbeiten -- Auswerten" hat sich auch der Name "*Read-Eval-Loop*" bzw. "*Read-Eval-Print-Loop*" (**REPL**) eingebürgert.

##### Auswertung von Literalen und Ausdrücken

-   Typen mappen: Zielsprache =\> Implementierungssprache

    Die in der Zielsprache verwendeten (primitiven) Typen müssen auf passende Typen der Sprache, in der der Interpreter selbst implementiert ist, abgebildet werden.

    Beispielsweise könnte man den Typ `nil` der Zielsprache auf den Typ `null` des in Java implementierten Interpreters abbilden, oder den Typ `number` der Zielsprache auf den Typ `Double` in Java mappen.

<!-- -->

-   Literale auswerten:

    ``` antlr
    INT: [0-9]+ ;
    ```

    ``` python
    elif t.type == Parser.INT : return Integer.parseInt(t.getText())
    ```

    Das ist der einfachste Teil ... Die primitiven Typen der Zielsprache, für die es meist ein eigenes Token gibt, müssen als Datentyp der Interpreter-Programmiersprache ausgewertet werden.

<!-- -->

-   Ausdrücke auswerten:

    ``` antlr
    add: e1=expr "+" e2=expr ;
    ```

    ``` python
    def add(self, AST t):
        lhs = eval(t.e1())
        rhs = eval(t.e2())
        return (double)lhs + (double)rhs  # Semantik!
    ```

    Die meisten möglichen Fehlerzustände sind bereits durch den Parser und bei der semantischen Analyse abgefangen worden. Falls zur Laufzeit die Auswertung der beiden Summanden keine Zahl ergibt, würde eine Java-Exception geworfen, die man an geeigneter Stelle fangen und behandeln muss. Der Interpreter soll sich ja nicht mit einem Stack-Trace verabschieden, sondern soll eine Fehlermeldung präsentieren und danach normal weiter machen ...

##### Kontrollstrukturen

``` antlr
ifstat: 'if' expr 'then' s1=stat ('else' s2=stat)? ;
```

``` python
def ifstat(self, AST t):
    if eval(t.expr()): eval(t.s1())
    else:
        if t.s2(): eval(t.s2())
```

Analog können die anderen bekannten Kontrollstrukturen umgesetzt werden, etwa `switch/case`, `while` oder `for`.

Dabei können erste Optimierungen vorgenommen werden: Beispielsweise könnten `for`-Schleifen im Interpreter in `while`-Schleifen transformiert werden, wodurch im Interpreter nur ein Schleifenkonstrukt implementiert werden müsste.

##### Zustände: Auswerten von Anweisungen

``` c
int x = 42;
float y;
{
    int x;
    x = 1;
    y = 2;
    { int y = x; }
}
```

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/06-interpretation/images/nested_envs_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/06-interpretation/images/nested_envs.png"  /></picture></p>

Das erinnert nicht nur zufällig an den Aufbau der Symboltabellen :-)

Und so lange es nur um Variablen ginge, könnte man die Symboltabellen für das Speichern der Werte nutzen. Allerdings müssen wir noch Funktionen und Strukturen bzw. Klassen realisieren, und spätestens dann kann man die Symboltabelle nicht mehr zum Speichern von Werten einsetzen. Also lohnt es sich, direkt neue Strukturen für das Halten von Variablen und Werten aufzubauen.

##### Detail: Felder im Interpreter

Eine mögliche Implementierung für einen Interpreter basierend auf einem ANTLR-Visitor ist nachfolgend gezeigt.

**Hinweis**: Bei der Ableitung des `BaseVisitor<T>` muss der Typ `T` festgelegt werden. Dieser fungiert als Rückgabetyp für die Visitor-Methoden. Entsprechend können alle Methoden nur einen gemeinsamen (Ober-) Typ zurückliefern, weshalb man sich an der Stelle oft mit `Object` behilft und dann manuell den konkreten Typ abfragen und korrekt casten muss.

``` python
class Interpreter(BaseVisitor<Object>):
    __init__(self, AST t):
        BaseVisitor<Object>.__init__(self)
        self.root = t
        self.env = Environment()
```

Quelle: AST-Interpreter: Eigener Code basierend auf einer Idee nach [Interpreter.java](https://github.com/munificent/craftinginterpreters/blob/master/java/com/craftinginterpreters/lox/Interpreter.java#L21) by [Bob Nystrom](https://github.com/munificent) on Github.com ([MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE))

##### Ausführen einer Variablendeklaration

``` antlr
varDecl: "var" ID ("=" expr)? ";" ;
```

``` python
def varDecl(self, AST t):
    # deklarierte Variable (String)
    name = t.ID().getText()

    value = None;  # TODO: Typ der Variablen beachten (Defaultwert)
    if t.expr(): value = eval(t.expr())

    self.env.define(name, value)

    return None
```

Wenn wir bei der Traversierung des AST mit `eval()` bei einer Variablendeklaration vorbeikommen, also etwa `int x;` oder `int x = wuppie + fluppie;`, dann wird im **aktuellen** Environment der String "x" sowie der Wert (im zweiten Fall) eingetragen.

##### Ausführen einer Zuweisung

``` antlr
assign: ID "=" expr;
```

``` python
def assign(self, AST t):
    lhs = t.ID().getText()
    value = eval(t.expr())

    self.env.assign(lhs, value)  # Semantik!
}

class Environment:
    def assign(self, String n, Object v):
        if self.values[n]: self.values[n] = v
        elif self.enclosing: self.enclosing.assign(n, v)
        else: raise RuntimeError(n, "undefined variable")
```

Quelle: Evaluieren einer Zuweisung: Eigener Code basierend auf einer Idee nach [Environment.java](https://github.com/munificent/craftinginterpreters/blob/master/java/com/craftinginterpreters/lox/Environment.java#L38) by [Bob Nystrom](https://github.com/munificent) on Github.com ([MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE))

Wenn wir bei der Traversierung des AST mit `eval()` bei einer Zuweisung vorbeikommen, also etwa `x = 7;` oder `x = wuppie + fluppie;`, dann wird zunächst im aktuellen Environment die rechte Seite der Zuweisung ausgewertet (Aufruf von `eval()`). Anschließend wird der Wert für die Variable im Environment eingetragen: Entweder sie wurde im aktuellen Environment früher bereits definiert, dann wird der neue Wert hier eingetragen. Ansonsten wird entlang der Verschachtelungshierarchie gesucht und entsprechend eingetragen. Falls die Variable nicht gefunden werden kann, wird eine Exception ausgelöst.

An dieser Stelle kann man über die Methode `assign` in der Klasse `Environment` dafür sorgen, dass nur bereits deklarierte Variablen zugewiesen werden dürfen. Wenn man stattdessen wie etwa in Python das implizite Erzeugen neuer Variablen erlaubten möchte, würde man statt `Environment#assign` einfach `Environment#define` nutzen ...

*Anmerkung*: Der gezeigte Code funktioniert nur für normale Variablen, nicht für Zugriffe auf Attribute einer Struct oder Klasse!

##### Blöcke: Umgang mit verschachtelten Environments

``` antlr
block:  '{' stat* '}' ;
```

``` python
def block(self, AST t):
    prev = self.env

    try:
        self.env = Environment(self.env)
        for s in t.stat(): eval(s)
    finally: self.env = prev

    return None;
```

Quelle: Nested Environments: Eigener Code basierend auf einer Idee nach [Interpreter.java](https://github.com/munificent/craftinginterpreters/blob/master/java/com/craftinginterpreters/lox/Interpreter.java#L92) by [Bob Nystrom](https://github.com/munificent) on Github.com ([MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE))

Beim Interpretieren von Blöcken muss man einfach nur eine weitere Verschachtelungsebene für die Environments anlegen und darin dann die Anweisungen eines Blockes auswerten ...

**Wichtig**: Egal, was beim Auswerten der Anweisungen in einem Block passiert: Es muss am Ende die ursprüngliche Umgebung wieder hergestellt werden (`finally`-Block).

##### Wrap-Up

-   Interpreter simulieren die Programmausführung
    -   Namen und Symbole auflösen
    -   Speicherbereiche simulieren
    -   Code ausführen: Read-Eval-Loop

<!-- -->

-   Traversierung des AST: `eval(AST t)` als Visitor-Dispatcher
-   Scopes mit `Environment` (analog zu Symboltabellen)
-   Interpretation von Blöcken und Variablen (Deklaration, Zuweisung)

> [!TIP]
>
> <details open>
> <summary><strong>📖 Zum Nachlesen</strong></summary>
>
> -   Nystrom ([2021](#ref-Nystrom2021)): Kapitel: A Tree-Walk Interpreter, insb. 8. Statements and State
> -   Grune u. a. ([2012](#ref-Grune2012)): Kapitel 6
> -   Mogensen ([2017](#ref-Mogensen2017)): Kapitel 4
>
> </details>

> [!NOTE]
>
> <details >
> <summary><strong>✅ Lernziele</strong></summary>
>
> -   k3: Ich kann die Traversierung von Parse-Trees implementieren und dabei mit Hilfe des Visitor-Patterns Aktionen ausführen
> -   k3: Ich kann Environment-Strukturen analog zu den Symboltabellen aufbauen, um Namen und Werte dynamisch zu speichern
> -   k3: Ich kann eine Read-Eval-Schleife implementieren und dabei durch Traversierung des AST die dort abgelegten Anweisungen und Ausdrücke und Kontrollstrukturen ausführen
>
> </details>

<a id="id-153937d8c8cfae4b7b9338d8dee2ea9c18a24ebf"></a>

#### AST-basierte Interpreter: Funktionen und Klassen

> [!IMPORTANT]
>
> <details open>
> <summary><strong>🎯 TL;DR</strong></summary>
>
> Üblicherweise können Funktionen auf die Umgebung zurückgreifen, in der die Definition der Funktion erfolgt ist (["**Closure**"](https://en.wikipedia.org/wiki/Closure_(computer_programming))). Deshalb wird beim Interpretieren einer Funktionsdefinition der jeweilige AST-Knoten (mit dem Block des Funktionskörpers) und die aktuelle Umgebung in einer Struktur zusammengefasst. Zusätzlich muss in der aktuellen Umgebung der Name der Funktion zusammen mit der eben erzeugten Struktur ("Funktionsobjekt") als Wert definiert werden.
>
> Beim Funktionsaufruf löst man den Funktionsnamen in der aktuellen Umgebung auf und erhält das Funktionsobjekt mit dem AST der Funktion und der Closure. Die Funktionsparameter werden ebenfalls in der aktuellen Umgebung aufgelöst (Aufruf von `eval()` für die AST-Kindknoten des Funktionsaufrufs). Zur Interpretation der Funktion legt man sich eine neue Umgebung an, deren Eltern-Umgebung die Closure der Funktion ist, definiert die Funktionsparameter (Name und eben ermittelter Wert) in dieser neuen Umgebung und interpretiert dann den AST-Kindknoten des Funktionsblocks in dieser neuen Umgebung. Für den Rückgabewert muss man ein wenig tricksen: Ein Block hat normalerweise keinen Wert. Eine Möglichkeit wäre, bei der Interpretation eines `return`-Statements eine Exception mit dem Wert des Ausdruck hinter dem "`return`" zu werfen und im `eval()` des Funktionsblock zu fangen.
>
> Für Klassen kann man analog verfahren. Methoden sind zunächst einfach Funktionen, die in einem Klassenobjekt gesammelt werden. Das Erzeugen einer Instanz einer Klasse ist die Interpretation eines "Aufrufs" der Klasse (analog zum Aufruf einer Funktion): Dabei wird ein spezielles Instanzobjekt erzeugt, welches auf die Klasse verweist und welches die Werte der Attribute hält. Beim Aufruf von Methoden auf einem Instanzobjekt wird der Name der Funktion über das Klassenobjekt aufgelöst, eine neue Umgebung erzeugt mit der Closure der Funktion als Eltern-Umgebung und das Instanzobjekt wird in dieser Umgebung definiert als "`this`" oder "`self`". Anschließend wird ein neues Funktionsobjekt mit der eben erzeugten Umgebung und dem Funktions-AST erzeugt und zurückgeliefert. Dieses neue Funktionsobjekt wird dann wie eine normale Funktion aufgerufen (interpretiert, s.o.). Der Zugriff in der Methode auf die Attribute der Klasse erfolgt dann über `this` bzw. `self`, welche in der Closure der Funktion nun definiert sind und auf das Instanzobjekt mit den Attributen verweisen.
>
> </details>

> [!TIP]
>
> <details open>
> <summary><strong>🎦 Videos</strong></summary>
>
> Vorlesung \[[YT](https://youtu.be/LFOwo6tclC8)\], \[[HSBI](https://www.hsbi.de/medienportal/album/video/cpl-ast-basierte-interpreter2-funktionen-und-klassen/6121693c3874442ee84a0a4bf0b5c455/254)\]
>
> </details>

##### Funktionen

``` java
int foo(int a, int b, int c) {
    print a + b + c;
}

foo(1, 2, 3);
```

``` python
def makeCounter():
    var i = 0
    def count():
        i = i + 1
        print i
    return count;

counter = makeCounter()
counter()   # "1"
counter()   # "2"
```

Die Funktionsdeklaration muss im aktuellen Kontext abgelegt werden, dazu wird der AST-Teilbaum der Deklaration benötigt.

Beim Aufruf muss man das Funktionssymbol im aktuellen Kontext suchen, die Argumente auswerten, einen neuen lokalen Kontext anlegen und darin die Parameter definieren (mit den eben ausgewerteten Werten) und anschließend den AST-Teilbaum des Funktionskörpers im Interpreter mit `eval()` auswerten ...

##### Ausführen einer Funktionsdeklaration

``` antlr
funcDecl : type ID '(' params? ')' block ;
funcCall : ID '(' exprList? ')' ;
```

``` python
def funcDecl(self, AST t):
    fn = Fun(t, self.env)
    self.env.define(t.ID().getText(), fn)
```

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/06-interpretation/images/fun_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/06-interpretation/images/fun.png"  /></picture></p>

Quelle: Funktionsdeklaration: Eigener Code basierend auf einer Idee nach [LoxFunction.java](https://github.com/munificent/craftinginterpreters/blob/master/java/com/craftinginterpreters/lox/LoxFunction.java#L6) by [Bob Nystrom](https://github.com/munificent) on Github.com ([MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE))

Man definiert im aktuellen Environment den Funktionsnamen und hält dazu den aktuellen Kontext (aktuelles Environment) sowie den AST-Knoten mit der eigentlichen Funktionsdefinition fest.

Für *Closures* ist der aktuelle Kontext wichtig, sobald man die Funktion ausführen muss. In ([Parr 2010, 236](#ref-Parr2010)) wird beispielsweise einfach nur ein neuer Memory-Space (entspricht ungefähr hier einem neuen lokalen Environment) angelegt, in dem die im Funktionskörper definierten Symbole angelegt werden. Die Suche nach Symbolen erfolgt dort nur im Memory-Space (Environment) der Funktion bzw. im globalen Scope (Environment).

##### Ausführen eines Funktionsaufrufs

``` antlr
funcDecl : type ID '(' params? ')' block ;
funcCall : ID '(' exprList? ')' ;
```

``` python
def funcCall(self, AST t):
    fn = (Fun)eval(t.ID())
    args = [eval(a)  for a in t.exprList()]

    prev = self.env;  self.env = Environment(fn.closure)
    for i in range(args.size()):
        self.env.define(fn.decl.params()[i].getText(), args[i])

    eval(fn.decl.block())
    self.env = prev
```

Quelle: Funktionsaufruf: Eigener Code basierend auf einer Idee nach [LoxFunction.java](https://github.com/munificent/craftinginterpreters/blob/master/java/com/craftinginterpreters/lox/LoxFunction.java#L57) by [Bob Nystrom](https://github.com/munificent) on Github.com ([MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE))

Zunächst wird die `ID` im aktuellen Kontext ausgewertet. In der obigen Grammatik ist dies tatsächlich nur ein Funktionsname, aber man könnte über diesen Mechanismus auch Ausdrücke erlauben und damit Funktionspointer bzw. Funktionsreferenzen realisieren ... Im Ergebnis hat man das Funktionsobjekt mit dem zugehörigen AST-Knoten und dem Kontext zur Deklarationszeit.

Die Argumente der Funktion werden nacheinander ebenfalls im aktuellen Kontext ausgewertet.

Um den Funktionsblock auszuwerten, legt man einen neuen temporären Kontext über dem Closure-Kontext der Funktion an und definiert darin die Parameter der Funktion samt den aktuellen Werten. Dann lässt man den Interpreter über den Visitor-Dispatch den Funktionskörper evaluieren und schaltet wieder auf den Kontext vor der Funktionsauswertung zurück.

##### Funktionsaufruf: Rückgabewerte

``` python
def funcCall(self, AST t):
    ...

    eval(fn.decl.block())

    ...
    return None  # (Wirkung)
```

``` python
class ReturnEx(RuntimeException):
    __init__(self, v): self.value = v

def return(self, AST t):
    raise ReturnEx(eval(t.expr()))

def funcCall(self, AST t):
    ...
    erg = None
    try: eval(fn.decl.block())
    except ReturnEx as r: erg = r.value
    ...
    return erg;
```

Quelle: Rückgabewerte: Eigener Code basierend auf einer Idee nach [Return.java](https://github.com/munificent/craftinginterpreters/blob/master/java/com/craftinginterpreters/lox/Return.java#L4) und [LoxFunction.java](https://github.com/munificent/craftinginterpreters/blob/master/java/com/craftinginterpreters/lox/LoxFunction.java#L74) by [Bob Nystrom](https://github.com/munificent) on Github.com ([MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE))

Rückgabewerte für den Funktionsaufruf werden innerhalb von `block` berechnet, wo eine Reihe von Anweisungen interpretiert werden, weshalb `block` ursprünglich keinen Rückgabewert hat. Im Prinzip könnte man `block` etwas zurück geben lassen, was durch die möglicherweise tiefe Rekursion relativ umständlich werden kann.

An dieser Stelle kann man den Exceptions-Mechanismus **missbrauchen** und bei der Auswertung eines `return` mit dem Ergebniswert direkt zum Funktionsaufruf zurück springen. In Methoden, wo man einen neuen lokalen Kontext anlegt und die globale `env`-Variable temporär damit ersetzt, muss man dann ebenfalls mit `try/catch` arbeiten und im `finally`-Block die Umgebung zurücksetzen und die Exception erneut werfen.

##### Native Funktionen

``` python
class Callable:
    def call(self, Interpreter i, List<Object> a): pass
class Fun(Callable): ...
class NativePrint(Fun):
    def call(self, Interpreter i, List<Object> a):
        for o in a: print a  # nur zur Demo, hier sinnvoller Code :-)

# Im Interpreter (Initialisierung):
self.env.define("print", NativePrint())

def funcCall(self, AST t):
    ...
#    prev = self.env;  self.env = Environment(fn.closure)
#    for i in range(args.size()): ...
#    eval(fn.decl.block()); self.env = prev
    fn.call(self, args)
    ...
```

Quelle: Native Funktionen: Eigener Code basierend auf einer Idee nach [LoxCallable.java](https://github.com/munificent/craftinginterpreters/blob/master/java/com/craftinginterpreters/lox/LoxCallable.java#L6) und [LoxFunction.java](https://github.com/munificent/craftinginterpreters/blob/master/java/com/craftinginterpreters/lox/LoxFunction.java#L6) by [Bob Nystrom](https://github.com/munificent) on Github.com ([MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE))

Normalerweise wird beim Interpretieren eines Funktionsaufrufs der Funktionskörper (repräsentiert durch den entsprechenden AST-Teilbaum) durch einen rekursiven Aufruf von `eval` ausgewertet.

Für native Funktionen, die im Interpreter eingebettet sind, klappt das nicht mehr, da hier kein AST vorliegt.

Man erstellt ein neues Interface `Callable` mit der Hauptmethode `call()` und leitet die frühere Klasse `Fun` davon ab: `class Fun(Callable)`. Die Methode `funcCall()` des Interpreters ruft nun statt der `eval()`-Methode die `call()`-Methode des Funktionsobjekts auf und übergibt den Interpreter (== Zustand) und die Argumente. Die `call()`-Methode der Klasse `Fun` muss nun ihrerseits im Normalfall den im Funktionsobjekt referenzierten AST-Teilbaum des Funktionskörpers mit dem Aufruf von `eval()` interpretieren ...

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/06-interpretation/images/callFun_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/06-interpretation/images/callFun.png"  /></picture></p>

Für die nativen Funktionen leitet man einfach eine (anonyme) Klasse ab und speichert sie unter dem gewünschten Namen im globalen Kontext des Interpreters. Die `call()`-Methode wird dann entsprechend der gewünschten Funktion implementiert, d.h. hier erfolgt kein weiteres Auswerten des AST.

##### Klassen und Instanzen I

``` antlr
classDef : "class" ID "{" funcDecl* "}" ;
```

``` python
def classDef(self, AST t):
    methods = HashMap<String, Fun>()
    for m in t.funcDecl():
        fn = Fun(m, self.env)
        methods[m.ID().getText()] = fn

    clazz = Clazz(methods)
    self.env.define(t.ID().getText(), clazz)
```

Quelle: Klassen: Eigener Code basierend auf einer Idee nach [Interpreter.java](https://github.com/munificent/craftinginterpreters/blob/master/java/com/craftinginterpreters/lox/Interpreter.java#L115) by [Bob Nystrom](https://github.com/munificent) on Github.com ([MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE))

**Anmerkung**: In dieser Darstellung wird der Einfachheit halber nur auf Methoden eingegangen. Für Attribute müssten ähnliche Konstrukte implementiert werden.

##### Klassen und Instanzen II

``` {.python size="footnotesize"}
class Clazz(Callable):
    __init__(self, Map<String, Fun> methods):
        self.methods = methods

    def call(self, Interpreter i, List<Object> a):
        return Instance(self)

    def findMethod(self, String name):
        return self.methods[name]

class Instance:
    __init__(self, Clazz clazz):
        self.clazz = clazz

    def get(self, String name):
        method = self.clazz.findMethod(name)
        if method != None: return method.bind(self)
        raise RuntimeError(name, "undefined method")
```

Quelle: Instanzen: Eigener Code basierend auf einer Idee nach [LoxClass.java](https://github.com/munificent/craftinginterpreters/blob/master/java/com/craftinginterpreters/lox/LoxClass.java#L11) und [LoxInstance.java](https://github.com/munificent/craftinginterpreters/blob/master/java/com/craftinginterpreters/lox/LoxInstance.java#L7) by [Bob Nystrom](https://github.com/munificent) on Github.com ([MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE))

Instanzen einer Klasse werden durch den funktionsartigen "Aufruf" der Klassen angelegt (parameterloser Konstruktor). Eine Instanz hält die Attribute (hier nicht gezeigt) und eine Referenz auf die Klasse, um später an die Methoden heranzukommen.

##### Zugriff auf Methoden (und Attribute)

``` antlr
getExpr : obj "." ID ;
```

``` python
def getExpr(self, AST t):
    obj = eval(t.obj())

    if isinstance(obj, Instance):
        return ((Instance)obj).get(t.ID().getText())

    raise RuntimeError(t.obj().getText(), "no object")
```

Beim Zugriff auf Attribute muss das Objekt im aktuellen Kontext evaluiert werden. Falls es eine Instanz von `Instance` ist, wird auf das Feld per interner Hash-Map zugriffen; sonst Exception.

##### Methoden und *this* oder *self*

``` python
class Fun(Callable):
    def bind(self, Instance i):
        e = Environment(self.closure)
        e.define("this", i)
        e.define("self", i)
        return Fun(self.decl, e)
```

Quelle: Methodenaufruf: Eigener Code basierend auf einer Idee nach [LoxFunction.java](https://github.com/munificent/craftinginterpreters/blob/master/java/com/craftinginterpreters/lox/LoxFunction.java#L31) by [Bob Nystrom](https://github.com/munificent) on Github.com ([MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE))

Nach dem Interpretieren von Klassendefinitionen sind die Methoden in der Klasse selbst gespeichert, wobei der jeweilige `closure` auf den Klassenkontext zeigt.

Beim Auflösen eines Methodenaufrufs wird die gefundene Methode an die Instanz gebunden, d.h. es wird eine neue Funktion angelegt, deren `closure` auf den Kontext der Instanz zeigt. Zusätzlich wird in diesem Kontext noch die Variable "`this`" definiert, damit man damit auf die Instanz zugreifen kann.

In Python wird das in der Methodensignatur sichtbar: Der erste Parameter ist eine Referenz auf die Instanz, auf der diese Methode ausgeführt werden soll ...

##### Wrap-Up

-   Interpreter simulieren die Programmausführung
    -   Namen und Symbole auflösen
    -   Speicherbereiche simulieren
    -   Code ausführen: Read-Eval-Loop

<!-- -->

-   Traversierung des AST: `eval(AST t)` als Visitor-Dispatcher
-   Scopes mit `Environment` (analog zu Symboltabellen)
-   Interpretation von Funktionen (Deklaration/Aufruf, native Funktionen)
-   Interpretation von Klassen und Instanzen

> [!TIP]
>
> <details open>
> <summary><strong>📖 Zum Nachlesen</strong></summary>
>
> -   Nystrom ([2021](#ref-Nystrom2021)): Kapitel: A Tree-Walk Interpreter, insb. 10. Functions u. 12. Classes
> -   Grune u. a. ([2012](#ref-Grune2012)): Kapitel 6
> -   Mogensen ([2017](#ref-Mogensen2017)): Kapitel 4
>
> </details>

> [!NOTE]
>
> <details >
> <summary><strong>✅ Lernziele</strong></summary>
>
> -   k3: Ich kann die Traversierung von Parse-Trees implementieren und dabei mit Hilfe des Visitor-Patterns Aktionen ausführen
> -   k3: Ich kann Environment-Strukturen analog zu den Symboltabellen aufbauen, um Namen und Werte dynamisch zu speichern
> -   k3: Ich kann eine Read-Eval-Schleife implementieren und dabei durch Traversierung des AST die dort abgelegten Klassendefinitionen und Methodenaufrufe ausführen
>
> </details>

> [!IMPORTANT]
>
> <details open>
> <summary><strong>🏅 Challenges</strong></summary>
>
> -   Wie interpretiert man Code?
> -   Warum kann man die Werte nicht einfach in Symboltabellen ablegen?
> -   Wie geht man mit Funktionen um? Warum? Kann man diese mehrfach aufrufen?
> -   Wieso erzeugt man eine neue Environment mit der Closure in der Funktion?
> -   Wie gehen native Funktionen?
>
> Betrachten Sie folgenden Code-Ausschnitt:
>
> ``` c
> int x = 42;
> int f(int x) {
>     int y = 9;
>     return y+x;
> }
>
> x = f(x);
> ```
>
> 1.  Geben Sie den AST an.
> 2.  Stellen Sie die Strukturen der Symboltabelle dar.
> 3.  Stellen Sie die Strukturen im Interpreter dar.
>
> </details>

<a id="id-84a69271af7716588de35dde4268e581639912d3"></a>

#### Syntaxgesteuerte Interpreter

> [!IMPORTANT]
>
> <details open>
> <summary><strong>🎯 TL;DR</strong></summary>
>
> Zur Einordnung noch einmal die bisher betrachteten Phasen und die jeweiligen Ergebnisse:
>
> <p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/06-interpretation/images/architektur_cb_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/06-interpretation/images/architektur_cb.png" width="60%" /></picture></p>
>
> |  | Phase | Ergebnis |
> |:----------|:----------------------|:-------------------------------------|
> | 0 | Lexer/Parser | AST |
> | 1 | Semantische Analyse, Def-Phase | Symboltabelle (Definitionen), Verknüpfung Scopes mit AST-Knoten |
> | 2 | Semantische Analyse, Ref-Phase | Prüfung auf nicht definierte Referenzen |
> | 3 | Interpreter | Abarbeitung, Nutzung von AST und Symboltabelle |
>
> Das Erzeugen der Symboltabelle wird häufig in zwei Phasen aufgeteilt: Zunächst werden die Definitionen abgearbeitet und in der zweiten Phase wird noch einmal über den AST iteriert und die Referenzen werden geprüft. Dies hat den Vorteil, dass man mit Vorwärtsreferenzen arbeiten kann ...
>
> Für die semantische Analyse kann man gut mit Listenern arbeiten, für den Interpreter werden oft Visitors eingesetzt.
>
> Die einfachste Form von Interpretern sind die "syntaxgesteuerten Interpreter". Durch den Einsatz von attributierten Grammatiken und eingebetteten Aktionen kann in einfachen Fällen der Programmcode bereits beim Parsen interpretiert werden, d.h. nach dem Parsen steht das Ergebnis fest.
>
> Normalerweise traversiert man in Interpretern aber den AST, etwa mit dem Listener- oder Visitor-Pattern. Die in dieser Sitzung gezeigten einfachen Beispiele der syntaxgesteuerten Interpreter werden erweitert auf die jeweilige Traversierung mit dem Listener- bzw. Visitor-Pattern. Für nicht so einfache Fälle braucht man aber zusätzlich noch Speicherstrukturen, die wir in [AST-basierte Interpreter: Basics](#id-1ef3437e88d6d165c0cf233b6df46f1189d6d4b6) und [AST-basierte Interpreter: Funktionen und Klassen](#id-153937d8c8cfae4b7b9338d8dee2ea9c18a24ebf) betrachten.
>
> </details>

> [!TIP]
>
> <details open>
> <summary><strong>🎦 Videos</strong></summary>
>
> Vorlesung \[[YT](https://youtu.be/7G_oDNZmZx8)\], \[[HSBI](https://www.hsbi.de/medienportal/album/video/cpl-syntaxgesteuerte-interpreter/593c59c84cbb2fe3bf8878b0a28b35fa/254)\]
>
> </details>

##### Überblick Interpreter

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/06-interpretation/images/interpreter_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/06-interpretation/images/interpreter.png" width="50%" /></picture></p>

Beim Interpreter durchläuft der Sourcecode nur das Frontend, also die Analyse. Es wird kein Code erzeugt, stattdessen führt der Interpreter die Anweisungen im AST bzw. IC aus. Dazu muss der Interpreter mit den Eingabedaten beschickt werden.

Es gibt verschiedene Varianten, beispielsweise:

-   Syntaxgesteuerte Interpreter

    -   Einfachste Variante, wird direkt im Parser mit abgearbeitet
    -   Keine Symboltabellen, d.h. auch keine Typprüfung oder Vorwärtsdeklarationen o.ä. (d.h. erlaubt nur vergleichsweise einfache Sprachen)
    -   Beispiel: siehe nächste Folie

-   AST-basierte Interpreter

    -   Nutzt den AST und Symboltabellen
    -   Beispiel: siehe weiter unten

-   Stack-basierte Interpreter

    -   Simuliert eine *Stack Machine*, d.h. hält alle (temporären) Werte auf einem Stack
    -   Arbeitet typischerweise auf bereits stark vereinfachtem Zwischencode (IR), etwa Bytecode

-   Register-basierte Interpreter

    -   Simuliert eine *Register Machine*, d.h. hält alle (temporären) Werte in virtuellen Prozessor-Registern
    -   Arbeitet typischerweise auf bereits stark vereinfachtem Zwischencode (IR), etwa Bytecode

Weiterhin kann man Interpreter danach unterscheiden, ob sie interaktiv sind oder nicht. Python kann beispielsweise direkt komplette Dateien verarbeiten oder interaktiv Eingaben abarbeiten. Letztlich kommen dabei aber die oben dargestellten Varianten zum Einsatz.

##### Syntaxgesteuerte Interpreter: Attributierte Grammatiken

``` antlr
s     : expr                    {System.err.println($expr.v);} ;

expr returns [int v]
      : e1=expr '*' e2=expr     {$v = $e1.v * $e2.v;}
      | e1=expr '+' e2=expr     {$v = $e1.v + $e2.v;}
      | DIGIT                   {$v = $DIGIT.int;}
      ;

DIGIT : [0-9] ;
```

Die einfachste Form des Interpreters wird direkt beim Parsen ausgeführt und kommt ohne AST aus. Der Nachteil ist, dass der AST dabei nicht vorverarbeitet werden kann, insbesondere entfallen semantische Prüfungen weitgehend.

Über `returns [int v]` fügt man der Regel `expr` ein Attribut `v` (Integer) hinzu, welches man im jeweiligen Kontext abfragen bzw. setzen kann (agiert als Rückgabewert der generierten Methode). Auf diesen Wert kann in den Aktionen mit `$v` zugegriffen werden.

Da in den Alternativen der Regel `expr` jeweils zwei "Aufrufe" dieser Regel auftauchen, muss man per "`e1=expr`" bzw. "`e2=expr`" eindeutige Namen für die "Aufrufe" vergeben, hier `e1` und `e2`.

##### Eingebettete Aktionen in ANTLR I

Erinnerung: ANTLR generiert einen LL-Parser, d.h. es wird zu jeder Regel eine entsprechende Methode generiert.

Analog zum Rückgabewert der Regel (Methode) `expr()` kann auf die Eigenschaften der Token und Sub-Regeln zugegriffen werden: `$name.eigenschaft`. Dabei gibt es bei Token Eigenschaften wie `text` (gematchter Text bei Token), `type` (Typ eines Tokens), `int` (Integerwert eines Tokens, entspricht `Integer.valueOf($Token.text)`). Parser-Regeln haben u.a. ein `text`-Attribut und ein spezielles Kontext-Objekt (`ctx`).

Die allgemeine Form lautet:

    rulename[args] returns [retvals] locals [localvars] : ... ;

Dabei werden die in "`[...]`" genannten Parameter mit Komma getrennt (Achtung: Abhängig von Zielsprache!).

Beispiel:

``` antlr
add[int x] returns [int r] : '+=' INT {$r = $x + $INT.int;} ;
```

##### Eingebettete Aktionen in ANTLR II

``` antlr
@members {
    int count = 0;
}

expr returns [int v]
      @after {System.out.println(count);}
      : e1=expr '*' e2=expr     {$v = $e1.v * $e2.v; count++;}
      | e1=expr '+' e2=expr     {$v = $e1.v + $e2.v; count++;}
      | DIGIT                   {$v = $DIGIT.int;}
      ;

DIGIT : [0-9] ;
```

Mit `@members { ... }` können im generierten Parser weitere Attribute angelegt werden, die in den Regeln normal genutzt werden können.

Die mit `@after` markierte Aktion wird am Ende der Regel `list` ausgeführt. Analog existiert `@init`.

##### ANTLR: Traversierung des AST und Auslesen von Kontext-Objekten

Mit dem obigen Beispiel, welches dem Einsatz einer L-attributierten SDD in ANTLR entspricht, können einfache Aufgaben bereits beim Parsen erledigt werden.

Für den etwas komplexeren Einsatz von attributierten Grammatiken kann man die von ANTLR erzeugten Kontext-Objekte für die einzelnen AST-Knoten nutzen und über den AST mit dem Visitor- oder dem Listener-Pattern iterieren.

Die Techniken sollen im Folgenden kurz vorgestellt werden.

###### ANTLR: Kontext-Objekte für Parser-Regeln

``` antlr
s    : expr         {List<EContext> x = $expr.ctx.e();} ;
expr : e '*' e ;
```

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/06-interpretation/images/ParserRuleContext_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/06-interpretation/images/ParserRuleContext.png"  /></picture></p>

Jede Regel liefert ein passend zu dieser Regel generiertes Kontext-Objekt zurück. Darüber kann man das/die Kontextobjekt(e) der Sub-Regeln abfragen.

Die Regel `s()` liefert entsprechend ein `SContext`-Objekt und die Regel `expr()` liefert ein `ExprContext`-Objekt zurück.

In der Aktion fragt man das Kontextobjekt über `ctx` ab.

Für einfache Regel-Aufrufe liefert die parameterlose Methode nur ein einziges Kontextobjekt (statt einer Liste) zurück.

**Anmerkung**: ANTLR generiert nur dann Felder für die Regel-Elemente im Kontextobjekt, wenn diese in irgendeiner Form referenziert werden. Dies kann beispielsweise durch Benennung (Definition eines Labels, siehe nächste Folie) oder durch Nutzung in einer Aktion (siehe obiges Beispiel) geschehen.

###### ANTLR: Benannte Regel-Elemente oder Alternativen

``` antlr
stat  : 'return' value=e ';'    # Return
      | 'break' ';'             # Break
      ;
```

``` java
public static class StatContext extends ParserRuleContext { ... }
public static class ReturnContext extends StatContext {
    public EContext value;
    public EContext e() { ... }
}
public static class BreakContext extends StatContext { ... }
```

Mit `value=e` wird der Aufruf der Regel `e` mit dem Label `value` belegt, d.h. man kann mit `$e.text` oder `$value.text` auf das `text`-Attribut von `e` zugreifen. Falls es in einer Produktion mehrere Aufrufe einer anderen Regel gibt, **muss** man für den Zugriff auf die Attribute eindeutige Label vergeben.

Analog wird für die beiden Alternativen je ein eigener Kontext erzeugt.

###### ANTLR: Arbeiten mit dem Listener-Pattern

ANTLR (generiert auf Wunsch) zur Grammatik passende Listener (Interface und leere Basisimplementierung). Beim Traversieren mit dem Default-`ParseTreeWalker` wird der Parse-Tree mit Tiefensuche abgelaufen und jeweils beim Eintritt in bzw. beim Austritt aus einen/m Knoten der passende Listener mit dem passenden Kontext-Objekt aufgerufen.

Damit kann man die Grammatik "für sich" halten, d.h. unabhängig von einer konkreten Zielsprache und die Aktionen über die Listener (oder Visitors, s.u.) ausführen.

``` {.antlr size="footnotesize"}
expr : e1=expr '*' e2=expr      # MULT
     | e1=expr '+' e2=expr      # ADD
     | DIGIT                    # ZAHL
     ;
```

ANTLR kann zu dieser Grammatik einen passenden Listener (Interface `calcListener`) generieren. Weiterhin generiert ANTLR eine leere Basisimplementierung (Klasse `calcBaseListener`):

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/06-interpretation/images/ParseTreeListener_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/06-interpretation/images/ParseTreeListener.png"  /></picture></p>

Von dieser Basisklasse leitet man einen eigenen Listener ab und implementiert die Methoden, die man benötigt.

``` {.java size="footnotesize"}
public static class MyListener extends calcBaseListener {
    Stack<Integer> stack = new Stack<Integer>();

    public void exitMULT(calcParser.MULTContext ctx) {
        int right = stack.pop();
        int left = stack.pop();
        stack.push(left * right);   // {$v = $e1.v * $e2.v;}
    }
    public void exitADD(calcParser.ADDContext ctx) {
        int right = stack.pop();
        int left = stack.pop();
        stack.push(left + right);   // {$v = $e1.v + $e2.v;}
    }
    public void exitZAHL(calcParser.ZAHLContext ctx) {
        stack.push(Integer.valueOf(ctx.DIGIT().getText()));
    }
}
```

Anschließend baut man das alles in eine Traversierung des Parse-Trees ein:

``` java
public class TestMyListener {
    public static class MyListener extends calcBaseListener {
        ...
    }

    public static void main(String[] args) throws Exception {
        calcLexer lexer = new calcLexer(CharStreams.fromStream(System.in));
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        calcParser parser = new calcParser(tokens);

        ParseTree tree = parser.s();    // Start-Regel
        System.out.println(tree.toStringTree(parser));

        ParseTreeWalker walker = new ParseTreeWalker();
        MyListener eval = new MyListener();
        walker.walk(eval, tree);
        System.out.println(eval.stack.pop());
    }
}
```

<p align="right"><a href="https://github.com/Compiler-CampusMinden/CPL-Vorlesung-Master/blob/master/lecture/06-interpretation/src/TestMyListener.java">Beispiel: TestMyListener.java und calc.g4</a></p>

###### ANTLR: Arbeiten mit dem Visitor-Pattern

ANTLR (generiert ebenfalls auf Wunsch) zur Grammatik passende Visitoren (Interface und leere Basisimplementierung). Hier muss man allerdings selbst für eine geeignete Traversierung des Parse-Trees sorgen. Dafür hat man mehr Freiheiten im Vergleich zum Listener-Pattern, insbesondere im Hinblick auf Rückgabewerte.

``` {.antlr size="footnotesize"}
expr : e1=expr '*' e2=expr      # MULT
     | e1=expr '+' e2=expr      # ADD
     | DIGIT                    # ZAHL
     ;
```

ANTLR kann zu dieser Grammatik einen passenden Visitor (Interface `calcVisitor<T>`) generieren. Weiterhin generiert ANTLR eine leere Basisimplementierung (Klasse `calcBaseVisitor<T>`):

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/06-interpretation/images/ParseTreeVisitor_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/lecture/06-interpretation/images/ParseTreeVisitor.png"  /></picture></p>

Von dieser Basisklasse leitet man einen eigenen Visitor ab und überschreibt die Methoden, die man benötigt. Wichtig ist, dass man selbst für das "Besuchen" der Kindknoten sorgen muss (rekursiver Aufruf der geerbten Methode `visit()`).

``` {.java size="footnotesize"}
public static class MyVisitor extends calcBaseVisitor<Integer> {
    public Integer visitMULT(calcParser.MULTContext ctx) {
        return visit(ctx.e1) * visit(ctx.e2);   // {$v = $e1.v * $e2.v;}
    }
    public Integer visitADD(calcParser.ADDContext ctx) {
        return visit(ctx.e1) + visit(ctx.e2);   // {$v = $e1.v + $e2.v;}
    }
    public Integer visitZAHL(calcParser.ZAHLContext ctx) {
        return Integer.valueOf(ctx.DIGIT().getText());
    }
}
```

Anschließend baut man das alles in eine manuelle Traversierung des Parse-Trees ein:

``` java
public class TestMyVisitor {
    public static class MyVisitor extends calcBaseVisitor<Integer> {
        ...
    }

    public static void main(String[] args) throws Exception {
        calcLexer lexer = new calcLexer(CharStreams.fromStream(System.in));
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        calcParser parser = new calcParser(tokens);

        ParseTree tree = parser.s();    // Start-Regel
        System.out.println(tree.toStringTree(parser));

        MyVisitor eval = new MyVisitor();
        System.out.println(eval.visit(tree));
    }
}
```

<p align="right"><a href="https://github.com/Compiler-CampusMinden/CPL-Vorlesung-Master/blob/master/lecture/06-interpretation/src/TestMyVisitor.java">Beispiel: TestMyVisitor.java und calc.g4</a></p>

##### Wrap-Up

-   Interpreter simulieren die Programmausführung

<!-- -->

-   Syntaxgesteuerter Interpreter (attributierte Grammatiken)
-   Beispiel ANTLR: Eingebettete Aktionen, Kontextobjekte, Visitors/Listeners (AST-Traversierung)

> [!TIP]
>
> <details open>
> <summary><strong>📖 Zum Nachlesen</strong></summary>
>
> -   Nystrom ([2021](#ref-Nystrom2021)): Kapitel: A Tree-Walk Interpreter
> -   Levine ([2009](#ref-Levine2009)): Bison, Kapitel 6
> -   Parr ([2014](#ref-Parr2014)): Kapitel 6.4 und 8.4
> -   Parr ([2010](#ref-Parr2010)): Kapitel 8 und 9
>
> </details>

> [!NOTE]
>
> <details >
> <summary><strong>✅ Lernziele</strong></summary>
>
> -   k3: Ich kann Attribute und eingebettete Aktionen in ANTLR einsetzen
> -   k3: Ich kann Parse-Trees traversieren und Aktionen implementieren mit Hilfe des Listener-Patterns
> -   k3: Ich kann Parse-Trees traversieren und Aktionen implementieren mit Hilfe des Visitor-Patterns
>
> </details>

<a id="id-d6f69e8d1e7eb66faad0157893fc81e79a683473"></a>

### Optimierung

Üblicherweise finden sich die verschiedenen Optimierungsmöglichkeiten in der Backend-Phase. Man kann u.a. zwischen lokaler und globaler Optimierung oder beispielsweise JIT unterscheiden. Es kann sehr unterschiedliche Ziele für die Optimierung geben, beispielsweise möchte man den Code kleiner(kürzer, kompakter) gestalten oder die Laufzeit für das Programm verringern oder sogar Energieaspekte berücksichtigen.

<a id="id-8517cc4b94e74e2d9db32a91d3b1c7960002a981"></a>

#### Optimierung und Datenflussanalyse

> [!TIP]
>
> <details open>
> <summary><strong>🖇 Weitere Unterlagen</strong></summary>
>
> -   [Annotierte Folien: Optimierung und Datenflussanalyse](https://github.com/Compiler-CampusMinden/AnnotatedSlides/blob/master/optimization.ann.ma.pdf)
>
> </details>

##### Motivation

###### Was geschieht hier?

    01  {
    02    var a;
    03    var b = 2;
    04    b = a;
    05  }

##### Thema für heute: Optimierungen

###### Was ist Optimierung in Compilern?

Verändern von Quellcode, Zwischencode oder Maschinencode eines Programms mit dem Ziel,

-   Laufzeit,
-   Speicherplatz oder
-   Energieverbrauch

zu verbessern.

###### Was ist machbar?

Manche Optimierungen machen den Code nur in bestimmten Fällen schneller, kleiner oder stromsparender.

Den optimalen Code zu finden, ist oft NP-vollständig oder sogar unentscheidbar.

-   Heuristiken kommen zum Einsatz.

-   Der Code wird verbessert, nicht in jedem Fall optimiert, manchmal auch verschlechtert.

-   Der Einsatz eines Debuggers ist meist nicht mehr möglich.

###### Anforderungen an Optimierung

-   sichere Transformationen durchführen

-   möglichst keine nachteiligen Effekte erzeugen

###### Optimierung zur Übersetzungszeit vs. Optimierung zur Laufzeit

-   Just-in-time-Compilierung (JIT), z. B. Java:

    Fast alle Optimierungsmaßnahmen finden in der virtuellen Maschine zur Laufzeit statt.

-   Ahead-of-time-Compilierung (AOT), z. B. C:

    Der Compiler erzeugt Maschinencode, die Optimierung findet zur Übersetzungszeit statt.

Beide haben ihre eigenen Optimierungsmöglichkeiten, es gibt aber auch Methoden, die bei beiden einsetzbar sind.

###### Welcher Code wird optimiert?

-   Algebraische Optimierung: Transformationen des Quellcodes

-   Maschinenunabhängige Optimierung: Transformationen des Zwischencodes

-   Maschinenabhängige Optimierung: Transformationen des Assemblercodes oder Maschinencodes

Viele Transformationen sind auf mehr als einer Ebene möglich. Wir wenden hier die meisten auf den Zwischencode an.

###### Welche Arten von Transformationen sind möglich?

-   Eliminierung unnötiger Berechnungen

-   Ersetzung von teuren Operationen durch kostengünstigere

###### Basisblöcke und Flussgraphen

**Def.:** Ein *Basisblock* ist eine Sequenz maximaler Länge von Anweisungen, die immer hintereinander ausgeführt werden.

Ein Sprungbefehl kann nur der letzte Befehl eines Basisblocks sein.

**Def.:** Ein *(Kontroll)Flussgraph* $G = (V, E)$ ist ein Graph mit

$V = \lbrace B_i \ \vert \ B_i \text{ ist ein Basisblock des zu compilierenden Programms} \rbrace$,

$E = \lbrace (B_i, B_j)\ \vert \text{ es gibt einen Programmlauf, in dem } B_j \text{ direkt hinter } B_i \text{ ausgeführt wird} \rbrace$

###### Beispiel

Hier entsteht ein Tafelbild.

###### Häufig benutzte Strategie: Peephole-Optimierung

Ein Fenster mit wenigen Zeilen Inhalt gleitet über den Quellcode, Zwischencode oder den Maschinencode. Der jeweils sichtbare Code wird mit Hilfe verschiedener Verfahren optimiert, wenn möglich.

Peephole-Optimierung ist zunächst ein lokales Verfahren, kann aber auch auf den gesamten Kontrollflussgraphen erweitert werden.

=\> Anwendung von Graphalgorithmen!

##### Algebraische Optimierung

###### Ersetzen von Teilbäumen im AST durch andere Bäume

        x = x*2         =>      x << 1

        x = x + 0       // k.w.
        x = x * 1       // k.w.

        x = x*0         =>      x = 0
        x = x*8         =>      x = x << 3

Sei $s = 2^a + 2^b$ die Summe zweier Zweierpotenzen:

        x = n*s         =>      (n << a) + (n << b)

Diese Umformungen können zusätzlich mittels Peephole-Optimierung in späteren Optimierungsphasen durchgeführt werden.

##### Maschinenunabhängige Optimierung

###### Maschinenunabhängige Optimierung

-   lokal (= innerhalb eines Basisblocks), z. B. Peephole-Optimierung

    Einige Strategien sind auch global einsetzbar (ohne die sog. Datenflussanalyse s. u.)

-   global, braucht nicht-lokale Informationen

    -   meist unter Zuhilfenahme der Datenflussanalyse
    -   Schleifenoptimierung

###### Zwischencode (intermediate code); hier: Drei-Adress-Code

-   registerbasiert
-   Formen: `x = y op z, x = op z, x = y`
-   temporäre Variablen für Zwischenergebnisse
-   bedingte und unbedingte Sprünge
-   Pointerarithmetik für Indizierung

<!-- -->

    i = 0
    while(f[i] > 100)
        i = i + 1;

        i = 0
    L1: t1 = i * 8
        t2 = f + t1
        if t2 <= 100 goto L2
        t3 = i + 1
        i = t3
        goto L1
    L2: ...

##### Lokale Optimierung

###### Constant Folding und Common Subexpression elimination

-   "*Constant Folding*": Auswerten von Konstanten zur Compile-Zeit

        x = 6 * 7         =>      x = 42
        if 2 > 0 jump L   =>      jump L

<!-- -->

-   "*Common Subexpression Elimination*"

        x = y + z
        ...
        a = y + z

    ersetze mit (falls in `...` keine weiteren Zuweisungen an `x`, `y`, `z` erfolgen)

        x = y + z
        ...
        a = x

###### Elimination redundanter Berechnungen in einem Basisblock mitels DAGs

Hier werden sog. *DAG*s benötigt:

Ein DAG *directed acyclic graph* ist ein gerichteter, kreisfreier Graph.

DAGs werden für Berechnungen in Basisblöcken generiert, um gemeinsame Teilausdrücke zu erkennen.

*Bsp.:* a = (b + c) \* (b + c) / 2

###### Copy propagation

-   "*Copy Propagation*"

        x = y + z
        a = x
        b = 2*a

    ersetze mit

        x = y + z
        a = x
        b = 2*x

Wenn auf *a* vor seiner nächsten Zuweisung nicht mehr lesend zugegriffen wird, kann *a* hier entfallen.

##### Globale Optimierung

###### Control Flow und Dead Code

-   Kontrollfluss-Optimierungen

            if debug == 1 goto L1           if debug != 1 goto L2
            goto L2                         print debug info
        L1: print debug info            L2: ...
        L2: ...

<!-- -->

-   Elimination of unreachable code

             goto L1                        L1: a = b+c
             ...
         L1: a = b+c

###### Schleifenoptimierung

Loop unrolling:

            for i = 1 to 3                  print("1")
                print(i)                    print("2")
                                            print("3")

Code Hoisting:

-   Invarianten vor die Schleife schieben

           x = 0                           x = 0
        L: a = n*7                         a = n*7
           x = x + a                    L: x = x + a
           if x<42 jump L                  if x<42 jump L

###### Kombination zweier Verfahren

-   Loop Unrolling (für eine Iteration), danach Common Subexpression Elimination

        while (cond) {                  if (cond) {
            body                            body
        }                                   while (cond) {
                                                body
                                            }
                                        }

###### Datenflussanalyse

Die Datenflussanalyse (auf 3-Adress-Code) basiert auf dem Wissen der Verfügbarkeit von Variablen und Ausdrücken am Anfang oder Ende von Basisblöcken, und zwar für alle möglichen Programmläufe.

Man unterscheidet:

-   Vorwärtsanalyse (in Richtung der Nachfolger eines Basisblocks)

-   Rückwärtsanalyse (in Richtung der Vorgänger eines Basisblocks)

In beiden Fällen gibt es zwei Varianten:

-   any analysis: Es wird die Vereinigung von Informationen benachbarter Block berücksichtigt.

-   all analysis: Es wird die Schnittmenge von Informationen benachbarter Block berücksichtigt.

###### Forward-any-analysis

Diese Analyse wird zur Propagation von Konstanten und Variablen benutzt und bildet sukzessive Mengen von Zeilen mit Variablendefinitionen.

$$out(B_i) = gen(B_i) \cup (in(B_i) - kill(B_i))$$

$out(B_i)$: alle Zeilennummern von Variablendefinitionen, die am Ende von $B_i$ gültig sind

$in(B_i)$: alle Zeilennummern von Variablendefinitionen, die am Ende von Vorgängerblöcken von $B_i$ gültig sind

$gen(B_i)$: alle Zeilennummern von letzten Variablendefinitionen in $B_i$

$kill(B_i)$: alle Zeilennummern von Variablendefinitionen außerhalb von $B_i$, die in $B_i$ überschrieben werden

Zunächst ist $in(B_1) = \emptyset$, danach ist $in(B_i) = \bigcup  out(B_j)$ mit $B_j$ ist Vorgänger von $B_i$.

###### Forward-all-analysis

Diese Analyse wird zur Berechnung verfügbarer Ausdrücke der Form $x = y\ op\ z$ für die Eliminierung redundanter Berechnungen benutzt und bildet sukzessive Mengen von Ausdrücken.

$$out(B_i) = gen(B_i) \cup (in(B_i) - kill(B_i))$$

$out(B_i)$: alle am Ende von $B_i$ verfügbaren Ausdrücke

$in(B_i)$: alle Ausdrücke, die am Anfang von $B_i$ verfügbar sind

$gen(B_i)$: alle in $B_i$ berechneten Ausdrücke

$kill(B_i)$: alle Ausdrücke $x\ op\ y$ mit einer Definition von $x$ oder $y$ in $B_i$ und $x\ op\ y$ ist nicht in $B_i$

Zunächst ist $gen(B_1) = \emptyset$, danach ist $in(B_i) = \bigcap  out(B_j)$ mit $B_j$ ist Vorgänger von $B_i$.

###### Backward-any-analysis

Diese Analyse dient der Ermittlung von lebenden und toten Variablen (für die Registerzuweisung) und bildet sukzessive Mengen von Variablen.

$$in(B_i) = gen(B_i) \cup (out(B_i) - kill(B_i))$$

$out(B_i)$: alle Variablen, die am Ende von $B_i$ lebendig sind

$in(B_i)$: alle Variablen, die am Ende von Vorgängerblöcken von $B_i$ lebendig sind

$gen(B_i)$: alle Variablen, deren erstes Vorkommen auf der echten Seite einer Zuweisung steht

$kill(B_i)$: alle Variablen, denen in $B_i$ Werte zugewiesen werden.

Zunächst ist $out(B_n) = \emptyset$, danach ist $out(B_i) = \bigcup in(B_j)$ mit $B_j$ ist Nachfolger von $B_i$.

###### Backward-all-analysis

Diese Analyse wird zur Berechnung von "very busy" Ausdrücken der Form $x = y\ op\ z$, die auf allen möglichen Wegen im Flussgraphen vom aktuellen Basisblock aus mindestens einmal benutzt werden. Ausdrücke sollten dort berechnet werden, wo sie very busy sind, um den Code kürzer zu machen.

$$in(B_i) = gen(B_i) \cup (out(B_i) - kill(B_i))$$

$out(B_i)$: alle Ausdrücke $x\ op\ y$, die am Ende von $B_i$ very busy sind

$in(B_i)$: alle Ausdrücke, die am Anfang von $B_i$ very busy sind

$gen(B_i)$: alle in $B_i$ benutzen Ausdrücke

$kill(B_i)$: alle Ausdrücke $x\ op\ y$, deren Operanden in $B_i$ nicht redefiniert werden.

Zunächst ist $out(B_n) = \emptyset$, danach ist $out(B_i) = \bigcap in(B_j)$ mit $B_j$ ist Nachfolger von $B_i$.

##### Maschinenabhängige Optimierung

###### Elimination redundanter Lade-, Speicher- und Sprungoperationen

        LD a, R0
        ST R0, a        // k.w.

            goto L1         goto L2
            ...             ...
        L1: goto L2     L1: goto L2

###### Register Allocation: Liveness Analysis

    a = b + c
    d = a + b
    e = d - 1

`a`, `d`, `e` können auf **ein** Register abgebildet werden!

    r1 = r2 + r3
    r1 = r1 + r2
    r1 = r1 - 1

=\> `a` und `d` sind nach Gebrauch "*tot*"

###### Berechnung der minimal benötigten Anzahl von Registern

=\> Liveness-Graph, Färbungsproblem für Graphen!

Es wird ein Graph $G = (V, E)$ erzeugt mit

$V = \lbrace v \ \vert \ v \text{ ist eine benötigte Variable} \rbrace$ und $E = \lbrace (v_1, v_2)\ \vert \ v_1  \text{ und } v_2 \text{ sind zur selben Zeit "lebendig"} \rbrace$

Heuristisch wird jetzt die minimale Anzahl von Farben für Knoten bestimmt, bei der benachbarte Knoten nicht dieselbe Farbe bekommen.

=\> Das Ergebnis ist die Zahl der benötigten Register.

###### Und wenn man nicht so viele Register zur Verfügung hat?

Registerinhalte temporär in den Speicher auslagern ("*Spilling*").

Kandidaten dafür werden mit Heuristiken gefunden, z. B. Register mit vielen Konflikten (= Kanten) oder Register mit selten genutzten Variablen.

In Schleifen genutzte Variablen werden eher nicht ausgelagert.

##### Optimierung zur Reduzierung des Energieverbrauchs

###### Energieverbrauch verschiedener Maschinenbefehle

Maschinenoperationen, die nur auf Registern arbeiten, verbrauchen die wenigste Energie.

Operationen, die nur lesend auf Speicherzellen zugreifen, verbrauchen ca. ein Drittel mehr Energie.

Operationen, die Speicherzellen beschreiben, benötigen zwei Drittel mehr Energie als die Operationen ausschließlich auf Register.

###### Energieeinsparung durch laufzeitbezogene Optimierung

Kürzere Programmlaufzeiten führen in der Regel auch zu Energieeinsparungen.

**gcc -O1** spart 2% bis 70% (durchschnittlich 20%) Energie

Umgekehrt: Energiebezogene Optimierung führt in der Regel zu kürzeren Laufzeiten.

###### Prozessorspannung variieren

Viele Prozessoren ermöglichen es, die Betriebsspannung per Maschinenbefehl zu verändern.

Eine höhere Spannung bewirkt eine proportionale Steigerung der Prozessorgeschwindigkeit und des fließenden Stroms, aber einen quadratischen Anstieg des Energieverbrauchs. $(P = U \times I, U = R \times I)$

Folgendes kann man ausnutzen:

Die Verringerung der Spannung um 20% führt zu einer um 20% geringeren Prozessorgeschwindigkeit, d. h. das Programm braucht 25% mehr Zeit, verbraucht aber 36% $(1-(1-0,2)^2)$ weniger Energie.

=\> Wenn das Programm durch Optimierung um 25% schneller wird und die Prozessorspannung um 20% verringert wird, verändert sich die Laufzeit des Programms nicht, man spart aber 36% Energie.

##### Wrap-Up

###### Wrap-Up

-   Verschiedene Optimierungsverfahren auf verschiedenen Ebenen, Peephole
-   Datenflussanalyse
-   Senkung des Energieverbrauchs durch Optimierung

> [!TIP]
>
> <details open>
> <summary><strong>📖 Zum Nachlesen</strong></summary>
>
> -   Güting ([1999](#ref-Güting1999)): Kapitel 8
> -   Grune u. a. ([2012](#ref-Grune2012)): Kapitel 9.3
> -   Aho u. a. ([2023](#ref-Aho2023)): Kapitel 9
> -   Mogensen ([2017](#ref-Mogensen2017)): Kapitel 8, 10 und 11
>
> </details>

> [!NOTE]
>
> <details >
> <summary><strong>✅ Lernziele</strong></summary>
>
> -   k1: Ich kenne verschiedene algebraische Optimierungen
> -   k1: Ich kenne verschiedene maschinenunabhängige Optimierungen
> -   k1: Ich kenne verschiedene maschinenabhängige Optimierungen
> -   k1: Ich kenne Datenflussanalyse auf 3-Adress-Code
>
> </details>

<a id="id-a264d337dcfeece8936f208b6f89bb1efe99ea0f"></a>

## Praktikum

Hier finden Sie die Übungsblätter.

<a id="id-a73470af5aac0f6102a1f24e33280ebad2acc29d"></a>

### Seminaristischer Unterricht: Vortragsthemen Kurzvortrag/Fachvortrag

#### Kurzvortrag "PL Feature" (ca. 20 Minuten, DE)

Ziel ist die Einführung in ein ausgewähltes Programmiersprachen-Thema. Das vortragende Team arbeitet die Kernideen heraus und demonstriert zentrale Konzepte anhand kleiner, prägnanter Beispiele und leitet die anschließende Diskussion.

Alle Teams haben die Literatur zu den Kurzvorträgen zumindest grob überflogen. Das vortragende Team leitet die an den Vortrag anschließende Diskussion und bereitet 2-4 gezielte Diskussionsfragen zur Aktivierung der Zuhörenden vor.

##### Verfügbare Themen

1.  Object-Oriented Paradigm (OOP) (([Gabbrielli und Martini 2023](#ref-Gabbrielli2023)), Kap. 10)
2.  Functional Programming Paradigm (FP) (([Gabbrielli und Martini 2023](#ref-Gabbrielli2023)), Kap. 11)
3.  Logic Programming Paradigm (LP) (([Gabbrielli und Martini 2023](#ref-Gabbrielli2023)), Kap. 12)
4.  Constraint Programming Paradigm (CP) (([Gabbrielli und Martini 2023](#ref-Gabbrielli2023)), Kap. 13)
5.  Borrow Checking und Lifetimes am Beispiel [Rust](https://www.rust-lang.org/)
6.  Dependent Type Systems am Beispiel [Idris](https://www.idris-lang.org/)
    -   [Why Dependent Types Matter](https://people.cs.nott.ac.uk/psztxa/publ/ydtm.pdf)
    -   [IDRIS ---: systems programming meets full dependent types](https://dl.acm.org/doi/10.1145/1929529.1929536)

##### Weitere mögliche Themen (nach Absprache)

-   Algebraische Effekte und Effekt-Systeme (z.B. Koka), Exceptions vs. Effekte
-   Pattern Matching und Algebraische Datentypen (OCaml/F#/Scala)
-   Metaprogrammierung und Makros (Lisp/Clojure, Rust macro_rules! und proc-macros)
-   Gradual Typing (TypeScript, Sorbet), Typklassen und Traits (Haskell/Rust)

##### Hinweise

-   *Jede Person* bereitet sich vorab vor; das präsentierende Team moderiert die Diskussion
-   Ziel ist Transferfähigkeit: Nach dem Vortrag sollen Zuhörende weiterführende Literatur verstehen und Ideen praktisch erproben können
-   Empfohlen: Zwei bis drei gut kuratierte Codebeispiele (live oder als Snippets), Vorbereitung von einigen Diskussionsfragen
-   Vortragssprache ist Deutsch

#### Fachvortrag "Compiler" (ca. 60 Minuten + 10 Minuten Q&A, DE)

Ziel ist die systematische Einführung in ein Compiler/VM-Thema mit genügend fachlicher Tiefe, so dass die Zuhörenden danach relevante Literatur lesen und das Thema praktisch anwenden können.

Bitte achten Sie auf eine präzise Begriffsbildung und den Einordnung in den Stand der Forschung/Praxis. Erstellen Sie eigene Beispiele und ggf. kurze Demos.

##### Verfügbare Themen

1.  Parsergeneratoren ([ANTLR](https://www.antlr.org/), [Tree-Sitter](http://tree-sitter.github.io/tree-sitter/), Flex & Bison, ...)
2.  Fortgeschrittene Parsertechniken: LALR, PEG, Pratt, Parser-Combinators
3.  Typen, Typsysteme, Type Checking
    -   [Hindley-Milner-Typsystem](https://en.wikipedia.org/wiki/Hindley%E2%80%93Milner_type_system)
    -   [Propositions as Types (Wadler)](https://dl.acm.org/doi/abs/10.1145/2699407)
    -   [Typechecker Zoo (Diehl)](https://sdiehl.github.io/typechecker-zoo/)
    -   [On Understanding Types, Data Abstraction, and Polymorphism (Cardelli/Wegner)](https://dl.acm.org/doi/pdf/10.1145/6041.6042)
4.  VM & Bytecode
    -   [AST vs. Bytecode: Interpreters in the Age of Meta-Compilation](https://dl.acm.org/doi/abs/10.1145/3622808)
    -   [An Introduction to Interpreters and JIT Compilation](https://stefan-marr.de/2023/09/pliss-summer-school/)
    -   [Optimizing the Order of Bytecode Handlers in Interpreters using a Genetic Algorithm](https://dl.acm.org/doi/abs/10.1145/3555776.3577712)
    -   Beispiele: JVM oder WASM
5.  Garbage Collection
    -   ([Nystrom 2021](#ref-Nystrom2021)), Kap. 26
    -   [Unified Theory of Garbage Collection](https://dl.acm.org/doi/10.1145/1035292.1028982)
    -   [Fast Conservative Garbage Collection](https://dl.acm.org/doi/10.1145/2660193.2660198)
    -   [GC vs. explicit memory management](https://dl.acm.org/doi/10.1145/1103845.1094836)
6.  Just-in-Time Compilation (JIT)
    -   [An Introduction to Interpreters and JIT Compilation](https://stefan-marr.de/2023/09/pliss-summer-school/)
    -   [AST vs. Bytecode: Interpreters in the Age of Meta-Compilation](https://dl.acm.org/doi/abs/10.1145/3622808)

##### Weitere mögliche Themen (nach Absprache)

-   Fehlertolerantes Parsen und Diagnosequalität (Error Recovery, präzise Fehlermeldungen)
-   Inkrementelle/Interaktive Compiler (IDE-Services, Language Server Protocol)
-   Testen von Compilern
    -   [Finding and Understanding Bugs in C Compilers](https://users.cs.utah.edu/~regehr/papers/pldi11-preprint.pdf)
    -   [Validating JIT Compilers via Compilation Space Exploration](https://connglli.github.io/pdfs/artemis_sosp23.pdf)
    -   [A Survey of Compiler Testing](https://software-lab.org/publications/csur2019_compiler_testing.pdf)
    -   [An empirical comparison of compiler testing techniques](https://xiongyingfei.github.io/papers/ICSE16.pdf)
    -   [Compiler Testing: A Systematic Literature Analysis](https://arxiv.org/abs/1810.02718)
    -   [Snapshot Testing for Compilers](https://www.cs.cornell.edu/~asampson/blog/turnt.html)
    -   [Tiny Unified Runner N' Tester (Turnt)](https://github.com/cucapra/turnt)
    -   [Testing Language Implementations](https://youtu.be/ZJUk8_k1HbY?si=Mis0l6M07vbI8Rqx)

##### Hinweise

Planen Sie im Anschluss an den 60-minütigen Vortrag ca. 10 Minuten Q&A und Diskussion ein.

<a id="id-441c6299f10fc33707a0080c5fef11dc5a486466"></a>

### DSL-Projekt: Sprachen und Compiler

#### Ziel und Rahmen

In diesem Projekt beschäftigen Sie sich mit fortgeschrittenen Inhalten im Bereich Programmiersprachen und Compilerbau. Sie können eigenständige Ideen einbringen oder einen der nachfolgend genannten Vorschläge aufgreifen und verfeinern. Neben der praktischen Beschäftigung mit den Kurs-Themen recherchieren Sie selbstständig nach relevanter Fachliteratur und reflektieren Ihre Designentscheidungen.

<div data-align="center">

Für das MIF-1.5-Kursprojekt können Sie jede[^1] Idee wählen, die einen Bezug zum Compilerbau hat.

</div>

#### Passende Themen (nicht abschließend)

Umfang und geeignete Themen (Beispiele, nicht abschließend)

-   Sprachdesign (DSLs), Scanner/Parser (ANTLR, Tree-Sitter), Typ-/Effekt-Systeme
-   IR-Design und -Transformation (Intermediate Representation), z.B. [Bril](https://github.com/sampsyo/bril), SSA, Dataflow-Analysen
-   MLIR (Multi-Level IR): Dialektentwurf, Lowerings, Pass-Pipelines, Canonicalization
-   Interpreter, VM/JIT, Codegenerierung (z.B. LLVM), Linken/Laden
-   Statische Analysen, Verifikation, Symbolik/SMT, Transformationspipelines
-   E-Graphs und Equality Saturation (z.B. egg/egglog) für optimierende Umformungen
-   Tooling: Incremental Build/Hot-Reload, Profiling/Tracing, Debug-Infos, Fehlermeldungen

Bitte wählen Sie einen klar abgegrenzten Scope, der in Tiefe und Breite zum Semester passt. Definieren Sie mindestens:

-   einen Minimalumfang, den Sie sicher erreichen wollen (und können), und
-   ein oder zwei optionale Erweiterungen, die Sie angehen, wenn Zeit bleibt.

Der Minimalumfang muss einen Parser-/Analyse-/Interpreter-Kern enthalten, die Erweiterungen können z.B. IDE-Integration, Optimierungen oder empirische Evaluationen sein.

Potentiell interessante Literatur im Bereich DSL:

-   Fowler ([2010](#ref-Fowler2010))
-   Voelter ([2013](#ref-Voelter2013)) (*Anmerkung*: Das Buch ist recht alt, aber die ersten drei Kapitel könnten hilfreich sein.)
-   Mernik u. a. ([2005](#ref-mernik2005))

#### Projektanregungen

##### Escape-Rooms mit MiniJava-Auswertung

Parsen und Interpretieren von MiniJava-Code im [Dungeon](https://github.com/Dungeon-CampusMinden/Dungeon)

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/homework/images/dungeon-interpreter_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/homework/images/dungeon-interpreter.png" width="50%" /></picture></p>

<details>

Im [Dungeon-Projekt](https://github.com/Dungeon-CampusMinden/Dungeon) wurden verschiedene Escape-Room-Rätsel realisiert. In einigen dieser Rätseln sollen die Spieler:innen Aufgaben lösen, indem sie MiniJava-Code (ein eingeschränkter Sub-Dialekt von Java) in ein Textfenster eingeben. Dieser Code muss syntaktisch und semantisch korrekt sein und soll geeignet evaluiert werden. Man sieht dabei live die Auswertung und die Auswirkung auf das Spiel. Diese Rätsel richten sich an Programmier-Einsteiger:innen, und zur Lösung der Rätsel sollen beispielsweise Kontrollstrukturen, Schleifen, Funktionen und ggf. auch Klassen definiert und eingesetzt werden.

In der vorliegenden Implementierung wurden zu jeder Aufgabe ein oder mehrere teilweise komplexe reguläre Ausdrücke hinterlegt, mit der der eingegebene Code dann verglichen wird. Das ist nicht nur sehr umständlich und schlecht zu warten und zu erweitern, sondern erlaubt auch keine anderen Eingaben als die vorgesehenen, selbst wenn damit die Aufgabe inhaltlich korrekt gelöst werden würde.

Ziel dieses Projekt-Vorschlags ist zunächst die Erstellung eines inkrementellen Interpreters für die MiniJava-Eingaben. Der Interpreter muss dabei vorausgegangene Eingaben berücksichtigen (Session-Kontext oder Re-Initialisierung) und zu einer Eingabe ein Ergebnis liefern oder verständliche Fehlermeldungen. In einer zweiten Phase soll eine "Welt-Interaktion" (Interaktion des Interpreters mit dem Dungeon) realisiert werden: Über "eingebaute" Funktionen ("native functions") sollen Spieler:innen direkt in ihrem MiniJava-Code Einfluss auf Elemente im Dungeon nehmen können. Es gibt beispielsweise einen kleinen Roboter, dessen Zustand im MiniJava-Code abgefragt und verändert werden kann. Dabei soll die Kopplung möglichst flexibel bleiben und die Spieler:innen sollen nicht der komplexen Dungeon-API ausgesetzt werden. Optional könnten statische Prüfungen (Schleifenbegrenzung, Laufzeitlimits, ...) mit eingebaut werden und/oder untersucht werden, wie sich die Gestaltung der Fehlermeldungen auf die Lösungszeit/Fehlerrate auswirkt.

Dieses Projekt kann auch mit den nachfolgenden Projekt-Anregungen kombiniert werden.

</details>

##### Einsteiger-IDE für Escape-Rooms

Text-Widget mit LSP als Einsteiger-IDE

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/homework/images/dungeon-mini-ide_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/homework/images/dungeon-mini-ide.png" width="50%" /></picture></p>

<details>

Für die Code-Eingabe im [Dungeon-Projekt](https://github.com/Dungeon-CampusMinden/Dungeon) (vgl. voriger Projektvorschlag) wird ein Text-Widget benutzt. Dabei handelt es sich um die reine Eingabe von Text, es gibt kein Syntaxhighlighting oder Autocompletion oder eine Anzeige von Fehlern o.ä.

Ziel dieses Projekt-Vorschlags ist der Umbau des Text-Widgets zu einer "Mini-IDE" und Integration typischer IDE-Features wie Zeilennummern, Syntaxhighlighting, Autocompletion (Keywords, bekannte Namen aus aktuellem Scope, ...), Anzeige von Fehlern oder sogar Tool-Tips beim Hovern mit der Maus und Anzeige der Javadoc (falls vorhanden). Hierzu soll eine geeignete technische Einbindung des interaktiven Interpreter aus dem vorigen Projektvorschlag erarbeitet und umgesetzt werden - beispielsweise losgelöst als LSP-Server vom Text-Widget.

Dieses Projekt kann auch mit der obigen Projekt-Anregung kombiniert werden.

</details>

##### Visualisierung von Programmabläufen

Visualisierung von Programmabläufen in einem interaktiven Interpreter im [Dungeon-Framework](https://github.com/Dungeon-CampusMinden/Dungeon)

<details>

Sie entwickeln einen Interpreter, der z.B. einen Sub-Dialekt von Java ("MiniJava") oder Python ("MiniPython") zur Laufzeit in ein Computer-Spiel wie das Java-basierte [Dungeon-Framework](https://github.com/Dungeon-CampusMinden/Dungeon) oder das von Ihnen parallel im Wahlmodul "Computer Games" entwickelte Spiel integriert.

Im Mittelpunkt steht die Frage, wie sich der Dungeon als **erweiterte Laufzeitumgebung** eines Interpreters nutzen lässt:

-   Wie können Sie Zustände Ihrer Programmiersprache (Variablen, Objekte, Funktionsaufrufe) auf Elemente im Dungeon (z.B. NPCs, Türen, Schalter, Items) **abbilden und sichtbar machen**?
-   Wie können Sie umgekehrt Dungeon-Elemente als **sprachseitige Objekte** oder Werte einblenden, sodass sie in der interpretierten Sprache direkt gelesen, verändert oder überwacht werden können?

Ziel ist es, Programmabläufe im Dungeon zu visualisieren: Zustandsänderungen (z.B. Variablenwerte, Objektzustände) sollen sich in der Spielwelt widerspiegeln, etwa durch Bewegung von NPCs, Animationen, Hervorhebungen oder Overlays. Gleichzeitig sollen Änderungen im Dungeon (Events, Kollisionen, Interaktionen) in der interpretierten Sprache beobachtbar und bearbeitbar sein (z.B. über Callbacks, Events, REPL).

Untersuchen Sie geeignete Mappings zwischen Programmzustand und Spielzustand, diskutieren Sie Designalternativen und erstellen Sie eine prototypische Laufzeitintegration mit visueller Darstellung von Programmlogik im Spiel.

</details>

##### Quest-DSL

Entwerfen Sie eine Sprache zur Beschreibung von Quests, Übungsaufgaben und Escape Rooms

<details>

Didaktische Inhalte können in Serious Games effizienter bereitgestellt werden, wenn Lehrende über eine fachnahe, deklarative Sprache arbeiten. Spiele(-frameworks) wie beispielsweise das Dungeon-Framework (ECS, Game-Loop) haben eine entsprechende API, die Nutzung erfordert jedoch aktuell dedizierte Kenntnisse der API und der jeweiligen Programmiersprache. Eine **Quest-DSL** schließt diese Lücke und eröffnet Raum für Forschung zu Sprachdesign, Laufzeitintegration, Event-Verarbeitung und Performanz in Game-Loops.

Sie entwickeln eine domänenspezifische Sprache (DSL), mit der sich:

-   fachliche Unterrichtsaufgaben, Quests und ggf. komplette Escape Rooms **deklarativ beschreiben** lassen (z.B. Ziele, Bedingungen, Belohnungen, Abhängigkeiten, lineare/nicht-lineare Verläufe),
-   sowie das Spiel zur Laufzeit **steuern und auf Spielereignisse reagieren** kann (z.B. bei "Quest erfüllt", "Item eingesammelt", "NPC erreicht Zielposition").

Ihre DSL soll es erlauben, typische Quest-Logiken ohne direkten Kontakt zur Dungeon-API zu formulieren. Dazu gehört u.a.:

-   Entwurf der Sprachkonzepte (Syntax, Grundbausteine, z.B. Zustände, Bedingungen, Trigger, Aktionen),
-   Umsetzung eines Parsers und statischer Checks (Konsistenz, Vollständigkeit, Referenzierbarkeit von Objekten),
-   eine Laufzeitintegration in ein Spiel (z.B. Dungeon-Framework), die Quest-Definitionen lädt, auswertet und mit Spielereignissen koppelt.

Untersuchen Sie existierende Quest-DSLs und Game-Scripting-Sprachen als Ausgangspunkt und reflektieren Sie, welche Designentscheidungen Sie für Ihre Sprache treffen.

*Optional*: Sie können zusätzlich eine explizite IR (Zwischendarstellung) für Ihre DSL entwerfen und diese als Zwischenziel der Übersetzung nutzen, z.B. zur besseren Analysierbarkeit oder Optimierung.

</details>

##### Compiler Bootstrapping

Eine kleine Sprache mit OOP- und FP-Features entwerfen und zwei Compiler bauen

<details>

Sie entwerfen eine kleine Sprache "X" mit OOP- und FP-Elementen.

Sie implementieren Compiler "A" in einer bestehenden Sprache Ihrer Wahl (Haskell, OCaml, Racket, Clojure, Java, zur Not auch Python oder Rust oder andere). Compiler A übersetzt nur ein Minimal-Subset von X: "X-min". A parst X-min, prüft Typen in einfacher Form und erzeugt Code in der gewählten Zielsprache ("transpiling").

Sie schreiben nun in X-min den Compiler "B", der den vollen Sprachumfang von X übersetzen kann. Sie zeigen Bootstrapping: B wird mit A gebaut und kompiliert anschließend in X formulierte Programme. B parst und kompiliert die Vollsprache X. B darf intern ein Desugaring auf den Kern verwenden.

Bootstrapping: B wird mit A auf die Zielplattform transpiliert. Sie kompilieren die *Quellen* von B mit dem Compiler A. Sie erhalten daraus den Compiler B in der Zielsprache (Sourcecode für B in der Zielsprache, z.B. Haskell, Java, ...). Sie bauen nun B mit dem passenden Systemwerkzeug (z.B. javac oder gcc). Verwenden sie den so entstehenden ausführbaren Compiler B, um Programme der Vollsprache X zu kompilieren.

Self-Hosting: Kann Ihr Compiler B sich selbst kompilieren, also kann B den in X geschriebenen Quellcode von B korrekt übersetzen?

Transpiling: Die Codegenerierung kann als Transpilation in eine bestehende Zielsprache (z.B. Java oder C) erfolgen. Sie brauchen also keine SSA-Phase und Assembler-Generierung o.ä. umsetzen. Der so generierte Code soll sich mit Standardwerkzeugen kompilieren oder ausführen lassen (z.B. javac, gcc, python, node). Sie sollten vermutlich eine kleine Laufzeitbibliothek in der Zielsprache mitliefern.

</details>

##### LaTeX Equation Language

Parsen und übersetzen eines LaTeX-Teilgrammatik (Arithmetik, cases, Funktionsdefinition) in ausführbaren LLVM-IR-Code oder Java-Bytecode o.ä. Ziel: Brücke von symbolischer Notation zu maschinennahem Code.

##### MLIR/E-Graphs-Pipeline

Entwurf eines kleinen MLIR-Dialekts (z.B. arithmetische Ausdrücke) mit Lowering nach LLVM; alternativ/ergänzend Optimierung via E-Graphs (Equality Saturation) und anschließendes Lowering.

Neben passenden Konzepten soll auch eine geeignete Umsetzung/Implementierung erstellt und empirisch untersucht werden.

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
> <div id="ref-Fowler2010" class="csl-entry">
>
> Fowler, M. 2010. *Domain Specific Languages*. Addison Wesley. <https://learning.oreilly.com/library/view/domain-specific-languages/9780132107549/>.
>
> </div>
>
> <div id="ref-Gabbrielli2023" class="csl-entry">
>
> Gabbrielli, M., und S. Martini. 2023. *Programming Languages: Principles and Paradigms*. Springer Cham. <https://doi.org/10.1007/978-3-031-34144-1>.
>
> </div>
>
> <div id="ref-Grune2012" class="csl-entry">
>
> Grune, D., K. van Reeuwijk, H. E. Bal, C. J. H. Jacobs, und K. Langendoen. 2012. *Modern Compiler Design*. Springer.
>
> </div>
>
> <div id="ref-Güting1999" class="csl-entry">
>
> Güting, R. H. 1999. *Übersetzerbau: Techniken, Werkzeuge, Anwendungen*. Springer.
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
> <div id="ref-Levine2009" class="csl-entry">
>
> Levine, J. 2009. *Flex & Bison*. O'Reilly.
>
> </div>
>
> <div id="ref-mernik2005" class="csl-entry">
>
> Mernik, M., J. Heering, und A. M. Sloane. 2005. „When and How to Develop Domain-Specific Languages". *ACM Computing Surveys (CSUR)* 37 (4): 316--44. <https://john.cs.olemiss.edu/~hcc/csci658/notes/localcopy/WhenDSL.pdf>.
>
> </div>
>
> <div id="ref-Mogensen2017" class="csl-entry">
>
> Mogensen, T. 2017. *Introduction to Compiler Design*. Springer. <https://doi.org/10.1007/978-3-319-66966-3>.
>
> </div>
>
> <div id="ref-Nystrom2021" class="csl-entry">
>
> Nystrom, R. 2021. *Crafting Interpreters*. Genever Benning. <https://github.com/munificent/craftinginterpreters>.
>
> </div>
>
> <div id="ref-Parr2010" class="csl-entry">
>
> Parr, T. 2010. *Language Implementation Patterns*. Pragmatic Bookshelf. <https://learning.oreilly.com/library/view/language-implementation-patterns/9781680500097/>.
>
> </div>
>
> <div id="ref-Parr2014" class="csl-entry">
>
> Parr, T. 2014. *The Definitive ANTLR 4 Reference*. Pragmatic Bookshelf. <https://learning.oreilly.com/library/view/the-definitive-antlr/9781941222621/>.
>
> </div>
>
> <div id="ref-Torczon2012" class="csl-entry">
>
> Torczon, L., und K. Cooper. 2012. *Engineering a Compiler*. Morgan Kaufmann. <https://learning.oreilly.com/library/view/engineering-a-compiler/9780080916613/>.
>
> </div>
>
> <div id="ref-Voelter2013" class="csl-entry">
>
> Voelter, M. 2013. *DSL Engineering: Designing, Implementing and Using Domain-Specific Languages*. CreateSpace Independent Publishing Platform. <https://www.voelter.de/dslbook/markusvoelter-dslengineering-1.0.pdf>.
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

**Exceptions:**

-   ["Language Java"](https://www.99-bottles-of-beer.net/language-java-4.html) by Sean Russell on 99-bottles-of-beer.net
-   ["Language Prolog"](https://www.99-bottles-of-beer.net/language-prolog-965.html) by M@ on 99-bottles-of-beer.net
-   ["Language C"](https://www.99-bottles-of-beer.net/language-c-116.html) by Bill Wein on 99-bottles-of-beer.net
-   [A Map of the Territory (mountain.png)](https://github.com/munificent/craftinginterpreters/blob/master/site/image/a-map-of-the-territory/mountain.png) by [Bob Nystrom](https://github.com/munificent) on Github.com ([MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE))
-   Abzählreim "99 Bottles of Beer" nach ["Lyrics of the song 99 Bottles of Beer"](https://www.99-bottles-of-beer.net/lyrics.html) on 99-bottles-of-beer.net
-   Screenshot of ["Language Brainfuck"](https://99-bottles-of-beer.net/language-brainfuck-2542.html) by Michal Wojciech Tarnowski on 99-bottles-of-beer.net
-   ["Language Haskell"](https://www.99-bottles-of-beer.net/language-haskell-1070.html) by Iavor on 99-bottles-of-beer.net

<blockquote><p><sup><sub><strong>Last modified:</strong> 9c29d9d 2026-10-24 lecture: remove typos (cfg)<br></sub></sup></p></blockquote>

[^1]: ... for a given value of "*jede*" :) ... Die Idee muss zum Thema passen und vom Anspruch und Umfang her einem 10 ECTS Master-Modul angemessen sein.
