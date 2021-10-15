---
title: "TL;DR"
disableToc: true
hidden: true
---


![](images/architektur_cb_parser.png)

Man kann einen LL(k)-Parser bei Bedarf um ein "spekulatives Matching" ergänzen. Dies ist in Situationen
relevant, wo man das $k$ nicht vorhersehen kann, etwa bei der Unterscheidung einer Vorwärtsdeklaration
und einer Funktionsdefinition in C. Hier kann man erst nach dem Parsen des Funktionsnamens entscheiden,
welche Situation vorliegt; der Funktionsname kann dabei (nahezu) beliebig lang sein.

Beim spekulativen Matching muss man sich merken, an welcher Position im Tokenstrom man die Spekulation
gestartet hat, um im Fall des Nichterfolgs dorthin wieder zurückspringen zu können ("Backtracking").

Das Backtracking kann sehr langsam werden durch das Ausprobieren mehrerer Alternativen und das jeweils
nötige Zurückrollen. Zudem kann es passieren, dass eine bestimmte Sequenz immer wieder erkannt werden
muss. Hier hilft eine weitere Technik: **Packrat Parsing** [@Packrat2006] (nutzt
["*memoisation*"](https://en.wikipedia.org/wiki/Memoization)). Hierbei führt man pro Regel eine Map mit,
in der zu einer Position im Tokenstrom festgehalten wird, ob diese Regel an/ab dieser Position bereits
erfolgreich oder nicht erfolgreich war. Dies kann man dann nutzen, um bei einem erneuten Parsen der
selben Regel "vorzuspulen".

In ANTLR kann man *semantische Prädikate* benutzen, um Alternativen "abzuschalten". Dies ist beispielsweise
nützlich, wenn man nur eine Grammatik für unterschiedliche Versionen einer Sprache implementieren will.

Eine gute Darstellung finden Sie in [@Parr2010] (Kapitel 3) und in [Packrat2006].
