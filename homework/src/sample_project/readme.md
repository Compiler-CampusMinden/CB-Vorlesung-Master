# Compiler Sample Project

Dies ist ein Starter-Projekt für die Übungsaufgaben in "Concepts of Programming
Languages" (Master). Es existiert eine [Gradle-Konfiguration](build.gradle)
(Java-Projekt), [JUnit](https://junit.org/junit5/) und
[ANTLR](https://www.antlr.org/) sind auch bereits eingebunden. Das Projekt zeigt die
Einbindung der ANTLR-Grammatiken. Zusätzlich existieren
[Beispielgrammatiken](src/main/antlr/) für einige Übungsblätter.

## Installation

Öffnen Sie den Ordner `sample_project` als neues Java-Projekt "mit existierenden
Quellen" in [IntelliJ](https://www.jetbrains.com/idea/). Achten Sie dabei darauf,
dass Sie als "Build Model" entsprechend "Gradle" auswählen, damit die Konfiguration
übernommen wird.

Sie benötigen ein installiertes [Java SE Development Kit 21
LTS](https://jdk.java.net/21/). Achten Sie darauf, dass dieses auch wirklich von
IntelliJ verwendet wird (zu finden unter Projekt-Einstellungen).

Weitere Software ist nicht notwendig. ANTLR und JUnit werden über das Build-Skript
automatisch als Dependency heruntergeladen und eingebunden. Es empfiehlt sich
dennoch, zusätzlich das [ANTLR-Plugin für
IntelliJ](https://plugins.jetbrains.com/plugin/7358-antlr-v4) zu installieren -
damit können Sie in der IDE interaktiv mit den Grammatiken experimentieren und
müssen nicht immer das gesamte Programm kompilieren und laufen lassen.

Sie können natürlich auch eine beliebige andere IDE oder sogar einen einfachen
Editor verwenden.

## Gradle-Tasks

### Aufräumen

`./gradlew clean`

### Starten des Programms

Konfigurieren Sie Ihr Programm im [`build.gradle`](build.gradle) in der Variablen
`mainClass`.

Danach können Sie das Programm kompilieren und starten über `./gradlew run`.

### Formatieren

Ihre Java-Sourcen können Sie mit `./gradlew spotlessApply` formatieren.

### Testen

`./gradlew check`

### Grammatik neu übersetzen

Die ANTLR-Grammatiken werden im Ordner [`src/main/antlr`](src/main/antlr/) erwartet.
Sie werden standardmäßig beim Bauen der Applikation übersetzt, also beispielsweise
beim Ausführen von `./gradlew run` oder `./gradlew build`.

Die dabei generierten Dateien werden im Build-Ordner
[`build/generated-src/antlr/main/`](build/generated-src/antlr/main/) abgelegt und
sind über die Gradle-Konfiguration automatisch im Classpath verfügbar.

Falls Ihre Grammatik in einem Package liegt (beispielsweise
[`HelloPackage.g4`](src/main/antlr/my/pkg/HelloPackage.g4) im Package `my.pkg`),
dann wird für die generierten Sourcen im Build-Ordner automatisch dieses Package mit
angelegt. Damit später die Einbindung in Ihr Programm funktioniert, sollten Sie
entsprechend in der Grammatik über die Direktive `@header` die entsprechende
Package-Deklaration mit in die generierten Sourcen hineingenerieren lassen.

Wenn Sie die Grammatik einzeln übersetzen wollen, können Sie dies mit
`./gradlew generateGrammarSource` tun.

<!--  pandoc -s -f markdown -t markdown+smart-grid_tables-multiline_tables-simple_tables --columns=94 readme.md -o xxx.md  -->
