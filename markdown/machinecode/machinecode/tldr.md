---
title: "TL;DR"
disableToc: true
hidden: true
---


Dies ist ein Ausblick und soll die Erzeugung von Maschinencode skizzieren.

Die Erzeugung von Maschinencode ist der Erzeugung von Bytecode relativ ähnlich, allerdings muss
man die Eigenschaften der Zielhardware (Register, Maschinenbefehle, ...) beachten. Insbesondere
muss man ein Text-Segment erstellen, welches die aus dem Zwischencode übersetzten Maschinenbefehle
enthält. Ähnlich wie beim Bytecode werden Konstanten und Literale am Ende vom Text-Segment
gesammelt.

Ein wichtiger (und schwieriger) Schritt ist die Zuordnung von Variablen und Daten zu Registern
oder Adressen. Auch für Sprünge o.ä. müssen immer wieder Adressen berechnet werden.

Der Aufruf von Funktionen funktioniert ähnlich wie bei der stackbasierten VM: Die Codegenerierung
muss dafür sorgen, dass für einen Funktionsaufruf der passende *Stack-Frame* erzeugt wird und
der Prozessor bei der Ausführung in das richtige Code-Segment springt (bei der VM war das einfach:
Die Pointer auf den Byte-Code und der Instruction-Pointer wurden einfach passend "umgebogen"). Für
den Rücksprung muss der Instruction-Pointer mit auf dem Stack abgelegt werden.
