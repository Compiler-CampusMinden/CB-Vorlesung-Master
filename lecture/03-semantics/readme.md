# Semantische Analyse

Auf die lexikalische Analyse und die Syntaxanalyse folgt die semantische
Analyse. Nach dem Parsen steht fest, dass ein Programm syntaktisch
korrekt ist. Nun muss geprüft werden, ob es auch semantisch korrekt ist.
Dazu gehören u.a. die Identifikation und Sammlung von Bezeichnern und
die Zuordnung zur richtigen Ebene (Scopes) sowie die die Typ-Prüfung und
-Inferenz.

In dieser Phase zeigen sich die Eigenschaften der zu verarbeitenden
Sprache sehr deutlich, beispielsweise müssen Bezeichner deklariert sein
vor der ersten Benutzung, welche Art von Scopes soll es geben, gibt es
Klassen und Vererbung …

Da hier der Kontext der Symbole eine Rolle spielt, wird diese Phase oft
auch “Context Handling” oder “Kontext Analyse” bezeichnet. Neben
attributierten Grammatiken sind die Symboltabellen wichtige Werkzeuge.

------------------------------------------------------------------------

<img src="https://licensebuttons.net/l/by-sa/4.0/88x31.png" width="10%">

Unless otherwise noted, this work is licensed under CC BY-SA 4.0.

<blockquote><p><sup><sub><strong>Last modified:</strong> 1c01cef (markdown: switch to leaner yaml header (#253), 2025-08-09)<br></sub></sup></p></blockquote>
