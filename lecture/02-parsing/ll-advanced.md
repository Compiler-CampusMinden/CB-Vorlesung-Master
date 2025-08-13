# LL-Parser: Fortgeschrittene Techniken

> [!NOTE]
>
> <details open>
>
> <summary><strong>🎯 TL;DR</strong></summary>
>
> <img src="https://github.com/Compiler-CampusMinden/CPL-Vorlesung-Master/blob/master/lecture/02-parsing/images/architektur_cb_parser.png?raw=true">
>
> Man kann einen LL(k)-Parser bei Bedarf um ein “spekulatives Matching”
> ergänzen. Dies ist in Situationen relevant, wo man das $`k`$ nicht
> vorhersehen kann, etwa bei der Unterscheidung einer
> Vorwärtsdeklaration und einer Funktionsdefinition in C. Hier kann man
> erst nach dem Parsen des Funktionsnamens entscheiden, welche Situation
> vorliegt; der Funktionsname kann dabei (nahezu) beliebig lang sein.
>
> Beim spekulativen Matching muss man sich merken, an welcher Position
> im Tokenstrom man die Spekulation gestartet hat, um im Fall des
> Nichterfolgs dorthin wieder zurückspringen zu können (“Backtracking”).
>
> Das Backtracking kann sehr langsam werden durch das Ausprobieren
> mehrerer Alternativen und das jeweils nötige Zurückrollen. Zudem kann
> es passieren, dass eine bestimmte Sequenz immer wieder erkannt werden
> muss. Hier hilft eine weitere Technik: **Packrat Parsing** ([Ford
> 2006](#ref-Packrat2006)) (nutzt
> [“*memoisation*”](https://en.wikipedia.org/wiki/Memoization)). Hierbei
> führt man pro Regel eine Map mit, in der zu einer Position im
> Tokenstrom festgehalten wird, ob diese Regel an/ab dieser Position
> bereits erfolgreich oder nicht erfolgreich war. Dies kann man dann
> nutzen, um bei einem erneuten Parsen der selben Regel “vorzuspulen”.
>
> In ANTLR kann man *semantische Prädikate* benutzen, um Alternativen
> “abzuschalten”. Dies ist beispielsweise nützlich, wenn man nur eine
> Grammatik für unterschiedliche Versionen einer Sprache implementieren
> will.
>
> Eine gute Darstellung finden Sie in ([Parr 2010](#ref-Parr2010))
> (Kapitel 3) und in ([Ford 2006](#ref-Packrat2006)).
>
> </details>
>
> <details>
>
> <summary><strong>🎦 Videos</strong></summary>
>
> - [VL LL-Parser: Fortgeschrittene
>   Techniken](https://youtu.be/12GT2WxZsxY)
>
> </details>

## LL-Parser mit Backtracking

Problem: Manchmal kennt man den nötigen Lookahead nicht vorher.
Beispiel:

``` cpp
wuppie();         // Vorwärtsdeklaration
wuppie() { ...}   // Definition
```

Entsprechend sähe die Grammatik aus:

``` antlr
func : fdef | fdecl ;
fdef : head '{' body '}' ;
fdecl: head ';' ;
head : ... ;
```

Hier müsste man erst den gesamten Funktionskopf parsen, bevor man
entscheiden kann, ob es sich um eine Deklaration oder eine Definition
handelt. Unglücklicherweise gibt es keine Längenbeschränkung bei den
Funktionsnamen …

Mit Hilfe von Backtracking kann man zunächst spekulativ matchen und beim
Auftreten eines Fehlers die Spekulation rückgängig machen:

``` python
def func():
    if speculate(fdef): fdef()      # Spekuliere auf "fdef"
    elif speculate(fdecl): fdecl()  # Spekuliere auf "fdecl"
    else: raise Exception()
```

Die erste Alternative, die passt, gewinnt. Über die Reihenfolge der
Spekulationen kann man entsprechend Vorrangregeln implementieren.

### Anmerkung

Man könnte die obige Grammatik umformen …

``` antlr
func : head ('{' body '}' | ';') ;
head : ... ;
```

…und bräuchte dann kein spekulatives Parsen mit Backtracking.

Da wir aber das Parsen mit Backtracking betrachten wollen, blenden wir
diese Möglichkeit jetzt einfach aus ;)

## Details: Spekulatives Matchen

``` python
def speculate(fn):
    success = True

    mark()                  # markiere aktuelle Position

    try:   fn()             # probiere Regel fn()
    catch: success = False

    clear()                 # Rollback

    return success
```

Quelle: Eigener Code basierend auf einer Idee nach ([Parr
2010](#ref-Parr2010), p. 60)

Der Funktion `speculate` wird die zu testende Regel (Funktion) als
Parameter übergeben, im obigen Beispiel wären dies `fdef` bzw. `fdecl`.

Vor dem spekulativen Matchen muss die aktuelle Position im Tokenstrom
markiert werden. Falls der Versuch, die Deklaration zu matchen nicht
funktioniert, wird der Regel-Aufruf eine Exception werfen, entsprechend
wird die Hilfsvariable gesetzt. Anschließend muss noch mit `clear()` das
aktuelle Token wieder hergestellt werden (wir sind ja nur im
Spekulationsmodus, d.h. selbst im Erfolgsfall wird ja die Regel noch
“richtig” aufgerufen).

## Spekulatives Matchen: Hilfsmethoden I/II

``` python
class Parser:
    Lexer lexer
    markers = []    # Integer-Stack: speichere Tokenpositionen
    lookahead = []  # Puffer (1 Token vorbefüllt via Konstruktor)
    start = 0       # aktuelle Tokenposition im lookahead-Puffer

    def mark():
        markers.push(start)

    def clear():
        start = markers.pop()
```

Quelle: Eigener Code basierend auf einer Idee nach ([Parr
2010](#ref-Parr2010), pp. 61/62)

## Spekulatives Matchen: Hilfsmethoden II/II

``` python
def consume():
    ++start
    if start == lookahead.count() and markers.isEmpty():
        start = 0; lookahead.clear()
    sync(1)

def lookahead(i):
    sync(i)
    return lookahead.get(start+i-1)

def sync(i):
    n = start + i - lookahead.count()
    while (n > 0):
        lookahead.add(lexer.nextToken()); --n
```

Quelle: Eigener Code basierend auf einer Idee nach ([Parr
2010](#ref-Parr2010), pp. 61/62)

`consume` holt wie immer das nächste Token, hier indem der Index `start`
weiter gesetzt wird und ein weiteres Token über `sync` in den Puffer
geladen wird. Falls wir nicht am Spekulieren sind und das Ende des
Puffers erreicht haben, nutzen wir die Gelegenheit und setzen den Puffer
zurück. (Dies geht nicht, wenn wir spekulieren – hier müssen wir ja ggf.
ein Rollback vornehmen und benötigen also den aktuellen Puffer dann
noch.)

Die Funktion `sync` stellt sicher, dass ab der Position `start` noch `i`
unverbrauchte Token im Puffer sind.

### Hinweis

Die Methode `count` liefert die Anzahl der aktuell gespeicherten
Elemente in `lookahead` zurück (nicht die Gesamtzahl der Plätze in der
Liste – diese kann größer sein). Mit der Methode `add` wird ein Element
hinten an die Liste angefügt, dabei wird das Token auf den nächsten
Index-Platz (`count`) geschrieben und ggf. die Liste ggf. automatisch um
weitere Speicherplätze ergänzt. Über `clear` werden die Elemente in der
Liste gelöscht, aber der Speicherplatz erhalten (d.h. `count()` liefert
den Wert 0, aber ein `add` müsste nicht erst die Liste mit weiteren
Plätzen erweitern, sondern könnte direkt an Index 0 das Token
schreiben).

### Backtracking führt zu Problemen

1.  Backtracking kann *sehr* langsam sein (Ausprobieren vieler
    Alternativen)
2.  Der spekulative Match muss ggf. rückgängig gemacht werden
3.  Man muss bereits gematchte Strukturen erneut matchen (=\> Abhilfe:
    Packrat-Parsing)

## Verbesserung Backtracking: Packrat Parser (Memoizing)

<img src="images/packrat.png" width="60%">

Bei der Eingabe `wuppie();` wird zunächst spekulativ die erste
Alternative `fdef` untersucht und ein `head` gematcht. Da die
Alternative nicht komplett passt (es kommt ein “;” statt einem “{”),
muss die Spekulation rückgängig gemacht werden und die zweite
Alternative `fdecl` untersucht werden. Dabei muss man den selben Input
erneut auf `head` matchen! (Und wenn die Spekulation (irgendwann)
erfolgreich war, muss noch einmal ein `head` gematcht werden …)

Idee: Wenn `head` sich merken würde, ob damit ein bestimmter Teil des
Tokenstroms bereits behandelt wurde (erfolgreich oder nicht), könnte man
das Spekulieren effizienter gestalten. Jede Regel muss also durch eine
passende Regel mit Speicherung ergänzt werden.

Dies wird auch als
[“Memoization”](https://en.wikipedia.org/wiki/Memoization) bezeichnet
und ist eine zentrales Technik des Packrat Parsers (vgl. Ford
([2006](#ref-Packrat2006))).

## Skizze: Idee des Packrat-Parsing

``` python
head_memo = {}

def head():
    if head_memo.get(start) == -1:
        raise Exception()                         # kein Match
    if head_memo.get(start) >= 0:
        start = head_memo[start]; return True     # Vorspulen
    else:
        failed = False; start_ = start
        try: ...     # rufe die ursprüngliche head()-Regel auf
        catch(e): failed = True; raise e
        finally: head_memo[start_] = (failed ? -1 : start)
```

Quelle: Eigener Code basierend auf einer Idee nach ([Parr
2010](#ref-Parr2010), pp. 65/66)

- Wenn bereits untersucht (Eintrag vorhanden): Vorspulen bzw. Exception
  werfen
- Sonst (aktuelle Position noch nicht in der Tabelle =\> Regel noch
  nicht an dieser Position getestet):
  - Original-Regel ausführen
  - Exception: Regel hatte keinen Erfolg =\> merken und Exception weiter
    reichen
- Ergebnis für diese Startposition und diese Regel merken:
  - Falls Regel erfolgreich, dann Start-Position und die aktuelle
    Position (Stopp-Position) in der Tabelle für diese Regel notieren
  - Falls Regel nicht erfolgreich, zur Start-Position eine ungültige
    Position setzen

### Anmerkung *consume()*

Die Funktion `consume()` muss passend ergänzt werden: Wann immer man den
`lookahead`-Puffer zurücksetzt, werden alle `*_memo` ungültig und müssen
ebenfalls zurückgesetzt werden!

## Semantische Prädikate

Problem in Java: `enum` ab Java5 Schlüsselwort (vorher als
Identifier-Name verwendbar)

``` antlr
prog : (enumDecl | stat)+ ;
stat : ... ;

enumDecl : ENUM id '{' id (',' id)* '}' ;
```

Wie kann ich eine Grammatik bauen, die sowohl für Java5 und später als
auch für die Vorgänger von Java5 funktioniert?

Angenommen, man hätte eine Hilfsfunktion (“Prädikat”), mit denen man aus
dem Kontext heraus die Unterscheidung treffen kann, dann würde die
Umsetzung der Regel ungefähr so aussehen:

``` python
def prog():
    if lookahead(1) == ENUM and java5: enumDecl()
    else: stat()
```

## Semantische Prädikate in ANTLR

### Semantische Prädikate in Parser-Regeln

``` antlr
@parser::members {public static boolean java5;}

prog : ({java5}? enumDecl | stat)+ ;
stat : ... ;

enumDecl : ENUM id '{' id (',' id)* '}' ;
```

Prädikate in Parser-Regeln aktivieren bzw. deaktivieren alles, was nach
der Abfrage des Prädikats gematcht werden könnte.

### Semantische Prädikate in Lexer-Regeln

Alternativ für Lexer-Regeln:

``` antlr
ENUM : 'enum' {java5}? ;
ID   : [a-zA-Z]+ ;
```

Bei Token kommt das Prädikat erst am rechten Ende einer Lexer-Regel vor,
da der Lexer keine Vorhersage macht, sondern nach dem längsten Match
sucht und die Entscheidung erst trifft, wenn das ganze Token gesehen
wurde. Bei Parser-Regeln steht das Prädikat links vor der entsprechenden
Alternative, da der Parser mit Hilfe des Lookaheads Vorhersagen trifft,
welche Regel/Alternative zutrifft.

*Anmerkung*: Hier wurden nur Variablen eingesetzt, es können aber auch
Methoden/Funktionen genutzt werden. In Verbindung mit einer
Symboltabelle ([“Symboltabellen”](cb_symboltabellen1.html)) und/oder mit
Attributen und Aktionen in der Grammatik
([“Attribute”](cb_attribute.html) und [“Interpreter:
Attribute+Aktionen”](cb_interpreter2.html)) hat man hier ein mächtiges
Hilfswerkzeug!

## Wrap-Up

- LL(1) und LL(k): Erweiterungen
  - Dynamischer Lookahead: BT-Parser mit Packrat-Ergänzung
  - Semantische Prädikate zum Abschalten von Alternativen

## 📖 Zum Nachlesen

- Parr ([2010](#ref-Parr2010)): Kapitel 3
- Parr ([2014](#ref-Parr2014))
- Mogensen ([2017](#ref-Mogensen2017)): Kapitel 2 (insbesondere
  Abschnitte 2.3 bis (einschließlich) 2.19)
- Aho u. a. ([2023](#ref-Aho2023)): Abschnitte 2.4 und 4.4
- Grune u. a. ([2012](#ref-Grune2012)): Abschnitte 3.1 bis
  (einschließlich) 3.4
- Ford ([2006](#ref-Packrat2006))

------------------------------------------------------------------------

> [!TIP]
>
> <details>
>
> <summary><strong>✅ Lernziele</strong></summary>
>
> - k3: Implementierung von LL(1)- und LL(k)-Parsern
> - k3: Dynamischer Lookahead mittels Backtracking; Verbesserung der
>   Laufzeiteigenschaften mit Packrat
> - k3: Einsatz von semantischen Prädikaten zum (De-) Aktivieren von
>   Regeln oder Token
>
> </details>

------------------------------------------------------------------------

> [!NOTE]
>
> <details>
>
> <summary><strong>👀 Quellen</strong></summary>
>
> <div id="refs" class="references csl-bib-body hanging-indent"
> entry-spacing="0">
>
> <div id="ref-Aho2023" class="csl-entry">
>
> Aho, A. V., M. S. Lam, R. Sethi, J. D. Ullman, und S. Bansal. 2023.
> *Compilers: Principles, Techniques, and Tools, Updated 2nd Edition by
> Pearson*. Pearson India.
> <https://learning.oreilly.com/library/view/compilers-principles-techniques/9789357054881/>.
>
> </div>
>
> <div id="ref-Packrat2006" class="csl-entry">
>
> Ford, B. 2006. „Packrat Parsing: Simple, Powerful, Lazy, Linear Time“.
> *CoRR* abs/cs/0603077. <http://arxiv.org/abs/cs/0603077>.
>
> </div>
>
> <div id="ref-Grune2012" class="csl-entry">
>
> Grune, D., K. van Reeuwijk, H. E. Bal, C. J. H. Jacobs, und K.
> Langendoen. 2012. *Modern Compiler Design*. Springer.
>
> </div>
>
> <div id="ref-Mogensen2017" class="csl-entry">
>
> Mogensen, T. 2017. *Introduction to Compiler Design*. Springer.
> <https://doi.org/10.1007/978-3-319-66966-3>.
>
> </div>
>
> <div id="ref-Parr2010" class="csl-entry">
>
> Parr, T. 2010. *Language Implementation Patterns*. Pragmatic
> Bookshelf.
> <https://learning.oreilly.com/library/view/language-implementation-patterns/9781680500097/>.
>
> </div>
>
> <div id="ref-Parr2014" class="csl-entry">
>
> ———. 2014. *The Definitive ANTLR 4 Reference*. Pragmatic Bookshelf.
> <https://learning.oreilly.com/library/view/the-definitive-antlr/9781941222621/>.
>
> </div>
>
> </div>
>
> </details>

------------------------------------------------------------------------

<img src="https://licensebuttons.net/l/by-sa/4.0/88x31.png" width="10%">

Unless otherwise noted, this work is licensed under CC BY-SA 4.0.

**Exceptions:**

- Eigener Code basierend auf einer Idee nach ([Parr
  2010](#ref-Parr2010), pp. 61/62)
- Eigener Code basierend auf einer Idee nach ([Parr
  2010](#ref-Parr2010), p. 60)
- Eigener Code basierend auf einer Idee nach ([Parr
  2010](#ref-Parr2010), pp. 65/66)

<blockquote><p><sup><sub><strong>Last modified:</strong> 5b3a3e7 (tooling: rename repo from 'cb-lecture' to 'cpl-lecture', 2025-08-13)<br></sub></sup></p></blockquote>
