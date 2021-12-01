---
type: lecture-cg
title: "AST-basierte Interpreter: Funktionen und Klassen"
menuTitle: "AST-basierte Interpreter 2"
author: "Carsten Gips (FH Bielefeld)"
weight: 3
readings:
  - key: "Nystrom2021"
    comment: "Kapitel Kapitel: A Tree-Walk Interpreter, insb. 10. Functions u. 12. Classes"
  - key: "Grune2012"
    comment: "Kapitel 6"
  - key: "Mogensen2017"
    comment: "Kapitel 4"
assignments:
  - topic: sheet05
youtube:
  - id: "LTqk7ifB-V0"
fhmedia:
  - link: "https://www.fh-bielefeld.de/medienportal/m/725097f1ce3ef3f10dd1d31674e1b18e89e8b58af259705080b78ccba9dd319d7be76884549c9c59e02fde9e1a2a91ae5aa3a6d44a8e200a2323e08e217faa14"
    name: "Direktlink FH-Medienportal: CB AST-basierte Interpreter (Funktionen, Klassen)"
---


## Funktionen

:::::: columns
::: {.column width="50%"}

\vspace{16mm}

```java
int foo(int a, int b, int c) {
    print a + b + c;
}

foo(1, 2, 3);
```

:::
::: {.column width="40%"}

\pause

```python
def makeCounter():
    var i = 0
    def count():
        i = i + 1
        print i
    return count;

counter = makeCounter()
counter()   # "1"
counter()   # "2"
```

:::
::::::

::: notes


Die Funktionsdeklaration muss im aktuellen Kontext abgelegt werden,
dazu wird der AST-Teilbaum der Deklaration benötigt.

Beim Aufruf muss man das Funktionssymbol im aktuellen Kontext
suchen, die Argumente auswerten, einen neuen lokalen Kontext
anlegen und darin die Parameter definieren (mit den eben ausgewerteten
Werten) und anschließend den AST-Teilbaum des Funktionskörpers im
Interpreter mit `eval()` auswerten ...
:::


## Ausführen einer Funktionsdeklaration

```yacc
funcDecl : type ID '(' params? ')' block ;
funcCall : ID '(' exprList? ')' ;
```

\bigskip

:::::: columns
::: {.column width="55%"}

```python
def funcDecl(self, AST t):
    fn = Fun(t, self.env)
    self.env.define(t.ID().getText(), fn)
```

:::
::: {.column width="25%"}

\vspace{3mm}

![](images/fun.png)

:::
::::::

[Quelle: Eigener Code basierend auf einer Idee nach [@Nystrom2021], [LoxFunction.java](https://github.com/munificent/craftinginterpreters/blob/master/java/com/craftinginterpreters/lox/LoxFunction.java#L6) ([MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE))]{.origin}

::: notes
Man definiert im aktuellen Environment den Funktionsnamen und hält dazu
den aktuellen Kontext (aktuelles Environment) sowie den AST-Knoten mit
der eigentlichen Funktionsdefinition fest.

Für *Closures* ist der aktuelle Kontext wichtig, sobald man die
Funktion ausführen muss. In [@Parr2010, S.236] wird beispielsweise
einfach nur ein neuer Memory-Space (entspricht ungefähr hier einem
neuen lokalen Environment) angelegt, in dem die im Funktionskörper
definierten Symbole angelegt werden. Die Suche nach Symbolen erfolgt
dort nur im Memory-Space (Environment) der Funktion bzw. im globalen
Scope (Environment).
:::


## Ausführen eines Funktionsaufrufs

```yacc
funcDecl : type ID '(' params? ')' block ;
funcCall : ID '(' exprList? ')' ;
```

\bigskip

```python
def funcCall(self, AST t):
    fn = (Fun)eval(t.ID())
    args = [eval(a)  for a in t.exprList()]

    prev = self.env;  self.env = Environment(fn.closure)
    for i in range(args.size()):
        self.env.define(fn.decl.params()[i].getText(), args[i])

    eval(fn.decl.block())
    self.env = prev
```

[Quelle: Eigener Code basierend auf einer Idee nach [@Nystrom2021], [LoxFunction.java](https://github.com/munificent/craftinginterpreters/blob/master/java/com/craftinginterpreters/lox/LoxFunction.java#L57) ([MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE))]{.origin}

::: notes
Zunächst wird die `ID` im aktuellen Kontext ausgewertet. In der obigen Grammatik
ist dies tatsächlich nur ein Funktionsname, aber man könnte über diesen Mechanismus
auch Ausdrücke erlauben und damit Funktionspointer bzw. Funktionsreferenzen
realisieren ... Im Ergebnis hat man das Funktionsobjekt mit dem zugehörigen AST-Knoten
und dem Kontext zur Deklarationszeit.

Die Argumente der Funktion werden nacheinander ebenfalls im aktuellen Kontext
ausgewertet.

Um den Funktionsblock auszuwerten, legt man einen neuen temporären Kontext über
dem Closure-Kontext der Funktion an und definiert darin die Parameter der Funktion
samt den aktuellen Werten. Dann lässt man den Interpreter über den Visitor-Dispatch
den Funktionskörper evaluieren und schaltet wieder auf den Kontext vor der
Funktionsauswertung zurück.
:::


## Funktionsaufruf: Rückgabewerte

:::::: columns
::: {.column width="45%"}

\vspace{28mm}

```python
def funcCall(self, AST t):
    ...

    eval(fn.decl.block())

    ...
    return None  # (Wirkung)
```

:::
::: {.column width="55%"}

\pause

```python
class ReturnEx(RuntimeException):
    __init__(self, v): self.value = v

def return(self, AST t):
    raise ReturnEx(eval(t.expr()))

def funcCall(self, AST t):
    ...
    erg = None
    try: eval(fn.decl.block())
    except ReturnEx as r: erg = r.value
    ...
    return erg;
```

:::
::::::

::: notes

[Quelle: Eigener Code basierend auf einer Idee nach [@Nystrom2021], [Return.java](https://github.com/munificent/craftinginterpreters/blob/master/java/com/craftinginterpreters/lox/Return.java#L4), [LoxFunction.java](https://github.com/munificent/craftinginterpreters/blob/master/java/com/craftinginterpreters/lox/LoxFunction.java#L74) ([MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE))]{.origin}

Rückgabewerte für den Funktionsaufruf werden innerhalb von `block` berechnet,
wo eine Reihe von Anweisungen interpretiert werden, weshalb `block` ursprünglich
keinen Rückgabewert hat. Im Prinzip könnte man `block` etwas zurück geben lassen,
was durch die möglicherweise tiefe Rekursion relativ umständlich werden kann.

An dieser Stelle kann man den Exceptions-Mechanismus **missbrauchen** und bei
der Auswertung eines `return` mit dem Ergebniswert direkt zum Funktionsaufruf
zurück springen. In Methoden, wo man einen neuen lokalen Kontext anlegt und
die globale `env`-Variable temporär damit ersetzt, muss man dann ebenfalls
mit `try/catch` arbeiten und im `finally`-Block die Umgebung zurücksetzen und
die Exception erneut werfen.
:::


## Native Funktionen

```python
class Callable:
    def call(self, Interpreter i, List<Object> a): pass
class Fun(Callable): ...
class NativePrint(Fun):
    def call(self, Interpreter i, List<Object> a):
        for o in a: print a  # nur zur Demo, hier sinnvoller Code :-)

# Im Interpreter (Initialisierung):
self.env.define("print", NativePrint())

def funcCall(self, AST t):
    ...
#    prev = self.env;  self.env = Environment(fn.closure)
#    for i in range(args.size()): ...
#    eval(fn.decl.block()); self.env = prev
    fn.call(self, args)
    ...
```

[Quelle: Eigener Code basierend auf einer Idee nach [@Nystrom2021], [LoxCallable.java](https://github.com/munificent/craftinginterpreters/blob/master/java/com/craftinginterpreters/lox/LoxCallable.java#L6), [LoxFunction.java](https://github.com/munificent/craftinginterpreters/blob/master/java/com/craftinginterpreters/lox/LoxFunction.java#L6) ([MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE))]{.origin}

::: notes
Normalerweise wird beim Interpretieren eines Funktionsaufrufs der
Funktionskörper (repräsentiert durch den entsprechenden AST-Teilbaum)
durch einen rekursiven Aufruf von `eval` ausgewertet.

Für native Funktionen, die im Interpreter eingebettet sind, klappt
das nicht mehr, da hier kein AST vorliegt.

Man erstellt ein neues Interface `Callable` mit der Hauptmethode `call()`
und leitet die frühere Klasse `Fun` davon ab: `class Fun(Callable)`.
Die Methode `funcCall()` des Interpreters ruft nun statt der `eval()`-Methode
die `call()`-Methode des Funktionsobjekts auf und übergibt den Interpreter
(== Zustand) und die Argumente. Die `call()`-Methode der Klasse `Fun` muss
nun ihrerseits im Normalfall den im Funktionsobjekt referenzierten AST-Teilbaum
des Funktionskörpers mit dem Aufruf von `eval()` interpretieren ...

![](images/callFun.png)

Für die nativen Funktionen leitet man einfach eine (anonyme) Klasse
ab und speichert sie unter dem gewünschten Namen im globalen Kontext
des Interpreters. Die `call()`-Methode wird dann entsprechend der
gewünschten Funktion implementiert, d.h. hier erfolgt kein weiteres
Auswerten des AST.
:::


## Klassen und Instanzen I

```yacc
classDef : "class" ID "{" funcDecl* "}" ;
```

\bigskip

```python
def classDef(self, AST t):
    methods = HashMap<String, Fun>()
    for m in t.funcDecl():
        fn = Fun(m, self.env)
        methods[m.ID().getText()] = fn

    clazz = Clazz(methods)
    self.env.define(t.ID().getText(), clazz)
```

[Quelle: Eigener Code basierend auf einer Idee nach [@Nystrom2021], [Interpreter.java](https://github.com/munificent/craftinginterpreters/blob/master/java/com/craftinginterpreters/lox/Interpreter.java#L115), ([MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE))]{.origin}

::: notes
**Anmerkung**: In dieser Darstellung wird der Einfachheit halber nur auf Methoden eingegangen.
Für Attribute müssten ähnliche Konstrukte implementiert werden.
:::


## Klassen und Instanzen II

``` {.python size="footnotesize"}
class Clazz(Callable):
    __init__(self, Map<String, Fun> methods):
        self.methods = methods

    def call(self, Interpreter i, List<Object> a):
        return Instance(self)

    def findMethod(self, String name):
        return self.methods[name]

class Instance:
    __init__(self, Clazz clazz):
        self.clazz = clazz

    def get(self, String name):
        method = self.clazz.findMethod(name)
        if method != None: return method.bind(self)
        raise RuntimeError(name, "undefined method")
```

[Quelle: Eigener Code basierend auf einer Idee nach [@Nystrom2021], [LoxClass.java](https://github.com/munificent/craftinginterpreters/blob/master/java/com/craftinginterpreters/lox/LoxClass.java#L11), [LoxInstance.java](https://github.com/munificent/craftinginterpreters/blob/master/java/com/craftinginterpreters/lox/LoxInstance.java#L7) ([MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE))]{.origin}

:::notes
Instanzen einer Klasse werden durch den funktionsartigen "Aufruf" der Klassen
angelegt (parameterloser Konstruktor). Eine Instanz hält die Attribute (hier
nicht gezeigt) und eine Referenz auf die Klasse, um später an die Methoden
heranzukommen.
:::


## Zugriff auf Methoden (und Attribute)

```yacc
getExpr : obj "." ID ;
```

\bigskip

```python
def getExpr(self, AST t):
    obj = eval(t.obj())

    if isinstance(obj, Instance):
        return ((Instance)obj).get(t.ID().getText())

    raise RuntimeError(t.obj().getText(), "no object")
```

::: notes
Beim Zugriff auf Attribute muss das Objekt im aktuellen Kontext evaluiert
werden. Falls es eine Instanz von `Instance` ist, wird auf das Feld per
interner Hash-Map zugriffen; sonst Exception.
:::


## Methoden und *this* oder *self*

```python
class Fun(Callable):
    def bind(self, Instance i):
        e = Environment(self.closure)
        e.define("this", i)
        e.define("self", i)
        return Fun(self.decl, e)
```

[Quelle: Eigener Code basierend auf einer Idee nach [@Nystrom2021], [LoxFunction.java](https://github.com/munificent/craftinginterpreters/blob/master/java/com/craftinginterpreters/lox/LoxFunction.java#L31), ([MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE))]{.origin}

::: notes
Nach dem Interpretieren von Klassendefinitionen sind die Methoden in der Klasse
selbst gespeichert, wobei der jeweilige `closure` auf den Klassenkontext zeigt.

Beim Auflösen eines Methodenaufrufs wird die gefundene Methode an die
Instanz gebunden, d.h. es wird eine neue Funktion angelegt, deren `closure`
auf den Kontext der Instanz zeigt. Zusätzlich wird in diesem Kontext noch die
Variable "`this`" definiert, damit man damit auf die Instanz zugreifen kann.

In Python wird das in der Methodensignatur sichtbar: Der erste Parameter ist
eine Referenz auf die Instanz, auf der diese Methode ausgeführt werden soll ...
:::


<!-- TODO
## Vererbung (Skizze)

TODO
-->


## Wrap-Up

*   Interpreter simulieren die Programmausführung
    *   Namen und Symbole auflösen
    *   Speicherbereiche simulieren
    *   Code ausführen: Read-Eval-Loop

\smallskip

*   Traversierung des AST: `eval(AST t)` als Visitor-Dispatcher
*   Scopes mit `Environment` (analog zu Symboltabellen)
*   Interpretation von Funktionen (Deklaration/Aufruf, native Funktionen)
*   Interpretation von Klassen und Instanzen





<!-- DO NOT REMOVE - THIS IS A LAST SLIDE TO INDICATE THE LICENSE AND POSSIBLE EXCEPTIONS (IMAGES, ...). -->
::: slides
## LICENSE
![](https://licensebuttons.net/l/by-sa/4.0/88x31.png)

Unless otherwise noted, this work is licensed under CC BY-SA 4.0.
:::
