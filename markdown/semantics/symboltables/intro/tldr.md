---
title: "TL;DR"
disableToc: true
hidden: true
---


Auf die lexikalische Analyse und die Syntaxanalyse folgt die semantische Analyse. Nach dem
Parsen steht fest, dass ein Programm syntaktisch korrekt ist. Nun muss geprüft werden, ob
es auch semantisch korrekt ist. Dies umfasst in der Regel die Identifikation und Sammlung
von Bezeichnern und die Zuordnung zur richtigen Ebene (Scopes). Außerdem muss die Nutzung
von Symbolen validiert werden: Je nach Sprache müssen beispielsweise Variablen und Funktionen
vor ihrer Benutzung zumindest deklariert sein; Funktionen sollten sich nicht wie Variablen
benutzen lassen, ...

Als Werkzeug werden (hierarchische) Tabellen eingesetzt, um die verschiedenen Symbole und
Informationen darüber zu verwalten. Dabei werden die Symboltabelleneinträge oft an verschiedenen
Stellen im Compiler generiert und benutzt.
