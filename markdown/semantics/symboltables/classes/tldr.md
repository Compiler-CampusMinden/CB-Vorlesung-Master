---
title: "TL;DR"
disableToc: true
hidden: true
---


Strukturen und Klassen bilden jeweils einen eigenen verschachtelten Scope, worin
die Attribute und Methoden definiert werden.

Bei der Namensauflösung muss man dies beachten und darf beim Zugriff auf Attribute
und Methoden nicht einfach in den übergeordneten Scope schauen. Zusätzlich müssen
hier Vererbungshierarchien in der Struktur der Symboltabelle berücksichtigt werden.
