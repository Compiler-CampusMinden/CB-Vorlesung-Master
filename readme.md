---
archetype: "home"
title: "MIF 1.10: Compilerbau / MIF 1.5: Concepts of Programming Languages (Winter 2023/24)"
---


![](admin/images/architektur_cb.png){width="80%"}


## Kursbeschreibung

Der Compiler ist das wichtigste Werkzeug in der Informatik. In der Königsdisziplin der
Informatik schließt sich der Kreis, hier kommen die unterschiedlichen Algorithmen und
Datenstrukturen und Programmiersprachenkonzepte zur Anwendung.

In diesem Modul geht es um ein grundlegendes Verständnis für die wichtigsten Konzepte
im Compilerbau. Wir schauen uns dazu relevante aktuelle Tools und Frameworks an und
setzen diese bei der Erstellung eines kleinen Compiler-Frontends für [_Mini-Python_] ein.

[_Mini-Python_]: https://github.com/Compiler-CampusMinden/Mini-Python-Builder


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
        *   Tabellenbasierte Verfahren
        *   Rekursiver Abstieg
        *   LL(1), LL(k), LL(*)
        *   Umgang mit linksrekursiven Grammatiken
        *   Umgang mit Vorrang-Regeln und Assoziativität
        *   Backtracking, Memoizing, Predicated Parsers; ANTLR4: ALL(*)
    *   LR-Parser (Bottom-Up-Parser)
        *   Shift-Reduce
        *   LR(0), SLR(1), LR(1), LALR(1)
    *   Generierung mit ANTLR und Bison

3.  Symboltabellen
    *   Berücksichtigung unterschiedlicher Sprachparadigmen
    *   Typen, Klassen, Polymorphie
    *   Namen und Scopes

4.  Semantische Analyse und Optimierungen
    *   Attributierte Grammatiken: L-attributed vs. R-attributed grammars
    *   Typen, Typ-Inferenz, Type Checking
    *   Datenfluss-Analyse
    *   Optimierungen: Peephole u.a.

5.  Zwischencode: Intermediate Representation (IR), LLVM

6.  Interpreter
    *   AST-Traversierung
    *   Read-Eval-Schleife
    *   Resolver: Beschleunigung bei der Interpretation

7.  Code-Generierung, Byte-Code
    *   Speicherlayout
    *   Erzeugen von Byte-Code
    *   Ausführen in einer Virtuellen Maschine


## Team

*   [BC George](https://www.hsbi.de/minden/ueber-uns/personenverzeichnis/birgit-christina-george)
*   [Carsten Gips](https://www.hsbi.de/minden/ueber-uns/personenverzeichnis/carsten-gips)


## Kursformat

:::::: {.tabs groupid="pruefungsordnung"}
::: {.tab title="Compilerbau"}

| Vorlesung (2 SWS)     | Praktikum (2 SWS)     |
|:----------------------|:----------------------|
| Di, 13:30 - 15:00 Uhr | Di, 15:15 - 16:45 Uhr |
| online/C1             | online/C1             |

:::
::: {.tab title="Concepts of Programming Languages"}

| Vorlesung (2 SWS)     | Praktikum (3 SWS)     |
|:----------------------|:----------------------|
| Di, 13:30 - 15:00 Uhr | Di, 15:15 - 17:30 Uhr |
| online/C1             | online/C1             |

:::
::::::

Durchführung als **Flipped Classroom** (Carsten) bzw. **Vorlesung** (BC):
alle Sitzungen online/per Zoom (**Zugangsdaten siehe [ILIAS]**)

[ILIAS]: https://www.hsbi.de/elearning/goto.php?target=crs_1117243&client_id=FH-Bielefeld

## Prüfungsform, Note und Credits

:::::: {.tabs groupid="pruefungsordnung"}
::: {.tab title="Compilerbau"}

**Mündliche Prüfung plus Testat**, 5 ECTS (PO18)

*   **Testat**: Vergabe der Credit-Points
    Für die Vergabe der Credit-Points ist die regelmäßige und erfolgreiche
    Teilnahme am Praktikum erforderlich, welche am Ende des Semesters durch
    ein Testat bescheinigt wird.

    Kriterien:
    *   Aktive Mitarbeit im Praktikum und den in der Gruppe definierten Meilensteinen
    *   Aktive Teilnahme an den drei gemeinsamen Terminen mit der University of Alberta (Edmonton)
    *   Vortrag I mit Edmonton zu Spezialisierung/Baustein in Projekt, ca. 10 Minuten pro Person (60 bis 90 Minuten gesamt)
    *   Vortrag II: Vorstellung der Projektergebnisse, ca. 10 Minuten pro Person (60 bis 90 Minuten gesamt)

*   **Gesamtnote**:
    Mündliche Prüfung am Ende des Semesters, angeboten in beiden Prüfungszeiträumen.

:::
::: {.tab title="Concepts of Programming Languages"}

**Parcoursprüfung**, 10 ECTS (PO23)

*   **unbenotet**: Aktive Mitarbeit im Praktikum und den in der Gruppe definierten Meilensteinen
*   **unbenotet**: Aktive Teilnahme an den drei gemeinsamen Terminen mit der University of Alberta (Edmonton)
*   **unbenotet**: Vortrag I mit Edmonton zu Spezialisierung/Baustein in Projekt,
    ca. 10 Minuten pro Person (60 bis 90 Minuten gesamt)
*   **unbenotet**: Vortrag II: Vorstellung der Projektergebnisse, ca. 10 Minuten pro Person (60 bis 90 Minuten gesamt)
*   **benotet (30%)**: Vortrag III: Vortrag zu Paper-Analyse oder zu Implementierung zusätzlicher
    Baustein (extra-Leistung neue PO) plus Diskussion (Vorbereitung/Leitung), 30 Minuten Dauer
*   **benotet (70%)**: Mündliche Prüfung am Ende des Semesters, angeboten in beiden Prüfungszeiträumen

**Gesamtnote: 30% Vortrag III plus 70% mdl. Prüfung**

:::
::::::


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

*   [github.com/antlr](https://github.com/antlr/antlr4)


## Fahrplan

### Vorlesung

| Woche | Datum                           | Themen                                                                                                                                    | Lead        | Bemerkung                                     |
|:-----:|:--------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------|:------------|:----------------------------------------------|
|  41   | Di, 10.10.                      | Orga (**Zoom**) \|\| [Überblick] \| [Sprachen] \| [Anwendungen]                                                                           | Carsten, BC |                                               |
|  42   | Di, 17.10.                      | [Reguläre Sprachen]                                                                                                                       | BC          |                                               |
|  42   | Di, 17.10. (**Praktikum**)      | [Tabellenbasierte Lexer] \| [Handcodierter Lexer] \| [Lexer mit ANTLR]                                                                    | Carsten     |                                               |
|  43   | Di, 24.10.                      | [CFG]                                                                                                                                     | BC          |                                               |
|  43   | Di, 24.10. (**Praktikum**)      | [LL-Parser (Theorie)]                                                                                                                     | BC          | Finale Verteilung Vortragsthemen              |
|  44   | **Mo, 30.10., 17:00-18:00 Uhr** | **Edmonton I**: ANTLR + Live-Coding (CA)                                                                                                  |             |                                               |
|  44   | Di, 31.10.                      | [LL-Parser (Praxis)] \| [LL: Fortgeschrittene Techniken] \| [Parser mit ANTLR]                                                            | Carsten     |                                               |
|  45   | Di, 07.11.                      | [LR-Parser (Teil 1)]                                                                                                                      | BC          |                                               |
|  45   | Di, 07.11. (**Praktikum**)      | [LR-Parser (Teil 2)]                                                                                                                      | BC          |                                               |
|  46   | Di, 14.11.                      | [PEG-Parser, Pratt-Parser]                                                                                                                | BC          | [B01]                                         |
|  47   | Di, 21.11.                      | [Error Revocery] \| [Grenze Lexer und Parser]                                                                                             | Carsten     |                                               |
|  47   | Di, 21.11. (**Praktikum**)      | [Überblick Symboltabellen] \| [Symboltabellen: Scopes] \| [Symboltabellen: Funktionen] \| [Symboltabellen: Klassen]                       | Carsten     |                                               |
|  48   | Di, 28.11.                      | [Attributierte Grammatiken]                                                                                                               | BC          |                                               |
|  48   | **Di, 28.11., 18:00-19:00 Uhr** | **Edmonton II**: Vortrag Mindener Projekte (DE) (**Vortrag I**)                                                                           |             |                                               |
|  49   | Di, 05.12.                      | [Überblick Zwischencode] \| [LLVM als IR]                                                                                                 | BC, Carsten |                                               |
|  49   | **Mi, 06.12., 18:00-19:00 Uhr** | **Edmonton III**: Vortrag Edmontoner Projekte (CA)                                                                                        |             | [B02] (Kein Praktikum - Termin mit Edmonton!) |
|  50   | Di, 12.12.                      | [Optimierung und Datenflussanalyse]                                                                                                       | BC          | [B03]                                         |
|  51   | Di, 19.12.                      | [Syntaxgesteuerte Interpreter] \| [AST-basierte Interpreter 1] \| [AST-basierte Interpreter 2] \| [Garbage Collection] \| [Maschinencode] | Carsten     | [B04]                                         |
|  02   | Di, 09.01.                      | Freies Arbeiten                                                                                                                           | Carsten     |                                               |
|  03   | Di, 16.01.                      | Vortrag II/III: Termine siehe Etherpad                                                                                                    | Carsten, BC |                                               |
|  04   | Di, 23.01.                      | Vortrag II/III: Termine siehe Etherpad                                                                                                    | Carsten, BC |                                               |

[Überblick]: lecture/intro/overview.md
[Sprachen]: lecture/intro/languages.md
[Anwendungen]: lecture/intro/applications.md

[Reguläre Sprachen]: lecture/frontend/lexing/regular.md
[Tabellenbasierte Lexer]: lecture/frontend/lexing/table.md
[Handcodierter Lexer]: lecture/frontend/lexing/recursive.md
[Lexer mit ANTLR]: lecture/frontend/lexing/antlr-lexing.md
<!-- [Lexer mit Flex]: lecture/frontend/lexing/flex.md -->

[CFG]: lecture/frontend/parsing/cfg.md
[LL-Parser (Theorie)]: lecture/frontend/parsing/ll-parser-theory.md
[LL-Parser (Praxis)]: lecture/frontend/parsing/ll-parser-impl.md
[LL: Fortgeschrittene Techniken]: lecture/frontend/parsing/ll-advanced.md
[Parser mit ANTLR]: lecture/frontend/parsing/antlr-parsing.md
<!-- [Parser mit Bison]: lecture/frontend/parsing/bison.md -->
[LR-Parser (Teil 1)]: lecture/frontend/parsing/lr-parser1.md
[LR-Parser (Teil 2)]: lecture/frontend/parsing/lr-parser2.md
[PEG-Parser, Pratt-Parser]: lecture/frontend/parsing/parsercombinator.md
[Error Revocery]: lecture/frontend/parsing/recovery.md
[Grenze Lexer und Parser]: lecture/frontend/parsing/finalwords.md

[Attributierte Grammatiken]: lecture/frontend/semantics/attribgrammars.md

[Überblick Symboltabellen]: lecture/frontend/semantics/symboltables/intro-symbtab.md
[Symboltabellen: Scopes]: lecture/frontend/semantics/symboltables/scopes.md
[Symboltabellen: Funktionen]: lecture/frontend/semantics/symboltables/functions.md
[Symboltabellen: Klassen]: lecture/frontend/semantics/symboltables/classes.md

[Überblick Zwischencode]: lecture/intermediate/intro-ir.md
[LLVM als IR]: lecture/intermediate/llvm-ir.md

[Syntaxgesteuerte Interpreter]: lecture/backend/interpretation/syntaxdriven.md
[AST-basierte Interpreter 1]: lecture/backend/interpretation/astdriven-part1.md
[AST-basierte Interpreter 2]: lecture/backend/interpretation/astdriven-part2.md
[Garbage Collection]: lecture/backend/interpretation/gc.md
<!-- [Bytecode und VM]: lecture/backend/interpretation/vm.md -->

[Optimierung und Datenflussanalyse]: lecture/backend/optimization.md
[Maschinencode]: lecture/backend/machinecode.md

### Praktikum

| Woche | Blatt      | Abgabe ILIAS                        | Vorstellung Praktikum                      |
|:-----:|:-----------|:------------------------------------|:-------------------------------------------|
|  46   | [B01]: XXX | Di, 14.11., 13:00 Uhr ([Link](XXX)) | Di, 14.11.                                 |
|  49   | [B02]: XXX | Mi, 06.12., 12:00 Uhr ([Link](XXX)) | **Mi, 06.12., 17:00-18:30 Uhr (Edmonton)** |
|  50   | [B03]: XXX | Di, 12.12., 13:00 Uhr ([Link](XXX)) | Di, 12.12.                                 |
|  51   | [B04]: XXX | Di, 19.12., 13:00 Uhr ([Link](XXX)) | Di, 19.12.                                 |

[B01]: homework/sheet01.md
[B02]: homework/sheet02.md
[B03]: homework/sheet03.md
[B04]: homework/sheet04.md


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
