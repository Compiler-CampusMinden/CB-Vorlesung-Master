---
archetype: assignment
title: "Blatt 01: Grammatik, Parser und AST"
author: "BC George, Carsten Gips (FH Bielefeld)"
weight: 1

hidden: true
---


## A1.1: Grammatik

Erstellen Sie eine Grammatik für **Mini-Python**.

Der auf der Wiki-Seite [Sprachumfang] definierte Umfang soll mit Ihrer
Grammatik mindestens unterstützt werden. Dabei ist die Funktionalität
wie in Python mit folgenden Ausnahmen:

*   Einrückung ist für die Funktionalität irrelevant
*   Schleifen, Funktionen und Klassen werden mit `#end` beendet

Nachfolgend einige Beispiele in Ergänzung zur Wiki-Seite [Sprachumfang]:

1.  Beispiele für IF-Statements:

    ```python
    a= 2
    if a == 2:
        print("a is ", a)
    #end
    ```

    ```python
    if a == 2:
    print("a is ", a)
    elif a == 3:
    print("a is ", a)
    else:
    print("a is neither 2 and 3")
    #end
    ```

2.  Beispiel für Schleifen:

    ```python
    while(x>y):
        print(x ,"is bigger than ",y)
        x=x-1
    #end
    ```

3.  Beispiel für Funktionen:

    ```python
    def foo():
    print("ich bin eine Funktion")
    #end
    ```

4.  Beispiele für Klassen:

    ```python
    class A:
    def foo():
        print("Ich bin eine Methode von A")
    #end
    #end
    ```

    ```python
    class B(A): #Vererbung B erbt von A
    def foo():
        print("Ich bin eine Methode von B")
    #end
    #end
    ```

[Sprachumfang]: https://github.com/Compiler-CampusMinden/Mini-Python-Builder/wiki/Definition-der-syntaktischen-Sprachelemente


## A1.2: ANTLR

Erzeugen Sie mithilfe der Grammatik und ANTLR einen Scanner und Parser, den Sie für
die folgenden Aufgaben nutzen.


## A1.3: AST

Entwickeln Sie ein Konzept für einen AST.

Begründen und diskutieren Sie im Praktikum Ihre Entscheidungen: Warum haben Sie
welche Elemente weggelassen, warum sieht Ihr AST so aus, wie er aussieht? Wie
kommen Sie vom Parse-Tree zum AST?
