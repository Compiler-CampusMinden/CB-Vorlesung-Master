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
im Compilerbau. Wir schauen uns dazu relevante aktuelle Tools und Frameworks an und setzen
diese bei der Erstellung eines Byte-Code-Compilers samt Virtual Machine für Java ein.


## Überblick Modulinhalte

1.  Lexikalische Analyse: Scanner/Lexer
    *   Reguläre Sprachen
    *   Klassisches Vorgehen: RegExp nach NFA (Thompson's Construction),
        NFA nach DFA (Subset Construction), DFA nach Minimal DFA (Hopcroft's Algorithm)
    *   Manuelle Implementierung, Generierung mit ANTLR und Flex
2.  Syntaxanalyse: Parser
    *   Kontextfreie Grammatiken (CFG), Chomsky
    *   LL-Parser (Top-Down-Parser)
        *   FIRST, FOLLOW
        *   Tabellenbasierte Verfahren, rekursiver Abstieg
        *   LL(1), LL(k), LL(*)
        *   Umgang mit Vorrang-Regeln, Assoziativität und linksrekursiven Grammatiken
        *   Backtracking, Memoizing, Predicated Parsers; ANTLR4: ALL(*)
    *   LR-Parser (Bottom-Up-Parser)
        *   Shift-Reduce
        *   LR(0), SLR(1), LR(1), LALR(1)
    *   Generierung mit ANTLR und Bison
3.  Symboltabellen
    *   Berücksichtigung unterschiedlicher Sprachparadigmen
    *   Namen und Scopes
    *   Typen, Klassen, Polymorphie
4.  Semantische Analyse und Optimierungen
    *   Attributierte Grammatiken: L-attributed vs. R-attributed grammars
    *   Typen, Typ-Inferenz, Type Checking
    *   Datenfluss-Analyse
    *   Optimierungen: Peephole u.a.
5.  Zwischencode: Intermediate Representation (IR), LLVM
6.  Interpreter
    *   AST-Traversierung
    *   Read-Eval-Schleife
    *   Resolver: Beschleunigung der Interpretation
7.  Code-Generierung, Byte-Code
    *   Speicherlayout
    *   Erzeugen von Byte-Code
    *   Ausführen in einer Virtuellen Maschine


## Team

*   [BC George](https://www.hsbi.de/minden/ueber-uns/personenverzeichnis/birgit-christina-george)
*   [Carsten Gips](https://www.hsbi.de/minden/ueber-uns/personenverzeichnis/carsten-gips) (Sprechstunde nach Vereinbarung)


## Kursformat

:::::: {.tabs groupid="vl-pr"}
::: {.tab title="Vorlesung"}

**Vorlesung (2 SWS)**

Mi, 08:00 - 09:30 Uhr (online)

Durchführung als **Flipped Classroom** (Carsten) bzw. **Vorlesung** (BC).

:::
::: {.tab title="Praktikum"}

**Praktikum (3 SWS)**

Fr, 15:15 - 16:45 Uhr (online)

:::
::::::

Online-Sitzungen per Zoom (**Zugangsdaten siehe [ILIAS]**).
Sie _können_ hierzu den Raum J104 nutzen.

[ILIAS]: https://www.hsbi.de/elearning/goto.php?target=crs_1254534&client_id=FH-Bielefeld


## Prüfungsform, Note und Credits

**Mündliche Prüfung plus Testat**, 10 ECTS (PO23)

*   **Testat**: Vergabe der Credit-Points

    Für die Vergabe der Credit-Points ist die regelmäßige und erfolgreiche
    Teilnahme am Praktikum erforderlich, welche am Ende des Semesters durch
    ein Testat bescheinigt wird.

    Kriterien:
    *   Aktive Mitarbeit im [Praktikum] und an den Meilensteinen
    *   Aktive Teilnahme an den drei gemeinsamen Terminen mit der University of Alberta (Edmonton)
    *   Vortrag I mit Edmonton zu Spezialisierung/Baustein in Projekt, ca. 6 Minuten pro Person (60 bis 90 Minuten gesamt)
    *   Vortrag II: Vorstellung der Projektergebnisse, ca. 12 Minuten pro Person (2x 90 Minuten gesamt)

*   **Gesamtnote**:
    Mündliche Prüfung am Ende des Semesters, angeboten in beiden Prüfungszeiträumen.


## Materialien

### Literatur

1.  "**Compiler: Prinzipien, Techniken und Werkzeuge**".
    Aho, A. V. und Lam, M. S. und Sethi, R. und Ullman, J. D., Pearson Studium, 2008.
    ISBN [978-3-8273-7097-6](https://fhb-bielefeld.digibib.net/openurl?isbn=978-3-8273-7097-6).

2.  ["**Crafting Interpreters**"](https://github.com/munificent/craftinginterpreters).
    Nystrom, R., Genever Benning, 2021.
    ISBN [978-0-9905829-3-9](https://fhb-bielefeld.digibib.net/openurl?isbn=978-0-9905829-3-9).

3.  "Modern Compiler Design".
    Grune, D. und van, Reeuwijk, K. und Bal, H. E. und Jacobs, C. J. H. und Langendoen, K., Springer, 2012.
    ISBN [978-1-4614-4698-9](https://fhb-bielefeld.digibib.net/openurl?isbn=978-1-4614-4698-9).

4.  "Engineering a Compiler".
    Torczon, L. und Cooper, K., Elsevier MK, 2012.
    ISBN [978-0-1208-8478-0](https://fhb-bielefeld.digibib.net/openurl?isbn=978-0-1208-8478-0).

5.  "The Definitive ANTLR 4 Reference".
    Parr, T., Pragmatic Bookshelf, 2014. ISBN [978-1-9343-5699-9](https://fhb-bielefeld.digibib.net/openurl?isbn=978-1-9343-5699-9).

### Tools

*   [ANTLR v4](https://github.com/antlr/antlr4)
*   JDK: Java SE 21 (LTS) ([Oracle](https://www.oracle.com/java/technologies/downloads/) oder
    [Alternativen](https://code.visualstudio.com/docs/languages/java#_install-a-java-development-kit-jdk),
    bitte 64-bit Version nutzen)
*   IDE: [Eclipse IDE for Java Developers](https://www.eclipse.org/downloads/) oder
    [IntelliJ IDEA (Community Edition)](https://www.jetbrains.com/idea/) oder
    [Visual Studio Code](https://code.visualstudio.com/) oder [Vim](https://www.vim.org/) oder ...
*   [Git](https://git-scm.com/)
*   [Compiler Explorer](https://godbolt.org/)


## Fahrplan

### Vorlesung

Hier finden Sie einen abonnierbaren [Google Kalender] mit allen Terminen der Veranstaltung zum Einbinden in Ihre Kalender-App.

| Monat    | Tag                         | Vorlesung                                                                                                                                            | Praktikum                                               | Lead        | Bemerkung                                          |
|:---------|:----------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------------------------------------|:------------|:---------------------------------------------------|
| Oktober  | 09.                         | [Orga] (Zoom); [Überblick], [Sprachen], [Anwendungen]                                                                                                |                                                         | Carsten, BC |                                                    |
|          | 16.                         | [Reguläre Sprachen], [Tabellenbasierte Lexer]                                                                                                        |                                                         | BC          |                                                    |
|          | 23.                         | [CFG], [LL-Parser (Theorie)]                                                                                                                         |                                                         | BC          |                                                    |
|          | 30.                         | [Lexer mit ANTLR], [Parser mit ANTLR], [Grenze Lexer und Parser]                                                                                     | **Edmonton I: ANTLR + Live-Coding (CA)**                | Carsten     |                                                    |
| November | 06.                         | [LR-Parser (Teil 1)]                                                                                                                                 |                                                         | BC          |                                                    |
|          | 13.                         | [LR-Parser (Teil 2)]                                                                                                                                 |                                                         | BC          |                                                    |
|          | 20.                         | [Attributierte Grammatiken]                                                                                                                          |                                                         | BC          |                                                    |
|          | 27.                         | _Freies Arbeiten - Vorbereitung Vortrag_                                                                                                             | **Edmonton II: Vortrag Mindener Projekte (Master, DE)** |             |                                                    |
| Dezember | 04.                         | [Optimierung und Datenflussanalyse]                                                                                                                  |                                                         | BC          | **Edmonton III: Vortrag Edmontoner Projekte (CA)** |
|          | 11.                         | [Überblick Symboltabellen], [Symboltabellen: Scopes], [Symboltabellen: Funktionen], [Symboltabellen: Klassen]                                        |                                                         | Carsten     |                                                    |
|          | 18.                         | [Syntaxgesteuerte Interpreter], [AST-basierte Interpreter 1], [AST-basierte Interpreter 2], [Garbage Collection], [Maschinencode], [Bytecode und VM] |                                                         | Carsten     |                                                    |
|          | 25.                         | _Weihnachtspause_                                                                                                                                    |                                                         |             |                                                    |
| Januar   | 01.                         | _Weihnachtspause_                                                                                                                                    |                                                         |             |                                                    |
|          | 08.                         | _Freies Arbeiten_                                                                                                                                    |                                                         |             |                                                    |
|          | 15.                         | _Freies Arbeiten_                                                                                                                                    |                                                         |             |                                                    |
|          | 22.                         | **Vortrag**: Vorstellung Interpreter                                                                                                                 |                                                         |             |                                                    |
|          |                             |                                                                                                                                                      |                                                         |             |                                                    |
|          | _(Prüfungsphase 1. Termin)_ | **Mdl. Prüfung (ALL\*)**                                                                                                                             |                                                         |             |                                                    |
|          | _(Prüfungsphase 2. Termin)_ | **Mdl. Prüfung (ALL\*)**                                                                                                                             |                                                         |             |                                                    |

**TODO**
1.  Praktikum:
    -   Sprachparadigmen und -konzepte (logisch/Prolog, imperativ/C, funktional/Haskell(?), oop/Klassen+Vererbung Java, LISP)- Sprache und Konzepte vorstellen
    -   Parser bauen
    -   Interpreter bauen
2.  Praktikum: Paper vorstellen und diskutieren


[Google Kalender]: https://calendar.google.com/calendar/ical/5121604486803dcdb5cfaa8602b8b09ce76743d8b9216795606617cac807e595%40group.calendar.google.com/public/basic.ics

[Überblick]: lecture/intro/overview.md
[Sprachen]: lecture/intro/languages.md
[Anwendungen]: lecture/intro/applications.md

[Reguläre Sprachen]: lecture/frontend/lexing/regular.md
[Tabellenbasierte Lexer]: lecture/frontend/lexing/table.md
<!-- [Handcodierter Lexer]: lecture/frontend/lexing/recursive.md -->
[Lexer mit ANTLR]: lecture/frontend/lexing/antlr-lexing.md
<!-- [Lexer mit Flex]: lecture/frontend/lexing/flex.md -->

[CFG]: lecture/frontend/parsing/cfg.md
[LL-Parser (Theorie)]: lecture/frontend/parsing/ll-parser-theory.md
<!-- [LL-Parser (Praxis)]: lecture/frontend/parsing/ll-parser-impl.md -->
<!-- [LL: Fortgeschrittene Techniken]: lecture/frontend/parsing/ll-advanced.md -->
[Parser mit ANTLR]: lecture/frontend/parsing/antlr-parsing.md
<!-- [Parser mit Bison]: lecture/frontend/parsing/bison.md -->
[LR-Parser (Teil 1)]: lecture/frontend/parsing/lr-parser1.md
[LR-Parser (Teil 2)]: lecture/frontend/parsing/lr-parser2.md
<!-- [PEG-Parser, Pratt-Parser]: lecture/frontend/parsing/parsercombinator.md -->
<!-- [Error Revocery]: lecture/frontend/parsing/recovery.md -->
[Grenze Lexer und Parser]: lecture/frontend/parsing/finalwords.md

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
[Garbage Collection]: lecture/backend/interpretation/gc.md
[Bytecode und VM]: lecture/backend/interpretation/vm.md

[Optimierung und Datenflussanalyse]: lecture/backend/optimization.md
[Maschinencode]: lecture/backend/machinecode.md

### Praktikum

Sie bearbeiten im Praktikum eine gemeinsame [Aufgabe] in der Semestergruppe.

| Woche  | Rücksprache   | Vorstellung Praktikum                         | Inhalt                                                    |
|:------:|:--------------|:----------------------------------------------|:----------------------------------------------------------|
|   45   | Meilenstein 1 | Di, 07.11.                                    | Konzepte Java-Bytecode, Arbeitsaufteilung, Arbeitsplanung |
| ~~46~~ | ~~Exposé~~    | ~~Di, 14.11.~~                                | ~~Diskussion Exposé [Vortrag III]~~                       |
|   48   | Meilenstein 2 | **Di, 28.11., 18:00-19:00 Uhr (Edmonton II)** | Projektstatus (**Vortrag I**)                             |
|   49   | Exposé        | Di, 05.12.                                    | Diskussion Exposé [Vortrag III]                           |
|   51   | Meilenstein 3 | Di, 19.12.                                    | Projektstatus                                             |

<!-- [B01]: homework/sheet01.md -->
<!-- [B02]: homework/sheet02.md -->
<!-- [B03]: homework/sheet03.md -->
<!-- [B04]: homework/sheet04.md -->
[Praktikum]: homework/project.md
[Aufgabe]: homework/project.md
[Vortrag III]: homework/talk.md


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
