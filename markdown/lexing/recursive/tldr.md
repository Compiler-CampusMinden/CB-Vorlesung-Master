---
title: "TL;DR"
disableToc: true
hidden: true
---


![](images/architektur_cb_lexer.png)

Der Lexer (auch "Scanner") soll den Zeichenstrom in eine Folge von Token zerlegen. Zur
Spezifikation der Token werden reguläre Ausdrücke verwendet.

Von Hand implementierte Lexer arbeiten üblicherweise rekursiv und verarbeiten immer
das nächste Zeichen im Eingabestrom. Die Arbeitsweise erinnert an LL-Parser (vgl.
["LL-Parser"]({{<ref "/parsing/ll-parser" >}})).

Lexer müssen sehr effizient sein, da sie noch direkt auf der niedrigsten Abstraktionsstufe
arbeiten und u.U. oft durchlaufen werden. Deshalb setzt man hier gern spezielle Techniken
wie Puffern von Zeichen über einen Doppel-Puffer ein.

Die Palette an Fehlerbehandlungsstrategien im Lexer reichen von "aufgeben" über den "Panic
Mode" ("gobbeln" von Zeichen, bis wieder eines passt) und Ein-Schritt-Transformationen bis
hin zu speziellen Lexer-Regeln, die beispielsweise besonders häufige Typos abfangen.
