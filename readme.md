# MIF 1.5: Concepts of Programming Languages (Winter 2025/26)

<img src="admin/images/architektur_cb.png" width="80%">

## Kursbeschreibung

Der Compiler ist das wichtigste Werkzeug in der Informatik. In der
Königsdisziplin der Informatik schließt sich der Kreis, hier kommen die
unterschiedlichen Algorithmen und Datenstrukturen und
Programmiersprachenkonzepte zur Anwendung.

In diesem Modul geht es um ein fortgeschrittenes Verständnis für
interessante Konzepte im Compilerbau sowie um grundlegende Konzepte von
Programmiersprachen und -paradigmen. Wir schauen uns dazu relevante
aktuelle Tools und Frameworks an und setzen diese bei der Erstellung
eines Bytecode-Compilers für unterschiedliche Programmiersprachen für
die Java-VM oder WASM ein.

## Überblick Modulinhalte

1.  Lexikalische Analyse: Scanner/Lexer
    - Reguläre Sprachen
    - Klassisches Vorgehen: RegExp nach NFA (Thompson’s Construction),
      NFA nach DFA (Subset Construction), DFA nach Minimal DFA
      (Hopcroft’s Algorithm)
    - Manuelle Implementierung, Generierung mit ANTLR oder Flex
2.  Syntaxanalyse: Parser
    - Kontextfreie Grammatiken (CFG), Chomsky
    - LL-Parser (Top-Down-Parser)
      - FIRST, FOLLOW
      - Tabellenbasierte Verfahren, rekursiver Abstieg
      - LL(1), LL(k), LL(\*)
      - Umgang mit Vorrang-Regeln, Assoziativität und linksrekursiven
        Grammatiken
    - LR-Parser (Bottom-Up-Parser)
      - Shift-Reduce
      - LR(0), SLR(1), LR(1), LALR
    - Generierung mit ANTLR oder Bison
3.  Semantische Analyse und Optimierungen
    - Symboltabellen
      - Namen und Scopes
      - Typen, Klassen, Polymorphie
    - Attributierte Grammatiken: L-attributed vs. R-attributed grammars
    - Typen, Typ-Inferenz, Type Checking
    - Datenfluss- und Kontrollfluss-Analyse
    - Optimierungen: Peephole u.a.
4.  Zwischencode: Intermediate Representation (IR), LLVM-IR
5.  Interpreter
    - AST-Traversierung
    - Read-Eval-Schleife
    - Resolver: Beschleunigung der Interpretation
6.  Code-Generierung, Bytecode/VM
    - Speicherlayout
    - Erzeugen von Bytecode
    - Ausführen in einer Virtuellen Maschine
    - Garbage Collection
7.  Programmiersprachen: Ruby, Prolog, Haskell, Lisp und die
    Auswirkungen der Konzepte auf den Compiler/Interpreter und die
    Laufzeitumgebung

## Team

- [BC
  George](https://www.hsbi.de/minden/ueber-uns/personenverzeichnis/birgit-christina-george)
- [Carsten
  Gips](https://www.hsbi.de/minden/ueber-uns/personenverzeichnis/carsten-gips)
  (Sprechstunde nach Vereinbarung)

## Kursformat

| Vorlesung (2 SWS)            | Praktikum (3 SWS)            |
|:-----------------------------|:-----------------------------|
| Di, 14:00 - 15:30 Uhr (Zoom) | Di, 15:45 - 18:00 Uhr (Zoom) |

Durchführung der Vorlesung als *Flipped Classroom* (Carsten) bzw. als
*reguläre Vorlesung* (BC). Zugangsdaten Zoom siehe
[ILIAS](https://www.hsbi.de/elearning/goto.php?target=crs_1400597&client_id=FH-Bielefeld).

## Fahrplan

Hier finden Sie einen abonnierbaren [Google
Kalender](https://calendar.google.com/calendar/ical/4ba4736f0bc2005e4bcd75d48671e49cd4c9f3839988bf4f522f45a8bfbf676b%40group.calendar.google.com/public/basic.ics)
mit allen Terminen der Veranstaltung zum Einbinden in Ihre Kalender-App.

Abgabe der Übungsblätter jeweils **Dienstag bis 14:00 Uhr** im
[ILIAS](https://www.hsbi.de/elearning/goto.php?target=exc_1421692&client_id=FH-Bielefeld).
Vorstellung der Lösung im jeweiligen Praktikum in der Abgabewoche.

| Monat | Tag | Vorlesung | Lead | Praktikum |
|:---|:---|:---|:---|:---|
| Oktober | 08\. | [Orga](https://www.hsbi.de/elearning/data/FH-Bielefeld/lm_data/lm_1603207/index.html#überblick-modulinhalte) (*Zoom*); [Überblick](lecture/00-intro/overview.md), [Sprachen](lecture/00-intro/languages.md), [Anwendungen](lecture/00-intro/applications.md) | Carsten, BC |  |
|  | 15\. | [Reguläre Sprachen](lecture/01-lexing/regular.md), [CFG](lecture/02-parsing/cfg.md), [LL-Parser](lecture/02-parsing/ll-parser.md), [LL-Parser (Impl)](lecture/02-parsing/ll-parser-impl.md), [LL-Parser (Advanced)](lecture/02-parsing/ll-advanced.md) | BC | Verteilung Themen |
|  | 22\. | [LR-Parser](lecture/02-parsing/lr-parser.md),[LR-Parser 1](lecture/02-parsing/lr-parser1.md), [LR-Parser 2](lecture/02-parsing/lr-parser2.md) | BC | Status Workshop I |
|  | 29\. | **[Workshop I](homework/project.md)**: Sprache und Features (auf Sprachebene) |  |  |
|  | 29\. | **18:00 - 19:30 Uhr (online): Edmonton I: ANTLR + Live-Coding** | *Edmonton* |  |
| November | 05\. | [Attributierte Grammatiken](lecture/03-semantics/attribgrammars.md) | BC | Status Workshop II |
|  | 12\. | [Überblick Symboltabellen](lecture/03-semantics/symbtab0-intro.md), [Symboltabellen: Scopes](lecture/03-semantics/symbtab1-scopes.md), [Symboltabellen: Funktionen](lecture/03-semantics/symbtab2-functions.md), [Symboltabellen: Klassen](lecture/03-semantics/symbtab3-classes.md) | Carsten | Status Workshop II |
|  | 19\. | **Start 15:30 Uhr**: [Syntaxgesteuerte Interpreter](lecture/06-interpretation/syntaxdriven.md), [AST-basierte Interpreter 1](lecture/06-interpretation/astdriven-part1.md), [AST-basierte Interpreter 2](lecture/06-interpretation/astdriven-part2.md) | Carsten | Status Workshop II |
|  | 26\. | **18:00 - 19:30 Uhr (online): Edmonton II: Vorträge Mindener Projekte: [Workshop II](homework/project.md)**: Sprache und Features (aus Compiler-Sicht) | *Minden (MIF)* |  |
| Dezember | 03\. | [Optimierung und Datenfluss- und Kontrollflussanalyse](lecture/05-optimization/optimization.md) | BC |  |
| Dezember | 03\. | **18:00 - 19:30 Uhr (online): Edmonton III: Vorträge Edmontoner Projekte** | *Edmonton* |  |
|  | 10\. | [Projekt-Pitch](homework/project.md): Vorstellen und Diskussion der Projektinhalte/-konzepte | Carsten |  |
|  | 17\. | *Freies Arbeiten* |  | Status Workshop III |
|  | 24\. | *Weihnachtspause* |  |  |
|  | 31\. | *Weihnachtspause* |  |  |
| Januar | 07\. | *Freies Arbeiten* |  | Status Workshop III |
|  | 14\. | *Freies Arbeiten* |  | Status Workshop III |
|  | 21\. | *Freies Arbeiten* |  | Status Workshop III |
| *(Prüfungsphase I)* | 31\. | **[Workshop III](homework/project.md): Projektvorstellung/-übergabe (10:00 - 12:30 Uhr, online)** |  |  |
| *(Prüfungsphase I)* | 07\. | **Feedback-Gespräche (10:00 - 12:00 Uhr, online)** |  |  |
| *(Prüfungsphase II)* |  | *Keine separate Prüfung* |  |  |

## Prüfungsform, Note und Credits

**Parcoursprüfung plus Testat**, 10 ECTS

- **Testat**: Vergabe der Credit-Points

  1.  **Aktive** Teilnahme an mind. 5 der 7 “Status Workshop”-Termine,
      **und**
  2.  **aktive** Teilnahme an allen 3 Edmonton-Terminen.

- **Gesamtnote**:

  Die Workshops werden bewertet und ergeben in folgender Gewichtung die
  Gesamtnote:

  - 20% [Workshop I](homework/project.md),
  - 30% [Workshop II](homework/project.md),
  - 50% [Workshop III](homework/project.md).

Die Bearbeitung der Aufgaben (Workshops) erfolgt in 2er Teams.

## Materialien

1.  [“**Compilers: Principles, Techniques, and
    Tools**”](https://learning.oreilly.com/library/view/compilers-principles-techniques/9789357054881/).
    Aho, A. V. und Lam, M. S. und Sethi, R. und Ullman, J. D. and
    Bansal, S., Pearson India, 2023. ISBN
    [978-9-3570-5488-1](https://fhb-bielefeld.digibib.net/openurl?isbn=978-9-3570-5488-1).
    [Online](https://learning.oreilly.com/library/view/compilers-principles-techniques/9789357054881/)
    über die
    [O’Reilly-Lernplattform](https://www.oreilly.com/library-access/).
2.  [“**Crafting
    Interpreters**”](https://github.com/munificent/craftinginterpreters).
    Nystrom, R., Genever Benning, 2021. ISBN
    [978-0-9905829-3-9](https://fhb-bielefeld.digibib.net/openurl?isbn=978-0-9905829-3-9).
    [Online](https://www.craftinginterpreters.com/).
3.  [“**Engineering a
    Compiler**”](https://learning.oreilly.com/library/view/engineering-a-compiler/9780080916613/).
    Torczon, L. und Cooper, K., Morgan Kaufmann, 2012. ISBN
    [978-0-1208-8478-0](https://fhb-bielefeld.digibib.net/openurl?isbn=978-0-1208-8478-0).
    [Online](https://learning.oreilly.com/library/view/engineering-a-compiler/9780080916613/)
    über die
    [O’Reilly-Lernplattform](https://www.oreilly.com/library-access/).
4.  [“Introduction to Compilers and Language
    Design”](https://www3.nd.edu/~dthain/compilerbook/). Thain,
    D., 2023. ISBN
    [979-8-655-18026-0](https://fhb-bielefeld.digibib.net/openurl?isbn=979-8-655-18026-0).
    [Online](https://www3.nd.edu/~dthain/compilerbook/).
5.  [“Writing a C
    Compiler”](https://learning.oreilly.com/library/view/writing-a-c/9781098182229/).
    Sandler, N., No Starch Press, 2024. ISBN
    [978-1-0981-8222-9](https://fhb-bielefeld.digibib.net/openurl?isbn=978-1-0981-8222-9).
    [Online](https://learning.oreilly.com/library/view/writing-a-c/9781098182229/)
    über die
    [O’Reilly-Lernplattform](https://www.oreilly.com/library-access/).
6.  [“**Seven Languages in Seven
    Weeks**”](https://learning.oreilly.com/library/view/seven-languages-in/9781680500059/).
    Tate, B.A., Pragmatic Bookshelf, 2010. ISBN
    [978-1-93435-659-3](https://fhb-bielefeld.digibib.net/openurl?isbn=978-1-93435-659-3).
    [Online](https://learning.oreilly.com/library/view/seven-languages-in/9781680500059/)
    über die
    [O’Reilly-Lernplattform](https://www.oreilly.com/library-access/).

## Förderungen und Kooperationen

### Kooperation mit University of Alberta, Edmonton (Kanada)

Über das Projekt [“We CAN
virtuOWL”](https://www.uni-bielefeld.de/international/profil/netzwerk/alberta-owl/we-can-virtuowl/)
der Fachhochschule Bielefeld ist im Frühjahr 2021 eine Kooperation mit
der [University of
Alberta](https://www.hsbi.de/en/international-office/alberta-owl-cooperation)
(Edmonton/Alberta, Kanada) im Modul “Compilerbau” gestartet.

Wir freuen uns, auch in diesem Semester wieder drei gemeinsame Sitzungen
für beide Hochschulen anbieten zu können. (Diese Termine werden in
englischer Sprache durchgeführt.)

------------------------------------------------------------------------

## LICENSE

<img src="https://licensebuttons.net/l/by-sa/4.0/88x31.png">

Unless otherwise noted, [this
work](https://github.com/Compiler-CampusMinden/CPL-Vorlesung-Master) by
[BC George](https://github.com/bcg7), [Carsten
Gips](https://github.com/cagix) and
[contributors](https://github.com/Compiler-CampusMinden/CPL-Vorlesung-Master/graphs/contributors)
is licensed under [CC BY-SA
4.0](https://github.com/Compiler-CampusMinden/CPL-Vorlesung-Master/blob/master/LICENSE.md).
See the [credits](CREDITS.md) for a detailed list of contributing
projects.

<blockquote><p><sup><sub><strong>Last modified:</strong> 5b3a3e7 (tooling: rename repo from 'cb-lecture' to 'cpl-lecture', 2025-08-13)<br></sub></sup></p></blockquote>
