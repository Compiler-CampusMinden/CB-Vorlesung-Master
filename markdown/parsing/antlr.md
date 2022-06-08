---
type: lecture-cg
title: "ANTLR (Parsergenerator)"
weight: 4
---


## ANTLR (Parsergenerator)

<!-- REM Vortragsthema string
-- Vortragsthema --
-->

<!-- ADD
- "altes Material" wieder einbauen
- soll mal eine 20 min Einheit werden
-->

<!-- ADD Content copied from old session "LL-Parser: Fortgeschrittene Techniken"

## Semantische Prädikate

Problem in Java: `enum` ab Java5 Schlüsselwort [(vorher als Identifier-Name verwendbar)]{.notes}

```yacc
prog : (enumDecl | stat)+ ;
stat : ... ;

enumDecl : ENUM id '{' id (',' id)* '}' ;
```

::: notes
Wie kann ich eine Grammatik bauen, die sowohl für Java5 und später als auch für die Vorgänger
von Java5 funktioniert?

Angenommen, man hätte eine Hilfsfunktion ("Prädikat"), mit denen man aus dem Kontext heraus
die Unterscheidung treffen kann, dann würde die Umsetzung der Regel ungefähr so aussehen:
:::

\bigskip
\pause

```python
def prog():
    if lookahead(1) == ENUM and java5: enumDecl()
    else: stat()
```


## Semantische Prädikate in ANTLR

::: notes
### Semantische Prädikate in Parser-Regeln
:::

```yacc
@parser::members {public static boolean java5;}

prog : ({java5}? enumDecl | stat)+ ;
stat : ... ;

enumDecl : ENUM id '{' id (',' id)* '}' ;
```

::: notes
Prädikate in Parser-Regeln aktivieren bzw. deaktivieren alles, was nach der Abfrage
des Prädikats gematcht werden könnte.

### Semantische Prädikate in Lexer-Regeln

Alternativ für Lexer-Regeln:
:::

```yacc
ENUM : 'enum' {java5}? ;
ID   : [a-zA-Z]+ ;
```

::: notes
Bei Token kommt das Prädikat erst am rechten Ende einer Lexer-Regel vor, da der Lexer keine
Vorhersage macht, sondern nach dem längsten Match sucht und die Entscheidung erst trifft,
wenn das ganze Token gesehen wurde. Bei Parser-Regeln steht das Prädikat links vor der
entsprechenden Alternative, da der Parser mit Hilfe des Lookaheads Vorhersagen trifft, welche
Regel/Alternative zutrifft.

*Anmerkung*: Hier wurden nur Variablen eingesetzt, es können aber auch Methoden/Funktionen
genutzt werden. In Verbindung mit einer Symboltabelle (["Symboltabellen"](cb_symboltabellen1.html))
und/oder mit Attributen und Aktionen in der Grammatik (["Attribute"](cb_attribute.html) und
["Interpreter: Attribute+Aktionen"](cb_interpreter2.html)) hat man hier ein mächtiges Hilfswerkzeug!
:::
-->

<!-- ADD
## Wrap-Up

TODO

<!-- DO NOT REMOVE - THIS IS A LAST SLIDE TO INDICATE THE LICENSE AND POSSIBLE EXCEPTIONS (IMAGES, ...). ->
::: slides
## LICENSE
![](https://licensebuttons.net/l/by-sa/4.0/88x31.png)

Unless otherwise noted, this work is licensed under CC BY-SA 4.0.
:::
-->
