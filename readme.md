---
archetype: "home"
title: "MIF 1.5 (PO23): Concepts of Programming Languages (Winter 2024/25)"
---


![](admin/images/architektur_cb.png){width="80%"}


## Kursbeschreibung

Der Compiler ist das wichtigste Werkzeug in der Informatik. In der Königsdisziplin der
Informatik schließt sich der Kreis, hier kommen die unterschiedlichen Algorithmen und
Datenstrukturen und Programmiersprachenkonzepte zur Anwendung.

In diesem Modul geht es um ein fortgeschrittenes Verständnis für interessante Konzepte
im Compilerbau sowie um grundlegende Konzepte von Programmiersprachen und -paradigmen.
Wir schauen uns dazu relevante aktuelle Tools und Frameworks an und setzen diese bei
der Erstellung eines Bytecode-Compilers für unterschiedliche Programmiersprachen für
die Java-VM oder WASM ein.


## Überblick Modulinhalte

1.  Lexikalische Analyse: Scanner/Lexer
    *   Reguläre Sprachen
    *   Klassisches Vorgehen: RegExp nach NFA (Thompson's Construction),
        NFA nach DFA (Subset Construction), DFA nach Minimal DFA (Hopcroft's Algorithm)
    *   Manuelle Implementierung, Generierung mit ANTLR oder Flex
2.  Syntaxanalyse: Parser
    *   Kontextfreie Grammatiken (CFG), Chomsky
    *   LL-Parser (Top-Down-Parser)
        *   FIRST, FOLLOW
        *   Tabellenbasierte Verfahren, rekursiver Abstieg
        *   LL(1), LL(k), LL(*)
        *   Umgang mit Vorrang-Regeln, Assoziativität und linksrekursiven Grammatiken
    *   LR-Parser (Bottom-Up-Parser)
        *   Shift-Reduce
        *   LR(0), SLR(1), LR(1), LALR
    *   Generierung mit ANTLR oder Bison
3.  Semantische Analyse und Optimierungen
    *   Symboltabellen
        *   Namen und Scopes
        *   Typen, Klassen, Polymorphie
    *   Attributierte Grammatiken: L-attributed vs. R-attributed grammars
    *   Typen, Typ-Inferenz, Type Checking
    *   Datenfluss- und Kontrollfluss-Analyse
    *   Optimierungen: Peephole u.a.
4.  Zwischencode: Intermediate Representation (IR), LLVM-IR
5.  Interpreter
    *   AST-Traversierung
    *   Read-Eval-Schleife
    *   Resolver: Beschleunigung der Interpretation
6.  Code-Generierung, Bytecode/VM
    *   Speicherlayout
    *   Erzeugen von Bytecode
    *   Ausführen in einer Virtuellen Maschine
    *   Garbage Collection
7.  Programmiersprachen: Ruby, Prolog, Haskell, Lisp und die Auswirkungen der Konzepte
    auf den Compiler/Interpreter und die Laufzeitumgebung


## Team

*   [BC George](https://www.hsbi.de/minden/ueber-uns/personenverzeichnis/birgit-christina-george)
*   [Carsten Gips](https://www.hsbi.de/minden/ueber-uns/personenverzeichnis/carsten-gips) (Sprechstunde nach Vereinbarung)


## Kursformat

| Vorlesung (2 SWS)                                                     | Praktikum (3 SWS)              |
|:----------------------------------------------------------------------|:-------------------------------|
| Di, 14:00 - 15:30 Uhr (online)                                        | Di, 15:45 - 18:00 Uhr (online) |
| Durchführung als *Flipped Classroom* (Carsten) bzw. *Vorlesung* (BC). |                                |

Online-Sitzungen per Zoom (**Zugangsdaten siehe [ILIAS]**).
Sie _können_ hierzu den Raum J101 nutzen.

[ILIAS]: https://www.hsbi.de/elearning/goto.php?target=crs_1254534&client_id=FH-Bielefeld


## Prüfungsform, Note und Credits

**Projektabgabe plus Testat**, 10 ECTS (PO23)

*   **Testat**:

    1.  Mindestens 4 der Übungsblätter B01 - B05 erfolgreich bearbeitet, **und**
    2.  aktive Teilnahme an [Workshop I], **und**
    3.  aktive Teilnahme an mindestens 2 der 3 Edmonton-Termine, **und**
    4.  aktive Teilnahme an den Meilensteinen 1 bis 3.

    ("erfolgreich bearbeitet": Bearbeitung 2er Team, je mindestens 80% bearbeitet,
    fristgerechte Abgabe der Lösungen im ILIAS, Vorstellung der Lösungen im Praktikum)

*   **Gesamtnote**:

    Der Vortrag ([Workshop II]) sowie die Projektarbeit und -übergabe ([Workshop III])
    werden bewertet. Die Gesamtnote setzt sich zu 40% für den Vortrag und zu 60% für
    die Projektübergabe zusammen.


## Materialien

1.  ["**Compilers: Principles, Techniques, and Tools**"](https://learning.oreilly.com/library/view/compilers-principles-techniques/9789357054881/).
    Aho, A. V. und Lam, M. S. und Sethi, R. und Ullman, J. D. and Bansal, S., Pearson India, 2023.
    ISBN [978-9-3570-5488-1](https://fhb-bielefeld.digibib.net/openurl?isbn=978-9-3570-5488-1).
    [Online](https://learning.oreilly.com/library/view/compilers-principles-techniques/9789357054881/) über die [O'Reilly-Lernplattform](https://www.oreilly.com/library-access/).
2.  ["**Crafting Interpreters**"](https://github.com/munificent/craftinginterpreters).
    Nystrom, R., Genever Benning, 2021.
    ISBN [978-0-9905829-3-9](https://fhb-bielefeld.digibib.net/openurl?isbn=978-0-9905829-3-9).
    [Online](https://www.craftinginterpreters.com/).
3.  ["**The Definitive ANTLR 4 Reference**"](https://learning.oreilly.com/library/view/the-definitive-antlr/9781941222621/).
    Parr, T., Pragmatic Bookshelf, 2014. ISBN [978-1-9343-5699-9](https://fhb-bielefeld.digibib.net/openurl?isbn=978-1-9343-5699-9).
    [Online](https://learning.oreilly.com/library/view/the-definitive-antlr/9781941222621/) über die [O'Reilly-Lernplattform](https://www.oreilly.com/library-access/).
4.  ["Engineering a Compiler"](https://learning.oreilly.com/library/view/engineering-a-compiler/9780080916613/).
    Torczon, L. und Cooper, K., Morgan Kaufmann, 2012.
    ISBN [978-0-1208-8478-0](https://fhb-bielefeld.digibib.net/openurl?isbn=978-0-1208-8478-0).
    [Online](https://learning.oreilly.com/library/view/engineering-a-compiler/9780080916613/) über die [O'Reilly-Lernplattform](https://www.oreilly.com/library-access/).
5.  ["**Seven Languages in Seven Weeks**"](https://learning.oreilly.com/library/view/seven-languages-in/9781680500059/).
    Tate, B.A., Pragmatic Bookshelf, 2010.
    ISBN [978-1-93435-659-3](https://fhb-bielefeld.digibib.net/openurl?isbn=978-1-93435-659-3).
    [Online](https://learning.oreilly.com/library/view/seven-languages-in/9781680500059/) über die [O'Reilly-Lernplattform](https://www.oreilly.com/library-access/).


## Fahrplan

Hier finden Sie einen abonnierbaren [Google Kalender] mit allen Terminen der Veranstaltung zum Einbinden in Ihre Kalender-App.

| Monat    | Tag                         | Vorlesung                                                                                                     | Praktikum                                               | Lead        |
|:---------|:----------------------------|:--------------------------------------------------------------------------------------------------------------|:--------------------------------------------------------|:------------|
| Oktober  | 08.                         | [Orga] (**Zoom**); [Überblick], [Sprachen], [Anwendungen]                                                     |                                                         | Carsten, BC |
|          | 15.                         | [Reguläre Sprachen], [CFG], [LL-Parser]                                                                       |                                                         | BC          |
|          | 22.                         | [LR-Parser (LR(0), LALR)]                                                                                     | [B01] (CFG, LL)                                         | BC          |
|          | 29.                         | **[Workshop I]**: Sprache und Features (auf Sprachebene)                                                      | **Edmonton I: ANTLR + Live-Coding (CA)**                |             |
| November | 05.                         | [Attributierte Grammatiken]                                                                                   | [B02] (LR)                                              | BC          |
|          | 12.                         | [Überblick Symboltabellen], [Symboltabellen: Scopes], [Symboltabellen: Funktionen], [Symboltabellen: Klassen] | [B03] (Attr. Grammar)                                   | Carsten     |
|          | 19.                         | [Syntaxgesteuerte Interpreter], [AST-basierte Interpreter 1], [AST-basierte Interpreter 2]                    | [B04] (Symboltabellen)                                  | Carsten     |
|          | 26.                         | **[Workshop II]**: Sprache und Features (aus Compiler-Sicht)                                                  | **Edmonton II: Vortrag Mindener Projekte (Master, DE)** |             |
| Dezember | 03.                         | [Optimierung und Datenfluss- und Kontrollflussanalyse]                                                        | **Edmonton III: Vortrag Edmontoner Projekte (CA)**      | BC          |
|          | 10.                         | [Projekt-Pitch]: Vorstellen und Diskussion der Projektinhalte/-konzepte                                       | [B05] (Interpreter, Optimierung)                        | Carsten     |
|          | 17.                         | _Freies Arbeiten_                                                                                             | [Meilenstein 1]                                         |             |
|          | 24.                         | _Weihnachtspause_                                                                                             |                                                         |             |
|          | 31.                         | _Weihnachtspause_                                                                                             |                                                         |             |
| Januar   | 07.                         | _Freies Arbeiten_                                                                                             | [Meilenstein 2]                                         |             |
|          | 14.                         | _Freies Arbeiten_                                                                                             | [Meilenstein 3]                                         |             |
|          | 21.                         | **[Workshop III]**: Projektvorstellung                                                                        |                                                         |             |
|          | _(Prüfungsphase 1. Termin)_ | _Keine separate Prüfung - Projektabgabe_                                                                      |                                                         |             |
|          | _(Prüfungsphase 2. Termin)_ | _Keine separate Prüfung - Projektabgabe_                                                                      |                                                         |             |

Abgabe der Übungsblätter jeweils **bis Dienstag, 14:00 Uhr** [im ILIAS](https://www.hsbi.de/elearning/goto.php?target=exc_1356670&client_id=FH-Bielefeld).


[Google Kalender]: https://calendar.google.com/calendar/ical/5121604486803dcdb5cfaa8602b8b09ce76743d8b9216795606617cac807e595%40group.calendar.google.com/public/basic.ics

[Orga]: https://github.com/Compiler-CampusMinden/CB-Vorlesung-Master/discussions/categories/q-a?discussions_q=is%3Aopen+category%3AQ%26A

[Überblick]: lecture/intro/overview.md
[Sprachen]: lecture/intro/languages.md
[Anwendungen]: lecture/intro/applications.md

[Reguläre Sprachen]: lecture/frontend/lexing/regular.md
<!-- [Tabellenbasierte Lexer]: lecture/frontend/lexing/table.md -->
<!-- [Handcodierter Lexer]: lecture/frontend/lexing/recursive.md -->
<!-- [Lexer mit ANTLR]: lecture/frontend/lexing/antlr-lexing.md -->
<!-- [Lexer mit Flex]: lecture/frontend/lexing/flex.md -->

[CFG]: lecture/frontend/parsing/cfg.md
[LL-Parser]: lecture/frontend/parsing/ll-parser-theory.md
<!-- [LL-Parser (Praxis)]: lecture/frontend/parsing/ll-parser-impl.md -->
<!-- [LL: Fortgeschrittene Techniken]: lecture/frontend/parsing/ll-advanced.md -->
<!-- [Parser mit ANTLR]: lecture/frontend/parsing/antlr-parsing.md -->
<!-- [Parser mit Bison]: lecture/frontend/parsing/bison.md -->
[LR-Parser (LR(0), LALR)]: lecture/frontend/parsing/lr-parser.md
<!-- [LR-Parser (Teil 1)]: lecture/frontend/parsing/lr-parser1.md -->
<!-- [LR-Parser (Teil 2)]: lecture/frontend/parsing/lr-parser2.md -->
<!-- [PEG-Parser, Pratt-Parser]: lecture/frontend/parsing/parsercombinator.md -->
<!-- [Error Revocery]: lecture/frontend/parsing/recovery.md -->
<!-- [Grenze Lexer und Parser]: lecture/frontend/parsing/finalwords.md -->

[Attributierte Grammatiken]: lecture/frontend/semantics/attribgrammars.md

[Überblick Symboltabellen]: lecture/frontend/semantics/symboltables/intro-symbtab.md
[Symboltabellen: Scopes]: lecture/frontend/semantics/symboltables/scopes.md
[Symboltabellen: Funktionen]: lecture/frontend/semantics/symboltables/functions.md
[Symboltabellen: Klassen]: lecture/frontend/semantics/symboltables/classes.md

<!-- [Überblick Zwischencode]: lecture/intermediate/intro-ir.md -->
<!-- [LLVM als IR]: lecture/intermediate/llvm-ir.md -->

[Syntaxgesteuerte Interpreter]: lecture/backend/interpretation/syntaxdriven.md
[AST-basierte Interpreter 1]: lecture/backend/interpretation/astdriven-part1.md
[AST-basierte Interpreter 2]: lecture/backend/interpretation/astdriven-part2.md
<!-- [Garbage Collection]: lecture/backend/interpretation/gc.md -->
<!-- [Bytecode und VM]: lecture/backend/interpretation/vm.md -->

[Optimierung und Datenfluss- und Kontrollflussanalyse]: lecture/backend/optimization.md
<!-- [Maschinencode]: lecture/backend/machinecode.md -->

[B01]: homework/sheet01.md
[B02]: homework/sheet02.md
[B03]: homework/sheet03.md
[B04]: homework/sheet04.md
[B05]: homework/sheet05.md
[Projekt-Pitch]: homework/project.md
[Meilenstein 1]: homework/project.md
[Meilenstein 2]: homework/project.md
[Meilenstein 3]: homework/project.md
[Workshop I]: homework/project.md
[Workshop II]: homework/project.md
[Workshop III]: homework/project.md


## Förderungen und Kooperationen

### Kooperation mit University of Alberta, Edmonton (Kanada)

Über das Projekt ["We CAN virtuOWL"] der Fachhochschule Bielefeld ist im Frühjahr 2021 eine
Kooperation mit der [University of Alberta] (Edmonton/Alberta, Kanada) im Modul "Compilerbau"
gestartet.

Wir freuen uns, auch in diesem Semester wieder drei gemeinsame Sitzungen für beide
Hochschulen anbieten zu können. (Diese Termine werden in englischer Sprache durchgeführt.)

["We CAN virtuOWL"]: https://www.uni-bielefeld.de/international/profil/netzwerk/alberta-owl/we-can-virtuowl/
[University of Alberta]: https://www.hsbi.de/en/international-office/alberta-owl-cooperation







<!-- DO NOT REMOVE - THIS IS A LAST SLIDE TO INDICATE THE LICENSE AND POSSIBLE EXCEPTIONS (IMAGES, ...). -->
::: slides
## LICENSE
![](https://licensebuttons.net/l/by-sa/4.0/88x31.png)

Unless otherwise noted, this work is licensed under CC BY-SA 4.0.
:::
