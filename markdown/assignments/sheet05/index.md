---
type: assignment
title: "Blatt 05: Interpreter"
author: "BC George, Carsten Gips (FH Bielefeld)"
hidden: true
weight: 5
---


## A5.1: Interpreter

Bauen Sie einen Tree-Walking-Interpreter in Ihr Projekt ein:

*   Lesen Sie zunächst den zu interpretierenden Small-C-Code aus einer Datei ein.
*   Realisieren Sie die Funktionen `readint` und `writeint` als *native* Funktionen im Interpreter.


## A5.2: Interaktivität

Erweitern Sie Ihren Interpreter um Interaktivität:

*   Der Interpreter soll einen Prompt in der Konsole anbieten
*   Der Interpreter soll Code zeilenweise von der Standard-Eingabe lesen und verarbeiten
*   Zur Eingabe mehrzeiliger Konstrukte sehen Sie entweder das Einlesen von
    Codeblöcken aus Dateien vor oder implementieren Sie entsprechend eine "logische
    Einrückung" für den Prompt als visuelles Feedback für den User

Sie können sich hier am [Interpreter für Lox](https://craftinginterpreters.com/a-tree-walk-interpreter.html) orientieren.
