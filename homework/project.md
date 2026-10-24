# DSL-Projekt: Sprachen und Compiler

## Ziel und Rahmen

In diesem Projekt beschäftigen Sie sich mit fortgeschrittenen Inhalten im Bereich Programmiersprachen und Compilerbau. Sie können eigenständige Ideen einbringen oder einen der nachfolgend genannten Vorschläge aufgreifen und verfeinern. Neben der praktischen Beschäftigung mit den Kurs-Themen recherchieren Sie selbstständig nach relevanter Fachliteratur und reflektieren Ihre Designentscheidungen.

<div data-align="center">

Für das MIF-1.5-Kursprojekt können Sie jede[^1] Idee wählen, die einen Bezug zum Compilerbau hat.

</div>

## Passende Themen (nicht abschließend)

Umfang und geeignete Themen (Beispiele, nicht abschließend)

-   Sprachdesign (DSLs), Scanner/Parser (ANTLR, Tree-Sitter), Typ-/Effekt-Systeme
-   IR-Design und -Transformation (Intermediate Representation), z.B. [Bril](https://github.com/sampsyo/bril), SSA, Dataflow-Analysen
-   MLIR (Multi-Level IR): Dialektentwurf, Lowerings, Pass-Pipelines, Canonicalization
-   Interpreter, VM/JIT, Codegenerierung (z.B. LLVM), Linken/Laden
-   Statische Analysen, Verifikation, Symbolik/SMT, Transformationspipelines
-   E-Graphs und Equality Saturation (z.B. egg/egglog) für optimierende Umformungen
-   Tooling: Incremental Build/Hot-Reload, Profiling/Tracing, Debug-Infos, Fehlermeldungen

Bitte wählen Sie einen klar abgegrenzten Scope, der in Tiefe und Breite zum Semester passt. Definieren Sie mindestens:

-   einen Minimalumfang, den Sie sicher erreichen wollen (und können), und
-   ein oder zwei optionale Erweiterungen, die Sie angehen, wenn Zeit bleibt.

Der Minimalumfang muss einen Parser-/Analyse-/Interpreter-Kern enthalten, die Erweiterungen können z.B. IDE-Integration, Optimierungen oder empirische Evaluationen sein.

Potentiell interessante Literatur im Bereich DSL:

-   Fowler ([2010](#ref-Fowler2010))
-   Voelter ([2013](#ref-Voelter2013)) (*Anmerkung*: Das Buch ist recht alt, aber die ersten drei Kapitel könnten hilfreich sein.)
-   Mernik u. a. ([2005](#ref-mernik2005))

## Projektanregungen

### Escape-Rooms mit MiniJava-Auswertung

Parsen und Interpretieren von MiniJava-Code im [Dungeon](https://github.com/Dungeon-CampusMinden/Dungeon)

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/homework/images/dungeon-interpreter_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/homework/images/dungeon-interpreter.png" width="50%" /></picture></p>

<details>

Im [Dungeon-Projekt](https://github.com/Dungeon-CampusMinden/Dungeon) wurden verschiedene Escape-Room-Rätsel realisiert. In einigen dieser Rätseln sollen die Spieler:innen Aufgaben lösen, indem sie MiniJava-Code (ein eingeschränkter Sub-Dialekt von Java) in ein Textfenster eingeben. Dieser Code muss syntaktisch und semantisch korrekt sein und soll geeignet evaluiert werden. Man sieht dabei live die Auswertung und die Auswirkung auf das Spiel. Diese Rätsel richten sich an Programmier-Einsteiger:innen, und zur Lösung der Rätsel sollen beispielsweise Kontrollstrukturen, Schleifen, Funktionen und ggf. auch Klassen definiert und eingesetzt werden.

In der vorliegenden Implementierung wurden zu jeder Aufgabe ein oder mehrere teilweise komplexe reguläre Ausdrücke hinterlegt, mit der der eingegebene Code dann verglichen wird. Das ist nicht nur sehr umständlich und schlecht zu warten und zu erweitern, sondern erlaubt auch keine anderen Eingaben als die vorgesehenen, selbst wenn damit die Aufgabe inhaltlich korrekt gelöst werden würde.

Ziel dieses Projekt-Vorschlags ist zunächst die Erstellung eines inkrementellen Interpreters für die MiniJava-Eingaben. Der Interpreter muss dabei vorausgegangene Eingaben berücksichtigen (Session-Kontext oder Re-Initialisierung) und zu einer Eingabe ein Ergebnis liefern oder verständliche Fehlermeldungen. In einer zweiten Phase soll eine "Welt-Interaktion" (Interaktion des Interpreters mit dem Dungeon) realisiert werden: Über "eingebaute" Funktionen ("native functions") sollen Spieler:innen direkt in ihrem MiniJava-Code Einfluss auf Elemente im Dungeon nehmen können. Es gibt beispielsweise einen kleinen Roboter, dessen Zustand im MiniJava-Code abgefragt und verändert werden kann. Dabei soll die Kopplung möglichst flexibel bleiben und die Spieler:innen sollen nicht der komplexen Dungeon-API ausgesetzt werden. Optional könnten statische Prüfungen (Schleifenbegrenzung, Laufzeitlimits, ...) mit eingebaut werden und/oder untersucht werden, wie sich die Gestaltung der Fehlermeldungen auf die Lösungszeit/Fehlerrate auswirkt.

Dieses Projekt kann auch mit den nachfolgenden Projekt-Anregungen kombiniert werden.

</details>

### Einsteiger-IDE für Escape-Rooms

Text-Widget mit LSP als Einsteiger-IDE

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/homework/images/dungeon-mini-ide_inv.png" /><img src="https://raw.githubusercontent.com/Compiler-CampusMinden/CPL-Vorlesung-Master/_w26/homework/images/dungeon-mini-ide.png" width="50%" /></picture></p>

<details>

Für die Code-Eingabe im [Dungeon-Projekt](https://github.com/Dungeon-CampusMinden/Dungeon) (vgl. voriger Projektvorschlag) wird ein Text-Widget benutzt. Dabei handelt es sich um die reine Eingabe von Text, es gibt kein Syntaxhighlighting oder Autocompletion oder eine Anzeige von Fehlern o.ä.

Ziel dieses Projekt-Vorschlags ist der Umbau des Text-Widgets zu einer "Mini-IDE" und Integration typischer IDE-Features wie Zeilennummern, Syntaxhighlighting, Autocompletion (Keywords, bekannte Namen aus aktuellem Scope, ...), Anzeige von Fehlern oder sogar Tool-Tips beim Hovern mit der Maus und Anzeige der Javadoc (falls vorhanden). Hierzu soll eine geeignete technische Einbindung des interaktiven Interpreter aus dem vorigen Projektvorschlag erarbeitet und umgesetzt werden - beispielsweise losgelöst als LSP-Server vom Text-Widget.

Dieses Projekt kann auch mit der obigen Projekt-Anregung kombiniert werden.

</details>

### Visualisierung von Programmabläufen

Visualisierung von Programmabläufen in einem interaktiven Interpreter im [Dungeon-Framework](https://github.com/Dungeon-CampusMinden/Dungeon)

<details>

Sie entwickeln einen Interpreter, der z.B. einen Sub-Dialekt von Java ("MiniJava") oder Python ("MiniPython") zur Laufzeit in ein Computer-Spiel wie das Java-basierte [Dungeon-Framework](https://github.com/Dungeon-CampusMinden/Dungeon) oder das von Ihnen parallel im Wahlmodul "Computer Games" entwickelte Spiel integriert.

Im Mittelpunkt steht die Frage, wie sich der Dungeon als **erweiterte Laufzeitumgebung** eines Interpreters nutzen lässt:

-   Wie können Sie Zustände Ihrer Programmiersprache (Variablen, Objekte, Funktionsaufrufe) auf Elemente im Dungeon (z.B. NPCs, Türen, Schalter, Items) **abbilden und sichtbar machen**?
-   Wie können Sie umgekehrt Dungeon-Elemente als **sprachseitige Objekte** oder Werte einblenden, sodass sie in der interpretierten Sprache direkt gelesen, verändert oder überwacht werden können?

Ziel ist es, Programmabläufe im Dungeon zu visualisieren: Zustandsänderungen (z.B. Variablenwerte, Objektzustände) sollen sich in der Spielwelt widerspiegeln, etwa durch Bewegung von NPCs, Animationen, Hervorhebungen oder Overlays. Gleichzeitig sollen Änderungen im Dungeon (Events, Kollisionen, Interaktionen) in der interpretierten Sprache beobachtbar und bearbeitbar sein (z.B. über Callbacks, Events, REPL).

Untersuchen Sie geeignete Mappings zwischen Programmzustand und Spielzustand, diskutieren Sie Designalternativen und erstellen Sie eine prototypische Laufzeitintegration mit visueller Darstellung von Programmlogik im Spiel.

</details>

### Quest-DSL

Entwerfen Sie eine Sprache zur Beschreibung von Quests, Übungsaufgaben und Escape Rooms

<details>

Didaktische Inhalte können in Serious Games effizienter bereitgestellt werden, wenn Lehrende über eine fachnahe, deklarative Sprache arbeiten. Spiele(-frameworks) wie beispielsweise das Dungeon-Framework (ECS, Game-Loop) haben eine entsprechende API, die Nutzung erfordert jedoch aktuell dedizierte Kenntnisse der API und der jeweiligen Programmiersprache. Eine **Quest-DSL** schließt diese Lücke und eröffnet Raum für Forschung zu Sprachdesign, Laufzeitintegration, Event-Verarbeitung und Performanz in Game-Loops.

Sie entwickeln eine domänenspezifische Sprache (DSL), mit der sich:

-   fachliche Unterrichtsaufgaben, Quests und ggf. komplette Escape Rooms **deklarativ beschreiben** lassen (z.B. Ziele, Bedingungen, Belohnungen, Abhängigkeiten, lineare/nicht-lineare Verläufe),
-   sowie das Spiel zur Laufzeit **steuern und auf Spielereignisse reagieren** kann (z.B. bei "Quest erfüllt", "Item eingesammelt", "NPC erreicht Zielposition").

Ihre DSL soll es erlauben, typische Quest-Logiken ohne direkten Kontakt zur Dungeon-API zu formulieren. Dazu gehört u.a.:

-   Entwurf der Sprachkonzepte (Syntax, Grundbausteine, z.B. Zustände, Bedingungen, Trigger, Aktionen),
-   Umsetzung eines Parsers und statischer Checks (Konsistenz, Vollständigkeit, Referenzierbarkeit von Objekten),
-   eine Laufzeitintegration in ein Spiel (z.B. Dungeon-Framework), die Quest-Definitionen lädt, auswertet und mit Spielereignissen koppelt.

Untersuchen Sie existierende Quest-DSLs und Game-Scripting-Sprachen als Ausgangspunkt und reflektieren Sie, welche Designentscheidungen Sie für Ihre Sprache treffen.

*Optional*: Sie können zusätzlich eine explizite IR (Zwischendarstellung) für Ihre DSL entwerfen und diese als Zwischenziel der Übersetzung nutzen, z.B. zur besseren Analysierbarkeit oder Optimierung.

</details>

### Compiler Bootstrapping

Eine kleine Sprache mit OOP- und FP-Features entwerfen und zwei Compiler bauen

<details>

Sie entwerfen eine kleine Sprache "X" mit OOP- und FP-Elementen.

Sie implementieren Compiler "A" in einer bestehenden Sprache Ihrer Wahl (Haskell, OCaml, Racket, Clojure, Java, zur Not auch Python oder Rust oder andere). Compiler A übersetzt nur ein Minimal-Subset von X: "X-min". A parst X-min, prüft Typen in einfacher Form und erzeugt Code in der gewählten Zielsprache ("transpiling").

Sie schreiben nun in X-min den Compiler "B", der den vollen Sprachumfang von X übersetzen kann. Sie zeigen Bootstrapping: B wird mit A gebaut und kompiliert anschließend in X formulierte Programme. B parst und kompiliert die Vollsprache X. B darf intern ein Desugaring auf den Kern verwenden.

Bootstrapping: B wird mit A auf die Zielplattform transpiliert. Sie kompilieren die *Quellen* von B mit dem Compiler A. Sie erhalten daraus den Compiler B in der Zielsprache (Sourcecode für B in der Zielsprache, z.B. Haskell, Java, ...). Sie bauen nun B mit dem passenden Systemwerkzeug (z.B. javac oder gcc). Verwenden sie den so entstehenden ausführbaren Compiler B, um Programme der Vollsprache X zu kompilieren.

Self-Hosting: Kann Ihr Compiler B sich selbst kompilieren, also kann B den in X geschriebenen Quellcode von B korrekt übersetzen?

Transpiling: Die Codegenerierung kann als Transpilation in eine bestehende Zielsprache (z.B. Java oder C) erfolgen. Sie brauchen also keine SSA-Phase und Assembler-Generierung o.ä. umsetzen. Der so generierte Code soll sich mit Standardwerkzeugen kompilieren oder ausführen lassen (z.B. javac, gcc, python, node). Sie sollten vermutlich eine kleine Laufzeitbibliothek in der Zielsprache mitliefern.

</details>

### LaTeX Equation Language

Parsen und übersetzen eines LaTeX-Teilgrammatik (Arithmetik, cases, Funktionsdefinition) in ausführbaren LLVM-IR-Code oder Java-Bytecode o.ä. Ziel: Brücke von symbolischer Notation zu maschinennahem Code.

### MLIR/E-Graphs-Pipeline

Entwurf eines kleinen MLIR-Dialekts (z.B. arithmetische Ausdrücke) mit Lowering nach LLVM; alternativ/ergänzend Optimierung via E-Graphs (Equality Saturation) und anschließendes Lowering.

Neben passenden Konzepten soll auch eine geeignete Umsetzung/Implementierung erstellt und empirisch untersucht werden.

------------------------------------------------------------------------

> [!NOTE]
>
> <details >
> <summary><strong>👀 Quellen</strong></summary>
>
> <div id="refs" class="references csl-bib-body hanging-indent">
>
> <div id="ref-Fowler2010" class="csl-entry">
>
> Fowler, M. 2010. *Domain Specific Languages*. Addison Wesley. <https://learning.oreilly.com/library/view/domain-specific-languages/9780132107549/>.
>
> </div>
>
> <div id="ref-mernik2005" class="csl-entry">
>
> Mernik, M., J. Heering, und A. M. Sloane. 2005. „When and How to Develop Domain-Specific Languages". *ACM Computing Surveys (CSUR)* 37 (4): 316--44. <https://john.cs.olemiss.edu/~hcc/csci658/notes/localcopy/WhenDSL.pdf>.
>
> </div>
>
> <div id="ref-Voelter2013" class="csl-entry">
>
> Voelter, M. 2013. *DSL Engineering: Designing, Implementing and Using Domain-Specific Languages*. CreateSpace Independent Publishing Platform. <https://www.voelter.de/dslbook/markusvoelter-dslengineering-1.0.pdf>.
>
> </div>
>
> </div>
>
> </details>

------------------------------------------------------------------------

<p align="center"><img src="https://licensebuttons.net/l/by-sa/4.0/88x31.png"  /></p>

Unless otherwise noted, this work is licensed under CC BY-SA 4.0.

<blockquote><p><sup><sub><strong>Last modified:</strong> a807eb5 2026-10-16 project: fix typos<br></sub></sup></p></blockquote>

[^1]: ... for a given value of "*jede*" :) ... Die Idee muss zum Thema passen und vom Anspruch und Umfang her einem 10 ECTS Master-Modul angemessen sein.
