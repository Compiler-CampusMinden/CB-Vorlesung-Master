---
archetype: lecture-cg
title: "Lexer mit ANTLR generieren"
author: "Carsten Gips (HSBI)"
readings:
  - key: "@Parr2014"
tldr: |
    ANTLR ist ein Parser-Generator, der aus einer Grammatik einen Parser in verschiedenen
    Zielsprachen (Java, Python, C++, ...) generieren kann.

    In der ANTLR-Grammatik werden die Parser-Regeln klein geschrieben, die Lexer-Regeln werden
    mit **Großbuchstaben** geschrieben. Jede Lexer-Regel liefert ein Token zurück, dabei
    ist der Tokenname die linke Seite der Regel. Wie bei Flex gewinnt der längste Match,
    und bei Gleichstand (mehrere längste Regeln matchen) gewinnt die zuerst definierte Regel.

    Die Lexer-Regeln können mit Aktionen annotiert werden, die beim Matchen der jeweiligen Regel
    abgearbeitet werden. Diese Aktionen müssen in der Zielprogrammiersprache formuliert werden,
    da sie in die generierte Lexerklasse in die jeweiligen Methoden eingebettet werden.

    ANTLR kennt Lexer-Kommandos wie `skip` (entferne das aktuelle Zeichen), `more` (lese mehr
    Input, um ein Token zu generieren) und andere. Mit "Fragmenten" kann man Hilfsregeln definieren,
    die keine Token darstellen.

    ANTLR kennt "Modes", mit denen man zustandsbehaftete Lexer erzeugen kann. Dies ist nützlich
    für "Insel-Grammatiken", etwa für das Bearbeiten von XML oder HTML. Zusätzlich gibt es "Channels"
    zum Vorsortieren von Tokens in verschiedene parallele Tokenstreams.
outcomes:
  - k3: "Lexer-Regeln in ANTLR formulieren und einsetzen"
  - k2: "Verhalten des Lexers: längste Matches, Reihenfolge"
  - k3: "Nutzung von Lexer-Aktionen"
  - k3: "Einsatz von Fragmenten"
  - k3: "Nutzung von Lexer-Kommandos"
  - k3: "Zustandsbehaftete Lexer (Modes)"
  - k3: "Nutzung von Channels"
  - k2: "Importieren von Grammatiken"
assignments:
  - topic: sheet01
youtube:
  - link: "https://youtu.be/I119N04WIYA"
    name: "VL Lexer mit ANTLR"
  - link: "https://youtu.be/pbjGThqVLkU"
    name: "Demo ANTLR Basics"
  - link: "https://youtu.be/vnJIm6S-898"
    name: "Demo Verhalten Lexer-Regeln"
  - link: "https://youtu.be/bNpgqctiQM8"
    name: "Demo Lexer-Regeln mit Aktionen"
fhmedia:
  - link: "https://www.hsbi.de/medienportal/m/10e0ed907bb767e8304c0cf197293588f9497a217e0dee792c458887ec73299a415da96fd2ea12e0f054ba478772239ec2581db5cedadb3aba14203c590493d1"
    name: "VL Lexer mit ANTLR"
challenges: |
    **Token und Lexer-Regeln mit ANTLR**

    Formulieren Sie für ANTLR Lexer-Regeln, mit denen folgende Token erkannt werden:

    *   White-Space: Leerzeichen, Tabs, Zeilenumbrüche
    *   Vergleichsoperatoren: `<`, `>`, `<=`, `>=`, `==`, `<>`
    *   If: `if`
    *   Then: `then`
    *   Else: `else`
    *   Namen: Ein Buchstabe, gefolgt von beliebig vielen weiteren Buchstaben und/oder Ziffern
    *   Numerische Konstanten: Mindestens eine Ziffer, gefolgt von maximal einem Paar bestehend aus einem Punkt und mindestens einer Ziffer, gefolgt von maximal einem Paar bestehend aus dem Buchstaben "E" gefolgt von einem "+" oder "-" und mindestens einer Ziffer.

    Formulieren Sie Hilfskonstrukte zur Verwendung in mehreren Lexer-Regeln als ANTLR-Fragmente.

    White-Spaces sollen entfernt werden und nicht als Token weitergereicht werden.


    **Real-World-Lexer mit ANTLR: Programmiersprache Lox**

    Betrachten Sie folgenden Code-Schnipsel in der Sprache ["Lox"](https://www.craftinginterpreters.com/the-lox-language.html):

    ```
    fun fib(x) {
        if (x == 0) {
            return 0;
        } else {
            if (x == 1) {
                return 1;
            } else {
                fib(x - 1) + fib(x - 2);
            }
        }
    }

    var wuppie = fib(4);
    ```

    Erstellen Sie für diese fiktive Sprache einen Lexer mit ANTLR. Die genauere Sprachdefinition finden Sie unter [craftinginterpreters.com/the-lox-language.html](https://www.craftinginterpreters.com/the-lox-language.html).


    **Pig-Latin mit ANTLR-Lexer**

    Schreiben Sie eine Lexer-Grammatik mit eingebetteten Aktionen für ANTLR sowie ein passendes Programm zur Einbindung des generierten Lexers, welches einen Text nach [Pig Latin](https://de.wikipedia.org/wiki/Pig_Latin) übersetzt:

    *   Ist der erste Buchstabe eines Wortes ein Konsonant, schiebe ihn ans Ende des Wortes und füge "ay" an.
    *   Ist der erste Buchstabe eines Wortes ein Vokal, hänge an das Wort ein "ay" an.


    **Lexing mit ANTLR**

    In einem Telefonbuch sind zeilenweise Namen und Telefonnummern gespeichert.

    Definieren Sie eine Lexer-Grammatik für ANTLR, mit der Sie die Zeilen einlesen können. Können Sie dabei verschiedene Formate der Telefonnummern berücksichtigen?

    ```
    Heinz 030 5346 983
    Kalle +49 30 1234 567
    Lina +49.571.8385-255
    Rosi (0571) 8385-268
    ```

    Können Sie die Grammatik so anpassen, dass Sie nur möglichst wenige verschiedene Token an den Parser weitergeben?

    Ergänzen Sie Ihre Grammatik um Lexer-Aktionen, so dass Sie die Zeilen, die Zeichen (in den Namen) und die Ziffern (in den Telefonnummern) zählen können.
---


## Hello World

```antlr
grammar Hello;

start       : 'hello' GREETING ;

GREETING    : [a-zA-Z]+ ;
WHITESPACE  : [ \t\n]+ -> skip ;
```

[Konsole: Hello (Classpath, Aliase, grun, Main, Dateien, Ausgabe)]{.bsp href="https://github.com/Compiler-CampusMinden/CB-Vorlesung-Master/blob/master/lecture/frontend/lexing/src/Hello.g4"}


::::::::: notes
### Hinweis zur Grammatik (Regeln)

*   `start` ist eine [Parser-Regel]{.alert}
    => Eine Parser-Regel pro Grammatik wird benötigt, damit man den generierten
    Parser am Ende auch starten kann ...
*   Die anderen beiden Regeln (mit großem Anfangsbuchstaben) aus der obigen Grammatik
    zählen zum Lexer

### ANTLR einrichten

*   Aktuelle Version herunterladen: [antlr.org](https://www.antlr.org/download.html),
    für Java als Zielsprache: ["Complete ANTLR 4.x Java binaries jar"](https://www.antlr.org/download/antlr-4.11.1-complete.jar)
*   CLASSPATH setzen: `export CLASSPATH=".:/<pathToJar>/antlr-4.11.1-complete.jar:$CLASSPATH"`
*   Aliase einrichten (`.bashrc`):
    *   `alias antlr='java org.antlr.v4.Tool'`
    *   `alias grun='java org.antlr.v4.gui.TestRig'`
*   Alternativ über den Python-Installer: `pip install antlr4-tools`
*   Im Web ohne lokale Installation: [ANTLR Lab](http://lab.antlr.org/)

(vgl. [github.com/antlr/antlr4/blob/master/doc/getting-started.md](https://github.com/antlr/antlr4/blob/master/doc/getting-started.md))

### "Hello World" übersetzen und ausführen

1.  Grammatik übersetzen und Code generieren: `antlr Hello.g4`
2.  Java-Code kompilieren: `javac *.java`
3.  Lexer ausführen:
    *   `grun Hello start -tokens` (Grammatik "Hello", Startregel "start")
    *   Alternativ mit kleinem Java-Programm:
        ```java
        import org.antlr.v4.runtime.*;

        public class Main {
            public static void main(String[] args) throws Exception {
                Lexer l = new HelloLexer(CharStreams.fromStream(System.in));
                Token t = l.nextToken();
                while (t.getType() != Token.EOF) {
                    System.out.println(t);
                    t = l.nextToken();
                }
            }
        }
        ```

### Generierte Dateien und Klassen

Nach dem Übersetzen finden sich folgende Dateien und Klassen vor:

```
.
├── bin
│   ├── HelloBaseListener.class
│   ├── HelloBaseVisitor.class
│   ├── HelloLexer.class
│   ├── HelloListener.class
│   ├── HelloParser.class
│   ├── HelloParser$RContext.class
│   ├── HelloVisitor.class
│   └── Main.class
├── Hello.g4
└── src
    ├── HelloBaseListener.java
    ├── HelloBaseVisitor.java
    ├── HelloLexer.java
    ├── HelloLexer.tokens
    ├── HelloListener.java
    ├── HelloParser.java
    ├── Hello.tokens
    ├── HelloVisitor.java
    └── Main.java
```

_Anmerkung_: Die Ordnerstruktur wurde durch ein ANTLR-Plugin für Eclipse
erzeugt. Bei Ausführung in der Konsole liegen alle Dateien in einem Ordner.

_Anmerkung_: Per Default werden nur die Listener angelegt, für die Visitoren
muss eine extra Option mitgegeben werden.

Die Dateien `Hello.tokens` und `HelloLexer.tokens` enthalten die Token samt
einer internen Nummer. (Der Inhalt beider Dateien ist identisch.)

Die Datei `HelloLexer.java` enthält den generierten Lexer, der eine
Spezialisierung der abstrakten Basisklasse `Lexer` darstellt. Über den
Konstruktor wird der zu scannende `CharStream` gesetzt. Über die Methode
`Lexer#nextToken()` kann man sich die erkannten Token der Reihe nach
zurückgeben lassen. (Diese Methode wird letztlich vom Parser benutzt.)

Die restlichen Dateien werden für den Parser und verschiedene Arten der
Traversierung des AST generiert (vgl.
`["AST-basierte Interpreter"]({{<ref "/backend/interpretation/astdriven-part1" >}})`{=markdown}).

### Bedeutung der Ausgabe

Wenn man dem Hello-Lexer die Eingabe

```
hello world
<EOF>
```

(das `<EOF>` wird durch die Tastenkombination `STRG-D` erreicht) gibt, dann
lautet die Ausgabe

```
$ grun Hello start -tokens
hello world
<EOF>
[@0,0:4='hello',<'hello'>,1:0]
[@1,6:10='world',<GREETING>,1:6]
[@2,12:11='<EOF>',<EOF>,2:0]
```

Die erkannten Token werden jeweils auf einer eigenen Zeile ausgegeben.

*   `@0`: Das erste Token (fortlaufend nummeriert, beginnend mit 0)
*   `0:4`: Das Token umfasst die Zeichen 0 bis 4 im Eingabestrom
*   `='hello'`: Das gefundene Lexem (Wert des Tokens)
*   `<'hello'>`: Das Token (Name/Typ des Tokens)
*   `1:0`: Das Token wurde in Zeile 1 gefunden (Start der Nummerierung mit
    Zeile 1), und startet in dieser Zeile an Position 0

Entsprechend bekommt man mit

```
$ grun Hello start -tokens
hello
  world

<EOF>
[@0,0:4='hello',<'hello'>,1:0]
[@1,8:12='world',<GREETING>,2:2]
[@2,15:14='<EOF>',<EOF>,4:0]
```

### ANTLR-Grammatik für die Lexer-Generierung

*   Start der Grammatik mit dem Namen "`XYZ`" mit

    ```
    grammar XYZ;
    ```

    oder (nur Lexer)

    ```
    lexer grammar XYZ;
    ```

*   Token und Lexer-Regeln starten mit _großen Anfangsbuchstaben_
    (Ausblick: Parser-Regeln starten mit kleinen Anfangsbuchstaben)

    Format: `TokenName : Alternative1 | ... | AlternativeN ;`

    Rekursive Lexer-Regeln sind erlaubt. **Achtung**: Es dürfen keine
    _links-rekursiven_ Regeln genutzt werden, etwa wie `ID : ID '*' ID ;` ...
    (Eine genauere Definition und die Transformation in nicht-linksrekursive
    Regeln siehe `["LL-Parser"]({{<ref "/frontend/parsing/ll-parser-theory" >}})`{=markdown}).

*   Alle Literale werden in _einfache_ Anführungszeichen eingeschlossen
    (es erfolgt keine Unterscheidung zwischen einzelnen Zeichen und Strings
    wie in anderen Sprachen)

*   Zeichenmengen: `[a-z\n]` umfasst alle Zeichen von `'a'` bis `'z'` sowie
    `'\n'`

    `'a'..'z'` ist identisch zu `[a-z]`

*   Schlüsselwörter: Die folgenden Strings stellen reservierte Schlüsselwörter
    dar und dürfen nicht als Token, Regel oder Label genutzt werden:

    ```
    import, fragment, lexer, parser, grammar, returns, locals, throws, catch, finally, mode, options, tokens
    ```

    _Anmerkung_: `rule` ist zwar kein Schlüsselwort, wird aber als Methodenname
    bei der Codegenerierung verwendet. => Wie ein Schlüsselwort behandeln!

(vgl. [github.com/antlr/antlr4/blob/master/doc/lexicon.md](https://github.com/antlr/antlr4/blob/master/doc/lexicon.md))


### Greedy und Non-greedy Lexer-Regeln

Die regulären Ausdrücke `(...)?`, `(...)*` und `(...)+` sind _greedy_ und
versuchen soviel Input wie möglich zu matchen.

Falls dies nicht sinnvoll sein sollte, kann man mit einem weiteren `?` das
Verhalten auf _non-greedy_ umschalten. Allerdings können non-greedy Regeln
das Verhalten des Lexers u.U. schwer vorhersehbar machen!

Die Empfehlung ist, non-greedy Lexer-Regeln nur sparsam einzusetzen
(vgl. [github.com/antlr/antlr4/blob/master/doc/wildcard.md](https://github.com/antlr/antlr4/blob/master/doc/wildcard.md)).
:::::::::


## Verhalten des Lexers: 1. Längster Match

Primäres Ziel: Erkennen der längsten Zeichenkette

```antlr
CHARS   : [a-z]+ ;
DIGITS  : [0-9]+ ;
FOO     : [a-z]+ [0-9]+ ;
```

::: notes
Die Regel, die den längsten Match für die aktuelle Eingabesequenz produziert,
"gewinnt".

Im Beispiel würde  ein "foo42" als `FOO` erkannt und nicht als `CHARS DIGITS`.
:::


## Verhalten des Lexers: 2. Reihenfolge

Reihenfolge in Grammatik definiert Priorität

```antlr
FOO     : 'f' .*? 'r' ;
BAR     : 'foo' .*? 'bar' ;
```

::: notes
Falls mehr als eine Lexer-Regel die selbe Inputsequenz matcht, dann
hat die in der Grammatik zuerst genannte Regel Priorität.

Im Beispiel würden für die Eingabe "foo42bar" beide Regeln den selben längsten
Match liefern - die Regel `FOO` ist in der Grammatik früher definiert und
"gewinnt".
:::


## Verhalten des Lexers: 3. Non-greedy Regeln

Non-greedy Regeln versuchen _so wenig_ Zeichen wie möglich zu matchen

```antlr
FOO     : 'foo' .*? 'bar' ;
BAR     : 'bar' ;
```

::: notes
Hier würde ein "foo42barbar" zu `FOO` gefolgt von `BAR` erkannt werden.
:::

\pause
\bigskip
\bigskip

[Achtung]{.alert}: Nach [dem Abarbeiten]{.notes} einer non-greedy Sub-Regel [in einer Lexer-Regel]{.notes}
gilt "_first match wins_"

`.*? ('4' | '42')`

=> [Der Teil]{.notes} `'42'` [auf der rechten Seite]{.notes} ist
"toter Code" (wegen der non-greedy Sub-Regel `.*?`)!

::: notes
Die Eingabe "x4" würde korrekt erkannt, währende "x42" nur als "x4" erkannt wird und für
die verbleibende "2" würde ein _token recognition error_ geworfen.
:::

::: notes
(vgl. [github.com/antlr/antlr4/blob/master/doc/wildcard.md](https://github.com/antlr/antlr4/blob/master/doc/wildcard.md))
:::


## Attribute und Aktionen

```antlr
grammar Demo;

@header {
import java.util.*;
}

@members {
String s = "";
}

start   : TYPE ID '=' INT ';' ;

TYPE    : ('int' | 'float') {s = getText();} ;
INT     : [0-9]+            {System.out.println(s+":"+Integer.valueOf(getText()));};
ID      : [a-z]+            {setText(String.valueOf(getText().charAt(0)));} ;
WS      : [ \t\n]+ -> skip ;
```

::: notes
### Attribute bei Token (Auswahl)

Token haben Attribute, die man abfragen kann. Dies umfasst u.a. folgende Felder:

*   `text`: Das gefundene Lexem als String
*   `type`: Der Token-Typ als Integer
*   `index`: Das wievielte Token (als Integer)

(vgl. [github.com/antlr/antlr4/blob/master/doc/actions.md](https://github.com/antlr/antlr4/blob/master/doc/actions.md))

Zur Auswertung in den Lexer-Regeln muss man anders vorgehen als in
Parser-Regeln: Nach der Erstellung eines Tokens kann man die zum Attribut
gehörenden `getX()` und `setX()`-Methoden aufrufen, um die Werte abzufragen
oder zu ändern.

Dies passiert im obigen Beispiel für das Attribut `text`: Abfrage mit
`getText()`, Ändern/Setzen mit `setText()`.

Die Methodenaufrufe wirken sich immer auf das gerade erstellte Token aus.

_Achtung_: Bei Aktionen in Parser-Regeln gelten andere Spielregeln!

### Aktionen mit den Lexer-Regeln

Aktionen für Lexer-Regeln sind Code-Blöcke in der Zielsprache, eingeschlossen
in geschweifte Klammern. Die Code-Blöcke werden direkt in die generierten
Lexer-Methoden kopiert.

Zusätzlich:

*   `@header`: Package-Deklarationen und/oder Importe (wird vor der
    Klassendefinition eingefügt)
*   `@members`: zusätzliche Attribute für die generierten Lexer- (und
    Parser-) Klassen.

Mit `@lexer::header` bzw. `@lexer::members` werden diese Codeblöcke nur in den
generierten Lexer eingefügt.

_Anmerkung_: Lexer-Aktionen müssen am Ende der äußersten Alternative erscheinen.
Wenn eine Lexer-Regel mehr als eine Alternative hat, müssen diese in runde
Klammern eingeschlossen werden.

(vgl. [github.com/antlr/antlr4/blob/master/doc/grammars.md](https://github.com/antlr/antlr4/blob/master/doc/grammars.md))
:::


## Hilfsregeln mit Fragmenten

::: notes
Fragmente sind Lexer-Regeln, die keine Token darstellen/erzeugen, aber
bei der Formulierung von Regeln für mehr Übersicht oder Wiederverwendung
sorgen. Fragmente werden mit dem Schlüsselwort `fragment` eingeleitet.

**Beispiel**:
:::

```antlr
NUM         : DIGIT+ ;

fragment
DIGIT       : [0-9] ;
```

\bigskip

=> Keine Token (für den Parser)!

::: notes
Hier würde der Parser nur `NUM` "bekommen", aber keine `DIGIT`-Token.
:::


## Lexer Kommandos (Auswahl)

```antlr
TokenName : Alternative -> command-name
```

*   `skip`

    ::: notes
    Verwerfe den aktuellen Text: `WS : [ \t]+ -> skip ;`
    (liefert kein Token)
    :::

*   `more`

    ::: notes
    Lese weiter ...

    Die Regel matcht zwar, aber es wird kein Token erzeugt. Die nächste
    matchende Regel wird den hier gematchten Text mit in ihr Token einbauen.
    Der Token-Typ ist der der zuletzt matchenden Regel.

    _Anmerkung_: Wird typischerweise zusammen mit Modes verwendet.
    :::

*   `mode` [(siehe unten)]{.notes}

*   `channel` [(siehe unten)]{.notes}

::: notes
(vgl. [github.com/antlr/antlr4/blob/master/doc/lexer-rules.md](https://github.com/antlr/antlr4/blob/master/doc/lexer-rules.md))
:::


## Modes und Insel-Grammatiken

::: notes
Umschalten zwischen verschiedenen Lexer-Modes: Wie verschiedene Sub-Lexer -
einen für jeden Kontext.

=> Parsen von "_Insel-Grammatiken_" (beispielsweise XML).

_Anmerkung_: `mode`-Spezifikation sind nur im Lexer-Teil der Grammatik erlaubt.

### Allgemeines Schema

```
rules in default mode
...

mode MODE_1;
rules in MODE_1
...

mode MODE_N;
rules in MODE_N
...
```

### Beispiel
:::

```antlr
lexer grammar ModeLexer;

LCOMMENT    : '/*' -> more, mode(CMNT) ;
WS          : [ \t\n]+ -> skip ;

mode CMNT;
COMMENT     : '*/' -> mode(DEFAULT_MODE) ;
CHAR        : . -> more ;
```

::: notes
Nach dem Matchen des Tokens wird mit `mode(X)` in den Mode `X` umgeschaltet.
Der Lexer beachtet dann nur die Lexer-Regeln unter Mode `X`.

Mit `pushMode(X)` erreicht man das selbe Verhalten wie mit `mode(X)`,
allerdings wird vor dem Umschalten der aktuelle Mode auf einem Stack abgelegt.
Mit `popMode` kann der oberste Mode vom Stack wieder herunter genommen werden
und als aktueller Lexer-Mode gesetzt werden.

(vgl. [github.com/antlr/antlr4/blob/master/doc/lexer-rules.md](https://github.com/antlr/antlr4/blob/master/doc/lexer-rules.md))
:::


## Channels

::: notes
Man kann die Token in verschiedene Kanäle ("Channels") schicken. Beispielsweise
werden beim Parsen von Python-Programmen die White-Spaces evtl. noch benötigt.

Anstatt diese mit `skip` komplett zu verwerfen, kann man sie in einen anderen
Channel schicken, wo man sie im Parser bei Bedarf wieder abfragen kann. Der
Token-Index bleibt dabei erhalten, auch wenn die Token in verschiedene Kanäle
verteilt werden.

**Anmerkung**: Channel-Spezifikationen sind nur im Lexer-Teil der Grammatik
erlaubt.
:::

```antlr
channels { WHITESPACE, COMMENTS }

BLOCK_COMMENT : '/*' .*? '*/' -> channel(COMMENTS) ;
LINE_COMMENT  : '//' ~[\n]*   -> channel(COMMENTS) ;
WS            : [ \t\n]+      -> channel(WHITESPACE) ;
```


::: notes
## Grammatiken importieren

Mit `import XZY;` bindet man eine andere Grammatik `XYZ` ein. Dabei werden nur
Regeln eingebunden, die bisher noch nicht definiert wurden.

Aus einer anderen Perspektive kann man diesen Mechanismus mit dem Überschreiben
von Methoden in einer abgeleiteten Klasse vergleichen: Dann bekommt man beim
Aufruf einer überschriebenen Methode ebenfalls nur die "neueste"
Implementierung ...

Wenn mehrere verschachtelte Grammatiken eingebunden werden (wie im Beispiel),
dann wird per _Tiefensuche_ der Einbindungsbaum durchlaufen.

(vgl. [github.com/antlr/antlr4/blob/master/doc/grammars.md](https://github.com/antlr/antlr4/blob/master/doc/grammars.md#grammar-imports))
:::


## Wrap-Up

Lexer mit ANTLR generieren: Lexer-Regeln werden mit **Großbuchstaben** geschrieben

\bigskip

*   Längster Match gewinnt, Gleichstand: zuerst definierte Regel
*   _non greedy_-Regeln: versuche so _wenig_ Zeichen zu matchen wie möglich
*   Aktionen beim Matchen
*   Hilfsregeln mit "Fragments"
*   Lexer Kommandos: `skip`, `more`, ...
*   Modes für Insel-Grammatiken
*   Channels als parallele Tokenstreams (Vorsortieren)
*   Teilgrammatiken importieren







<!-- DO NOT REMOVE - THIS IS A LAST SLIDE TO INDICATE THE LICENSE AND POSSIBLE EXCEPTIONS (IMAGES, ...). -->
::: slides
## LICENSE
![](https://licensebuttons.net/l/by-sa/4.0/88x31.png)

Unless otherwise noted, this work is licensed under CC BY-SA 4.0.
:::
