/* PID */
/* additions to "status_pid" where the arrangement can be discussed (in sod_romance_pid.d) */
EXTEND_TOP c#husamj status_pid
+ ~Global("C#HusamRomanceActive","GLOBAL",2)
Global("C#HU_SoDRomanceIQ","LOCALS",0)
RandomNum(4,1)~ + ~(You say the codephrase you and Husam agreed on for your private sessions.) Husam, ich brauche Zugang zum *geheimen Wissen der Schattendiebe*. Lasst uns baldmöglichst eine *persönliche Unterredung* haben.~ + pc_requested
+ ~Global("C#HusamRomanceActive","GLOBAL",2)
Global("C#HU_SoDRomanceIQ","LOCALS",0)
RandomNum(4,2)~ + ~(You say the codephrase you and Husam agreed on for your private sessions.) Husam, ich brauche Zugang zum *geheimen Wissen der Schattendiebe*. Lasst uns baldmöglichst eine *persönliche Unterredung* haben.~ + pc_requested_01
+ ~Global("C#HusamRomanceActive","GLOBAL",2)
Global("C#HU_SoDRomanceIQ","LOCALS",0)
RandomNum(4,3)~ + ~(You say the codephrase you and Husam agreed on for your private sessions.) Husam, ich brauche Zugang zum *geheimen Wissen der Schattendiebe*. Lasst uns baldmöglichst eine *persönliche Unterredung* haben.~ + pc_requested_02
+ ~Global("C#HusamRomanceActive","GLOBAL",2)
Global("C#HU_SoDRomanceIQ","LOCALS",0)
RandomNum(4,4)~ + ~(You say the codephrase you and Husam agreed on for your private sessions.) Husam, ich brauche Zugang zum *geheimen Wissen der Schattendiebe*. Lasst uns baldmöglichst eine *persönliche Unterredung* haben.~ + pc_requested_03

/*
+ ~Global("C#HusamRomanceActive","GLOBAL",2)
Global("C#HU_SoDRomanceIQ","LOCALS",0)
[## extra talk 1 queued]~ + ~(You say the codephrase you and Husam agreed on for your private sessions.) Husam, ich brauche Zugang zum *geheimen Wissen der Schattendiebe*. Lasst uns baldmöglichst eine *persönliche Unterredung* haben.~ + pc_requested_04
*/

/* PC asked already */
+ ~Global("C#HusamRomanceActive","GLOBAL",2)
Global("C#HU_SoDRomanceIQ","LOCALS",1)
RandomNum(2,1)~ + ~(You say the codephrase you and Husam agreed on for your private sessions.) Husam, ich brauche Zugang zum *geheimen Wissen der Schattendiebe*. Lasst uns baldmöglichst eine *persönliche Unterredung* haben.~ + pc_requested_already
+ ~Global("C#HusamRomanceActive","GLOBAL",2)
Global("C#HU_SoDRomanceIQ","LOCALS",1)
RandomNum(2,2)~ + ~(You say the codephrase you and Husam agreed on for your private sessions.) Husam, ich brauche Zugang zum *geheimen Wissen der Schattendiebe*. Lasst uns baldmöglichst eine *persönliche Unterredung* haben.~ + pc_requested_already_01
END

APPEND c#husamj

IF ~~ THEN pc_requested
SAY ~I understand. You request is noted.~
IF ~~ THEN DO ~SetGlobal("C#HU_SoDRomanceIQ","LOCALS",1)~ + %pid%
END

IF ~~ THEN pc_requested_01
SAY ~Noted. Await me aloof from the camp tonight.~
IF ~~ THEN DO ~SetGlobal("C#HU_SoDRomanceIQ","LOCALS",1)~ + %pid%
END

IF ~~ THEN pc_requested_02
SAY ~Alright. I'll come to you upon our next rest.~
IF ~~ THEN DO ~SetGlobal("C#HU_SoDRomanceIQ","LOCALS",1)~ + %pid%
END

IF ~~ THEN pc_requested_03
SAY ~I see. I'll make it happen, <CHARNAME>.~
IF ~~ THEN DO ~SetGlobal("C#HU_SoDRomanceIQ","LOCALS",1)~ + %pid%
END

IF ~~ THEN pc_requested_already
SAY ~I did not forget, <CHARNAME>. Not at all.~ 
IF ~~ THEN EXIT
END

IF ~~ THEN pc_requested_already_01
SAY ~As you already requested. I am working on finding the right time.~ 
IF ~~ THEN EXIT
END

/*
/* special replies (timered - refer to unique rest dialogue) */
/* Romanze_SoD_Spielzeug.d */
IF ~~ THEN pc_requested_04
SAY ~Excellent. I have a special topic I want to communicate with you about. I'll come to you as soon as possible.~
IF ~~ THEN DO ~[## set variable for Romanze_SoD_Spielzeug.d]~ EXIT
END
*/

/* generic rest dialogues so the player knows the romance doesn't bug out */
IF WEIGHT #-1
~Global("C#HU_SoDRomanceIQ","LOCALS",2)
RandomNum(5,1)~ THEN resttalk_01
SAY ~Here we are, <CHARNAME>. Come with me then ... the pleasures of innuendo, it never gets old.~
IF ~~ THEN DO ~SetGlobal("C#HU_SoDRomanceIQ","LOCALS",0)
RestParty()~ EXIT
END

IF WEIGHT #-1
~Global("C#HU_SoDRomanceIQ","LOCALS",2)
RandomNum(5,2)~ THEN resttalk_02
SAY ~Well then, <CHARNAME>. Let us handle your urgent request.~
IF ~~ THEN DO ~SetGlobal("C#HU_SoDRomanceIQ","LOCALS",0)
RestParty()~ EXIT
END

IF WEIGHT #-1
~Global("C#HU_SoDRomanceIQ","LOCALS",2)
RandomNum(5,3)~ THEN resttalk_03
SAY ~This is the best place I can offer this time. Come here!~
IF ~~ THEN DO ~SetGlobal("C#HU_SoDRomanceIQ","LOCALS",0)
RestParty()~ EXIT
END

IF WEIGHT #-1
~Global("C#HU_SoDRomanceIQ","LOCALS",2)
RandomNum(5,4)~ THEN resttalk_04
SAY ~Let's get to it, <CHARNAME>, shall we?~
IF ~~ THEN DO ~SetGlobal("C#HU_SoDRomanceIQ","LOCALS",0)
RestParty()~ EXIT
END

IF WEIGHT #-1
~Global("C#HU_SoDRomanceIQ","LOCALS",2)
RandomNum(5,5)~ THEN resttalk_05
SAY ~Finally. I will make sure that the wait was worth it for you, <CHARNAME>...~
IF ~~ THEN DO ~SetGlobal("C#HU_SoDRomanceIQ","LOCALS",0)
RestParty()~ EXIT
END
END //APPEND