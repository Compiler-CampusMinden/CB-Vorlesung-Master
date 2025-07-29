---
title: "Interpreter"
---


Ein Interpreter erzeugt keinen Code, sondern führt Source-Code (interaktiv) aus. Die einfachste
Möglichkeit ist der Einsatz von attributierten Grammatiken, wo der Code bereits beim Parsen
ausgeführt wird ("syntaxgesteuerte Interpretation"). Mehr Möglichkeiten hat man dagegen bei der
Traversierung des AST, beispielsweise mit dem Visitor-Pattern. Auch die Abarbeitung von Bytecode
in einer Virtuellen Maschine (VM) zählt zur Interpretation.

(Register- und Stack-basierte Interpreter betrachten wir im Rahmen der Veranstaltung aktuell nicht.)
