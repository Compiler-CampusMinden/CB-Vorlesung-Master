---
title: "Concepts of Programming Languages (PO23): Vortrag III"
author: "BC George, Carsten Gips (HSBI)"
no_beamer: true
---


Der Vortrag III ist Teil der Prüfungsleistung für Studierende, die nach der neuen Prüfungsordnung (PO23) am Modul "Concepts of Programming Languages" teilnehmen. Die Vorträge sollen 20 Minuten dauern und werden in der letzten Vorlesungswoche stattfinden. Planen Sie eine Diskussion von zusätzlich ca. 10 Minuten ein. Zusätzlich ist eine kurze Zusammenfassung des Vortrags als Blog im Discussions-Thread des jeweiligen Exposés zu erstellen.

Wir bieten Ihnen hier verschiedene Themen zur Auswahl an, Sie können aber auch gern eigene Vorschläge erarbeiten. Erstellen Sie in beiden Fällen ein kurzes Exposé (Thema, Kernthesen, Paper) als neuen Beitrag in den [GitHub-Discussions](https://github.com/Compiler-CampusMinden/CB-Vorlesung-Master/discussions/new?category=vortrag-iii) und stimmen Sie dieses bis zum Meilenstein I mit Ihren Dozent:innen ab. Ein Thema (bezogen auf die genutzten Paper/Quellen) kann nur einmal vergeben werden - hier gilt das _first-come-first-serve_-Prinzip in den Discussions.

1.  LR-Parsergeneratoren im Vergleich:
    -   Flex und Bison vs. [Tree-Sitter](http://tree-sitter.github.io/tree-sitter/)
2.  Advanced Parsing:
    -   Pratt-Parser
    -   PEG-Parser
    -   Parser-Kombinatoren
    -   [flap: A Deterministic Parser with Fused Lexing](https://dl.acm.org/doi/pdf/10.1145/3591269)
    -   [Interval Parsing Grammars for File Format Parsing](https://dl.acm.org/doi/10.1145/3591264)
    -   [Resolvable Ambiguity: Principled Resolution of Syntactically Ambiguous Programs](https://people.kth.se/~dbro/papers/palmkvist-et-al-2021-resolvable-ambiguity.pdf)
3.  VM und Bytecode:
    -   [AST vs. Bytecode: Interpreters in the Age of Meta-Compilation](https://stefan-marr.de/downloads/oopsla23-larose-et-al-ast-vs-bytecode-interpreters-in-the-age-of-meta-compilation.pdf)
    -   [An Introduction to Interpreters and JIT Compilation](https://stefan-marr.de/2023/09/pliss-summer-school/)
    -   [Optimizing the Order of Bytecode Handlers in Interpreters using a Genetic Algorithm](https://stefan-marr.de/downloads/acmsac23-huang-et-al-optimizing-the-order-of-bytecode-handlers-in-interpreters-using-a-genetic-algorithm.pdf)
4.  Garbage Collection:
    -   [Unified Theory of Garbage Collection](https://scholar.google.de/scholar?hl=en&as_sdt=0%2C5&as_vis=1&q=Unified+Theory+of+Garbage+Collection&btnG=)
    -   [Fast Conservative Garbage Collection](https://scholar.google.de/scholar?hl=en&as_sdt=0%2C5&as_vis=1&q=Fast+Conservative+Garbage+Collection&btnG=)
    -   [Ownership guided C to Rust translation](https://arxiv.org/pdf/2303.10515.pdf)
    -   [Precise Garbage Collection for C](https://www-old.cs.utah.edu/plt/publications/ismm09-rwrf.pdf)
5.  Optimierung:
    -   [Alias-Based Optimization](https://dl.acm.org/doi/10.1145/277652.277670)
    -   [Applying Optimizations for Dynamically-typed Languages to Java](https://stefan-marr.de/downloads/manlang17-grimmer-et-al-applying-optimizations-for-dynamically-typed-languages-to-java.pdf)
    -   [Provably Correct Peephole Optimizations with Alive](https://web.ist.utl.pt/nuno.lopes/pubs/alive-pldi15.pdf)
6.  Profiling:
    -   [Efficient Path Profiling](https://dl.acm.org/citation.cfm?id=243857)
    -   [Efficiently counting program events with support for on-line queries](https://dl.acm.org/doi/10.1145/186025.186027)
    -   [Whole program paths](https://dl.acm.org/doi/10.1145/301631.301678)
    -   [Don’t Trust Your Profiler: An Empirical Study on the Precision and Accuracy of Java Profilers](https://stefan-marr.de/downloads/mplr23-burchell-et-al-dont-trust-your-profiler.pdf)
7.  LL(\*) und Adaptive LL(\*) in ANTLR v4
    -   T. Parr: "_LL(\*): The Foundation of the ANTLR Parser Generator_"
    -   T. Parr: "_Adaptive LL(\*) Parsing: The Power of Dynamic Analysis_"
    -   T. Parr: [_LL(\*) grammar analysis_](https://theantlrguy.atlassian.net/wiki/spaces/~admin/pages/524294/LL+grammar+analysis)
8.  Testing:
    -   [Finding and Understanding Bugs in C Compilers](https://users.cs.utah.edu/~regehr/papers/pldi11-preprint.pdf)
    -   [Validating JIT Compilers via Compilation Space Exploration](https://connglli.github.io/pdfs/artemis_sosp23.pdf)
    -   [A Survey of Compiler Testing](https://software-lab.org/publications/csur2019_compiler_testing.pdf)
    -   [An empirical comparison of compiler testing techniques](https://xiongyingfei.github.io/papers/ICSE16.pdf)
    -   [Compiler Testing: A Systematic Literature Analysis](https://arxiv.org/abs/1810.02718)
    -   [Snapshot Testing for Compilers](https://www.cs.cornell.edu/~asampson/blog/turnt.html)
    -   [Tiny Unified Runner N' Tester (Turnt)](https://github.com/cucapra/turnt)
    -   [Testing Language Implementations](https://youtu.be/ZJUk8_k1HbY?si=Mis0l6M07vbI8Rqx)
9.  Typen und Typinferenzsysteme:
    -   Hindley-Milner Typinferenzsystem
    -   [On Understanding Types, Data Abstraction, and Polymorphism](http://lucacardelli.name/Papers/OnUnderstanding.A4.pdf)
    -   [Propositions as Types](https://homepages.inf.ed.ac.uk/wadler/papers/propositions-as-types/propositions-as-types.pdf)
10. DSL:
    -   [A Modern Compiler for the French Tax Code](https://arxiv.org/pdf/2011.07966.pdf)
    -   [Compiling ML models to C for fun](https://bernsteinbear.com/blog/compiling-ml-models/)
11. Programming Language Concepts
    -   Erforschen Sie das **actor model** mit [Elixir](https://elixir-lang.org/), einer neuen funktionalen Programmiersprache für das Web basierend auf der Erlang Virtual Machine.
    -   Erkunden Sie **borrowing and lifetimes** anhand von [Rust](https://www.rust-lang.org/), einer Systemsprache ohne Garbage Collector.
    -   Erforschen Sie **dependent type systems** mit [Idris](https://www.idris-lang.org/), einer neuen, von Haskell inspirierten Sprache mit beispielloser Unterstützung für typgesteuerte Entwicklung.
    -   Erforschen Sie **Algebraische Typen mit Pattern Matching**, deren praktischen Einsatz (etwa in Haskell, Scala und Java) sowie die interne Umsetzung im Compiler und der Laufzeitumgebung.
    -   Erkunden Sie Konzepte zur Behandlung von optionalen und/oder `null`-/`nil`-Werten sowie deren Umsetzung im Compiler und der Laufzeitumgebung.
