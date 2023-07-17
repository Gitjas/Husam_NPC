
/* Husam Romance "Conflict" */

EXTEND_BOTTOM c#husamj %other_romance_00%
IF ~Global("L#1VerrRomanceActive","GLOBAL",2)~ THEN + verrsza
END

EXTEND_BOTTOM c#husamj %other_romance_01%
IF ~Global("L#1VerrRomanceActive","GLOBAL",2)~ THEN + verrsza
END

APPEND c#husamj

IF ~~ THEN verrsza
SAY ~[Husam]Ich fürchte, dass Euer erster Ansprechpartner für dieses Bedürfnis Euer Geliebter, Verrsza, sein sollte, <CHARNAME>. Zumindest, wenn ich Eure Beziehung nicht komplett falsch einschätze.~
= ~[Husam]Ich bin durchaus mit dem Spiel des unverbindlichen Austauschs körperlicher Intimitäten vertraut und absolut nicht zögerlich, es einzugehen. *Ich* hätte überhaupt kein Problem mit einem Seitensprung, unabhängig vom Beziehungsstatus des anderen.~
= ~Aber Euer Geliebter ist ein Rakshasa - ein Pantheratiger. Deren Geruchssinn ist überaus ausgeprägt ... und besser als alles, was ich vertuschen könnte. Ich kann keine Turbulenzen in der Gruppe riskieren, <CHARNAME>. Die emotionale, romantische Art ist die gefährlichste. Ich kann es mir nicht leisten, den Erfolg dieser Mission zu riskieren - meinen Erfolg in dieser Mission.~
++ ~Hmm, da ist was Wahres dran. Es bleibt dann wohl bei unseren Flirts, Husam.~ + %pid_wohlbefinden_14% 
++ ~Na gut. Dann wird das wohl nichts mit uns. Lasst uns wieder zu einem Verhältnis zwischen Reisekameraden zurückkehren.~ + %other_romance_reaction_04%
END
END //APPEND
