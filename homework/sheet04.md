---
archetype: assignment
title: "Blatt 04: Semantische Analyse"
author: "Carsten Gips, BC George (HSBI)"

hidden: true
---

<!--  pandoc -s -f markdown -t markdown+smart-grid_tables-multiline_tables-simple_tables --columns=94 sheet04.md -o xxx.md  -->

## Zusammenfassung

Ziel dieses Aufgabenblattes ist die Erstellung einer Symboltabelle und eines einfachen
Type-Checkers für eine fiktive statisch typisierte Sprache mit Expressions, Kontrollstrukturen
und Funktionen.

## Methodik

Definieren Sie zunächst eine passende kontextfreie Grammatik und erstellen Sie mit ANTLR
wieder einen Lexer und Parser. Definieren Sie einen AST und konvertieren Sie Ihren Parse-Tree
in einen AST.

Es ist empfehlenswert, den Type-Checker zweistufig zu realisieren:

1.  Aufbauen der Symboltabelle und Prüfung von Deklaration vs. Definition vs. Benutzung
2.  Prüfen der verwendeten Typen

## Sprachdefinition

Ein Programm besteht aus einer oder mehreren Anweisungen (*Statements*).

### Anweisungen (*Statements*)

Eine Anweisung ist eine Befehlsfolge, beispielsweise eine Deklaration (Funktionen), Definition
(Variablen, Funktionen), Zuweisung, ein Funktionsaufruf oder eine Operation. Sie muss immer
mit einem Semikolon abgeschlossen werden. Eine Anweisung hat keinen Wert.

``` python
int a;           # Definition der Integer-Variablen a
int b = 10 - 5;  # Definition der Integer-Variablen b und Zuweisung des Ausdruckes 10-5 (Integer-Wert 5)
c = "foo";       # Zuweisung des Ausdrucks "foo" (String) an die Variable c
bool foo();      # Deklaration der Funktion foo
func1(a, c);     # Funktionsaufruf mit Variablen a und c
```

Kontrollstrukturen zählen ebenfalls als Anweisung.

### Blöcke

Code-Blöcke werden in geschweifte Klammern eingeschlossen und enthalten ein oder mehrere
Anweisungen. Jeder Code-Block ist ein eigener Scope - alle Deklarationen/Definition in diesem
Scope sind im äußeren Scope nicht sichtbar. Im Scope kann auf die Symbole des umgebenden
Scopes zugegriffen werden. Symbole in einem Scope können gleichnamige Symbole im äußeren Scope
verdecken.

``` python
# globaler Scope
int a = 7;
int d;
{   # erster innerer Scope
    int b = 7;      # b ist nur in diesem und im zweiten inneren Scope sichtbar
    foo(a);         # Funktionsaufruf mit der Variable a aus dem äußeren Scope (Wert 7)
    int a = 42;     # Variable verdeckt das a aus dem äußeren Scope
    foo(a);         # Funktionsaufruf mit der Variable a aus dem aktuellen Scope (Wert 42)
    {   # zweiter innerer Scope
        int c = 9;  # dieses c ist nur hier sichtbar
        foo(d);     # d wird im äußeren Scope gesucht, dort nicht gefunden und im nächsthöheren Scope gesucht (rekursiv)
    }
}
{   # dritter innerer Scope
    int b;          # dieses b hat mit dem b aus dem ersten inneren Scope nichts zu tun
    foo(a);         # Funktionsaufruf mit der Variable a aus dem äußeren Scope (Wert 7)
}
```

### Ausdrücke (*Expressions*)

Die einfachsten Ausdrücke sind Integer- oder String-Literale oder die Wahrheitswerte.
Variablen und Funktionsaufrufe sind ebenfalls Ausdrücke. Komplexere Ausdrücke werden mit Hilfe
von Operationen gebildet, dabei sind die Operanden jeweils auch wieder Ausdrücke.

Ein Ausdruck hat immer einen Wert und einen Typ.

Die Operatoren besitzen eine Rangfolge, um verschachtelte Operationen aufzulösen. Sie dürfen
daher nicht einfach von links nach rechts aufgelöst werden. Die Rangfolge der Operatoren
entspricht der üblichen Semantik (vgl. Java, C, Python).

Es gibt in unserer Sprache folgende Operationen mit der üblichen Semantik:

#### Vergleichsoperatoren

| Operation    | Operator |
|:-------------|:--------:|
| Gleichheit   |   `==`   |
| Ungleichheit |   `!=`   |
| Größer       |   `>`    |
| Kleiner      |   `<`    |

#### Arithmetische Operatoren

| Operation                            | Operator |
|:-------------------------------------|:--------:|
| Addition / String-Literal-Verkettung |   `+`    |
| Subtraktion                          |   `-`    |
| Multiplikation                       |   `*`    |
| Division                             |   `/`    |

#### Beispiele für Ausdrücke

``` python
10 - 5       # Der Integer-Wert 5
"foo"        # Der String "foo"
a            # Wert der Variablen a
a + b        # Ergebnis der Addition der Variablen a und b
func1(a, b)  # Ergebnis des Funktionsaufrufs
```

Ausdrücke werden nicht mit einem Semikolon abgeschlossen.

### Bezeichner

Werden zur Bezeichnung von Variablen und Funktionsnamen verwendet. Sie bestehen aus einer
Zeichenkette der Zeichen `a-z`,`A-Z`, `0-9`, `_`. Bezeichner dürfen nicht mit einer Ziffer
`0-9` beginnen.

### Variablen

Variablen bestehen aus einem eindeutigen Bezeichner (Variablennamen). Den Variablen können
Werte zugewiesen werden und Variablen können als Werte verwendet werden. Die Zuweisung erfolgt
mithilfe des `=`-Operators. Auf der rechten Seite der Zuweisung können auch Ausdrücke stehen.

``` python
int a;         # Definition der Variablen a (Typ: Integer)
int a = 7;     # Definition und Initialisierung einer Variablen
a = 5;         # Zuweisung des Wertes 5 an die Variable a
a = 2 + 3;     # Zuweisung des Wertes 5 an die Variable a
print_int(a);  # Ausgabe des Wertes 5 auf der Standardausgabe
```

Variablen müssen vor ihrer Benutzung definiert sein. Die Initialisierung kann zusammen mit der
Definition erfolgen.

### Kommentare

Kommentare werden durch das Zeichen `#` eingeleitet und umfassen sämtliche Zeichen bis zum
nächsten Newline.

### Kontrollstrukturen

#### While-Schleife

While-Schleifen werden mit dem Schlüsselwort `while` eingeleitet. Sie bestehen im Weiteren aus
einer Bedingung in runden Klammern und einem in geschweiften Klammern formulierten Block mit
ein oder mehreren Anweisungen.

Die Bedingung kann aus einem atomaren Boolean-Wert oder einem Vergleichsausdruck bestehen.

``` c
while (<Bedingung>) {
    <Anweisung_1>
    <Anweisung_2>
}
```

``` c
int a = 10;
while (a >= 0) {
    print_int(a);
    a = a- 1;
}
```

#### Bedingte Anweisung (If-Else)

Eine bedingte Anweisung besteht immer aus genau einer `if`-Anweisung, und einer oder keiner
`else`-Anweisung.

Eine `if`-Anweisung wird mit dem Schlüsselwort `if` eingeleitet und besteht aus einer
Bedingung in runden Klammern und einem in geschweiften Klammern formulierten Block mit ein
oder mehreren Anweisungen.

Eine `else`-Anweisung wird mit dem Schlüsselwort `else` eingeleitet. Auf das Schlüsselwort
folgt in geschweiften Klammern formulierter Block mit ein oder mehreren Anweisungen.

``` c
if (<Bedingung>) {
    <Anweisung_1>
    <Anweisung_2>
}
```

``` c
if (<Bedingung>) {
    <Anweisung>
} else {
    <Anweisung>
}
```

``` c
int a = "abc";
if (a < "adc") {
    print_string("a kleiner als ", "adc");
} else {
    print_string("a passt nicht");
}
```

### Funktionen

#### Funktionsdeklaration

Jede Funktion muss vor ihrer Benutzung mindestens deklariert sein. Dabei wird die Signatur
bekannt gegeben: Rückgabetyp, Funktionsname, Parameterliste. Die Parameterliste ist eine
Komma-separierte Liste mit der Deklaration der Parameter (jeweils Typ und Variablenname). Die
Parameterliste kann auch leer sein.

``` c
type bezeichner(type param1, type param2);
```

``` c
bool func1(int a, string b);
```

Eine Funktionsdeklaration kann beliebig oft im Programm vorkommen, so lange sie sich nicht
ändert.

Funktionen können nicht überladen werden.

#### Funktionsdefinition

Eine Funktionsdefinition macht dem Compiler die Implementierung der Funktion bekannt. Sie ist
gleichzeitig auch eine Funktionsdeklaration und fügt nach der Deklaration den Funktionskörper
als Code-Block an.

Eine Funktionsdefinition darf es jeweils nur einmal im Programm geben.

``` c
type bezeichner(type param1, type param2) {
    <Anweisung_1>
    <Anweisung_2>
    return <Bezeichner, Wert oder Operation>;
}
```

``` c
bool func1(int a, string b) {
    int c = a + b;
    return c == a + b;
}
```

#### Funktionsaufrufe

Funktionsaufrufe bestehen aus einem Bezeichner (Funktionsname) gefolgt von einer in Klammern
angegebenen Parameterliste, die auch leer sein kann. Als Parameter können alle passend
typisierten Ausdrücke dienen.

``` python
func1(var1, 5)
func1(func2(), 1 + 1)
```

Funktionen müssen vor dem Aufruf mindestens deklariert sein.

#### Eingebaute Funktionen

Die Funktionen `print_int`, `print_string` und `print_bool` sind in der Sprache eingebaut. Sie
nehmen einen Ausdruck mit dem jeweiligen Typ (`int`, `string`, `bool`) als Parameter entgegen,
werten diesen aus und geben das Ergebnis auf der Standardausgabe aus.

### Datentypen

Unsere Sprache hat drei eingebaute Datentypen:

| Datentyp | Definition der Literale                                       |
|:---------|:--------------------------------------------------------------|
| `int`    | eine beliebige Folge der Ziffern `0-9`                        |
| `string` | eine beliebige Folge von ASCII-Zeichen, eingeschlossen in `"` |
| `bool`   | eines der beiden Schlüsselwörter `True` oder `False`          |

### Beispiele

``` c
print_string("Hello World");
```

``` c
string a = "wuppie fluppie";
```

``` c
int a = 0;
if (10<1) {
    print_string("10<1");
    a = 42;
} else {
    print_string("kaputt");
}
```

``` c
int f95(int n) {
    if (n == 0) {
        print_string("\t n==0");
        return 1;
    } else {
        if (n == 1) {
            print_string("\t n==1");
            return 1;
        } else {
            print_string("\t rekursiv...");
            return f95(n - 1) + f95(n - 2) + f95(n - 3) + f95(n - 4) + f95(n - 5);
        }
    }
}

int n = 10;
print_int(f95(n));
```

## Aufgaben

### A4.1: Beispielprogramme (1P)

Sie finden unten einige Beispielprogramme.

Erstellen Sie selbst weitere Programme in der Zielsprache. Diese sollten von einfachsten
Ausdrücken bis hin zu komplexeren Programmen reichen.

Definieren Sie neben gültigen Programmen auch solche, die in der semantischen Analyse
zurückgewiesen werden sollten. Welche Fehlerkategorien könnte es hier geben?

### A4.2: Grammatik und ANTLR (3P)

Definieren Sie für die obige Sprache eine geeignete ANTLR-Grammatik.

Erzeugen Sie mithilfe der Grammatik und ANTLR einen Lexer und Parser, den Sie für die
folgenden Aufgaben nutzen.

Beim Parsen bekommen Sie von ANTLR einen Parse-Tree zurück, der die Struktur Ihrer Grammatik
widerspiegelt. Die einzelnen Zweige sind damit aber auch viel zu tief verschachtelt.

Überlegen Sie sich, welche Informationen/Knoten Sie für die formatierte Ausgabe wirklich
benötigen (das ist Ihr AST). Programmieren Sie eine Transformation des Parse-Tree in die von
Ihnen hier formulierten AST-Strukturen.

### A4.3: Aufbau der Symboltabelle und Typprüfung (6P)

Bauen Sie für den AST eine Symboltabelle auf. Führen Sie die Typprüfung durch. Geben Sie
erkannte Fehler auf der Konsole aus.

Entwickeln Sie eine Ausgabefunktion, so dass auch die Symboltabelle geeignet formatiert
ausgegeben wird. Nutzen Sie diese Ausgabe auch zum Debuggen und zum Erklären Ihres Codes.



### A4.X: Pointer und Arrays

Ergänzen Sie diese Sprache
um Arrays und Pointer. Benutzen Sie dabei die aus C/C++ bekannte Syntax.

*Anmerkung*: Hier sind nur die syntaktischen Elemente und ihre semantischen Auswirkungen
interessant, d.h. (Funktionen/Operatoren für die) dynamische Speicherverwaltung brauchen Sie
nicht implementieren!
