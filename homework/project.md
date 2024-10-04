---
archetype: assignment
title: "Projekt"
author: "BC George, Carsten Gips (HSBI)"

hidden: true
---


## Projekt-Aufgabe


Prolog: Interpreter (Anfragen, Pattern Matching/Unifikation, Resolution, Tiefensuche mit Backtracking)
Haskell: Currying, Lambda-Kalkül, Typ-Inferenz (Hindley-Milner-Typsystem/inferenz), higher-order Functions, lazy Evaluation
Ruby: Klassen, (Multi-) Vererbung, Traits, Monkey-Patching, dynamische Typisierung/Duck-Typing
Lisp: Interpreter (schrittweise Ergänzung, Makros vs. Funktionen, symbolische Programmierung)


Vortrag I: Sprache und Features: Sprache vorstellen
Vortrag II: CB-Algorithmen: Auswirkung auf Compiler vorstellen (Auswirkungen auf semantische Analyse und Interpreter und Laufzeit)
Vortrag III: Projektvorstellung

Dick Grune "Modern Compiler Design" - Chap. 11, 12, 13 (OO, FP, Prolog)

Sprachen: Ruby, Haskell, Prolog, Lisp/Clojure(?)

Workshop I: Vorstellung Sprachen (Kernkonzepte)
Workshop II:
-   Parser:
    -   LALR vs. ALL*
    -   PEG, Pratt Parsing und Parser Combinators
-   Memory Management: Garbage Collection & Borrow Checking/Lifetime-Analysis
-   Semantische Analyse/Typen: Hindley-Milner-Typsystem/-inferenz
-   Unifikation/Resolution (PK1)
-   Byte-Code und VM: WASM, Java-VM
-   IR/Optimierung: SeaOfNodes, MLIR, E-Graphs
Workshop III: Umsetzung als Compiler/Interpreter, Vorstellung der Bausteine und Einordnung; Lexer+Parser selbst implementieren inkl. Fehlerbehandlung; attrib. Grammatik


Ruby: OO
-   Imperative Konzepte (Statements, Expression, Funktionen)
-   Klassen
    -   Offene Klassen/Monkey Patching
    -   Überladene und überschriebene Methoden
    -   (Mehrfach-) Vererbung
-   Dynamisches vs. statisches Binden
-   Module/Importe (benannte Scopes)
-   Duck-Typing, Type-Checking, Type Coercion
-   Templates (?)

Haskell: FP
-   Offside Rule
-   Listen, List Comprehensions
-   Pattern Matching
-   Polymorphic Typing, HM-Typinferenz
-   Higher-order Functions
-   Lazy Evaluation
-   Compiler (Desugaring, Graph-Reduction, Strictness Analysis) und Laufzeit ("functional core")

Prolog: LP
-   Horn-Klauseln
-   Unifikation, Substitution
-   Resolutionskalkül
-   Abarbeitung
-   Listen, Prädikate, Terme
-   Cut

Literatur siehe Literaturquellen im Grune; zusätzlich Tate (7W7S, O'Reilly)





Konzipieren und implementieren Sie im Laufe des Semesters gemeinsam in der gesamten Gruppe einen Compiler `cmjavac` sowie eine Virtual Machine `cmjava` für die Programmiersprache Java.

Ihr Java-Compiler `cmjavac` soll entsprechenden Java-Bytecode in `.class`-Dateien ausgeben, Ihre VM `cmjava` soll `.class`-Dateien einlesen und abarbeiten können. Im Rahmen der umgesetzten Features soll eine Interoperabilität mit den "echten" Java-Tools möglich sein: Eine passende Java-Quelldatei soll sich sowohl von Ihrem Compiler als auch einem `javac` in einem üblichen JDK übersetzen lassen. Die `.class`-Dateien sollen sich dann sowohl mit Ihrer VM als auch der aus einem üblichen JDK einlesen und verarbeiten lassen und zum selben Ergebnis kommen.

Sie können sich relativ frei aussuchen, welche Java-Konzepte Sie umsetzen wollen. Folgende Konzepte stellen einen minimalen Umfang dar:

-   Kontrollfluss (`if`, `for`, ...)
-   Erzeugung von primitiven Datentypen und Objekten
-   Einfache Ein- und Ausgabe von/auf der Konsole
-   Klassen, Vererbung, Polymorphie
-   Exceptions
-   Semantische Analyse und Optimierungen
-   Garbage Collection (in der VM)

Da dies eine Implementierung für Lernzwecke ist, müssen Sie folgende Java-Konzepte nicht umsetzen:

-   Generics
-   Threads
-   Reflection
-   Annotations
-   I/O (Umgang mit Dateien und Ordnern)
-   Laden von Klassen aus einem `.jar`

Strukturell werden Sie vermutlich ein Frontend mit Lexer und Parser benötigen. Hier empfehlen wir Ihnen die Umsetzung mit ANTLR. Sie werden ebenfalls Symboltabellen für die semantische Analyse benötigen und für verschiedene Optimierungen. Ihr Compiler `cmjavac` soll Java Bytecode als "Zwischencode" ausgeben (`.class`-Dateien). Ihre Virtual Machine `cmjava` liest die `.class`-Dateien wieder ein und verarbeitet diese. Arbeiten Sie mit einer Stack-basierten VM und implementieren Sie diese in einer Sprache, die keine Garbage Collection eingebaut hat.

Organisieren Sie selbstständig in Ihrer Semestergruppe die Arbeitsaufteilung und -planung. Da der Java Bytecode eine zentrale Rolle spielt, sollten Sie sich dieses Thema gemeinsam in einem ersten Schritt anschauen.

Stimmen Sie alle Schritte und Ergebnisse mit Ihren Dozent:innen ab und holen Sie sich aktiv Feedback.

**Hinweis**: Wir werden in der Vorlesung nicht alle benötigten Techniken besprechen können (und auch möglicherweise nicht rechtzeitig). Es besteht die Erwartung, dass Sie sich selbstständig und rechtzeitig mit den jeweiligen Themen auseinander setzen.


## Meilensteine

Es gibt drei vordefinierte Meilensteine:

1.  **Meilenstein 1**: Vorstellung der Recherche-Ergebnisse und Konzepte zum Thema Java Bytecode sowie zur Arbeitsaufteilung und -planung (im Praktikum)
2.  **Meilenstein 2**: Vorstellung der Arbeit im Rahmen des Edmonton-Meetings (Prüfungsleistung "**Vortrag I**", Termin "**Edmonton II**")
3.  **Meilenstein 3**: Vorstellung des Projektstatus (in Vorlesung und/oder Praktikum)

Im Rahmen des **Vortrags II** sollen am Ende des Semesters die Projektergebnisse gemeinsam vorgestellt werden.

**Hinweis zu Meilenstein 2**:
Stellen Sie gemeinsam als Gruppe das Projekt den Studierenden der University of Alberta vor: Was ist die Aufgabe, welche Konzepte und Strukturen haben Sie erarbeitet, wie sehen erste Arbeitsergebnisse aus? Jede(r) sollte ca. 6 Minuten vortragen. Dieser Vortrag findet in englischer Sprache statt und ist Teil der Prüfungsleistung.


## Workshops

TODO





## Vorstellung (Station I der Parcoursprüfung)

Stellen Sie Ihre Konzepte und Lösungen im Rahmen eines Vortrags vor. Fokussieren Sie sich
dabei auf die Auswirkungen der oben beschriebenen Erweiterung der Sprache auf die Grammatik
und die semantische Analyse. Der Vortrag soll 20 Minuten dauern.

Am 20. November halten Sie den Vortrag zur Probe im Kreis der Kursgruppe. Hier bekommen Sie
von der Gruppe Feedback, welches Sie zur Verbesserung Ihres Vortrags nutzen können. Dieser
Vortrag zählt für das Testat im Praktikum.

Am 26. November halten Sie den Vortrag als Station I Ihrer Parcoursprüfung auf dem zweiten
Edmonton-Treffen (englische Sprache). Dieser Vortrag wird benotet.

**Bewertungskriterien**

1.  **Inhalt (50 Punkte)**

    -   **Themenverständnis (30 Punkte)**: Wurde das Thema klar und umfassend dargestellt?
        Wurde das Fachwissen adäquat vermittelt?
    -   **Argumentation und Nachvollziehbarkeit (20 Punkte)**: Sind die Konzepte logisch und
        schlüssig aufgebaut? Werden die Aussagen durch relevante Beispiele gestützt?

2.  **Struktur (20 Punkte)**

    -   **Aufbau (10 Punkte)**: Gibt es eine klare Einleitung, einen strukturierten Hauptteil
        und einen prägnanten Schluss?
    -   **Roter Faden (10 Punkte)**: Wird der rote Faden während des gesamten Vortrags
        beibehalten? Ist der Zusammenhang zwischen den einzelnen Punkten nachvollziehbar?

3.  **Präsentationsform (20 Punkte)**

    -   **Gestaltung (10 Punkte)**: Wurden geeignete und ansprechende visuelle Hilfsmittel
        eingesetzt (Diagramme, Abbildungen)? Unterstützen diese die Inhalte oder lenken sie
        eher ab?
    -   **Gestik, Mimik und Sprache (10 Punkte)**: Ist die Sprache klar, verständlich und
        angemessen? Ist die Stimmlage dynamisch und ansprechend? Ist das Tempo angemessen?

4.  **Verschiedenes (10 Punkte)**

    -   **Zeitmanagement (5 Punkte)**: Wurde das der Zeitrahmen (20 Minuten pro Vortrag)
        eingehalten?
    -   **Reaktionen auf Fragen (5 Punkte)**: Wurden Fragen des Publikums souverän und
        kompetent beantwortet?

Gesamtbewertung: 100 Punkte
