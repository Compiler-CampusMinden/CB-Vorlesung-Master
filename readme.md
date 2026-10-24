# MIF 1.5: Concepts of Programming Languages (Winter 2026/27)

## Syllabus

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/admin/images/architektur_cb_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/admin/images/architektur_cb.png" width="80%" /></picture></p>

### Kursbeschreibung

Der Compiler ist das wichtigste Werkzeug in der Informatik. In der Königsdisziplin der Informatik schließt sich der Kreis, hier kommen die unterschiedlichen Algorithmen und Datenstrukturen und Programmiersprachenkonzepte zur Anwendung.

In diesem Modul geht es um ein fortgeschrittenes Verständnis für interessante Konzepte im Compilerbau sowie um grundlegende Konzepte von Programmiersprachen und -paradigmen. Wir schauen uns dazu relevante aktuelle Tools und Frameworks an und setzen diese bei der Erstellung eines Bytecode-Compilers für unterschiedliche Programmiersprachen für die Java-VM oder WASM ein.

### Überblick Modulinhalte

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

### Team

-   [BC George](https://www.hsbi.de/minden/ueber-uns/personenverzeichnis/birgit-christina-george)
-   [Carsten Gips](https://www.hsbi.de/minden/ueber-uns/personenverzeichnis/carsten-gips) (Sprechstunde nach Vereinbarung)

### Kursformat

| Seminaristischer Unterricht (2 SWS) | Praktikum (3 SWS)            |
|:------------------------------------|:-----------------------------|
| Fr, 08:45 - 10:15 Uhr (Zoom)        | Fr, 10:30 - 12:45 Uhr (Zoom) |

Durchführung des seminaristischen Unterrichts als *Flipped Classroom* (Carsten) bzw. als *reguläre Vorlesung* (BC). **Zugangsdaten Zoom siehe [ILIAS](https://www.hsbi.de/elearning/goto.php/crs/1702087)**.

### Fahrplan

| Monat | Woche (Fr) | Seminaristischer Unterricht | Praktikum | Edmonton/Minden-Meetings |
|---|:--|:---------------------------------|:------------------|:--------------|
| Oktober | 16.10. | Orga \|\| [Überblick](lecture/00-intro/overview.md) \| [Sprachen](lecture/00-intro/languages.md) \| [Anwendungen](lecture/00-intro/applications.md) | \- |  |
|  | 23.10. | [Reguläre Sprachen](lecture/01-lexing/regular.md) | [CFG](lecture/02-parsing/cfg.md) |  |
|  | 30.10. | [LL-Parser (Theorie)](lecture/02-parsing/ll-parser.md) | [Lexer (Implementierung)](lecture/01-lexing/recursive.md) \| [LL-Parser (Implementierung)](lecture/02-parsing/ll-parser-impl.md) |  |
| November | 06.11. | [LR-Parser](lecture/02-parsing/lr-parser.md) | **Vortrag**: Parsergeneratoren (ANTLR, Treesitter, Flex&Bison, ...) | **Di, 03.11., 17:00 - 18:00 Uhr (online): ANTLR + Live-Coding** |
|  | 13.11. | Semantische Analyse: [Intro](lecture/03-semantics/symbtab0-intro.md) \| [Scopes](lecture/03-semantics/symbtab1-scopes.md) \| [Funktionen](lecture/03-semantics/symbtab2-functions.md) \| [Klassen](lecture/03-semantics/symbtab3-classes.md) | **Vortrag**: LALR, PEG, Pratt, Combinators |  |
|  | 20.11. | **Vortrag**: Type Checking, Hindley-Milner | **Pitch DSL-Projekt** |  |
|  | 27.11. | **Kurzvortrag**: OOP (Gabbrielli & Martini, Kap. 10) | **Kurzvortrag**: FP (Gabbrielli & Martini, Kap. 11) |  |
| Dezember | 04.12. | [Interpreter 1](lecture/06-interpretation/astdriven-part1.md) \| [Interpreter 2](lecture/06-interpretation/astdriven-part2.md) | \- | **Mo, 30.11., 17:00 - 18:00 Uhr (online): Minden Presentations**: **Vorstellung "DSL-Projekt"** |
|  | 11.12. | **Vortrag**: VM & Bytecode | **Kurzvortrag**: LP (Gabbrielli & Martini, Kap. 12) | **Mo, 07.12., 17:00 - 18:00 Uhr (online): Edmonton Presentations** |
|  | 18.12. | [Optimierung und Datenfluss- und Kontrollflussanalyse](lecture/05-optimization/optimization.md) | **Kurzvortrag**: CP (Gabbrielli & Martini, Kap. 13) |  |
|  | *25.12.* | ***Weihnachtspause*** | \- |  |
|  | *01.01.* | ***Weihnachtspause*** | \- |  |
| Januar | 08.01. | **Vortrag**: Garbage Collection | **Vortrag**: JIT |  |
|  | 15.01. | **Kurzvortrag**: Borrow Checking und Lifetimes (Rust) | **Kurzvortrag**: Dependent Type Systems (Idris) |  |
|  | 22.01. | *Sprechstunde* | *Freies Arbeiten* |  |
|  | 29.01. | **Vorträge DSL-Projekt** | **Vorträge DSL-Projekt** |  |

-   [Zu den Talks ...](homework/talk.md)
-   [Zum DSL-Projekt ...](homework/project.md)

### Prüfungsform, Note und Credits

**Mündliche Prüfung plus Studienleistung (Portfolio)**, 10 ECTS

#### **Studienleistung**: "Portfolio"

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

#### **Gesamtnote**: Mündliche Prüfung (einzeln, ca. 45 Minuten)

Die Modul-Note ergibt sich aus der Leistung in der mündlichen Prüfung.

Sie können die Prüfung in der ersten oder in der zweiten Prüfungsphase ablegen. Die mündliche Prüfung wird über Zoom durchgeführt und dauert ca. 45 Minuten.

#### Hinweise

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

### Materialien

1.  ["**Compilers: Principles, Techniques, and Tools**"](https://learning.oreilly.com/library/view/compilers-principles-techniques/9789357054881/). Aho, A. V. und Lam, M. S. und Sethi, R. und Ullman, J. D. and Bansal, S., Pearson India, 2023. ISBN [978-9-3570-5488-1](https://fhb-bielefeld.digibib.net/openurl?isbn=978-9-3570-5488-1). [Online](https://learning.oreilly.com/library/view/compilers-principles-techniques/9789357054881/) über die [O'Reilly-Lernplattform](https://www.oreilly.com/library-access/).
2.  ["**Crafting Interpreters**"](https://github.com/munificent/craftinginterpreters). Nystrom, R., Genever Benning, 2021. ISBN [978-0-9905829-3-9](https://fhb-bielefeld.digibib.net/openurl?isbn=978-0-9905829-3-9). [Online](https://www.craftinginterpreters.com/).
3.  ["**Engineering a Compiler**"](https://learning.oreilly.com/library/view/engineering-a-compiler/9780080916613/). Torczon, L. und Cooper, K., Morgan Kaufmann, 2012. ISBN [978-0-1208-8478-0](https://fhb-bielefeld.digibib.net/openurl?isbn=978-0-1208-8478-0). [Online](https://learning.oreilly.com/library/view/engineering-a-compiler/9780080916613/) über die [O'Reilly-Lernplattform](https://www.oreilly.com/library-access/).
4.  ["Introduction to Compilers and Language Design"](https://www3.nd.edu/~dthain/compilerbook/). Thain, D., 2023. ISBN [979-8-655-18026-0](https://fhb-bielefeld.digibib.net/openurl?isbn=979-8-655-18026-0). [Online](https://www3.nd.edu/~dthain/compilerbook/).
5.  ["Writing a C Compiler"](https://learning.oreilly.com/library/view/writing-a-c/9781098182229/). Sandler, N., No Starch Press, 2024. ISBN [978-1-0981-8222-9](https://fhb-bielefeld.digibib.net/openurl?isbn=978-1-0981-8222-9). [Online](https://learning.oreilly.com/library/view/writing-a-c/9781098182229/) über die [O'Reilly-Lernplattform](https://www.oreilly.com/library-access/).
6.  ["**Seven Languages in Seven Weeks**"](https://learning.oreilly.com/library/view/seven-languages-in/9781680500059/). Tate, B.A., Pragmatic Bookshelf, 2010. ISBN [978-1-93435-659-3](https://fhb-bielefeld.digibib.net/openurl?isbn=978-1-93435-659-3). [Online](https://learning.oreilly.com/library/view/seven-languages-in/9781680500059/) über die [O'Reilly-Lernplattform](https://www.oreilly.com/library-access/).

### Förderungen und Kooperationen

#### Kooperation mit University of Alberta, Edmonton (Kanada)

Über das Projekt ["We CAN virtuOWL"](https://www.uni-bielefeld.de/international/profil/netzwerk/alberta-owl/we-can-virtuowl/) der Fachhochschule Bielefeld ist im Frühjahr 2021 eine Kooperation mit der [University of Alberta](https://www.hsbi.de/en/international-office/alberta-owl-cooperation) (Edmonton/Alberta, Kanada) im Modul "Compilerbau" gestartet.

Wir freuen uns, auch in diesem Semester wieder drei gemeinsame Sitzungen für beide Hochschulen anbieten zu können. (Diese Termine werden in englischer Sprache durchgeführt.)

------------------------------------------------------------------------

### LICENSE

<p align="center"><img src="https://licensebuttons.net/l/by-sa/4.0/88x31.png"  /></p>

Unless otherwise noted, [this work](https://github.com/Compiler-CampusMinden/CPL-Vorlesung-Master) by [BC George](https://github.com/bcg7), [Carsten Gips](https://github.com/cagix) and [contributors](https://github.com/Compiler-CampusMinden/CPL-Vorlesung-Master/graphs/contributors) is licensed under [CC BY-SA 4.0](https://github.com/Compiler-CampusMinden/CPL-Vorlesung-Master/blob/master/LICENSE.md). See the [credits](https://github.com/Compiler-CampusMinden/CPL-Vorlesung-Master/blob/master/CREDITS.md) for a detailed list of contributing projects.

<blockquote><p><sup><sub><strong>Last modified:</strong> 4f2e07a 2026-10-16 orga: improve readability<br></sub></sup></p></blockquote>
