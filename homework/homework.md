---
archetype: assignment
title: "Aufgabe: Java-Compiler und -VM"
author: "BC George, Carsten Gips (HSBI)"

hidden: true
---


## Aufgabe: Java-Compiler und -VM

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

Strukturell werden Sie vermutlich ein Frontend mit Lexer und Parser benötigen. Hier empfehlen wir Ihnen die Umsetzung mit ANTLR. Sie werden ebenfalls Symboltabellen für die semantische Analyse benötigen und für verschiedene Optimierungen. Ihr Compiler `cmjavac` soll dann Java Bytecode als "Zwischencode" ausgeben (`.class`-Dateien). Ihre Virtual Machine `cmjava` liest die `.class`-Dateien wieder ein und verarbeitet diese. Arbeiten Sie mit einer Stack-basierten VM und implementieren Sie diese in einer Sprache, die keine Garbage Collection eingebaut hat.

Organisieren Sie selbstständig in Ihrer Semestergruppe die Arbeitsaufteilung und -planung. Da der Java Bytecode eine zentrale Rolle spielt, sollten Sie sich dies gemeinsam in einem ersten Schritt anschauen.
