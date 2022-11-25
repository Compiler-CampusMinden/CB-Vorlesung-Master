---
archetype: assignment
title: "Meilenstein 04: Builder und freie Aufgabe (Mini-Python)"
author: "BC George, Carsten Gips (FH Bielefeld)"
weight: 4

hidden: true
---


## A4.1: Mini-Python, Builder

Erweitern Sie Ihr Projekt zu einem Compiler, indem Sie unseren [CBuilder]
einbinden. Erzeugen Sie damit aus dem geparsten Mini-Python-Code passenden
C-Code, den Sie mit der im [CBuilder] mitgelieferten [C-Runtime] in ein
lauffähiges Programm übersetzen und ausführen können.

[CBuilder]: https://github.com/Compiler-CampusMinden/Mini-Python-Builder
[C-Runtime]: https://github.com/Compiler-CampusMinden/Mini-Python-Builder/tree/master/c-runtime


## A4.2: Konzepte und Features

Überlegen Sie sich zusätzliche Konzepte und Features, die Sie in Ihren
Interpreter/Compiler einbauen wollen. Dies können zusätzliche Features
auf Sprachebene sein oder Ergänzungen/Erweiterungen Ihres Interpreters
bzw. Compilers.

Beispiel: Sie könnten neue syntaktische Elemente in Mini-Python einführen,
die intern auf die existierende Semantik abgebildet werden ([_syntactic sugar_]).
Hier könnten Sie eine `for`-Schleife einbauen, die intern auf die bereits
existierende `while`-Schleife abgebildet wird. (Sie sollen sich aber
selbst Features überlegen - die `for`-Schleife können Sie also nicht
nehmen :-)

Stellen Sie diese Ideen im Praktikum vor und verteidigen Sie diese.

[_syntactic sugar_]: https://en.wikipedia.org/wiki/Syntactic_sugar


## A4.3: Umsetzung

Setzen Sie die im Praktikum vorgestellten Features bis zur Projektvorstellung in
der letzten Sitzung um.


## A4.4: Vortrag II

Bereiten Sie Ihren Vortrag für die Vorstellung Ihrer zusätzlichen Features vor.

Siehe `["Note und Credits > Vortrag II"]({{< ref "/org/grading" >}})`{=markdown}.
