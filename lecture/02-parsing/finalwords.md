---
title: "Grenze Lexer und Parser"
author: "Carsten Gips (HSBI)"
readings:
  - key: "Nystrom2021"
  - key: "Parr2014"
tldr: |
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
outcomes:
  - k2: "Grenze zwischen Lexer und Parser: Was mache ich auf welcher Stufe?"
youtube:
  - link: "https://youtu.be/`u9fE_I764rg`{=markdown}"
    name: "VL Grenze Lexer und Parser"
fhmedia:
  - link: "https://www.hsbi.de/medienportal/m/cb1486383c3bc9cf2e1c88b2dd94dea71954ceb2f6ea23dea512f10b3d86c34363b8d9c0ab41ef56fc07d9e3b22726752a92ff426592f129c6d6e674795f91cb"
    name: "VL Grenze Lexer und Parser"
---


## Grenze Lexer und Parser (Faustregeln)

::: notes
Der Lexer verwendet einfache reguläre Ausdrücke, während der Parser
mit Lookaheads unterschiedlicher Größe, Backtracking und umfangreicher
Error-Recovery arbeitet. Entsprechend sollte man alle Arbeit, die
man bereits im Lexer erledigen kann, auch dort erledigen. Oder
andersherum: Man sollte dem Parser nicht unnötige Arbeit aufbürden.

=> Erreiche in jeder Verarbeitungsstufe die maximal mögliche Abstraktionsstufe!
:::


1.  Matche und verwerfe im Lexer alles, was der Parser nicht braucht.

    ::: notes
    Wenn bestimmte Dinge später nicht gebraucht werden, sollten sie bereits
    im Lexer erkannt und aussortiert werden. Der Lexer arbeitet deutlich
    einfacher und schneller als der Parser ... Und je weniger Token der
    Parser betrachten muss, um so einfacher und schneller kann er werden.
    :::

\bigskip

2.  Matche gebräuchliche Token [(Namen, Schlüsselwörter, Strings, Zahlen)]{.notes} im Lexer.

    ::: notes
    Der Lexer hat deutlich weniger Overhead als der Parser. Es lohnt sich deshalb,
    beispielsweise Ziffern bereits im Lexer zu Zahlen zusammenzusetzen und dem
    Parser als entsprechendes Token zu präsentieren.
    :::

\bigskip

3.  Quetsche alle lexikalischen Strukturen, die der Parser nicht unterscheiden muss, in einen Token-Typ.

    ::: notes
    Wenn der Parser bestimmte Strukturen nicht unterscheiden muss, dann macht es
    wenig Sinn, dennoch unterschiedliche Token an den Parser zu senden.

    Beispiel:
    Wenn eine Anwendung nicht zwischen Integer- und Gleitkommazahlen unterscheidet,
    sollte der Lexer dafür nur einen Token-Typ erzeugen und an den Parser senden
    (etwa `NUMBER`).

    Beispiel:
    Wenn der Parser nicht den Inhalt eines XML-Tags "verstehen" muss, dann kann man
    diesen in ein einzelnes Token packen.
    :::

\bigskip

4.  Wenn der Parser Texteinheiten unterscheiden muss, erzeuge dafür eigene Token-Typen im Lexer.

    ::: notes
    Wenn der Parser etwa Elemente einer Telefonnummer verarbeiten muss, sollte
    der Lexer passende Token für die Teile der Telefonnummer erzeugen und an den
    Parser schicken.
    :::


## Diskussion: Parsen von Adressbüchern und Telefonnummern

::: notes
Typischer Aufbau eines Adressbuch-Eintrags:
:::

``` {size="footnotesize"}
Vorname Name: +49.571.8385-268
```

\pause
\bigskip

*   Zählen der Zeilen des Adressbuchs

    ::: notes
    Wenn es nur um das Zählen der Zeilen geht, muss der Parser nicht den
    Aufbau der Zeilen oder sogar den Aufbau von Telefonnummern verstehen.
    Es reichen einfache Lexer-Regeln (`ROW`), die quasi die Zeilenumbrüche
    repräsentieren. Der Rest (`OTHER`) wird per `skip` (ANTLR-Syntax)
    einfach entfernt ...
    :::

    ``` {.antlr size="scriptsize"}
    addrbk : ROW+;
    ROW    : '\n';
    OTHER  : ~'\n' -> skip ;
    ```

\pause

*   Liste aller Telefonnummern

    ::: notes
    Wenn man nun eine Liste aller Telefonnummern erzeugen will, wäre es ausreichend,
    die Struktur einer Zeile (und damit die Telefonnummern) mit Lexer-Regeln
    (und -Fragmenten) zu erkennen.
    :::

    ``` {.antlr size="scriptsize"}
    addrbk  : row+;
    row     : SURNAME NAME ':' TELNR;
    ```

\pause

*   Weitere Verarbeiten der Telefonnummern im Parser (Aktionen)

    ::: notes
    Wenn man zusätzlich die Telefonnummern noch weiter im Parser verarbeiten will
    (etwa durch eingebettete Aktionen), dann muss die Regel zum Erkennen der
    Adressen entsprechend eine Parser-Regel sein:
    :::

    ``` {.antlr size="scriptsize"}
    addrbk  : row+;
    row     : SURNAME NAME ':' telnr;
   ```

::: notes
Die weiterführenden Lexer- und Parser-Regeln (`telnr`, `TELNR`, `SURNAME`, `NAME`)
sind hier nicht dargestellt.
:::


## Wrap-Up

*   Grenze zw. Lexer und Parser ist gleitend
*   Ziel: möglichst hohe Abstraktion auf jeder Ebene erreichen
