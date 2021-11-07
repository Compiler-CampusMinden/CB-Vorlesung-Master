---
type: lecture-cg
title: "Strukturen und Klassen"
author: "Carsten Gips (FH Bielefeld)"
weight: 4
readings:
  - key: "Mogensen2017"
    comment: "Kapitel 3"
  - key: "Parr2014"
    comment: "Kapitel 6.4 und 8.4"
  - key: "Parr2010"
    comment: "Kapitel 6, 7 und 8"
assignments:
  - topic: sheet02
youtube:
  - id: "-w9ljeFGq3k"
fhmedia:
  - link: "https://www.fh-bielefeld.de/medienportal/m/61bbea5570ec17a741c3899f0822085deee317d4f5f34268eb6bcc1cc4ce6b443eb2ac397791e1fbeb5ba7a9d6c46cf08307bf3be2ccde9b7d2fc0a6ee9cfcc9"
    name: "Direktlink FH-Medienportal: CB Strukturen und Klassen"
---


## Strukturen

:::::: columns
::: {.column width="32%"}

```c
struct A {
    int x;
    struct B {int x;};
    B b;
    struct C {int z;};
};
A a;
void f() {
    A a;
    a.b.x = 42;
}
```

:::
::: {.column width="68%"}

\pause
\vspace{8mm}

![](images/structscopes.png)

:::
::::::


## Strukturen: Erweiterung der Symbole und Scopes

![](images/structscopesuml.png){width="80%"}

[Quelle: Eigene Modellierung nach einer Idee in [@Parr2010, S. 162]]{.origin}


::: notes
Strukturen stellen wie Funktionen sowohl einen Scope als auch ein Symbol dar.

Zusätzlich stellt eine Struktur (-definition) aber auch einen neuen Typ
dar, weshalb `Struct` auch noch das Interface `Type` "implementiert".
:::


## Strukturen: Auflösen von Namen

``` python
class Struct(Scope, Symbol, Type):
    def resolveMember(name):
        return symbols[name]
```
\smallskip

=> Auflösen von "`a.b`"[\ (im Listener in `exitMember()`)]{.notes}:

*   `a` im "normalen" Modus mit `resolve()` über den aktuellen Scope
*   Typ von `a` ist `Struct` mit Verweis auf den eigenen Scope
*   `b` nur innerhalb des `Struct`-Scopes mit `resolveMember()`

::: notes
In der Grammatik würde es eine Regel `member` geben, die auf eine Struktur
der Art `ID.ID` anspricht (d.h. eigentlich den Teil `.ID`), und entsprechend
zu Methoden `enterMember()` und `exitMember()` im Listener führt.

Das Symbol für `a` hat als `type`-Attribut eine Referenz auf die `Struct`,
die ja einen eigenen Scope hat (`symbols`-Map). Darin muss dann `b` aufgelöst
werden.
:::

\bigskip

::::::::: slides
:::::: columns
::: {.column width="13%"}
\vspace{-1mm}
``` {.c size="tiny"}
struct A {
    int b;
};
void f() {
    A a;
    a.b = 42;
}
```
:::
::: {.column width="33%"}
![](images/structscopes.png)
:::
::: {.column width="54%"}
![](images/structscopesuml.png){width="90%"}
[Quelle: Eigene Modellierung nach einer Idee in [@Parr2010, S. 162]]{.origin}
:::
::::::
:::::::::


## Klassen

:::::: columns
::: {.column width="32%"}

```cpp
class A {
public:
    int x;
    void foo() { ; }
};
class B : public A {
public
    int y;
    void foo() {
        int z = x+y;
    }
};
```

:::
::: {.column width="58%"}

\pause

![](images/classscopes.png)

:::
::::::


## Klassen: Erweiterung der Symbole und Scopes

![](images/classscopesuml.png){width="80%"}

[Quelle: Eigene Modellierung nach einer Idee in [@Parr2010, S. 167]]{.origin}

::: notes
Bei Klassen kommt in den Tabellen ein weiterer Pointer `parentClazz` auf die
Elternklasse hinzu (in der Superklasse ist der Wert `None`).
:::

## Klassen: Auflösen von Namen

``` {.python size="footnotesize"}
class Clazz(Struct):
    Clazz parentClazz   # None if base class

    def resolve(name):
        # do we know "name" here?
        if symbols[name]: return symbols[name]
        # NEW: if not here, check any parent class ...
        if parentClazz != None: return parentClazz.resolve(name)
        # ... or enclosing scope if base class
        try: return enclosingScope.resolve(name)
        except: return None     # not found

    def resolveMember(name):
        if symbols[name]: return symbols[name]
        # NEW: check parent class
        try: return parentClazz.resolveMember(name)
        except: return None
```

[Quelle: Eigene Implementierung nach einer Idee in [@Parr2010, S. 172]]{.origin}

::: notes
Beim Auflösen von Attributen oder Methoden muss zunächst in der Klasse selbst gesucht werden,
anschließend in der Elternklasse.

Beispiel (mit den obigen Klassen `A` und `B`):

```cpp
B foo;
foo.x = 42;
```

Hier wird analog zu den Structs zuerst `foo` mit `resolve()` im lokalen Scope aufgelöst. Der Typ
des Symbols `foo` ist ein `Clazz`, was zugleich ein Scope ist. In diesem Scope wird nun mit
`resolveMember()` nach dem Symbol `x` gesucht. Falls es hier nicht gefunden werden kann, wird in
der Elternklasse (sofern vorhanden) weiter mit`resolveMember()` gesucht.


Die normale Namensauflösung wird ebenfalls erweitert um die Auflösung in der Elternklasse.

Beispiel:

```cpp
int wuppie;
class A {
public:
    int x;
    void foo() { ; }
};
class B : public A {
public
    int y;
    void foo() {
        int z = x+y+wuppie;
    }
};
```

Hier würde `wuppie` als Symbol im globalen Scope definiert werden. Beim Verarbeiten von
`int z = x+y+wuppie;` würde mit `resolve()` nach `wuppie` gesucht: Zuerst im lokalen Scope
unterhalb der Funktion, dann im Funktions-Scope, dann im Klassen-Scope von `B`. Hier sucht
`resolve()` auch zunächst lokal, geht dann aber die Vererbungshierarchie entlang (sofern
wie hier vorhanden). Erst in der Superklasse (wenn der `parentClazz`-Zeiger `None` ist),
löst `resolve()` wieder normal auf und sucht um umgebenden Scope. Auf diese Weise kann man
wie gezeigt in Klassen (Methoden) auf globale Variablen verweisen ...


*Anmerkung*: Durch dieses Vorgehen wird im Prinzip in Methoden aus dem Zugriff auf ein Feld
`x` implizit ein `this.x` aufgelöst, wobei `this` die Klasse auflöst und `x` als Attribut darin.
:::


## Wrap-Up

*   Symboltabellen: Verwaltung von Symbolen und Typen (Informationen über Bezeichner)

\smallskip

*   Strukturen und Klassen bilden eigenen Scope
*   Strukturen/Klassen lösen etwas anders auf: Zugriff auf Attribute und Methoden







<!-- DO NOT REMOVE - THIS IS A LAST SLIDE TO INDICATE THE LICENSE AND POSSIBLE EXCEPTIONS (IMAGES, ...). -->
::: slides
## LICENSE
![](https://licensebuttons.net/l/by-sa/4.0/88x31.png)

Unless otherwise noted, this work is licensed under CC BY-SA 4.0.
:::
