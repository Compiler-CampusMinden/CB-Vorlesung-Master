---
title: "TL;DR"
disableToc: true
hidden: true
---


Üblicherweise können Funktionen auf die Umgebung zurückgreifen, in der die Definition der
Funktion erfolgt ist (["**Closure**"](https://en.wikipedia.org/wiki/Closure_(computer_programming))).
Deshalb wird beim Interpretieren einer Funktionsdefinition der jeweilige AST-Knoten (mit
dem Block des Funktionskörpers) und die aktuelle Umgebung in einer Struktur zusammengefasst.
Zusätzlich muss in der aktuellen Umgebung der Name der Funktion zusammen mit der eben erzeugten
Struktur ("Funktionsobjekt") als Wert definiert werden.

Beim Funktionsaufruf löst man den Funktionsnamen in der aktuellen Umgebung auf und erhält
das Funktionsobjekt mit dem AST der Funktion und der Closure. Die Funktionsparameter werden
ebenfalls in der aktuellen Umgebung aufgelöst (Aufruf von `eval()` für die AST-Kindknoten
des Funktionsaufrufs). Zur Interpretation der Funktion legt man sich eine neue Umgebung an,
deren Eltern-Umgebung die Closure der Funktion ist, definiert die Funktionsparameter (Name
und eben ermittelter Wert) in dieser neuen Umgebung und interpretiert dann den AST-Kindknoten
des Funktionsblocks in dieser neuen Umgebung. Für den Rückgabewert muss man ein wenig tricksen:
Ein Block hat normalerweise keinen Wert. Eine Möglichkeit wäre, bei der Interpretation eines
`return`-Statements eine Exception mit dem Wert des Ausdruck hinter dem "`return`" zu werfen
und im `eval()` des Funktionsblock zu fangen.

Für Klassen kann man analog verfahren. Methoden sind zunächst einfach Funktionen, die in einem
Klassenobjekt gesammelt werden. Das Erzeugen einer Instanz einer Klasse ist die Interpretation
eines "Aufrufs" der Klasse (analog zum Aufruf einer Funktion): Dabei wird ein spezielles
Instanzobjekt erzeugt, welches auf die Klasse verweist und welches die Werte der Attribute hält.
Beim Aufruf von Methoden auf einem Instanzobjekt wird der Name der Funktion über das Klassenobjekt
aufgelöst, eine neue Umgebung erzeugt mit der Closure der Funktion als Eltern-Umgebung und das
Instanzobjekt wird in dieser Umgebung definiert als "`this`" oder "`self`". Anschließend wird
ein neues Funktionsobjekt mit der eben erzeugten Umgebung und dem Funktions-AST erzeugt und
zurückgeliefert. Dieses neue Funktionsobjekt wird dann wie eine normale Funktion aufgerufen
(interpretiert, s.o.). Der Zugriff in der Methode auf die Attribute der Klasse erfolgt dann
über `this` bzw. `self`, welche in der Closure der Funktion nun definiert sind und auf das
Instanzobjekt mit den Attributen verweisen.
