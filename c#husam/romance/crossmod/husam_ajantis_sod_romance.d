
/* Husam Romance "Conflict" */

EXTEND_BOTTOM c#husamj %other_romance_00%
IF ~Global("X#AjantisRomanceActive","GLOBAL",2)~ THEN + ajantis_bg1npc_sod
END

EXTEND_BOTTOM c#husamj %other_romance_01%
IF ~Global("X#AjantisRomanceActive","GLOBAL",2)~ THEN + ajantis_bg1npc_sod
END

APPEND c#husamj

IF ~~ THEN ajantis_bg1npc_sod
SAY ~[Husam]Ich fürchte, dass Euer erster Ansprechpartner für dieses Bedürfnis Euer Verlobter, Ajantis, sein sollte, <CHARNAME>.~
IF ~~ THEN + %other_romance_02%
END
END //APPEND
