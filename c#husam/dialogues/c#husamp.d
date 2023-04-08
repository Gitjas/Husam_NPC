BEGIN C#HUSAMP


IF ~!InParty(Myself) Global("C#HusamJoined","GLOBAL",1)
!Global("C#Husam3_AgainstBodhi","GLOBAL",1)~ THEN kickout
SAY @0 /* Yes, <CHARNAME>? */
++ @1 /* I just need you to make some room. Get in line behind me. */ + follow_companion
++ @2 /* My mistake - stay where you were. */ + rejoin
+ ~%IT_IS_SOD%~ + @3 /* Can you wait for me here? */ + wait
+ ~%IT_IS_SOD%~ + @4 /* I changed my mind, Husam. I don't want you around any more. */ + go
+ ~!%IT_IS_SOD%~ + @4 /* I changed my mind, Husam. I don't want you around any more. */ + go_thievesguild
END

IF ~~ THEN wait
SAY @5 /* I'd rather not. Officially having an eye on your actions kind of includes being at your side. */
++ @1 /* I just need you to make some room. Get in line behind me. */ + follow_companion
++ @2 /* My mistake - stay where you were. */ + rejoin
+ ~%IT_IS_SOD%~ + @4 /* I changed my mind, Husam. I don't want you around any more. */ + go
END


IF ~~ THEN follow_companion
SAY @6 /* As you wish. */
IF ~~ THEN DO ~SetInterrupt(FALSE)
//##RealSetGlobalTimer("C#HusamNPCBanterTimer","GLOBAL",400)
SetGlobal("C#HusamJoined","GLOBAL",2) 
MakeGlobal()
ChangeEnemyAlly(Myself, FAMILIAR)
AddFamiliar()
SetDialog("C#Husamj")
//ChangeAIScript("DEFAULT",CLASS)
ChangeAIScript("THIEF4",CLASS)
ChangeAIScript("",RACE)
ChangeAIScript("",GENERAL)
ChangeAIScript("",DEFAULT)
SetGlobal("C#LevelUp","LOCALS",0)
SetInterrupt(TRUE)~ EXIT
END

IF ~~ THEN go
SAY @7 /* If I go now it will be final, <CHARNAME>. I will not sit around for you to come back. */
++ @1 /* I just need you to make some room. Get in line behind me. */ + follow_companion
++ @2 /* My mistake - stay where you were. */ + rejoin
++ @8 /* I'm aware. I want you to leave. */ + go_01
END

IF ~~ THEN go_01
SAY @9 /* Hm, that's a pity, <CHARNAME>. Farewell, then. */
IF ~~ THEN DO ~SetGlobal("C#HusamJoined","GLOBAL",0)
EscapeArea()~ EXIT
END

IF ~~ THEN rejoin
SAY @10 /* With pleasure. */
IF ~~ THEN DO ~SetGlobal("C#HusamJoined","GLOBAL",1) JoinParty()~ EXIT
END

IF ~~ THEN go_thievesguild
SAY @11 /* You'll find me in the Thieves' Guild, then. */
IF ~~ THEN DO ~SetGlobal("C#HusamJoined","GLOBAL",0)
EscapeAreaMove("AR0305",1095,620,0)~ EXIT
END

IF ~GlobalGT("C#Husam3_AgainstBodhi","GLOBAL",0)
GlobalLT("C#Husam3_AgainstBodhi","GLOBAL",4)~ THEN fight_bodhi
SAY @12 /* I stand ready to fight Bodhi, <CHARNAME>. */
+ ~NumInPartyLT(6)~ + @13 /* Join me, Husam. */ DO ~SetGlobal("C#Husam3_AgainstBodhi","GLOBAL",4)
ChangeAIScript("c#husam2",OVERRIDE) ChangeAIScript("",DEFAULT)~ + rejoin
+ ~NumInParty(6)~ + @13 /* Join me, Husam. */ DO ~SetGlobal("C#Husam3_AgainstBodhi","GLOBAL",4)
ChangeAIScript("c#husam2",OVERRIDE) ChangeAIScript("",DEFAULT)~ + follow_companion
++ @14 /* Very well. */ EXIT
END
