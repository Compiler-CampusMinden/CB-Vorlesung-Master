---
type: lecture-cg
title: "Garbage Collection"
menuTitle: "Garbage Collection"
author: "Carsten Gips (FH Bielefeld)"
weight: 5
readings:
  - key: "Nystrom2021"
    comment: "Kapitel 26: Garbage Collection"
  - key: "GCHandbook2011"
youtube:
  - id: Loo3Ver5pyc
fhmedia:
  - link: "https://www.fh-bielefeld.de/medienportal/m/6f634388ae21b10f85827208a3a00606fef9550c5ab1fb94fd750ff0f6ebf24f9e1873213cb14c93406b2512041a49bc3bede5a995750d82ce6299669476b4b3"
    name: "Direktlink FH-Medienportal: CB Garbage Collection"
---


## Ist das Code oder kann das weg?

:::::: columns
::: {.column width="45%"}
```python
x = 42
y = 'wuppie'
y = 'fluppie'
print(y)
```
:::
::: {.column width="45%"}
```python
def foo():
    x = 'wuppie'
    def bar():
        print(x)
    return f

fn = foo()
fn()
```
:::
::::::

::: notes
Bei der Erzeugung von Bytecode für eine VM kann man die Konstanten direkt in einem
Konstanten-Array sammeln und im Bytecode mit den entsprechenden Indizes arbeiten.
Das entspricht dem Vorgehen bei der Maschinencode-Erzeugung, dort sammelt man die
Konstanten typischerweise am Ende des Text-Segments.

Bei der Abarbeitung des Bytecodes durch die VM legt diese Objekte für globale und
lokale Variablen, Strings sowie für Funktionen etc. an. Der Speicher dafür wird
dynamisch auf dem Heap reserviert, und die Adressen beispielsweise im Stack (bei
lokalen Variablen) oder in Hashtabellen (Funktionsnamen, globale Variablen) o.ä.
gespeichert.

Wenn Objekte nicht mehr benötigt werden, sollten sie entsprechend wieder freigegeben
werden, da sonst der Heap der VM voll läuft. Im obigen Beispiel wird der Speicher
für `wuppie` unerreichbar, sobald man die Zuweisung `y = 'fluppie'` ausführt.
Andererseits darf man aber auch nicht zu großzügig Objekt aufräumen: Die lokale
Variable `x` in `foo` wird in der beim Aufruf erzeugten Funktion `bar` benötigt
(*Closure*) und muss deshalb von der Lebensdauer wie eine globale Variable behandelt
werden.
:::


## Erreichbarkeit

![](https://raw.githubusercontent.com/munificent/craftinginterpreters/master/site/image/garbage-collection/reachable.png)

[Quelle: [`reachable.png`](https://github.com/munificent/craftinginterpreters/blob/master/site/image/garbage-collection/reachable.png) by [Bob Nystrom](https://github.com/munificent), licensed under [MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE)]{.origin}

::: notes
1. Erreichbar sind zunächst alle "Wurzeln", d.h. alle Objekte, die direkt über den
Stack oder die Konstanten-Arrays oder die Hashtabelle mit den globalen Variablen
(und Funktionen) erreichbar sind.

2. Alle Objekte, die von erreichbaren Objekten aus erreichbar sind, sind ebenfalls
erreichbar.

"Objekt" meint dabei im Zuge der Bytecode-Generierung oder während der Bearbeitung
durch die VM erstellte Werte/Objekte, die auf dem Heap alloziert wurden und durch
die VM aktiv freigegeben werden müssen.
:::


## "Präzises GC": Mark-Sweep Garbage Collection

::: notes
Das führt zu einem zweistufigen Algorithmus:

1.  **Mark**: Starte mit den Wurzeln und traversiere so lange durch die Objektreferenzen,
    bis alle erreichbaren Objekte besucht wurden.
2.  **Sweep**: Lösche alle anderen Objekte.
:::

![](https://raw.githubusercontent.com/munificent/craftinginterpreters/master/site/image/garbage-collection/mark-sweep.png)

[Quelle: [`mark-sweep.png`](https://github.com/munificent/craftinginterpreters/blob/master/site/image/garbage-collection/mark-sweep.png) by [Bob Nystrom](https://github.com/munificent), licensed under [MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE)]{.origin}

::: notes
Die Strukturen für Objekte und die VM werden ergänzt: Objekte erhalten noch
ein Flag für die Markierung.

Zum Auffinden der erreichbaren Objekte wird mit einem Färbungsalgorithmus
gearbeitet. Initial sind alle Objekte "weiß" (nicht markiert).

### Phase "Mark": Wurzeln markieren

Im ersten Schritt färbt man alle "Wurzeln" "grau" ein. Dabei werden alle
Objektreferenzen im Stack der VM, in der Hashtabelle für globale Variablen
der VM, in der Konstantentabelle des Bytecode-Chunks sowie in den Funktionspointern
betrachtet: Über diese Datenstrukturen wird iteriert und alle auf dem Heap
der Laufzeitumgebung allozierten Strukturen/Objekte werden markiert, indem
ihr Flag gesetzt wird. Zusätzlich werden die Pointer auf diese Objekte in
einen "`grayStack`" hinzugefügt. Damit sind alle Wurzeln "grau" markiert".

### Phase "Mark": Trace

Nachdem alle Wurzeln "grau" markiert wurden und auf den `grayStack` der VM
gelegt wurden, müssen nun mögliche Verweise in den Wurzeln verfolgt werden.
Dazu entfernt man schrittweise die Objekte vom Stack und betrachtet sie damit
als "schwarz". (Das Markierungs-Flag bleibt gesetzt, "schwarz" sind die "grau"
markierten Objekte, weil sie nicht mehr auf dem `grayStack` der VM liegen.)
Sofern das aktuell betrachtete Objekt seinerseits wieder Referenzen hat
(beispielsweise haben Funktionen wieder einen Bytecode-Chunk mit einem
Konstanten-Array), werden diese Referenzen iteriert und alle dabei aufgefundenen
Objekte auf den `grayStack` der VM gelegt und ihr Flag gesetzt.

Dieser Prozess wird so lange durchgeführt, bis der `grayStack` leer ist. Dann
sind alle erreichbaren Objekte markiert.

### Phase "Sweep"

Jetzt sind alle erreichbaren Objekte markiert. Objekte, deren Flag nicht gesetzt
ist, sind nicht mehr erreichbar und können freigegeben werden.

Wenn die Objekte nicht erreichbar sind, wie kommt man dann an diese heran?

Die Strukturen für Objekte und die VM werden erneut ergänzt: Objekte erhalten noch
einen `next`-Pointer, mit dem *alle* Objekte in einer verketteten Liste gehalten
werden können.

Wann immer für ein Objekt Speicher auf dem Laufzeit-Heap angefordert wird,
wird dieses Objekt in eine verkettete Liste aller Objekte der VM eingehängt.
Über diese Liste wird nun iteriert und dabei werden alle "weißen" (nicht markierten)
Objekte ausgehängt und freigegeben.

Zusätzlich müssen alle verbleibenden Objekte für den nächsten GC-Lauf wieder
entfärbt werden, d.h. die Markierung muss wieder zurückgesetzt werden.

### Hinweise

Die Mark-and-Sweep-GC-Variante wird auch "präzises Garbage Collection" genannt,
da dabei *alle* nicht mehr benötigten Objekte entfernt werden.

Da während der Durchführung der GC die Abarbeitung des Programms pausiert wird,
hat sich deshalb auch die Bezeichnung *stop-the-world GC* eingebürgert.
:::


## Metriken: Latenz und Durchsatz

::: notes
*   **Latenz**: Längste Zeitdauer, während der das eigentliche Programm (des Users)
    pausiert, beispielsweise weil gerade eine Garbage Collection läuft

*   **Durchsatz**: Verhältnis aus Zeit für den User-Code zu Zeit für Garbage Collection

    Beispiel: Ein Durchsatz von 90% bedeutet, dass 90% der Rechenzeit für den User
    zur Verfügung steht und 10% für GC verwendet werden.
:::

::: center
![](https://raw.githubusercontent.com/munificent/craftinginterpreters/master/site/image/garbage-collection/latency-throughput.png){width="80%"}

[Quelle: [`latency-throughput.png`](https://github.com/munificent/craftinginterpreters/blob/master/site/image/garbage-collection/latency-throughput.png) by [Bob Nystrom](https://github.com/munificent), licensed under [MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE)]{.origin}
:::


## Heuristik: Self-adjusting Heap

*   GC selten: Hohe Latenz (lange Pausen)
*   GC oft: Geringer Durchsatz

\bigskip
\bigskip

**Heuristik**

*   Beobachte den allozierten Speicher der VM
*   Wenn [vorher festgelegte (willkürliche)]{.notes} Grenze überschritten: GC
*   Größe des verbliebenen [belegten]{.notes} Speichers mal Faktor \blueArrow neue Grenze

::: notes
Die Objekte bzw. der Speicherverbrauch, der nach einem GC-Lauf übrig bleibt, ist
ein Indikator für den aktuell nötigen Speicher. Deshalb setzt man die neue Schwelle,
ab der der nächste GC-Lauf gestartet wird, ungefähr auf diesen Speicherverbrauch mal
einem gewissen Faktor (beispielsweise den Wert 2), um nicht sofort wieder einen
GC starten zu müssen ...
:::


## Generational GC

*   Teile Heap in zwei Bereiche: "*Kinderstube*" und "*Erwachsenenbereich*"
*   Neue Objekte werden in der Kinderstube angelegt
*   Häufiges GC in Kinderstube
*   Überlebende Objekte werden nach $N$ Generation in den Erwachsenenbereich verschoben
*   Deutlich selteneres GC im Erwachsenenbereich

::: notes
Die meisten Objekte haben oft eher eine kurze Lebensdauer. Wenn sie aber ein gewisses
"Alter" erreicht haben, werden sie oft noch weiterhin benötigt.

Man teilt den Heap in zwei unterschiedlich große Bereiche auf: Die "Kinderstube"
(*Nursery*) und den größeren Heap-Bereich für die "Erwachsenen". Neue Objekte kommen
zunächst in die Kinderstube, und dort wird regelmäßig GC ausgeführt. Bei jedem GC-Lauf
wird der Generationen-Zähler der "überlebenden" Objekte inkrementiert. Wenn die Objekte
eine bestimmte Anzahl an Generationen überlebt haben, werden sie in den Erwachsenenbereich
verschoben, wo deutlich seltener eine GC durchgeführt wird.
:::


## "Konservatives GC": Boehm GC

::: notes
Man unterscheidet zusätzlich noch zwischen *konservativem* und *präzisem* GC:

*   *Konservatives GC* geht eher vorsichtig vor: Wenn ein Speicherbereich
    möglicherweise noch benötigt werden *könnte*, wird er nicht angefasst;
    alles, was auch nur so aussieht wie ein Pointer wird entsprechend behandelt.
*   *Präzises GC* "weiss" dagegen genau, welche Werte Pointer sind und welche
    nicht und handelt entsprechend.


Boehm, Weiser und Demers: ["**Boehm GC**"](https://hboehm.info/gc/)
=> Konservativer GC (Variante des Mark-and-Sweep-GC)
:::

::: center
![](images/freispeicherverwaltung.png){width="80%"}
:::

\bigskip

*   Idee: Nutze die interne Verwaltung des Heaps zum Finden von Objekten

::::::::: notes
### Ablauf

*   **Mark**:
    1.  Suche alle potentiell zu bereinigenden Objekte: Inspiziere Stack, statische
        Daten, Prozessor-Register, ...
    2.  Behandle alle gefundenen Adressen zunächst als "unsichere Pointer" \
        Es ist noch nicht klar, ob das wirklich gültige Adressen in den Heap sind ...
    3.  Prüfe alle unsicheren Pointer:
        *   Liegt die Adresse tatsächlich *im* Heap?
        *   Zeigt der Pointer auf den Anfang eines Blockes?
        *   Ist der Block nicht in der Free-List enthalten?
        => Ergebnis: gültige Pointer ("Root-Pointer"): markiere diese Objekte als "erreichbar"
    4.  Wiederhole die Schritte (1) bis (3) durch die Untersuchung der gefundenen Objekte
*   **Sweep**: Iteriere über den Heap (blockweise) und gebe alle belegten Blöcke frei, die
    nicht als "erreichbar" markiert wurden

### Exkurs Heap-Verwaltung

Der Heap ist ein zusammenhängender Speicherbereich, der durch die Allokation und Freigabe
von Blöcken in mehrere Blöcke segmentiert wird. Die freien Blöcke werden dabei in eine
verkettete Liste "Free-List" (im Bild "freemem") eingehängt. Diese verkettete Liste wird
direkt im Heap abgebildet.

Es wird dazu eine Verwaltungsstruktur definiert, die neben Informationen wie der Größe des
freien Blocks einen Pointer auf den nächsten freien Block aufweist. Jeder Speicherblock im
Heap beginnt stets mit dieser Struktur, so dass alle freien Blöcke in die Freispeicherliste
eingehängt werden können:

```c
struct memblock {
    size_t size;
    uint marked;
    struct memblock *next;
};
```

*   `size` kann die Gesamtgröße des Blockes bedeuten oder aber nur die Größe der Nutzdaten,
    die sich hinter der Verwaltungsstruktur befinden
    => letztere Deutung wird in Linux verwendet
*   In Linux hat man eine doppelt verkettete Liste (statt wie hier nur einfach verkettet)

Bei `malloc` durchsucht man diese Liste im Heap, bis man einen passenden Block gefunden hat.
Dann setzt man den `next`-Pointer des Vorgängerblocks auf den Wert des eigenen `next`-Pointers
und hängt damit den gefundenen Block aus der Freispeicherliste aus. Der `next`-Pointer wird
ungültig gemacht, indem man ihn auf einen vordefinierten (und nur zu diesem Zweck genutzten)
Wert setzt (alternativ kann man dazu ein weiteres Flag in der Struktur spendieren). Dann
bestimmt man per Pointerarithmetik die Adresse des ersten Bytes hinter der Verwaltungsstruktur
und liefert diese Adresse als Ergebnis (Pointer auf den Nutzbereich des Blockes) an den Aufrufer
zurück. Wenn der gefundene freie Block "viel zu groß" ist, kann man den Block auch splitten:
Einen Teil gibt man als allozierten Block an den Aufrufer zurück, den anderen Teil (den Rest)
hängt man als neuen Block in die Freispeicherliste ein.

Bei einem `free` bekommt man den Pointer auf das erste Byte der Nutzdaten eines Speicherblockes
und muss per Pointerarithmetik den Beginn der Verwaltungsstruktur des Blockes bestimmen. Dann
setzt man den `next`-Pointer des Blockes auf den Wert des Freispeicherlisten-Pointers, und
dieser wird auf die Startadresse der Verwaltungsstruktur des Blockes "umgebogen". Damit hat man
den Block vorn in die Freispeicherliste eingehängt.

### Vor- und Nachteile des konservativen GC

*   (+) Keine explizite Kooperation mit der Speicherverwaltung nötig \
    Die Speicherverwaltung muss nur eine Bedingung erfüllen: Jedes benutzte Objekt hat einen
    Pointer auf den Anfang des Blockes
*   (+) Explizite Deallocation (`free`) ist möglich
*   (+) Kann jederzeit abgebrochen werden \
    Praktisch in Verbindung mit opportunistischer GC in interaktiven Applikationen
*   (+) Keine separate Buchführung über alle in der VM erzeugten Objekte nötig
*   (-) Mark-Phase dauert durch die zusätzlichen Tests länger
*   (-) Die Möglichkeit einer Fragmentierung des Speichers ist hoch
*   (-) Fehlinterpretationen können dafür sorgen, dass unsichere Pointer nicht freigegeben werden
*   (-) Bei hoch optimierenden Compilern ist die GC nicht zuverlässig, da die Adressen u.U. nicht
    mehr auf die benutzen Objekte zeigen
:::::::::


## Reference Counting

::: notes
Beim Reference Counting erhält jedes Objekt einen Referenz-Zähler.

Beim Erstellen weiterer Referenzen oder Pointer auf ein Objekt wird der Zähler entsprechend
inkrementiert.

Sobald ein Objekt seinen Gültigskeitsbereich (Scope) verlässt, wird versucht, das Objekt
freizugeben. Dazu wird der interne Referenz-Zähler dekrementiert. Erst wenn der Zähler dabei
den Wert 0 erreicht, bedeutet dies, dass es keine weitere Referenz oder Pointer auf dieses Objekt
gibt und das Objekt wird vom Heap entfernt (freigegeben). Wenn der Zähler noch größer Null ist,
wird das Objekt nicht weiter verändert.

Dies ist eine einfach Form des GC, die ohne zyklische Sammelphasen auskommt. Allerdings hat
diese Form ein Problem mit zyklischen Datenstrukturen.

### Algorithmus (Skizze)
:::


::::::::: columns
:::::: {.column width="45%"}

\vspace{6mm}

```python
def new():
    obj = alloc_memory()
    obj.set_ref_counter(1)
    return obj
```

::: notes
`new()` wird beim Erstellen eines Objektes aufgerufen.
:::

\bigskip

```python
def delete(obj):
    obj.dec_ref_counter()
    if obj.get_ref_counter() == 0:
        for child in children(obj):
            delete(child)
        free_object(obj)
```

::: notes
`delete()` wird aufgerufen, wenn das Objekt nicht weiter vom Programm verwendet wird, es
beispielsweise seinen Scope verlässt. Hierbei wird geprüft, ob noch anderweitig auf dieses
Objekt referenziert wird.
:::

::::::
:::::: {.column width="50%"}

\pause

![](images/delete_example.png)

::: notes
Im Beispiel wird `delete(A)` ausgeführt: Der Referenz-Zähler (*RC*) von A wird dekrementiert,
und da er den Wert 0 erreicht, werden rekursiv die von A verwiesenen Kinder gelöscht. In B
wird dabei ebenfalls der Wert 0 erreicht und `delete(D)` aufgerufen. Da dort der RC größer 0
bleibt, wird dessen Kind E nicht weiter beachtet. Anschließend werden A und B aus dem Speicher
freigegeben.
:::

::::::
:::::::::


::: notes
### Probleme

Das größte Problem beim Referenz Counting ist der Umgang mit zyklischen Datenstrukturen, wie
verkettete Listen oder einfache Graphen. Es dazu kommen, dass zyklische Datenstrukturen nicht
gelöscht und freigegeben werden können und ein Speicherverlust entsteht.

Das folgende Beispiel erläutert dieses Problem:

![](images/delete_problem.png){width="80"}
:::


## Stop-and-Copy Garbage Collection

*   Teile Heap in zwei Bereiche (A und B)
*   Alloziere nur Speicher aus A (bis der Bereich voll ist)
*   Stoppe Programmausführung und kopiere alle erreichbaren Objekte von A nach B
*   Gebe gesamten Speicher in A frei
*   Setze Programmausführung mit vertauschten Rollen von A und B fort


::: notes
### Vor- und Nachteile von Stop-and-Copy GC

*   (+) Nur ein Lauf über Daten nötig
*   (+) Automatische Speicherdefragmentierung
*   (+) Aufwand proportional zur Menge der erreichbaren Objekte und nicht zur Größe des Speichers
*   (+) Zyklische Referenzen sind kein Problem
*   (-) Benötigt doppelten Speicherplatz für gegebene Heap-Größe
*   (-) Objekte werden im Speicher bewegt (Update von Referenzen nötig)
*   (-) Programm muss für GC angehalten werden
:::


## Wrap-Up

*   Pflege verkette Liste aller Objekte in der VM

\smallskip

*   Mark-Sweep-GC:
    1.  Markiere alle Wurzeln ("grau", aus Stack und Hashtabelle)
    2.  Traversiere ausgehend von den Wurzeln alle Objekte und markiere sie
    3.  Gehe die verkettete Liste aller Objekte durch und entferne alle nicht markierten

\smallskip

*   Problem: Latenz und Durchsatz => Idee des "self-adjusting" Heaps

\smallskip

*   Varianten/Alternativen: Generational GC, Boehm-GC, Reference Counting, Stop-and-Copy GC, ...





<!-- DO NOT REMOVE - THIS IS A LAST SLIDE TO INDICATE THE LICENSE AND POSSIBLE EXCEPTIONS (IMAGES, ...). -->
::: slides
## LICENSE
![](https://licensebuttons.net/l/by-sa/4.0/88x31.png)

Unless otherwise noted, this work is licensed under CC BY-SA 4.0.

### Exceptions
*   Image [`reachable.png`](https://github.com/munificent/craftinginterpreters/blob/master/site/image/garbage-collection/reachable.png)
    (https://github.com/munificent/craftinginterpreters/blob/master/site/image/garbage-collection/reachable.png),
    by [Bob Nystrom](https://github.com/munificent), licensed under [MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE)
*   Image [`mark-sweep.png`](https://github.com/munificent/craftinginterpreters/blob/master/site/image/garbage-collection/mark-sweep.png)
    (https://github.com/munificent/craftinginterpreters/blob/master/site/image/garbage-collection/mark-sweep.png),
    by [Bob Nystrom](https://github.com/munificent), licensed under [MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE)
*   Image [`latency-throughput.png`](https://github.com/munificent/craftinginterpreters/blob/master/site/image/garbage-collection/latency-throughput.png)
    (https://github.com/munificent/craftinginterpreters/blob/master/site/image/garbage-collection/latency-throughput.png),
    by [Bob Nystrom](https://github.com/munificent), licensed under [MIT](https://github.com/munificent/craftinginterpreters/blob/master/LICENSE)
:::
