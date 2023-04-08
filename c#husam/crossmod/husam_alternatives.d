/* Alternatives: Aster makes her offer */

I_C_T ~B!Aster~ 35 C#Husam2_B_ASTER_35
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~(sigh) I sense where this is going.~
END

I_C_T ~B!Aster~ 39 C#Husam2_B_ASTER_39
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~<CHARNAME>, I do not need to tell you that if you attempt to do the first task, our alliance will be over - and we will be enemies.~
END


I_C_T3 ~B!Aster~ 45 C#Husam2_B_ASTER_45
== C#HusamJ IF ~InMyArea("C#Husam1")
	InParty("C#Husam1")
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~<CHARNAME>, this was a mistake. You helped me, so I'll refrain from murdering you in your sleep tonight, but will wait until we cross blades next time we meet - probably in a guild fight. It's a pity we lose you to our enemy, but that is how life goes. I can't say 'Farewell' because we are enemies now, but I can say 'Take care'.~ DO ~SetGlobal("C#HusamJoined","GLOBAL",3) SetGlobal("C#Husam2_PCAttacksGuild","GLOBAL",1) DestroyItem("LEAT07") DestroyItem("SW1H10") GivePartyAllEquipment() SetLeavePartyDialogFile() LeaveParty() EscapeArea()~ 

== C#HusamJ IF ~InMyArea("C#Husam1")
	Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~<CHARNAME>, this was a mistake. You helped me, so I'll refrain from murdering you in your sleep tonight, but will wait until we cross blades next time we meet - probably in a guild fight. It's a pity we lose you to our enemy, but that is how life goes. I can't say 'Farewell' because we are enemies now, but I can say 'Take care'.~ DO ~SetGlobal("C#HusamJoined","GLOBAL",3) SetGlobal("C#Husam2_PCAttacksGuild","GLOBAL",1) DestroyItem("LEAT07") DestroyItem("SW1H10") GivePartyAllEquipment() SetLeavePartyDialogFile() RemoveFamiliar()
ChangeEnemyAlly(Myself,NEUTRAL) EscapeArea()~
END

/* Malficus path */


I_C_T ~B!Mal~ 4 C#Husam2_B_MAL_4
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Well, well, you shouldn't start a business relation with a lie, man. 'Malficus' surely is not your first name. Maybe more of a hint as to what to expect from you?~
== ~B!Mal~ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Oh, it's not the name my *parents* gave me, but that wasn't the question, was it? And I am a sincere businessman, will you just listen.~
END

I_C_T ~B!Mal~ 5 C#Husam2_B_MAL_5
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~No, *you* did not follow us, or I would know. But I see where this is going. Who are you working for?~
== ~B!Mal~ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Oh, but do not tangle yourself up in distrust before even listening to my offer. I am a sincere businessman, will you just listen.~
END

I_C_T ~B!Mal~ 6 C#Husam2_B_MAL_6
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~No, *you* did not follow us, or I would know. But I see where this is going. Who are you working for?~
== ~B!Mal~ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Oh, but do not tangle yourself up in distrust before even listening to my offer. I am a sincere businessman, will you just listen.~
END

I_C_T ~B!Mal~ 22 C#Husam2_B_MAL_22
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~There, at least, he is right.~
END

/* first task */
I_C_T ~B!Mal~ 36 C#Husam_CM_MAL_36
== C#HUsamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~<CHARNAME>, you aren't that naive to think that this is something this man wants to be done for himself, are you? I bet with you that he has a client who paid him a lot of gold for this errand to be performed, and now he lets you do it - without having to pay for it!~
== ~B!Mal~ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Well, aren't you a suspicious one. I *am* paying, in the end - because I will have to refund the lowered cost of your friend's ship voyage out of my own pocket, have I not?~
END

/* kill Aran Linvail - warning */
I_C_T ~B!Mal~ 95 C#Husam2_CM_MAL_95
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~<CHARNAME>, I do not need to tell you that if you accept this task, our alliance will be over - and we will be enemies.~
END

/* kill Aran Linvail - Husam leaves */
I_C_T3 ~B!Mal~ 101 C#Husam2_CM_MAL_101
== C#HusamJ IF ~InMyArea("C#Husam1")
	InParty("C#Husam1")
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~<CHARNAME>, this was a mistake. You helped me, so I'll refrain from murdering you in your sleep tonight, but will wait until we cross blades next time we meet - probably in a guild fight. It's a pity we lose you to our enemy, but that is how life goes. I can't say 'Farewell' because we are enemies now, but I can say 'Take care'.~ DO ~SetGlobal("C#HusamJoined","GLOBAL",3) SetGlobal("C#Husam2_PCAttacksGuild","GLOBAL",1) DestroyItem("LEAT07") DestroyItem("SW1H10") GivePartyAllEquipment() SetLeavePartyDialogFile() LeaveParty() EscapeArea()~ 

== C#HusamJ IF ~InMyArea("C#Husam1")
	Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~<CHARNAME>, this was a mistake. You helped me, so I'll refrain from murdering you in your sleep tonight, but will wait until we cross blades next time we meet - probably in a guild fight. It's a pity we lose you to our enemy, but that is how life goes. I can't say 'Farewell' because we are enemies now, but I can say 'Take care'.~ DO ~SetGlobal("C#HusamJoined","GLOBAL",3) SetGlobal("C#Husam2_PCAttacksGuild","GLOBAL",1) DestroyItem("LEAT07") DestroyItem("SW1H10") GivePartyAllEquipment() SetLeavePartyDialogFile() RemoveFamiliar()
ChangeEnemyAlly(Myself,NEUTRAL) EscapeArea()~
END



APPEND C#HusamJ

/* PC paid for journey to Maztica Global("B!TouristFirstClass","GLOBAL",1) */

IF WEIGHT #-1
~Global("C#Husam2_CM_AltMal","GLOBAL",1)~ THEN malficus_path
SAY ~Hmm, I am not sure I got this right, <CHARNAME>. I expected you to go for Ireniucs, now you are planning to... what, take a leave?~
++ ~Yep. I think I earned myself a timeout.~ + malficus_path_02
++ ~You are welcome to go, if you don't like it.~ + malficus_path_01
END

IF ~~ THEN malficus_path_01
SAY ~I don't like it, that is true.~
IF ~~ THEN + malficus_path_02
END

IF ~~ THEN malficus_path_02
SAY ~Nevertheless, I will go with you. Why? Because I am convinced that if you don't go to Irenicus, he will come for you. And that is all that matters.~
IF ~~ THEN DO ~Global("C#Husam2_CM_AltMal","GLOBAL",2)~ EXIT
END



/* Husam warns about Malficus 

!Global("B!TouristFirstClass","GLOBAL",1) */

IF WEIGHT #-1
~Global("C#Husam2_CM_AltMal2","GLOBAL",2)~ THEN malficus_warn
SAY ~<CHARNAME>, I have to warn you about this Malficus.~
++ ~Do you know who he is working for?~ + malficus_warn_01
++ ~Why?~ + malficus_warn_02
+ ~!Global("B!TouristFirstClass","GLOBAL",1)~ + ~Husam, I will take his offer to leave this place, no matter who he is working for.~ + malficus_warn_02
+ ~Global("B!TouristFirstClass","GLOBAL",1)~ + ~Husam, I already paid him to leave this place, no matter who he is working for.~ + malficus_warn_02
END

IF ~~ THEN malficus_warn_01
SAY ~That is the reason why I have to warn you.~
IF ~~ THEN + malficus_warn_02
END

IF ~~ THEN malficus_warn_02
SAY ~We couldn't track who he is working for.~
++ ~Oha. That shady?~ + malficus_warn_04
++ ~What's the problem, then?~ + malficus_warn_03
++ ~And that is a bad thing?~ + malficus_warn_05
END

IF ~~ THEN malficus_warn_03
SAY ~You don't understand.~
IF ~~ THEN + malficus_warn_06
END

IF ~~ THEN malficus_warn_04
SAY ~That shady, indeed.~
IF ~~ THEN + malficus_warn_06
END

IF ~~ THEN malficus_warn_05
SAY ~Yes, very bad.~
IF ~~ THEN + malficus_warn_06
END

IF ~~ THEN malficus_warn_06
SAY ~See, I had several thieves observe him and follow him and his clients. And we couldn't track *any* connection to any bigger organization in the city. No, this is not a good sign. Because the kind of operations this man pulls off - he *can't* do them on his own, <CHARNAME>. Someone is helping him, and they are hiding their tracks way too well.~
++ ~Who do you think could be behind him?~ + malficus_warn_07
++ ~What do you suggest?~ + malficus_warn_08
++ ~Husam, I don't care. He seems trustworthy enough to get us on a boat, and we aren't exactly helpless, overall.~ + malficus_warn_08
END

IF ~~ THEN malficus_warn_07
SAY ~Difficult to say... If I had to guess, I would say Night Knives. Not a belated greeting from Mae'Var, I don't think he was that important there in the end. But they would be an organization that could pull something like this off, and their desire for secrecy is well known.~
+ ~!Global("B!TouristFirstClass","GLOBAL",1)~ + ~What do you suggest?~ + malficus_warn_08
+ ~!Global("B!TouristFirstClass","GLOBAL",1)~ + ~Husam, I don't care. He seems trustworthy enough to get us on a boat, and we aren't exactly helpless, overall.~ + malficus_warn_08
+ ~Global("B!TouristFirstClass","GLOBAL",1)~ + ~What do you suggest?~ + malficus_warn_09
+ ~Global("B!TouristFirstClass","GLOBAL",1)~ + ~Husam, I don't care. He seems trustworthy enough to get us on a boat, and we aren't exactly helpless, overall.~ + malficus_warn_09
END

IF ~~ THEN malficus_warn_08
SAY ~Something is very, very off with this man. But as long as we don't know whether it has anything to do with *you*, all we can do is keep our eyes and ears open for nasty surprises.~
IF ~~ THEN DO ~SetGlobal("C#Husam2_CM_AltMal2","GLOBAL",3)~ EXIT
END

IF ~~ THEN malficus_warn_09
SAY ~We are already preparing to leave with his ship, so there is little we can do other than to keep our eyes and ears open for nasty surprises - and hope that the secrecy of his organisation has nothing to do with *you*.~
IF ~~ THEN DO ~SetGlobal("C#Husam2_CM_AltMal2","GLOBAL",3)~ EXIT
END



/* Malficus path, arrival at Brynnlaw because of Bodhi's betrayal */

/*
GlobalGT("AsylumPlot","GLOBAL",2) 
Global("B!Tourist","GLOBAL",10)
Dead("ppvalen")
Dead("ppparis")
Dead("ppdel")
!See("ppsaem")
*/

IF WEIGHT #-1
~Global("C#Husam2_CM_AltMal3","GLOBAL",1)~ THEN mal_betrayal
SAY ~Bodhi! So this Malficus worked for our rival guild, after all - and it *was* addressed against you. Cursed be my naivite - the thought of even considering the possibility that it might have nothing to do with you brings tears of shame to my eyes.~
++ ~Well, yeah, guess I have to accept that I am a very wanted person.~ + mal_betrayal_01
++ ~You haven't been a great help in this, indeed.~ + mal_betrayal_02
++ ~Oh well, I guess we can look for this Spellhold, now that we are here already.~ + mal_betrayal_01
++ ~The persons responsible for this better watch out.~ + mal_betrayal_01
END 

IF ~~ THEN mal_betrayal_01
SAY ~One good thing came out of this, though. Now we are nearer Irenicus that I had dared to hope when going for this journey.~
IF ~~ THEN + mal_betrayal_03
END

IF ~~ THEN mal_betrayal_02
SAY ~Well - I wasn't the one making the deal, <CHARNAME>.~
IF ~~ THEN + mal_betrayal_01
END

IF ~~ THEN mal_betrayal_03
SAY ~Ha! The irony of life. I trusted in Irenicus coming for you if you don't go for him. I didn't consider *you* being brought to *him* as an option.~
IF ~~ THEN DO ~SetGlobal("C#Husam2_CM_AltMal3","GLOBAL",2)~ EXIT
END

END //APPEND


/* STATE_WHICH_SAYS @853  = ~Something I can put my hands on. A document, a witness, something more than your word against his.~

@890  = ~Keldorn is well known to me, and his witness is irrefutable.~

@893  = ~Very well, your witness is credible and confirms your allegations, and that's enough justification to act.~

@891  = ~I'll have my men move on this at once.~

@894  = ~Do I know you? I'm sorry, <CHARNAME>, but I can't authorize the detention of a sworn civil servant on the word of someone so completely unknown to myself and the Council.~



*/

/* add Husam to Brega's dialogue - PC needs witness */

EXTEND_BOTTOM HABREGA %brega_state_853%
+ ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ + ~Husam, would you please tell Inspector Brega that the accusations are true?~ EXTERN C#HusamJ brega
END

APPEND C#HusamJ

IF ~~ THEN brega
SAY ~<CHARNAME>, please - of course I will second what you said, but Chief Inspector Brega is a very busy man. He surely can't know every *honest and normal* citizen of this city.~
IF ~~ THEN EXTERN HABREGA %brega_state_894%
END

END //APPEND

