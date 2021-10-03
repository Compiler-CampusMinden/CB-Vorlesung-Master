---
title: "TL;DR"
disableToc: true
hidden: true
---


Compiler übersetzen (formalen) Text in ein anderes Format.

Typischerweise kann man diesen Prozess in verschiedene Stufen/Phasen einteilen. Dabei
verarbeitet jede Phase den Output der vorangegangenen Phase und erzeugt ein (kompakteres)
Ergebnis, welches an die nächste Phase weitergereicht wird. Dabei nimmt die Abstraktion
von Stufe zu Stufe zu: Der ursprüngliche Input ist ein Strom von Zeichen, daraus wird ein
Strom von Wörtern (Token), daraus ein Baum (Parse Tree), Zwischencode (IC), ...

![](images/architektur_cb.png)

Die gezeigten Phasen werden traditionell unterschieden. Je nach Aufgabe können verschiedene
Stufen zusammengefasst werden oder sogar gar nicht auftreten.
