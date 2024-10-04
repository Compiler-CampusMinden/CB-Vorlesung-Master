---
archetype: assignment
title: "Blatt 05: Interpreter, Optimierung"
author: "Carsten Gips, BC George (HSBI)"

hidden: true
---

<!--  pandoc -s -f markdown -t markdown+smart-grid_tables-multiline_tables-simple_tables --columns=94 --reference-links=true  sheet05.md  -o xxx.md  -->

## Zusammenfassung

Ziel dieses Aufgabenblattes ist die Erstellung eines Tree-Walking-Interpreter mit ANTLR für
eine Lisp-artige Sprache.

## Methodik

Sie finden im [Sample Project] eine [Grammatik], die (teilweise) zu der Zielsprache auf diesem
Blatt passt. Analysieren Sie diese Grammatik und vervollständigen Sie diese bzw. passen Sie
diese an.

Erstellen Sie mit dieser Grammatik und ANTLR wieder einen Lexer und Parser.

Es ist empfehlenswert, den Interpreter dreistufig zu realisieren:

1.  Einlesen aus einer Datei und Parsen der Inhalte
2.  Aufbauen der Symboltabelle und Durchführung der semantischen Analyse
3.  Ablaufen des Parse-Tree/AST und Auswerten der Ausdrücke

## Sprachdefinition

Ein Programm besteht aus einem oder mehreren Ausdrücken (*Expressions*). Die Ausdrücke haben
eine spezielle Form: Sie sind sogenannte S-Expressions. Dies sind entweder Literale der Form
`x` oder einfache listenartige Gebilde der Form `(. x y)`, wobei der `.` eine Operation (oder
Funktion) darstellt und `x` und `y` selbst wieder S-Expressions sind.

Die einfachste Form sind dabei Literale mit konkreten Werten der drei Datentypen `Integer`,
`String` und `Boolean`:

``` clojure
42          ;; Integer
"hello"     ;; String
true        ;; Boolean
false       ;; Boolean
```

(Über `;;` wird ein Kommentar eingeleitet, der bis zum Ende der Zeile geht.)

Komplexere Ausdrücke werden über die Listenform gebildet:

``` clojure
(+ 1 1)               ;; 1 + 1
(/ 10 3)              ;; 10 / 3
(+ 1 2 3 4)           ;; 1 + 2 + 3 + 4
(+ (+ (+ 1 2) 3) 4)   ;; (((1 + 2) + 3) + 4)
(/ (+ 10 2) (+ 2 4))  ;; ((10 + 2) / (2 + 4))
```

In der listenartigen Form ist der erste Eintrag der Liste immer eine Operation (oder ein
Funktionsname), danach kommen je nach Operation/Funktion (die Arität muss passen!)
entsprechende Einträge, die als Parameter für die Operation oder Funktion zu verstehen sind.

Die Ausdrücke sind implizit von links nach rechts geklammert, d.h. der Ausdruck `(+ 1 2 3 4)`
ist äquivalent zu `(+ (+ (+ 1 2) 3) 4)` und löst sich nach $1+2+3+4$ auf.

### Eingebaute Funktionen

Es gibt zwei Funktionen, die fest in der Sprache integriert sind.

Mit der eingebauten Funktion `print` kann der Wert eines Ausdrucks auf der Konsole ausgegeben
werden:

``` clojure
(print "hello world")
(print "wuppie\nfluppie\nfoo\nbar")
```

Die eingebaute Funktion `str` verknüpft ihre Argumente und bildet einen String. Falls nötig,
werden die Argumente vorher in einen String umgewandelt.

``` clojure
(str 42)                              ;; liefert "42" zurück
(str "wuppie" "fluppie" "foo" "bar")  ;; liefert "wuppiefluppiefoobar" zurück
(str "one: " 1 ", two: " 2)           ;; liefert "one: 1, two: 2" zurück
```

### Operatoren

Es gibt nur wenige vordefinierte Operatoren, diese mit der üblichen Semantik.

#### Vergleichsoperatoren

| Operation  | Operator |
|:-----------|:--------:|
| Gleichheit |   `=`    |
| Größer     |   `>`    |
| Kleiner    |   `<`    |

Die Operanden müssen jeweils beide den selben Typ haben. Dabei sind `String` und `Integer`
zulässig. Das Ergebnis ist immer vom Typ `Boolean`.

#### Arithmetische Operatoren

| Operation      | Operator |
|:---------------|:--------:|
| Addition       |   `+`    |
| Subtraktion    |   `-`    |
| Multiplikation |   `*`    |
| Division       |   `/`    |

Die Operanden müssen jeweils beide den selben Typ haben. Dabei sind `String` und `Integer`
zulässig. Das Ergebnis ist vom Typ der Operanden.

### Kontrollstrukturen (If-Else)

Die `if-then-else`-Abfrage gibt es mit und ohne den `else`-Zweig:

``` clojure
(if boolean-form
    then-form
    optional-else-form)
```

Dabei kann jeweils nur genau eine S-Expression genutzt werden. Wenn man mehrere Dinge
berechnen möchte, nutzt man `do`:

``` clojure
(do (print "wuppie") (print "fluppie") (print "foo") (print "bar"))
```

Beispiel:

``` clojure
(if (< 1 2) (do (print "true") (print "WUPPIE")) (print "false"))
```

oder anders formatiert:

``` clojure
(if (< 1 2)
    (do (print "true")
        (print "WUPPIE"))
    (print "false"))
```

### Variablen: Bindings mit *def* anlegen

``` clojure
(def x 42)  ;; definiert eine neue Variable mit dem Namen "x" und dem Wert 42

x           ;; liefert 42
(+ x 7)     ;; liefert 49
```

### Funktionen mit *defn* definieren

``` clojure
;;     name   params  body
(defn  hello  (n)     (str "hello " n))  ;; Definition einer Funktion "hello" mit einem Parameter

(hello "world")                          ;; Aufruf der Funktion "hello" mit dem Argument "world"
```

### Lokale Scopes mit *let*

``` clojure
;;    bindings      use names here
(let  (name value)  (code that uses name))

(def x 99)   ;; globale Variable x
(def y 101)  ;; globale Variable y
(def z 42)   ;; globale Variable z
(let (x 1   ;; lokales x mit Wert 1(verdeckt globales x)
      y 2)  ;; lokales y mit Wert 2
     (+ x y z))  ;; 1+2+42

(defn  hello
       (n)
       (let (l 42)  ;; l is valid in this scope
            (str "hello " n ": " l)
       )  ;; end of local scope
)  ;; end of function definition
```

Mit `let` können lokale Variablen erzeugt werden, die dann in dem jeweiligen Scope genutzt
werden können. Dies funktioniert wie in anderen Sprachen mit Scopes.

### Rekursion

``` clojure
(defn fac (n)
    (if (< n 2)
        1
        (* n (fac (- n 1)))))
```

Da es kein `while` oder `for` gibt, müssen Schleifen über rekursive Aufrufe abgebildet werden.

### Datenstrukturen

In unserer Sprache gibt es Listen:

``` clojure
(1 2 3)          ;; Fehler!
(def v (1 2 3))  ;; Fehler!
```

Das Problem daran ist, dass unsere S-Expressions zwar bereits listenartige Strukturen sind,
der erste Eintrag aber als Operator oder Funktion interpretiert wird. Der Ausdruck oben würde
beim Auswerten versuchen, die "Funktion" 1 auf den Argumenten 2 und 3 aufzurufen ...

Man braucht also eine Notation, die ein sofortiges Auswerten verhindert und nur die Liste an
sich zurückliefert. Dies erreicht man durch die Funktion `list`:

``` clojure
(list 1 2 3)          ;; (1 2 3)

(def v (list 1 2 3))  ;; v = (1 2 3)
v                     ;; (1 2 3)
```

Mit der Funktion `nth` kann man auf das n-te Element einer Liste zugreifen:

``` clojure
(nth (list "abc" false 99) 2)  ;; 99
```

Zusätzlich gibt es die beiden Funktionen `head` und `tail`, die das erste Element einer Liste
bzw. die restliche Liste ohne das erste Element zurückliefern:

``` clojure
(head (list 1 2 3))  ;; 1
(tail (list 1 2 3))  ;; (2 3)
```

## Aufgaben

### A5.1: Grammatik und ANTLR (3P)

1.  Erstellen Sie zunächst einige Programme in der Zielsprache. Diese sollten von einfachsten
    Ausdrücken bis hin zu komplexeren Programmen reichen. Definieren Sie beispielsweise eine
    Funktion, die rekursiv die Länge einer Liste berechnet.

    Definieren Sie neben gültigen Programmen auch solche, die in der semantischen Analyse
    zurückgewiesen werden sollten. Welche Fehlerkategorien könnte es hier geben?

2.  Definieren Sie für die obige Sprache eine geeignete ANTLR-Grammatik. Sie können dabei die
    [Grammatik] im [Sample Project] als Ausgangspunkt nutzen und diese anpassen und
    vervollständigen. Erzeugen Sie mithilfe der Grammatik und ANTLR einen Lexer und Parser.

3.  Führen Sie die semantische Analyse durch: Sind alle Symbole bekannt, passen die Scopes?

### A5.2: Tree-Walking-Interpreter (5P)

Bauen Sie einen Tree-Walking-Interpreter in Ihr Projekt ein.

Realisieren Sie die eingebauten Funktionen `print` und `str` dabei als *native* Funktionen.
Realisieren Sie `list`, `nth`, `head` und `tail` sowie `def`, `let`, `defn`, `do` und die
Operatoren und die Kontrollstrukturen geeignet.

Achten Sie auf die Datentypen. Die Typen von Variablen etc. sind erst zur Laufzeit bekannt und
müssen dann passen.

Lesen Sie den zu interpretierenden Code aus einer Datei ein.

Testen Sie Ihren Interpreter mit Ihren Beispielprogrammen.

### A5.3: Interaktiver Interpreter (2P)

Bauen Sie eine *REPL* ein, d.h. geben Sie nach dem Start des Interpreters einen Prompt aus und
verarbeiten Sie die Eingaben interaktiv. Wie müssen Sie hier mit der Symboltabelle umgehen?

  [Sample Project]: https://github.com/Compiler-CampusMinden/CB-Vorlesung-Bachelor/tree/master/homework/src/sample_project
  [Grammatik]: https://github.com/Compiler-CampusMinden/CB-Vorlesung-Bachelor/blob/master/homework/src/sample_project/src/main/antlr/MiniLisp.g4
