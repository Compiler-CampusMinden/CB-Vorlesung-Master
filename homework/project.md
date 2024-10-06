---
archetype: lecture-cg
title: "Compiler-Projekt"
author: "BC George, Carsten Gips (HSBI)"
readings:
  - key: "@Tate2011"
  - key: "@Tate2014"

hidden: true
---

<!--  pandoc -s -f markdown -t markdown+smart-grid_tables-multiline_tables-simple_tables --columns=94 --reference-links=true  project.md  -o xxx.md  -->

## Zusammenfassung

Im Rahmen dieses Projektes werden Sie sich mit der Analyse und Implementierung einer
Programmiersprache zu beschäftigen. Ziel ist es, sowohl die theoretischen als auch die
praktischen Aspekte des Compilerbaus zu vertiefen.

Es wird drei Workshops geben, an denen Sie bestimmte Arbeitsergebnisse präsentieren. Diese
Workshops werden bewertet und gehen in die Gesamtnote ein.

**Fristen** (siehe Orga-Seite)

-   Workshop I: Präsentation der Programmiersprache: 29. Oktober
-   Workshop II: Präsentation Analyse von Compiler-Technologien: 26. November
-   Workshop III: Abgabe und Präsentation des Compilers und der Dokumentation: 21. Januar

## Wahl der Programmiersprache

Wählen Sie eine Programmiersprache aus den folgenden Kategorien:

-   Objektorientiert: Ruby
    -   Imperative Konzepte (Statements, Expression, Funktionen)
    -   Klassen
        -   Monkey Patching
        -   Überladene und überschriebene Methoden
        -   (Mehrfach-) Vererbung
        -   Traits
    -   Dynamisches vs. statisches Binden
    -   Module/Importe (benannte Scopes)
    -   Duck-Typing, Type-Checking, Type Coercion
-   Funktional: Haskell
    -   Offside Rule
    -   Listen, List Comprehensions
    -   Pattern Matching
    -   Currying, Lambda-Kalkül
    -   Funktionen höherer Ordnung
    -   algebraische Datentypen
    -   Polymorphic Typing, Hindley-Milner-Typinferenz
    -   Lazy Evaluation
    -   Compiler (Desugaring, Graph-Reduction, Strictness Analysis) und Laufzeit ("functional
        core")
-   Logisch: Prolog
    -   Horn-Klauseln
    -   Unifikation, Substitution
    -   Resolutionskalkül
    -   Abarbeitung
    -   Listen, Prädikate, Terme
    -   Cut
-   Lisp-Varianten: Clojure
    -   REPL
    -   Makros vs. Funktionen
    -   symbolische Programmierung

Die genannten Sprachen sind als Beispiele zu verstehen. Sie können gern auch andere Sprachen
und Paradigmen einbringen.

Dokumentieren Sie Ihre Wahl und begründen Sie, warum Sie sich für diese Sprache entschieden
haben.

## Workshop I: Präsentation der Programmiersprache

Bereiten Sie pro Team eine Präsentation (ca. 20 Minuten) vor, in der Sie die zentralen
Sprachkonzepte Ihrer gewählten Programmiersprache vorstellen. Folgende Punkte sollten Sie
abdecken:

-   Syntax und Semantik der Sprache
-   Wichtige Sprachmerkmale und Konzepte (z.B. Typisierung, Paradigmen)
-   Praktische Beispiele, um die Konzepte zu veranschaulichen

Reichen Sie ein Begleitdokument (PDF) zu Ihrer Präsentation ein, das eine Übersicht Ihrer
Darstellung enthält.

Sie können sich inhaltlich an [@Tate2011] und [@Tate2014] orientieren. Beide Werke finden Sie
im HSBI-Online-Zugang auf der Plattform O'Reilly.

## Workshop II: Analyse von Compiler-Technologien

Analysieren Sie, wie spezifische Sprachkonzepte den Compiler und seine verschiedenen Phasen
beeinflussen. Berücksichtigen Sie dabei u.a. die Semantische Analyse, die
Interpreter-Entwicklung und Codegenerierung sowie Einfluss auf die Laufzeitumgebung.

Untersuchen Sie (passend zu Ihrer gewählten Sprache) spezielle Themen wie beispielsweise

-   Fortgeschrittene Parseralgorithmen:
    -   LALR vs. ALL\*
    -   PEG, Pratt Parsing und Parser Combinators
-   Memory Management:
    -   Garbage Collection
    -   Borrow Checking/Lifetime-Analysis
-   Semantische Analyse, Typen: Hindley-Milner-Typsystem
-   Generics
-   Error-Handling
-   Unifikation/Resolution (PK1)
-   Byte-Code und VM: WASM, Java-VM
-   IR/Optimierung:
    -   SeaOfNodes
    -   MLIR
    -   E-Graphs

Führen Sie eine eigenständige Recherche durch und arbeiten Sie die Themen durch.

Bereiten Sie pro Team eine kurze Präsentation (ca. 20 Minuten) vor, in der Sie die Konzepte
vorstellen und deren Arbeitsweise an ausgewählten Beispielen verdeutlichen.

Die Präsentation findet im Rahmen des zweiten Edmonton-Treffens ("Edmonton II", 26. November)
und wird von Ihnen in englischer Sprache gehalten.

## Workshop III: Implementierung eines einfachen Compilers

Entwickeln Sie einen kleinen Compiler für die gewählte Programmiersprache. Die Implementierung
sollte grundlegende Sprachfeatures unterstützen (z.B. einfache Datentypen, Kontrollstrukturen)
und eine einfache Codegenerierung (etwa nach C oder Java, oder nach WASM o.ä.) beinhalten.

Sie finden in [@Grune2012] in den Kapiteln 11 bis 13 wertvolle Ideen zu verschiedenen
Sprachparadigmen.

Dokumentieren Sie den Entwicklungsprozess, die Herausforderungen und die Lösungen, die Sie
gefunden haben.

Halten Sie eine Präsentation von ca. 30 Minuten, in der Sie den Compiler vorstellen, seine
Architektur und die von Ihnen gewählten Lösungsansätze erläutern.

**Abgabeformat**

Reichen Sie alle relevanten Unterlagen elektronisch über ILIAS ein. Dazu gehören:

-   Präsentationen und Begleitdokumente für jeden Workshop
-   Der Quellcode Ihres Compilers (mit Kommentaren und Anleitungen zur Ausführung)
-   Eine umfassende Projektdokumentation, die die folgenden Punkte behandelt:
    -   Einführung ins Projekt
    -   Technische Architektur des Compilers
    -   Reflexion: Herausforderungen und Lösungen
    -   Fazit und Ausblick

## Bewertung

Die Bewertung erfolgt anhand der Qualität der Präsentationen, der Tiefe der Analyse, der
technischen Umsetzung des Compilers sowie der Reflexion über den gesamten Prozess.

Berücksichtigen Sie bei Ihrer Analyse auch die Einflüsse diverser Programmiersprachen auf
Compiler-Designs und beschreiben Sie eventuelle Inspirationsquellen oder alternative Ansätze.

* * * * *

Wir freuen uns darauf, Sie in diesem herausfordernden und spannenden Projekt zu begleiten und
wünschen Ihnen viel Erfolg!

Stimmen Sie alle Schritte und Ergebnisse mit Ihren Dozent:innen ab und holen Sie sich aktiv
Feedback.

**Hinweis**: Wir werden in der Vorlesung nicht alle benötigten Techniken besprechen können
(und auch möglicherweise nicht rechtzeitig). Es besteht die Erwartung, dass Sie sich
selbstständig und rechtzeitig mit den jeweiligen Themen auseinander setzen. Nutzen Sie
wissenschaftliche Literatur.
