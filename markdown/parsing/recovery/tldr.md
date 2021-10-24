---
title: "TL;DR"
disableToc: true
hidden: true
---


Umgang mit Fehlern ist im Compiler sehr wichtig: Falscher Code darf nicht in ein ausführbares Programm
umgewandelt werden oder ausgeführt werden, gleichzeitig erwarten Nutzer zielführende Fehlermeldungen
und auch das Erkennen von möglichst mehreren Fehlern in einem Lauf.

Auf der Ebene des Parsers kann man Fehler in Bezug auf die Grammatik erkennen. Typische Strategien sind
das Entfernen von Token aus dem Eingabestrom, bis wieder ein Token erscheint, welches die weitere Abarbeitung
der aktuellen Regel erlaubt ("Synchronisierung"). Dies sind oft Zeilenenden, ein Semikolon oder eine schließende
geschweifte Klammer. Dieses recht einfache, aber grobe Vorgehen kann verfeinert werden, indem man versucht,
überschüssige Token zu entfernen oder fehlender Token zu ersetzen. In ANTLR wird beispielsweise maximal ein
fehlendes Token virtuell "ersetzt" bzw. max. ein überschüssiges Token entfernt, damit man den restlichen Code
weiter parsen kann. Wenn mehr als ein Token fehlt oder zuviel ist, geht ANTLR in einen "Panic Mode" und
entfernt so lange Token aus dem Eingabestrom, bis das aktuelle Token in einem *Resynchronization Set* enthalten
ist. Die Bildung dieser Menge erinnert an die Regeln zum Bilden der *FOLLOW*-Mengen, ist aber an den Kontext
der "aufgerufenen" Parser-Regeln gebunden. Zusätzlich gibt es weitere Strategien zum Behandeln von Fehlern in
Schleifen sowie zur Vermeidung von Endlos-Fehlerbehebungsschleifen ("Fail-Save"). In Bison wird dagegen mit
einem speziellen *error*-Token gearbeitet und man fügt an "strategischen" Stellen Regeln der Form Regel $A \to
\operatorname{error} \alpha$ hinzu. Dabei ist $\alpha$ ein Token, welches zur Synchronisierung genutzt werden
soll. Im Fehlerfall werden so lange Token vom Stack entfernt, bis man eine Regel $A \to \operatorname{error}
\alpha$ anwenden kann und das *error*-Token shiften kann. Danach werden ggf. so lange Token aus dem Eingabestrom
entfernt, bis das Token $\alpha$ auftaucht und man die Regel mit einem *reduce* abschließen kann. Diese Form
der Behandlung stellt einen Kompromiss zwischen Aufwand (auch Zeit) und Nutzen dar.

Zusätzlich kann man in der Grammatik bereits typische Fehler (vergessene Klammern oder Typos wie Dreher bei
Schlüsselwörtern) schon über "Fehlerproduktionen" vorwegnehmen. Das bedeutet, dass man eine Regel formuliert,
die diesen typischen Tippfehler akzeptiert (und korrigiert), aber zusätzlich eine Warnung generiert. Es muss
dann aber jeweils entschieden werden, ob der entsprechende Quellcode in ein ausführbares Programm übersetzt
werden darf.
