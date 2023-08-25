---
archetype: "home"
title: "CB W22 M.Sc."
---


# MIF 1.10: Compilerbau (Winter 2022/23)

## Kursbeschreibung

![](admin/images/architektur_cb.png){width="80%"}

Der Compiler ist das wichtigste Werkzeug in der Informatik. In der Königsdisziplin der
Informatik schließt sich der Kreis, hier kommen die unterschiedlichen Algorithmen und
Datenstrukturen und Programmiersprachenkonzepte zur Anwendung.

In diesem Modul geht es um ein grundlegendes Verständnis für die wichtigsten Konzepte
im Compilerbau. Wir schauen uns dazu relevante aktuelle Tools und Frameworks an und
setzen diese bei der Erstellung eines kleinen Compiler-Frontends für [_Mini-Python_] ein.

Siehe [Syllabus](admin/syllabus.md) zu Details.

[_Mini-Python_]: https://github.com/Compiler-CampusMinden/Mini-Python-Builder


## Team

-   [BC George](https://www.hsbi.de/minden/ueber-uns/personenverzeichnis/birgit-christina-george)
-   [Carsten Gips](https://www.hsbi.de/minden/ueber-uns/personenverzeichnis/carsten-gips)


## Kursformat

| Vorlesung (2 SWS)     | Praktikum (2 SWS)     |
|:----------------------|:----------------------|
| Di, 14:00 - 15:30 Uhr | Di, 15:45 - 17:15 Uhr |
| online/C1             | online/C1             |

Durchführung als **Flipped Classroom/online** (Carsten) bzw. **Hybrid-Vorlesung** (BC):
Sitzungen per Zoom (**Zugangsdaten siehe [ILIAS]**)

[ILIAS]: https://www.hsbi.de/elearning/goto.php?target=crs_1117243&client_id=FH-Bielefeld

### Prüfungsform, Note und Credits

**Mündliche Prüfung plus Testat**, 5 ECTS

Hier finden Sie Informationen zum Ablauf des Praktikums sowie zur Prüfungsform:
[Note und Credits](admin/grading.md).


## Materialien

1.  "**Compiler: Prinzipien, Techniken und Werkzeuge**".
    Aho, A. V. und Lam, M. S. und Sethi, R. und Ullman, J. D., Pearson Studium, 2008.
    ISBN [978-3-8273-7097-6](https://fhb-bielefeld.digibib.net/openurl?isbn=978-3-8273-7097-6).

2.  ["**Crafting Interpreters**"](https://github.com/munificent/craftinginterpreters).
    Nystrom, R., Genever Benning, 2021.
    ISBN [978-0-9905829-3-9](https://fhb-bielefeld.digibib.net/openurl?isbn=978-0-9905829-3-9).

Weitere empfohlene Literatur siehe [Ressourcen](admin/resources.md).


## Fahrplan

`{{< schedule >}}`{=markdown}

**Hinweis**: Abgabe der Hausaufgaben bis jeweils 14.00 Uhr im ILIAS.


## Förderungen und Kooperationen

### Kooperation mit University of Alberta, Edmonton (Kanada)

Über das Projekt ["We CAN virtuOWL"] der Fachhochschule Bielefeld ist im Frühjahr 2021 eine
Kooperation mit der [University of Alberta] (Edmonton/Alberta, Kanada) im Modul "Compilerbau"
gestartet.

Wir freuen uns, auch in diesem Semester wieder drei gemeinsame Sitzungen für beide
Hochschulen anbieten zu können. (Diese Termine werden in englischer Sprache durchgeführt.)

["We CAN virtuOWL"]: https://www.uni-bielefeld.de/international/profil/netzwerk/alberta-owl/we-can-virtuowl/
[University of Alberta]: https://www.hsbi.de/en/international-office/alberta-owl-cooperation


<!-- reference to all markdown pages used in the current semester (to be replaced using a proper schedule table) -->
::: slides
[Syllabus](admin/syllabus.md)
[Resources](admin/resources.md)
[Grading](admin/grading.md)
[Prüfungsvorbereitung](admin/exams.md)
[FAQ](admin/faq.md)

[Überblick](lecture/intro/overview.md)
[Sprachen](lecture/intro/languages.md)
[Anwendungen](lecture/intro/applications.md)

[Reguläre Sprachen](lecture/frontend/lexing/regular.md)
[](lecture/frontend/lexing/table.md)
[Handcodierter Lexer](lecture/frontend/lexing/recursive.md)
[Lexer mit ANTLR](lecture/frontend/lexing/antlr-lexing.md)
[Lexer mit Flex](lecture/frontend/lexing/flex.md)

[CFG](lecture/frontend/parsing/cfg.md)
[LL-Parser (Theorie)](lecture/frontend/parsing/ll-parser-theory.md)
[LL-Parser (Praxis)](lecture/frontend/parsing/ll-parser-impl.md)
[](lecture/frontend/parsing/ll-advanced.md)
[Parser mit ANTLR](lecture/frontend/parsing/antlr-parsing.md)
[Parser mit Bison](lecture/frontend/parsing/bison.md)
[](lecture/frontend/parsing/lr-parser1.md)
[](lecture/frontend/parsing/lr-parser2.md)
[](lecture/frontend/parsing/parsercombinator.md)
[Error Revocery](lecture/frontend/parsing/recovery.md)
[Grenze Lexer und Parser](lecture/frontend/parsing/finalwords.md)

[Attributierte Grammatiken](lecture/frontend/semantics/attribgrammars.md)

[Überblick Symboltabellen](lecture/frontend/semantics/symboltables/intro-symbtab.md)
[Symboltabellen: Scopes](lecture/frontend/semantics/symboltables/scopes.md)
[Symboltabellen: Funktionen](lecture/frontend/semantics/symboltables/functions.md)
[Symboltabellen: Klassen](lecture/frontend/semantics/symboltables/classes.md)

[Überblick Zwischencode](lecture/intermediate/intro-ir.md)
[](lecture/intermediate/llvm-ir.md)

<!-- [Mini-Python (Builder)](lecture/backend/minipython-builder.md) -->

[Syntaxgesteuerte Interpreter](lecture/backend/interpretation/syntaxdriven.md)
[AST-basierte Interpreter 1](lecture/backend/interpretation/astdriven-part1.md)
[AST-basierte Interpreter 2](lecture/backend/interpretation/astdriven-part2.md)
[Garbage Collection](lecture/backend/interpretation/gc.md)
[Bytecode und VM](lecture/backend/interpretation/vm.md)

[](lecture/backend/optimization.md)
[](lecture/backend/machinecode.md)

[B01](homework/sheet01.md)
[B02](homework/sheet02.md)
[B03](homework/sheet03.md)
[B04](homework/sheet04.md)
:::







<!-- DO NOT REMOVE - THIS IS A LAST SLIDE TO INDICATE THE LICENSE AND POSSIBLE EXCEPTIONS (IMAGES, ...). -->
::: slides
## LICENSE
![](https://licensebuttons.net/l/by-sa/4.0/88x31.png)

Unless otherwise noted, this work is licensed under CC BY-SA 4.0.
:::
