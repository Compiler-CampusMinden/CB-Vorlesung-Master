---
title: "Interpreter"
---


Ein Interpreter erzeugt keinen Code, sondern führt Source-Code (interaktiv) aus. Die einfachste
Möglichkeit ist der Einsatz von attributierten Grammatiken, wo der Code bereits beim Parsen
ausgeführt wird ("syntaxgesteuerte Interpretation"). Mehr Möglichkeiten hat man dagegen bei der
Traversierung des AST, beispielsweise mit dem Visitor-Pattern. Auch die Abarbeitung von Bytecode
in einer Virtuellen Maschine (VM) zählt zur Interpretation.

(Register- und Stack-basierte Interpreter betrachten wir im Rahmen der Veranstaltung aktuell nicht.)


`{{< children showhidden="true" >}}`{=markdown}







<!-- DO NOT REMOVE - THIS IS A LAST SLIDE TO INDICATE THE LICENSE AND POSSIBLE EXCEPTIONS (IMAGES, ...). -->
::: slides
## LICENSE
![](https://licensebuttons.net/l/by-sa/4.0/88x31.png)

Unless otherwise noted, this work is licensed under CC BY-SA 4.0.
:::
