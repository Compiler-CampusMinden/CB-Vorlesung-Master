---
chapter: true
title: "Interpreter"
weight: 6
---


# Interpreter

Ein Interpreter erzeugt keinen Code, sondern führt Source-Code (interaktiv) aus. Die einfachste
Möglichkeit ist der Einsatz von attributierten Grammatiken, wo der Code bereits beim Parsen
ausgeführt wird. Mehr Möglichkeiten hat man dagegen bei der Traversierung des AST, beispielsweise
mit dem Visitor-Pattern. (Register- und Stack-basierte Interpreter betrachten wir im Rahmen der
Veranstaltung aktuell nicht.)


{{< children showhidden="true" >}}
