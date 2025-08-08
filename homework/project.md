---
author: BC George, Carsten Gips (HSBI)
no_beamer: true
title: Compiler-Projekt
---

<!--  pandoc -s -f markdown -t markdown+smart-grid_tables-multiline_tables-simple_tables --columns=94  project.md  -o xxx.md  -->

# Zusammenfassung

Im Rahmen dieses Projektes werden Sie sich mit der Analyse und Implementierung einer Programmiersprache zu beschäftigen.
Ziel ist es, sowohl die theoretischen als auch die praktischen Aspekte des Compilerbaus zu vertiefen.

Es wird drei Workshops geben, an denen Sie bestimmte Arbeitsergebnisse präsentieren. Diese Workshops werden bewertet und
gehen in die Gesamtnote ein.

## Fristen (siehe Orga-Seite)

-   Workshop I: Präsentation der Programmiersprache: 29. Oktober (14:00 - 15:30 Uhr, online)
-   Workshop II: Präsentation Analyse von Compiler-Technologien: 26. November (18:00 - 19:30 Uhr, online)
-   Workshop III: Abgabe und Präsentation des Compilers und der Dokumentation: 31. Januar (10:00 - 12:30 Uhr, online)

Feedback-Gespräche: 07. Februar (10:00 - 12:00 Uhr, online)

## Teams

Die Aufgaben (Workshops) werden in 2er Teams bearbeitet.

# Wahl der Programmiersprache

Wählen Sie eine Programmiersprache aus den folgenden Kategorien:

-   Objektorientiert: Ruby
    -   Imperative Konzepte (Statements, Expression, Funktionen)
    -   Klassen
        -   Monkey Patching
        -   Überladene und überschriebene Methoden
        -   (Mehrfach-) Vererbung
        -   Traits
    -   Module/Importe (benannte Scopes)
    -   Duck-Typing (dynamisches vs. statisches Binden), Type-Checking, Type Coercion
-   Funktional: Haskell
    -   Offside Rule
    -   Listen, List Comprehensions
    -   Pattern Matching
    -   Currying, Lambda-Kalkül
    -   Funktionen höherer Ordnung
    -   algebraische Datentypen
    -   Polymorphic Typing, Hindley-Milner-Typinferenz
    -   Lazy Evaluation
    -   Compiler (Desugaring, Graph-Reduction, Strictness Analysis) und Laufzeit ("functional core")
-   Logisch: Prolog
    -   Horn-Klauseln
    -   Unifikation, Substitution
    -   Resolutionskalkül
    -   Abarbeitung
    -   Listen, Prädikate, Terme
    -   Cut

Die genannten Sprachen sind als Beispiele zu verstehen. Sie können gern auch andere Sprachen und Paradigmen einbringen.

Dokumentieren Sie Ihre Wahl und begründen Sie, warum Sie sich für diese Sprache entschieden haben.

# Workshop I: Präsentation der Programmiersprache

Bereiten Sie pro Team eine Präsentation (ca. 20 Minuten) vor, in der Sie die zentralen Sprachkonzepte Ihrer gewählten
Programmiersprache vorstellen. Folgende Punkte sollten Sie abdecken:

-   Syntax und Semantik der Sprache
-   Wichtige Sprachmerkmale und Konzepte (z.B. Typisierung, Paradigmen)
-   Praktische Beispiele, um die Konzepte zu veranschaulichen

Reichen Sie ein Begleitdokument (PDF) zu Ihrer Präsentation ein, das eine Übersicht Ihrer Darstellung enthält.

Sie können sich inhaltlich an [@Tate2011] und [@Tate2014] orientieren. Beide Werke finden Sie im HSBI-Online-Zugang auf
der Plattform O'Reilly.

# Workshop II: Analyse von Compiler-Technologien

Analysieren Sie, wie spezifische Sprachkonzepte den Compiler und seine verschiedenen Phasen beeinflussen.
Berücksichtigen Sie dabei u.a. die Semantische Analyse, die Interpreter-Entwicklung und Codegenerierung sowie Einfluss
auf die Laufzeitumgebung.

Untersuchen Sie (passend zu Ihrer gewählten Sprache) spezielle Themen wie beispielsweise

1.  LR-Parsergeneratoren im Vergleich:
    -   Flex und Bison vs. [Tree-Sitter](http://tree-sitter.github.io/tree-sitter/)
2.  Advanced Parsing:
    -   Pratt-Parsing, PEG-Parser, Parser-Kombinatoren
    -   LALR-Parsing
    -   LL(\*) und Adaptive LL(\*) in ANTLR v4
        -   T. Parr: "*LL(\*): The Foundation of the ANTLR Parser Generator*"
        -   T. Parr: "*Adaptive LL(\*) Parsing: The Power of Dynamic Analysis*"
        -   T. Parr: [*LL(\*) grammar
            analysis*](https://theantlrguy.atlassian.net/wiki/spaces/~admin/pages/524294/LL+grammar+analysis)
    -   [flap: A Deterministic Parser with Fused Lexing](https://dl.acm.org/doi/pdf/10.1145/3591269)
3.  VM und Bytecode:
    -   [AST vs. Bytecode: Interpreters in the Age of
        Meta-Compilation](https://stefan-marr.de/downloads/oopsla23-larose-et-al-ast-vs-bytecode-interpreters-in-the-age-of-meta-compilation.pdf)
    -   [An Introduction to Interpreters and JIT Compilation](https://stefan-marr.de/2023/09/pliss-summer-school/)
    -   [Optimizing the Order of Bytecode Handlers in Interpreters using a Genetic
        Algorithm](https://stefan-marr.de/downloads/acmsac23-huang-et-al-optimizing-the-order-of-bytecode-handlers-in-interpreters-using-a-genetic-algorithm.pdf)
    -   WASM vs. Java-VM
4.  Memory Management:
    -   Garbage Collection:
        -   [Unified Theory of Garbage
            Collection](https://scholar.google.de/scholar?hl=en&as_sdt=0%2C5&as_vis=1&q=Unified+Theory+of+Garbage+Collection&btnG=)
        -   [Fast Conservative Garbage
            Collection](https://scholar.google.de/scholar?hl=en&as_sdt=0%2C5&as_vis=1&q=Fast+Conservative+Garbage+Collection&btnG=)
        -   [Ownership guided C to Rust translation](https://arxiv.org/pdf/2303.10515.pdf)
        -   [Precise Garbage Collection for C](https://www-old.cs.utah.edu/plt/publications/ismm09-rwrf.pdf)
    -   Borrow Checking/Lifetime-Analysis
5.  Optimierung:
    -   [Alias-Based Optimization](https://dl.acm.org/doi/10.1145/277652.277670)
    -   [Applying Optimizations for Dynamically-typed Languages to
        Java](https://stefan-marr.de/downloads/manlang17-grimmer-et-al-applying-optimizations-for-dynamically-typed-languages-to-java.pdf)
    -   [Provably Correct Peephole Optimizations with Alive](https://web.ist.utl.pt/nuno.lopes/pubs/alive-pldi15.pdf)
    -   [Don't Trust Your Profiler: An Empirical Study on the Precision and Accuracy of Java
        Profilers](https://stefan-marr.de/downloads/mplr23-burchell-et-al-dont-trust-your-profiler.pdf)
6.  Testing:
    -   [Finding and Understanding Bugs in C Compilers](https://users.cs.utah.edu/~regehr/papers/pldi11-preprint.pdf)
    -   [Validating JIT Compilers via Compilation Space Exploration](https://connglli.github.io/pdfs/artemis_sosp23.pdf)
    -   [A Survey of Compiler Testing](https://software-lab.org/publications/csur2019_compiler_testing.pdf)
    -   [An empirical comparison of compiler testing techniques](https://xiongyingfei.github.io/papers/ICSE16.pdf)
    -   [Compiler Testing: A Systematic Literature Analysis](https://arxiv.org/abs/1810.02718)
    -   [Snapshot Testing for Compilers](https://www.cs.cornell.edu/~asampson/blog/turnt.html)
    -   [Tiny Unified Runner N' Tester (Turnt)](https://github.com/cucapra/turnt)
    -   [Testing Language Implementations](https://youtu.be/ZJUk8_k1HbY?si=Mis0l6M07vbI8Rqx)
7.  Typen und Typinferenzsysteme:
    -   Hindley-Milner Typinferenzsystem
    -   [On Understanding Types, Data Abstraction, and
        Polymorphism](http://lucacardelli.name/Papers/OnUnderstanding.A4.pdf)
    -   [Propositions as
        Types](https://homepages.inf.ed.ac.uk/wadler/papers/propositions-as-types/propositions-as-types.pdf)
8.  IR
    -   [Multi-Level Intermediate Representation (MLIR)](https://mlir.llvm.org/) und [Clang IR
        (CIR)](https://llvm.github.io/clangir/), [MLIR: A Compiler Infrastructure for the End of Moore's
        Law](https://arxiv.org/abs/2002.11054)
    -   [Sea-of-Nodes IR](https://github.com/SeaOfNodes/Simple)

Führen Sie eine eigenständige Recherche durch und arbeiten Sie die Themen durch.

Bereiten Sie pro Team eine kurze Präsentation (ca. 20 bis 30 Minuten) vor, in der Sie die Konzepte vorstellen und deren
Arbeitsweise an ausgewählten Beispielen verdeutlichen.

Die Präsentation findet im Rahmen des zweiten Edmonton-Treffens ("Edmonton II", 26. November) und wird von Ihnen in
englischer Sprache gehalten.

# Workshop III: Implementierung eines einfachen Compilers

Entwickeln Sie einen kleinen Compiler für die gewählte Programmiersprache. Die Implementierung sollte grundlegende
Sprachfeatures unterstützen (z.B. einfache Datentypen, Kontrollstrukturen) und eine einfache Codegenerierung (etwa nach
C oder Java, oder nach WASM o.ä.) beinhalten. Berücksichtigen Sie dabei nach Möglichkeit die von Ihnen in Workshop II
vorgestellten Techniken und Algorithmen.

Sie finden in [@Grune2012] in den Kapiteln 11 bis 13 wertvolle Ideen zu verschiedenen Sprachparadigmen.

Dokumentieren Sie den Entwicklungsprozess, die Herausforderungen und die Lösungen, die Sie gefunden haben.

Halten Sie eine Präsentation von ca. 30 Minuten, in der Sie den Compiler vorstellen, seine Architektur und die von Ihnen
gewählten Lösungsansätze erläutern.

**Abgabeformat**

Reichen Sie alle relevanten Unterlagen elektronisch über ILIAS ein. Dazu gehören:

-   Präsentationen und Begleitdokumente für jeden Workshop
-   Der Quellcode Ihres Compilers (mit Kommentaren und Anleitungen zur Ausführung)
-   Eine umfassende Projektdokumentation, die die folgenden Punkte behandelt:
    -   Einführung ins Projekt
    -   Technische Architektur des Compilers
    -   Reflexion: Herausforderungen und Lösungen
    -   Fazit und Ausblick

# Bewertung

Die Bewertung erfolgt anhand der Qualität der Präsentationen, der Tiefe der Analyse, der technischen Umsetzung des
Compilers sowie der Reflexion über den gesamten Prozess.

Berücksichtigen Sie bei Ihrer Analyse auch die Einflüsse diverser Programmiersprachen auf Compiler-Designs und
beschreiben Sie eventuelle Inspirationsquellen oder alternative Ansätze.

------------------------------------------------------------------------------------------------------------------------

Wir freuen uns darauf, Sie in diesem herausfordernden und spannenden Projekt zu begleiten und wünschen Ihnen viel
Erfolg!

Stimmen Sie alle Schritte und Ergebnisse mit Ihren Dozent:innen ab und holen Sie sich aktiv Feedback.

**Hinweis**: Wir werden in der Vorlesung nicht alle benötigten Techniken besprechen können (und auch möglicherweise
nicht rechtzeitig). Es besteht die Erwartung, dass Sie sich selbstständig und rechtzeitig mit den jeweiligen Themen
auseinander setzen. Nutzen Sie wissenschaftliche Literatur.

::: readings
-   @Tate2011
-   @Tate2014
:::
