---
title: "TL;DR"
disableToc: true
hidden: true
---


In Symboltabellen werden Informationen über Bezeichner verwaltet. Wenn es in der zu
übersetzenden Sprache *Nested Scopes* gibt, spiegelt sich dies in den Symboltabellen
wider: Auch hier wird eine entsprechende hierarchische Organisation notwendig. In der
Regel nutzt man Tabellen, die untereinander verlinkt sind.

Eine wichtige Aufgabe ist das Binden von Bezeichner gleichen Namens an ihren jeweiligen
Scope => `bind()`. Zusätzlich müssen Symboltabellen auch das Abrufen von Bezeichnern
aus dem aktuellen Scope oder den Elternscopes unterstützen => `resolve()`.
