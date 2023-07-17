
/* Husam Romance "Conflict" */

EXTEND_BOTTOM c#husamj %other_romance_00%

IF ~Global("X#DynaheirRomanceActive","GLOBAL",2)
Global("X#DynaheirRomanceInactive","GLOBAL",0)~ THEN + dynaheir_bg1npc
END

EXTEND_BOTTOM c#husamj %other_romance_01%

IF ~Global("X#DynaheirRomanceActive","GLOBAL",2)
Global("X#DynaheirRomanceInactive","GLOBAL",0)~ THEN + dynaheir_bg1npc
END

APPEND c#husamj

IF ~~ THEN dynaheir_bg1npc
SAY ~[Husam]Ich fürchte, dass Euer erster Ansprechpartner für dieses Bedürfnis Eure Geliebte, Dynaheir, sein sollte, <CHARNAME>.~
IF ~~ THEN + %other_romance_02%
END
END //APPEND
