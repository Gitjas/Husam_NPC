/* /////////////////////////////////////////////////////////////
3. If PC said ~Nun, ich fühle mich einfach wohler, wenn ich die Leute kenne, mit denen ich zusammenarbeite, Husam.~ 
+ Flirtcount is at ~4 
=> Husam hebt das Spiel aufs nächste Level: ~[Husam]Hmmm, es gibt viele Wege, für Wohlbefinden zu sorgen, <CHARNAME>. Nicht alle davon erfordern Reden.~
//////////////////////////////////////////////////////////////////////
*/
APPEND c#husamj

/* dialgue start if Husam put HC on hold and initiates dialogue when flirt count is high enough */
IF WEIGHT #-1
~GlobalGT("C#HU_SoDPID_romstage1","LOCALS",0)
Global("C#HU_RomanceCounter","GLOBAL",4)~ THEN reached_counter2
SAY ~<CHARNAME>, unser ... intimes Spiel der doppeldeutigen Worte erfreut mich sehr. Ich habe auch mitnichten Eure, ich nenne es mal Anfrage, vergessen.~
IF ~~ THEN + pid_wohlbefinden_06
END

/* this dialogue also starts if PC flited long enough without asking for intimacies themselves */
/* and no other detected committed romance */
IF WEIGHT #-1
~Global("C#HU_SoDPID_romstage1","LOCALS",0)
Global("C#HU_RomanceCounter","GLOBAL",4)~ THEN pid_wohlbefinden_01
SAY ~Es gibt viele Wege, sich "kennen zu lernen", <CHARNAME>. Wir spielten bisher ein recht attraktives Spiel der doppeldeutigen Worte, das uns, würde ich sagen, bereits sehr viel näher gebracht hat. Dieses Spiel hat sogar das Potential, dass wir uns noch viel intensiver und ... intimer kennen lernen könnten - und das, OHNE dass wir dabei viele Worte verlieren.~
/*
+ ~[##dialog im Palast fand statt]~ + ~Schon wieder so eindeutig zweideutige Bemerkungen. Worauf wollt Ihr hinaus, Husam?~ + pid_wohlbefinden_02
+ ~[##dialog im Palast fand statt]~ + ~In der Tat. Und manche davon hätten eine gute Verwendung für Eure bereits erwähnten ... Spezialwerkzeuge, Husam, hmm?~ + 
*/
+ ~OR(3)
GlobalGT("RE1_HusamSex","GLOBAL",0)
Global("C#LC_HusamEncounter","GLOBAL",4)
Global("C#LC_HusamEncounter","GLOBAL",25)~ + ~Ich erinnere mich da an Euer Angebot in Baldurs Tor ...~ + bg1re_memento
++ ~Das war entweder eine versteckte Anspielung oder ein ziemlich eindeutiges Angebot.~ + pid_wohlbefinden_02
++ ~Bietet Ihr mir gerade Intimitäten an?~ + pid_wohlbefinden_02
++ ~Meint Ihr solche, bei denen man SEHR eng miteinander arbeitet und sich ZIEMLICH innig kennenlernt?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + pid_wohlbefinden_01b
END

IF ~~ THEN pid_wohlbefinden_01b
SAY ~[Husam](Er lächelt.) Genau solche, <CHARNAME>.~
IF ~~ THEN + pid_wohlbefinden_02
END

IF ~~ THEN pid_wohlbefinden_02
SAY ~[Husam]Wie möchtet Ihr es denn verstanden wissen?~ + ~Global("RE1_HusamSex","GLOBAL",0)
!Global("C#LC_HusamEncounter","GLOBAL",4)
!Global("C#LC_HusamEncounter","GLOBAL",25)~ + ~Als Angebot für Intimitäten. Und ich hoffe sehr für Euch, dass Ihr Euch keinen Scherz mit mir erlaubt.~ + pid_wohlbefinden_05
+ ~OR(3)
GlobalGT("RE1_HusamSex","GLOBAL",0)
Global("C#LC_HusamEncounter","GLOBAL",4)
Global("C#LC_HusamEncounter","GLOBAL",25)~ + ~Ich erinnere mich da an Euer Angebot in Baldurs Tor ...~ + bg1re_memento
++ ~Als eine Fortführung unseres verbalen Spiels - eine versteckte Anspielung, an die ich mich in einem ungestörten Moment zurückbesinnen kann, um bei der Vorstellung all ihrer verheißungsvollen Möglichkeiten bis in die Haarspitzen zu erröten.~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",3)~ + pid_wohlbefinden_14
++ ~Ich finde es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",3)~ + pid_wohlbefinden_14
++ ~Ihr sagt mir erst wie Ihr es meintet, Husam.~ + pid_wohlbefinden_03
++ ~Ehrlich gesagt, nein. Ich bin nicht an Intimitäten mit Euch interessiert. Lasst uns das ganze Thema beenden und auf eine Zusammenarbeit als Kampfgefährten konzentrieren.~ + pid_konditionen_08
END

IF ~~ THEN pid_wohlbefinden_03
SAY ~[Husam]Ihr meint, ich soll mich als Erster ... nackig machen?~
IF ~~ THEN + pid_wohlbefinden_04
END

IF ~~ THEN pid_wohlbefinden_04
SAY ~[Husam]Ich meine es in jeder Hinsicht, die Ihr Euch vorstellen könnt, <CHARNAME> - wie Ihr meine Aussage verstanden wissen wollt, müsst jedoch Ihr entscheiden.~
+ ~Global("RE1_HusamSex","GLOBAL",0)
!Global("C#LC_HusamEncounter","GLOBAL",4)
!Global("C#LC_HusamEncounter","GLOBAL",25)~ + ~Als Angebot für Intimitäten. Und ich hoffe sehr für Euch, dass Ihr Euch keinen Scherz mit mir erlaubt.~ + pid_wohlbefinden_05
+ ~OR(3)
GlobalGT("RE1_HusamSex","GLOBAL",0)
Global("C#LC_HusamEncounter","GLOBAL",4)
Global("C#LC_HusamEncounter","GLOBAL",25)~ + ~Ich erinnere mich da an Euer Angebot in Baldurs Tor ...~ + bg1re_memento
++ ~Als eine Fortführung unseres verbalen Spiels - eine versteckte Anspielung, an die ich mich in einem ungestörten Moment zurückbesinnen kann, um bei der Vorstellung all ihrer verheißungsvollen Möglichkeiten bis in die Haarspitzen zu erröten.~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",3)~ + pid_wohlbefinden_14
++ ~Ich finde es sehr reizvoll, einfach nur mit Euch zu flirten, Husam.~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",3)~ + pid_wohlbefinden_14
++ ~Ehrlich gesagt, nein. Ich bin nicht an Intimitäten mit Euch interessiert. Lasst uns das ganze Thema beenden und auf eine Zusammenarbeit als Kampfgefährten konzentrieren.~ + pid_konditionen_08
END
END //APPEND

CHAIN
IF ~~ THEN c#husamj pid_wohlbefinden_05
~[Husam]Ich scherze mitnichten. Ich lote gewisse Möglichkeiten aus, <CHARNAME>.~
== c#husamj IF ~Global("C#HU_praiseThievingTools","LOCALS",0)~ THEN ~[Husam]Als erfahrener und fähiger Schurke bin ich außerordentlich geübt, geschickt und kann mit ... Werkzeugen jeder Art umgehen. Und ich bin auch nicht darum verlegen, meine einzusetzen.~
== c#husamj IF ~Global("C#HU_praiseThievingTools","LOCALS",1)~ THEN ~[Husam]Als erfahrener und fähiger Schurke bin ich außerordentlich geübt, geschickt und kann wie bereits erwähnt mit ... Werkzeugen jeder Art umgehen. Und ich bin auch nicht darum verlegen, meine einzusetzen.~
END
IF ~~ THEN + pid_wohlbefinden_06

APPEND c#husamj
IF ~~ THEN pid_wohlbefinden_06
SAY ~[Husam]Wäre das also Euer Wunsch, <CHARNAME>? Mit mir in intensiven aber unverbindlichen Momenten das Lager zu zerwühlen und die intimen Zonen unserer Körper zu erkunden?~
++ ~Genau das, Husam.~ + pid_wohlbefinden_07
++ ~(schnurr) Ja, und Ihr?~ + pid_wohlbefinden_07
++ ~Ich dachte, das wäre klar.~ + pid_wohlbefinden_07
++ ~Ich bin bereits heiß, Husam. Heizt es nicht noch mehr an, wenn es für Euch nicht in Frage kommt.~ + pid_wohlbefinden_13
++ ~Ehrlich gesagt finde ich es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",3)~ + pid_wohlbefinden_14
++ ~Ehrlich gesagt, nein. Ich bin nicht an Intimitäten mit Euch interessiert. Lasst uns das ganze Thema beenden und auf eine Zusammenarbeit als Kampfgefährten konzentrieren.~ + pid_konditionen_08
END

IF ~~ THEN pid_wohlbefinden_07
SAY ~[Husam]Wäre unsere Zusammenarbeit hier wie die in Baldurs Tor, als wir unseren eigenen Aufgaben verpflichtet waren, hätte ich Euch eventuell bereits angeboten, die Monotonie und Strapazen Eurer Suche mit einem, nennen wir es, ersprießlichen Zeitvertreib zu zerstreuen.~
IF ~~ THEN + pid_wohlbefinden_08
END

IF ~~ THEN pid_wohlbefinden_08
SAY ~[Husam]Diese Situation hier ist anders. Wir arbeiten zusammen. Was immer wir auch tun, darf nicht unsere Ziele gefährden.~ 
++ ~Oh? Befürchtet Ihr etwa, dass ich Euch zu sehr von Euren Schattendieb-Verpflichtungen ablenken könnte?~ + pid_wohlbefinden_09
++ ~Na, da werden wir doch wohl einen Weg finden, wie das möglich ist, oder?~ + pid_wohlbefinden_15
++ ~Macht Ihr etwa jetzt einen Rückzieher? Das ist nicht Euer Ernst, oder?~ + pid_wohlbefinden_11
END

IF ~~ THEN pid_wohlbefinden_09
SAY ~[Husam](Er lächelt.) Nun. Es bestünde ebenso die Gefahr, dass unser kleines Spiel EUCH zu sehr ablenken könnte ...~
++ ~Gar nicht! Es würde mir sehr helfen, mich besser ... auf die vor uns liegenden Aufgaben zu konzentrieren.~ + pid_wohlbefinden_10
++ ~Es wird mich noch viel mehr ablenken, wenn ein attraktiver Schurke mich nur mit pikanten Frivolitäten in Versuchung bringt!~ + pid_wohlbefinden_12
++ ~Macht Ihr etwa jetzt einen Rückzieher? Das ist nicht Euer Ernst, oder?~ + pid_wohlbefinden_11
END

IF ~~ THEN pid_wohlbefinden_10
SAY ~[Husam]Ihr meint der Erfolg unserer Mission hinge sogar davon ab? Ihr packt mich bei meiner Ehre als Schattendieb und Geschäftspartner, <CHARNAME>. Ich habe mich Euch angeschlossen und Ihr seid unser Anführer und der Held, auf den alle blicken ... Wann, wenn nicht jetzt, sollte ich ein Interesse daran haben, dass Ihr immer gefasst und ausgeglichen Euer Tageswerk begehen könnt? (Er lächelt.)~
IF ~~ THEN + pid_wohlbefinden_15
END

IF ~~ THEN pid_wohlbefinden_11
SAY ~[Husam]Mitnichten. Zweifelt nicht an meiner Bereitschaft zu solch einem Unterfangen.~
IF ~~ THEN + pid_wohlbefinden_15
END

IF ~~ THEN pid_wohlbefinden_12
SAY ~[Husam]Ich habe mich Euch angeschlossen und Ihr seid unser Anführer und der Held, auf den alle blicken ... Wann, wenn nicht jetzt, sollte ich ein Interesse daran haben, dass Ihr immer gefasst und ausgeglichen Euer Tageswerk begehen könnt? (Er lächelt.)~
IF ~~ THEN + pid_wohlbefinden_15
END

IF ~~ THEN pid_wohlbefinden_13
SAY ~[Husam]Ich habe nicht gesagt, dass es für mich nicht in Frage kommt.~
IF ~~ THEN + pid_wohlbefinden_07
END
END //APPEND

CHAIN
IF ~~ THEN c#husamj pid_wohlbefinden_14
@0 /* ~[Husam]Ich verstehe. (Er lächelt.) Dieses Spiel können wir ohne Einschränkung spielen, wenn Ihr wollt - so, wie wir es bereits taten. Ich jedenfalls werde es tun, solange Ihr willig seid.~ */
== c#husamj IF ~Global("C#HU_RomanceCounter","GLOBAL",0)~ THEN ~[Husam]Ich werde mir ebenfalls erlauben, auf dieses Spiel noch eingehender einzugehen. Stellt Euch also darauf ein, dass ich hierzu noch tiefer in die Thematik eindringen werde. (Er lächelt.)~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",1)~
END
IF ~~ THEN DO ~SetGlobal("C#HU_SoDPID_romstage1","LOCALS",4)
SetGlobal("C#HusamRomanceActive","GLOBAL",1)~ EXIT

APPEND c#husamj
IF ~~ THEN pid_wohlbefinden_15
SAY ~[Husam]Ihr habt also tatsächlich Interesse, unsere ... Aktivitäten  zu vertiefen. Dann sollten wir klären, was wir einander bieten können, <CHARNAME>. Was auch immer sich zwischen uns entwickelt wird keine sich dynamisch-chaotisch entwickelnde Beziehung sein, sondern eine rein physische, ablaufend nach klaren Regeln, die wir vorher festlegen - und es wird mit dem Ende unserer Zusammenarbeit gegen den Kreuzzug ebenfalls zu Ende gehen. Ist das soweit für Euch akzeptabel?~
++ ~Hmmm, das klingt ja vielversprechend. Legen wir auch gleich noch das Sortiment an möglichen Spielzeugen fest?~ + pid_wohlbefinden_16
++ ~Ich würde es gerne offen lassen, ob sich nicht etwas über das rein Körperliche hinaus entwickelt, Husam.~ + pid_wohlbefinden_18
++ ~Ich erwarte, dass Ihr solange keine anderen Intimpartner habt, Husam.~ + pid_wohlbefinden_17
+ ~GlobalGT("C#HU_RomanceCounter","GLOBAL",1)~ + ~Das klingt gut, lasst uns das machen!~ + konkrete_konditionen_02
+ ~!GlobalGT("C#HU_RomanceCounter","GLOBAL",1)~ + ~Das klingt gut, lasst uns das machen!~ + pid_wohlbefinden_19
++ ~Ich finde es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",3)~ + pid_wohlbefinden_14
++ ~Unter den Umständen verzichte ich ganz.~ + pid_konditionen_08
END

IF ~~ THEN pid_wohlbefinden_16
SAY ~[Husam](Er lächelt.) Wenn das Nutzen solcher Euer Begehr ist, dann sollten wir das definitiv tun.~
++ ~Ich würde es gerne offen lassen, ob sich nicht etwas über das rein Körperliche hinaus entwickelt, Husam.~ + pid_wohlbefinden_18
++ ~Ich erwarte, dass Ihr solange keine anderen Intimpartner habt, Husam.~ + pid_wohlbefinden_17
+ ~GlobalGT("C#HU_RomanceCounter","GLOBAL",1)~ + ~Das klingt gut, lasst uns das machen!~ + konkrete_konditionen_02
+ ~!GlobalGT("C#HU_RomanceCounter","GLOBAL",1)~ + ~Das klingt gut, lasst uns das machen!~ + pid_wohlbefinden_19
++ ~Ich finde es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",3)~ + pid_wohlbefinden_14
++ ~Unter den Umständen verzichte ich ganz.~ + pid_konditionen_08
END

IF ~~ THEN pid_wohlbefinden_17
SAY ~[Husam]Hmmm, verbindliche Exklusivität für mich - Ihr wollt wohl meine Bereitschaft steigern, <CHARNAME>? Seid unbesorgt. Ich gehe bereits genug Risiko damit ein, Euch an mich ran zu lassen.~
+ ~GlobalGT("C#HU_RomanceCounter","GLOBAL",1)~ + ~Das klingt gut, lasst uns das machen!~ + konkrete_konditionen_02
+ ~!GlobalGT("C#HU_RomanceCounter","GLOBAL",1)~ + ~Das klingt gut, lasst uns das machen!~ + pid_wohlbefinden_19
++ ~Ich finde es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",3)~ + pid_wohlbefinden_14
++ ~Unter den Umständen verzichte ich ganz.~ + pid_konditionen_08
END

IF ~~ THEN pid_wohlbefinden_18
SAY ~[Husam]Das wird es nicht, <CHARNAME>. Ich biete Euch körperliche Zerstreuung, unverbindlich und solange wir zusammen gegen den Kreuzzug ziehen.~
++ ~Ich erwarte, dass Ihr solange keine anderen Intimpartner habt, Husam.~ + pid_wohlbefinden_17
+ ~GlobalGT("C#HU_RomanceCounter","GLOBAL",1)~ + ~Das klingt gut, lasst uns das machen!~ + konkrete_konditionen_02
+ ~!GlobalGT("C#HU_RomanceCounter","GLOBAL",1)~ + ~Das klingt gut, lasst uns das machen!~ + pid_wohlbefinden_19
++ ~Ich finde es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",3)~ + pid_wohlbefinden_14
++ ~Unter den Umständen verzichte ich ganz.~ + pid_konditionen_08
END
END //APPEND

CHAIN
IF ~~ THEN c#husamJ pid_wohlbefinden_19
~[Husam]Darüber, wie wir das handhaben, so dass es zu unserer beiden Zufriedenheit geschieht, sollten wir uns bei der nächsten Gelegenheit ausführlicher unterhalten, teuerste/r <CHARNAME>.~
== c#husamj IF ~Global("C#HU_RomanceCounter","GLOBAL",0)~ THEN ~[Husam]Ich werde mir darüber hinaus erlauben, Euren Wunsch noch eingehender zu ... sondieren. Stellt Euch also darauf ein, dass ich hierzu noch tiefer in die Thematik eindringen werde, <CHARNAME>. (Er lächelt.)~
END
IF ~~ THEN DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",5)
SetGlobal("C#HU_SoDPID_romstage1","LOCALS",5)
SetGlobal("C#HusamRomanceActive","GLOBAL",1)~ EXIT


