---
title: "TL;DR"
disableToc: true
hidden: true
---


Bei der Abarbeitung des Bytecodes in der VM werden immer wieder Objekte auf dem Laufzeit-Heap angelegt.
Nicht benötigte Objekte müssen von Zeit zu Zeit wieder frei gegeben werden.

Für die **Mark-Sweep-Garbage-Collection** pflegt man in der VM eine verkettete Liste aller Objekte, die
auf dem Heap angelegt werden. Bei der Durchführung eines Mark-Sweep-Laufs markiert man zunächst alle
"Wurzeln", d.h. die über den Stack der VM oder die Hashtabelle der VM mit den globalen Variablen und
Funktionen oder die Konstanten-Arrays der VM direkt erreichbaren Objekte. Von hier aus traversiert man
alle verwiesenen Objekte und markiert diese ebenfalls. Anschließend iteriert man über die verkettete
Liste aller Objekte in der VM und entfernt alle Objekte, die im vorigen Schritt nicht markiert wurden.

Wenn man GC zu selten durchführt, dauert ein GC-Lauf u.U. sehr lange (viele Objekte): hohe Latenz.
Wenn man GC zu oft durchführt, dauert ein einzelner Lauf zwar nur recht kurz, aber das Verhältnis
von Zeit im "User-Modus" vs. Zeit im "GC-Modus" wird ebenfalls schlecht: niedriger Durchsatz. Hier
kann man mit der Heuristik des "self-adjusting" Heaps arbeiten: Wenn die Gesamtgröße der allozierten
Objekte einen Schwellwert überschreitet, führt man GC durch und vergrößert den Schwellwert: Größe der
verbleibenden Objekte multipliziert mit einem Faktor.
