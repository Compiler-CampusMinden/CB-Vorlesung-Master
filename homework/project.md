---
archetype: assignment
title: "Aufgabe: Java-Compiler und -VM"
author: "BC George, Carsten Gips (HSBI)"

hidden: true
---


## Aufgabe

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
Stellen Sie gemeinsam als Gruppe das Projekt den Studierenden der University of Alberta vor: Was ist die Aufgabe, welche Konzepte und Strukturen haben Sie erarbeitet, wie sehen erste Arbeitsergebnisse aus? Jede(r) sollte ca. 5 Minuten vortragen. Dieser Vortrag findet in englischer Sprache statt und ist Teil der Prüfungsleistung.
