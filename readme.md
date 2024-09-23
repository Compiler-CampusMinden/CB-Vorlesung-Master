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

| Vorlesung (2 SWS)                               | Praktikum (3 SWS)              |
|:------------------------------------------------|:-------------------------------|
| Di, 14:00 - 15:30 Uhr (online)                  | Di, 15:45 - 18:00 Uhr (online) |
| (Carsten: *Flipped Classroom*, BC: *Vorlesung*) |                                |

Online-Sitzungen per Zoom (**Zugangsdaten siehe [ILIAS]**).
Sie _können_ hierzu den Raum J101 (siehe Stundenplan) nutzen.

[ILIAS]: https://www.hsbi.de/elearning/goto.php?target=crs_1400613&client_id=FH-Bielefeld


## Prüfungsform, Note und Credits

**Parcoursprüfung plus Testat**, 10 ECTS (PO23)

*   **Testat**: Vergabe der Credit-Points

    1.  Mindestens 3 der Übungsblätter [B01], [B02], [B03], [B04] und [B05] erfolgreich bearbeitet, **und**
    2.  **aktive** Teilnahme an allen 3 Edmonton-Terminen.

    ("erfolgreich bearbeitet": Bearbeitung in 2er Teams, je mindestens 60% bearbeitet,
    fristgerechte Abgabe der Lösungen im ILIAS, Vorstellung der Lösungen im Praktikum)

*   **Gesamtnote**:

    Die Workshops werden bewertet und ergeben in folgender Gewichtung die Gesamtnote:
    *   20% [Workshop I],
    *   30% [Workshop II],
    *   50% [Workshop III].


## Materialien

1.  ["**Compilers: Principles, Techniques, and Tools**"](https://learning.oreilly.com/library/view/compilers-principles-techniques/9789357054881/).
    Aho, A. V. und Lam, M. S. und Sethi, R. und Ullman, J. D. and Bansal, S., Pearson India, 2023.
    ISBN [978-9-3570-5488-1](https://fhb-bielefeld.digibib.net/openurl?isbn=978-9-3570-5488-1).
    [Online](https://learning.oreilly.com/library/view/compilers-principles-techniques/9789357054881/) über die [O'Reilly-Lernplattform](https://www.oreilly.com/library-access/).
2.  ["**Crafting Interpreters**"](https://github.com/munificent/craftinginterpreters).
    Nystrom, R., Genever Benning, 2021.
    ISBN [978-0-9905829-3-9](https://fhb-bielefeld.digibib.net/openurl?isbn=978-0-9905829-3-9).
    [Online](https://www.craftinginterpreters.com/).
3.  ["**Engineering a Compiler**"](https://learning.oreilly.com/library/view/engineering-a-compiler/9780080916613/).
    Torczon, L. und Cooper, K., Morgan Kaufmann, 2012.
    ISBN [978-0-1208-8478-0](https://fhb-bielefeld.digibib.net/openurl?isbn=978-0-1208-8478-0).
    [Online](https://learning.oreilly.com/library/view/engineering-a-compiler/9780080916613/) über die [O'Reilly-Lernplattform](https://www.oreilly.com/library-access/).
4.  ["Introduction to Compilers and Language Design"](https://www3.nd.edu/~dthain/compilerbook/).
    Thain, D., 2023. ISBN [979-8-655-18026-0](https://fhb-bielefeld.digibib.net/openurl?isbn=979-8-655-18026-0).
    [Online](https://www3.nd.edu/~dthain/compilerbook/).
5.  ["Writing a C Compiler"](https://learning.oreilly.com/library/view/writing-a-c/9781098182229/).
    Sandler, N., No Starch Press, 2024. ISBN [978-1-0981-8222-9](https://fhb-bielefeld.digibib.net/openurl?isbn=978-1-0981-8222-9).
    [Online](https://learning.oreilly.com/library/view/writing-a-c/9781098182229/) über die [O'Reilly-Lernplattform](https://www.oreilly.com/library-access/).
6.  ["**Seven Languages in Seven Weeks**"](https://learning.oreilly.com/library/view/seven-languages-in/9781680500059/).
    Tate, B.A., Pragmatic Bookshelf, 2010.
    ISBN [978-1-93435-659-3](https://fhb-bielefeld.digibib.net/openurl?isbn=978-1-93435-659-3).
    [Online](https://learning.oreilly.com/library/view/seven-languages-in/9781680500059/) über die [O'Reilly-Lernplattform](https://www.oreilly.com/library-access/).


## Fahrplan

<!--
`{{% notice style="note" title="News" %}}`{=markdown}
Here be dragons ...
`{{% /notice %}}`{=markdown}
-->

Hier finden Sie einen abonnierbaren [Google Kalender] mit allen Terminen der Veranstaltung zum Einbinden in Ihre Kalender-App.

Abgabe der Übungsblätter jeweils **Dienstag bis 14:00 Uhr** im [ILIAS](https://www.hsbi.de/elearning/goto.php?target=exc_1421692&client_id=FH-Bielefeld). Vorstellung der Lösung im jeweiligen Praktikum in der Abgabewoche.

| Monat              | Tag | Vorlesung                                                                                                                                   | Lead           | Praktikum                        |
|:-------------------|:----|:--------------------------------------------------------------------------------------------------------------------------------------------|:---------------|:---------------------------------|
| Oktober            | 08. | [Orga] (*Zoom*); [Überblick], [Sprachen], [Anwendungen]                                                                                     | Carsten, BC    |                                  |
|                    | 15. | [Reguläre Sprachen], [CFG], [LL-Parser]                                                                                                     | BC             |                                  |
|                    | 22. | [LR-Parser (LR(0), LALR)]                                                                                                                   | BC             | [B01] (CFG, LL)                  |
|                    | 29. | **[Workshop I]**: Sprache und Features (auf Sprachebene)                                                                                    |                |                                  |
|                    | 29. | **18:00 - 19:30 Uhr (online): Edmonton I: ANTLR + Live-Coding**                                                                             | _Edmonton_     |                                  |
| November           | 05. | [Attributierte Grammatiken]                                                                                                                 | BC             | [B02] (LR)                       |
|                    | 12. | [Überblick Symboltabellen], [Symboltabellen: Scopes], [Symboltabellen: Funktionen], [Symboltabellen: Klassen]                               | Carsten        | [B03] (Attr. Grammar)            |
|                    | 19. | [Syntaxgesteuerte Interpreter], [AST-basierte Interpreter 1], [AST-basierte Interpreter 2]                                                  | Carsten        | [B04] (Symboltabellen)           |
|                    | 26. | [**18:00 - 19:30 Uhr (online): Edmonton II: Vorträge Mindener Projekte: [Workshop II]**]{.alert}: Sprache und Features (aus Compiler-Sicht) | _Minden (MIF)_ |                                  |
| Dezember           | 03. | [Optimierung und Datenfluss- und Kontrollflussanalyse]                                                                                      | BC             |                                  |
| Dezember           | 03. | **18:00 - 19:30 Uhr (online): Edmonton III: Vorträge Edmontoner Projekte**                                                                  | _Edmonton_     |                                  |
|                    | 10. | [Projekt-Pitch]: Vorstellen und Diskussion der Projektinhalte/-konzepte                                                                     | Carsten        | [B05] (Interpreter, Optimierung) |
|                    | 17. | _Freies Arbeiten_                                                                                                                           |                | [Meilenstein 1]                  |
|                    | 24. | _Weihnachtspause_                                                                                                                           |                |                                  |
|                    | 31. | _Weihnachtspause_                                                                                                                           |                |                                  |
| Januar             | 07. | _Freies Arbeiten_                                                                                                                           |                | [Meilenstein 2]                  |
|                    | 14. | _Freies Arbeiten_                                                                                                                           |                | [Meilenstein 3]                  |
|                    | 21. | [**[Workshop III]: Projektvorstellung/-übergabe**]{.alert}                                                                                  |                |                                  |
| _(Prüfungsphasen)_ |     | _Keine separate Prüfung_                                                                                                                    |                |                                  |


[Google Kalender]: https://calendar.google.com/calendar/ical/5121604486803dcdb5cfaa8602b8b09ce76743d8b9216795606617cac807e595%40group.calendar.google.com/public/basic.ics

[Orga]: https://github.com/Compiler-CampusMinden/CB-Vorlesung-Master/discussions/categories/q-a?discussions_q=is%3Aopen+category%3AQ%26A

[Überblick]: lecture/00-intro/overview.md
[Sprachen]: lecture/00-intro/languages.md
[Anwendungen]: lecture/00-intro/applications.md

[Reguläre Sprachen]: lecture/01-lexing/regular.md
<!-- [Tabellenbasierte Lexer]: lecture/01-lexing/table.md -->
<!-- [Handcodierter Lexer]: lecture/01-lexing/recursive.md -->
<!-- [Lexer mit ANTLR]: lecture/01-lexing/antlr-lexing.md -->
<!-- [Lexer mit Flex]: lecture/01-lexing/flex.md -->

[CFG]: lecture/02-parsing/cfg.md
[LL-Parser]: lecture/02-parsing/ll-parser.md
<!-- [LL-Parser (Praxis)]: lecture/02-parsing/ll-parser-impl.md -->
<!-- [LL: Fortgeschrittene Techniken]: lecture/02-parsing/ll-advanced.md -->
<!-- [Parser mit ANTLR]: lecture/02-parsing/antlr-parsing.md -->
<!-- [Parser mit Bison]: lecture/02-parsing/bison.md -->
[LR-Parser (LR(0), LALR)]: lecture/02-parsing/lr-parser.md
<!-- [LR-Parser (Teil 1)]: lecture/02-parsing/lr-parser1.md -->
<!-- [LR-Parser (Teil 2)]: lecture/02-parsing/lr-parser2.md -->
<!-- [PEG-Parser, Pratt-Parser]: lecture/02-parsing/parsercombinator.md -->
<!-- [Error Revocery]: lecture/02-parsing/recovery.md -->
<!-- [Grenze Lexer und Parser]: lecture/02-parsing/finalwords.md -->

[Attributierte Grammatiken]: lecture/03-semantics/attribgrammars.md
[Überblick Symboltabellen]: lecture/03-semantics/symbtab0-intro.md
[Symboltabellen: Scopes]: lecture/03-semantics/symbtab1-scopes.md
[Symboltabellen: Funktionen]: lecture/03-semantics/symbtab2-functions.md
[Symboltabellen: Klassen]: lecture/03-semantics/symbtab3-classes.md

<!-- [Überblick Zwischencode]: lecture/04-intermediate/intro-ir.md -->
<!-- [LLVM als IR]: lecture/04-intermediate/llvm-ir.md -->

[Optimierung und Datenfluss- und Kontrollflussanalyse]: lecture/05-optimization/optimization.md

[Syntaxgesteuerte Interpreter]: lecture/06-interpretation/syntaxdriven.md
[AST-basierte Interpreter 1]: lecture/06-interpretation/astdriven-part1.md
[AST-basierte Interpreter 2]: lecture/06-interpretation/astdriven-part2.md
<!-- [VM]: lecture/06-interpretation/vm.md -->

<!-- [Bytecode]: lecture/07-codegen/bytecode.md -->
<!-- [Maschinencode]: lecture/07-codegen/machinecode.md -->

<!-- [Garbage Collection]: lecture/08-memory/gc.md -->

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
