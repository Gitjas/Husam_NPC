


/* Transitions. SoD AND direct BGII transition. Husam will leave. */

APPEND C#HusamJ 
IF WEIGHT #-1
~Global("C#Husam_TransitionsLeave","GLOBAL",1)~ THEN sod_leave
SAY @1 /* ~If you leave the Sword Coast and the Crusade I am afraid our companionship ends here. It was a pleasure to work with you, <CHARNAME>. Farewell.~ */
IF ~InParty("C#Husam1")~ THEN DO ~SetInterrupt(FALSE)
SetGlobal("#L_BG2ExitModded","LOCALS",2)
SetGlobal("C#Husam_TransitionsLeave","GLOBAL",4)
MakeGlobal()
SetGlobal("C#HusamJoined","GLOBAL",0)
ChangeAIScript("",DEFAULT)
LeaveParty()
EscapeArea()
SetInterrupt(TRUE)~ EXIT
IF ~Global("C#HusamJoined","GLOBAL",2)~ THEN DO ~SetInterrupt(FALSE)
SetGlobal("#L_BG2ExitModded","LOCALS",2)
SetGlobal("C#Husam_TransitionsLeave","GLOBAL",4)
MakeGlobal()
SetGlobal("C#HusamJoined","GLOBAL",0)
ChangeAIScript("",DEFAULT)
RemoveFamiliar()
ChangeEnemyAlly(Myself,NEUTRAL)
EscapeArea() 
SetInterrupt(TRUE)~ EXIT
END


END //APPEND
