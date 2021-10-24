---
title: "TL;DR"
disableToc: true
hidden: true
---


Die Grenze zwischen Lexer und Parser ist gleitend. Das Ziel jeder Verarbeitungsstufe in der
Compilerpipeline sollte es sein, eine möglichst hohe Abstraktion auf der jeweiligen Ebene
zu erreichen.


Das führt zu einfachen Grundregeln:

-   Verwerfe im Lexer alles, was ich später nicht mehr benötige
-   Fasse so viel wie möglich zusammen:
    -   Dinge, die der Parser unterscheiden können muss, sollten vom Lexer als unterschiedliche
        Token erkannt werden
    -   Dinge, die der Parser nicht unterscheiden muss, könnten in einen gemeinsamen Token-Typ
        geschrieben werden
    -   Fasse nach Möglichkeit passende Zeichenfolgen als ein Token zusammen, d.h. präsentiere
        dem Parser nicht eine Folge von Ziffern-Token, sondern *ein* Number-Token (wenn im
        Zeichenstrom eine Integerzahl kommt)
