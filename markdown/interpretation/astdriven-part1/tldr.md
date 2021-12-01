---
title: "TL;DR"
disableToc: true
hidden: true
---


Ein AST-basierter Interpreter besteht oft aus einem "Visitor-Dispatcher": Man traversiert
mit einer `eval()`-Funktion den AST und ruft je nach Knotentyp die passende Funktion auf.
Dabei werden bei Ausdrücken (*Expressions*) Werte berechnet und zurückgegeben, d.h. hier
hat man einen Rückgabewert und ein entsprechendes `return` im `switch`/`case`, während man
bei Anweisungen (*Statements*) keinen Rückgabewert hat.

Der Wert von Literalen ergibt sich direkt durch die Übersetzung des jeweiligen Werts in den
passenden Typ der Implementierungssprache. Bei einfachen Ausdrücken kann man auf das in
["Syntaxgesteuerte Interpreter"]({{<ref "/interpretation/syntaxdriven" >}}) demonstrierte
Vorgehen zurückgreifen: Man interpretiert zunächst die Teilausdrücke durch den Aufruf von
`eval()` für die jeweiligen AST-Kindknoten und berechnet daraus das gewünschte Ergebnis.

Für Blöcke und Variablen muss man analog zum Aufbau von Symboltabellen wieder Scopes
berücksichtigen, d.h. man benötigt Strukturen ähnlich zu den Symboltabellen (hier "Umgebung"
(*Environment*) genannt). Es gibt eine globale Umgebung, und mit dem Betreten eines neuen
Blocks wird eine neue Umgebung aufgemacht, deren Eltern-Umgebung die bisherige Umgebung ist.

Zu jedem Namen kann man in einer Umgebung einen Wert definieren bzw. abrufen. Dabei muss man
je nach Semantik der zu interpretierenden Sprache unterscheiden zwischen der "Definition" und
der "Zuweisung" einer Variablen: Die Definition erfolgt i.d.R. in der aktuellen Umgebung, bei
der Zuweisung sucht man ausgehend von der aktuellen Umgebung bis hoch zur globalen Umgebung
nach dem ersten Vorkommen der Variablen und setzt den Wert in der gefundenen Umgebung. Bei
Sprachen, die Variablen beim ersten Zugriff definieren, muss man dieses Verhalten entsprechend
anpassen.
