---
title: "Memory Management und Runtime"
no_pdf: true
no_beamer: true
---


Wenn der generierte Code ausgeführt wird, erfolgen in der Regel Speicherallokationen.
Dieser Speicher muss verwaltet werden, d.h. die Lebensdauer von Objekten und die Freigabe
muss bereits bei der Codegenerierung berücksichtigt werden und in den generierten Code
mit hineingeneriert werden.

Zusätzlich benötigt man oft bestimmte Funktionalitäten, die dem generierten Programm zur
Laufzeit zur Verfügung stehen (Runtime-Umgebung).
