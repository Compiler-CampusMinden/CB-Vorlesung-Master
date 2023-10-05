---
archetype: assignment
title: "Concepts of Programming Languages (PO23): Vortrag III"
author: "BC George, Carsten Gips (HSBI)"

hidden: true
---


## Vortrag III

Der Vortrag III ist Teil der Prüfungsleistung für Studierende, die nach der neuen Prüfungsordnung (PO23) am Modul "Concepts of Programming Languages" teilnehmen. Die Vorträge sollen 30 Minuten dauern und werden in der letzten Vorlesungswoche stattfinden. Planen Sie eine Diskussion von ca. 10 Minuten ein.

Wir bieten Ihnen verschiedene Themen zur Auswahl an. Sie können gern auch eigene Vorschläge einreichen.

1.  LR-Parsergeneratoren im Vergleich: Flex und Bison vs. [Tree-Sitter](http://tree-sitter.github.io/tree-sitter/)
2.  Advanced Parsing: Pratt-Parser, PEG, Parser-Kombinatoren,
    [flap: A Deterministic Parser with Fused Lexing](https://dl.acm.org/doi/pdf/10.1145/3591269),
    [Interval Parsing Grammars for File Format Parsing](https://dl.acm.org/doi/10.1145/3591264)
3.  [VM und Bytecode](https://scholar.google.de/scholar?hl=en&as_sdt=0%2C5&as_vis=1&q=byte+code+interpreter&btnG=&oq=byte+code),
    [Optimizing the Order of Bytecode Handlers in Interpreters using a Genetic Algorithm](https://stefan-marr.de/downloads/acmsac23-huang-et-al-optimizing-the-order-of-bytecode-handlers-in-interpreters-using-a-genetic-algorithm.pdf)
4.  [Just-in-Time Compilation](https://scholar.google.de/scholar?hl=en&as_sdt=0%2C5&as_vis=1&q=Just-in-Time+Compilation&btnG=) (Python, Javascript):
    [An Introduction to Interpreters and JIT Compilation](https://stefan-marr.de/2023/09/pliss-summer-school/),
    [AST vs. Bytecode: Interpreters in the Age of Meta-Compilation](https://stefan-marr.de/downloads/oopsla23-larose-et-al-ast-vs-bytecode-interpreters-in-the-age-of-meta-compilation.pdf)
5.  Garbage Collection:
    [Unified Theory of Garbage Collection](https://scholar.google.de/scholar?hl=en&as_sdt=0%2C5&as_vis=1&q=Unified+Theory+of+Garbage+Collection&btnG=),
    [Fast Conservative Garbage Collection](https://scholar.google.de/scholar?hl=en&as_sdt=0%2C5&as_vis=1&q=Fast+Conservative+Garbage+Collection&btnG=),
    [Ownership guided C to Rust translation](https://arxiv.org/pdf/2303.10515.pdf),
    [Precise Garbage Collection for C](https://www-old.cs.utah.edu/plt/publications/ismm09-rwrf.pdf)
6.  Optimierung:
    [Alias-Based Optimization](https://dl.acm.org/doi/10.1145/277652.277670),
    [Optimizing the Order of Bytecode Handlers in Interpreters using a Genetic Algorithm](https://stefan-marr.de/downloads/acmsac23-huang-et-al-optimizing-the-order-of-bytecode-handlers-in-interpreters-using-a-genetic-algorithm.pdf),
    [Applying Optimizations for Dynamically-typed Languages to Java](https://stefan-marr.de/downloads/manlang17-grimmer-et-al-applying-optimizations-for-dynamically-typed-languages-to-java.pdf),
    [Provably Correct Peephole Optimizations with Alive](https://web.ist.utl.pt/nuno.lopes/pubs/alive-pldi15.pdf)
7.  Profiling:
    [Efficient Path Profiling](https://dl.acm.org/citation.cfm?id=243857),
    [Efficiently counting program events with support for on-line queries](https://dl.acm.org/doi/10.1145/186025.186027),
    [Whole program paths](https://dl.acm.org/doi/10.1145/301631.301678),
    [Don’t Trust Your Profiler: An Empirical Study on the Precision and Accuracy of Java Profilers](https://stefan-marr.de/downloads/mplr23-burchell-et-al-dont-trust-your-profiler.pdf)
8.  Backend mit LLVM (Überblick und Beispiel in die Tiefe)
9.  LL(\*) und Adaptive LL(\*) in ANTLR v4
    (T. Parr: "_LL(\*): The Foundation of the ANTLR Parser Generator_" und "_Adaptive LL(\*) Parsing: The Power of Dynamic Analysis_"
    und [_LL(\*) grammar analysis_](https://theantlrguy.atlassian.net/wiki/spaces/~admin/pages/524294/LL+grammar+analysis))
10. Testing:
    [Finding and Understanding Bugs in C Compilers](https://users.cs.utah.edu/~regehr/papers/pldi11-preprint.pdf),
    [Validating JIT Compilers via Compilation Space Exploration](https://connglli.github.io/pdfs/artemis_sosp23_preprint.pdf),
    [A Survey of Compiler Testing](https://software-lab.org/publications/csur2019_compiler_testing.pdf),
    [An empirical comparison of compiler testing techniques](https://xiongyingfei.github.io/papers/ICSE16.pdf),
    [Compiler Testing: A Systematic Literature Analysis](https://arxiv.org/abs/1810.02718),
    [Snapshot Testing for Compilers](https://www.cs.cornell.edu/~asampson/blog/turnt.html),
    [Tiny Unified Runner N' Tester (Turnt)](https://github.com/cucapra/turnt),
    [Testing Language Implementations](https://youtu.be/ZJUk8_k1HbY?si=Mis0l6M07vbI8Rqx)
11. Typen:
    [On Understanding Types, Data Abstraction, and Polymorphism](http://lucacardelli.name/Papers/OnUnderstanding.A4.pdf),
    [Propositions as Types](https://homepages.inf.ed.ac.uk/wadler/papers/propositions-as-types/propositions-as-types.pdf)
12. DSL:
    [A Modern Compiler for the French Tax Code](https://arxiv.org/pdf/2011.07966.pdf),
    [Compiling ML models to C for fun](https://bernsteinbear.com/blog/compiling-ml-models/),
    [Provably Correct Peephole Optimizations with Alive](https://web.ist.utl.pt/nuno.lopes/pubs/alive-pldi15.pdf)

* Explore the **actor model** through [Elixir](https://elixir-lang.org/), a new functional programming language for the web based on the battle-tested Erlang Virtual Machine!
* Explore **borrowing and lifetimes** through [Rust](https://www.rust-lang.org/), a systems language which achieves memory- and thread-safety without a garbage collector!
* Explore **dependent type systems** through [Idris](https://www.idris-lang.org/), a new Haskell-inspired language with unprecedented support for type-driven development.


[Resolvable Ambiguity: Principled Resolution of Syntactically Ambiguous Programs](https://people.kth.se/~dbro/papers/palmkvist-et-al-2021-resolvable-ambiguity.pdf)
[Programming Language Semantics](https://www.cs.nott.ac.uk/~pszgmh/123.pdf)
[An Incremental Approach to Compiler Construction](http://scheme2006.cs.uchicago.edu/11-ghuloum.pdf)




1.  Algebraische Typen mit Pattern Matching
    Ursprünglich in funktionalen Programmiersprachen wie ML oder Haskell beheimatet, finden sich algebraische Datentypen in modernen Varianten funktionaler Sprachen wie F# und ebenso auch in Hybridsprachen wie Scala in Form von Case-Klassen. Algebraische Datentypen sind eine einfach Möglichkeit einen Datentyp als Summentyp mehrerer Produkttypen darzustellen. Eine Fallunterscheidung über die Summentypen und Projektion auf die Attribute der Produkttypen kann über Pattern-Matching erfolgen.
    Der Vortrag zeigt an Beispielen die Funktionsweise von algebraischen Datentypen und geht auf Vor- und Nachteile dieser ein.

2.  Kombinatorbibliotheken und Monaden
    Funktionalität oder Aktionen zu kombinieren stellt eine ungeahnt allgemeine Fragestellung dar. Hierbei lassen sich zunächst die Sequenz von Aktionen (erst das eine, dann das andere), oder die Option, entweder das eine eventuell dann doch das andere identifizieren. Funktionale Sprachen erlauben es, Operatoren zur Verknüpfung von Aktionen zu definieren und haben schließlich die wunderbare Welt der Monaden erfunden.

3.  Nebenläufigkeit auf der JVM mittels Aktoren in Akka
    Was ist das Aktorenmodell des Frameworks AKKA? In Wikipedia wird es wie folgt umschrieben:
    Akka is an open-source toolkit and runtime simplifying the construction of concurrent and distributed applications on the JVM. Akka supports multiple programming models for concurrency, but it emphasizes actor-based concurrency, with inspiration drawn from Erlang.
    From Wikipedia, the free encyclopedia

4.  Behandlung von optionalen oder null-/nil-Werten
    Nullwerte sind in fast allen Sprachen eine häufige Fehlerquelle. Daher gibt es mehrere Ansätze mit diesen umzugehen: Maybe-Monade in Haskell, Option Chaining in Swift, null

5.  Dynamische Daten
    Dynamische Code Erzeugung und Ausführung in statisch getypten Sprachen: Dynamics in Scala, Reflection in Java,....

6.  Java 8 Streams (die Interna)
    Wie sehen die Interna des Java 8 Stream Apis aus. Wie wird die automatische Nebenläufigkeit in parallelStream realisiert. Was ist eigentlich sin Spilterator.

7.  Garbage Collection in Java
    Was macht eigentlich die JVM für eine Garbage Collection. Kann man diese auch als Programmierer beeinflussen?

8.  Typinferenzsysteme
    Mit der Sprache ML wurde das Hindley-Milner Typinferenzsystem entwickelt, das dann in Haskell erweitert wurde. Heute finden sich auch in typgecheckten Programmiersprachen zunehmend inferierte Anteile im Typsystem.

9.  Annotationen in Java
    Alle kennen die @Override Annotationen in Java. Aber Java bietet an, eigene Annotationen zu entwickeln und diese bei der Compilierung auswerten zu lassen. Oft sieht man solche Annotationen bei der Persistierung von Daten. Aber auch ganz andere Szenarien sind denkbar, wie das Annotieren zur Generierung automatischer GUI-Klassen, bis hin zur Simulation von algebraischen Typen.

10. Lazyness
    Was ist Lazyness, was geht damit gut, wo liegen die Probleme in diesem Ausführungsmodell?

11. Lift Framework
    Lift ist ein sehr mächtiges Framework zur Erstellung von Webanwendungen in der Programmiersprach Scala.

