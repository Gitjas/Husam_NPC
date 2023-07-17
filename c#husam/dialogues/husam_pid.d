/* Husam's PID */

APPEND C#HusamJ

IF ~IsGabber(Player1)~ THEN pid
SAY @0 /* [PID first line]What can I do for you? */

/* SoD  */

/* Grey's quest */
+ ~GlobalLT("bd_plot","global",395)
GlobalLT("C#Grey_SoDQuest","GLOBAL",19)
Global("C#HU_SoD_GreyQuestInquiries","GLOBAL",1)~ + @1 /* You offered information regarding the stolen ham? I would assume you could get us information without us having to search through the camp. */ + stolen_ham_grey_sod

+ ~GlobalLT("bd_plot","global",395)
GlobalLT("C#Grey_SoDQuest","GLOBAL",19)
Global("C#HU_SoD_GreyQuestInquiries","GLOBAL",5)
Global("C#Grey_SoDKnowScald","GLOBAL",2)~ + @2 /* So, who stole the ham hock? */ + stolen_ham_grey_sod_01
+ ~GlobalLT("bd_plot","global",395)
GlobalLT("C#Grey_SoDQuest","GLOBAL",19)
Global("C#HU_SoD_GreyQuestInquiries","GLOBAL",5)
GlobalLT("C#Grey_SoDKnowScald","GLOBAL",2)~ + @2 /* So, who stole the ham hock? */ + stolen_ham_grey_sod_02

/* after quest */
+ ~%IT_IS_SOD% Global("C#HU_SoD_BrensQuest","GLOBAL",10)
Global("C#HU_SoD_questPID1","LOCALS",0)~ + @3 /* You sent Bren away? Don't you have any further use of him? */ DO ~SetGlobal("C#HU_SoD_questPID1","LOCALS",1)~ + bren_quest_01
+ ~%IT_IS_SOD% Global("C#HU_SoD_BrensQuest","GLOBAL",10)
Global("C#HU_SoD_questPID1","LOCALS",0)~ + @4 /* It's good that this "Bren drama" is over for good now. */ DO ~SetGlobal("C#HU_SoD_questPID1","LOCALS",1)~ + bren_quest_02

+ ~%IT_IS_SOD% Global("C#Husam_SoDbdmisc57","GLOBAL",2) PartyHasItem("bdmisc57")~ + @5 /* You said you could make a good prize out of this gold burst? I want you to sell it. */ + sell_goldburst

+ ~%IT_IS_SOD% Global("C#HusamSoD_PID_career","LOCALS",0)~ + @6 /* So, the Shadow Thief is using the Bhaalspawn for his own career boost. */ DO ~SetGlobal("C#HusamSoD_PID_career","LOCALS",1)~ + career
+ ~%IT_IS_SOD% Global("C#HusamSoD_PID_career","LOCALS",0)~ + @7 /* Busy writing your reports about our progress? */ DO ~SetGlobal("C#HusamSoD_PID_career","LOCALS",1)~ + career

+ ~Global("C#HusamSoD_PID_career","LOCALS",1)~ + @124 /* I'm surprised to hear you use a word like "honor" if talking about thieves, Husam. */ DO ~SetGlobal("C#HusamSoD_PID_career","LOCALS",2)~ + career_followup
+ ~Global("C#HusamSoD_PID_career","LOCALS",1)~ + @125 /* You mentioned an honor code of Shadow Thieves? */ DO ~SetGlobal("C#HusamSoD_PID_career","LOCALS",2)~ + career_followup_01

+ ~%IT_IS_SOD% Global("C#HusamSoD_PID_marchlaw","LOCALS",0)~ + @8 /* And, how does it feel to march at the side of law and official forces? */ DO ~SetGlobal("C#HusamSoD_PID_marchlaw","LOCALS",1)~ + marching_law_order

/* romance PIDs will be inersted here */

/* general statement about the crusade */
+ ~%IT_IS_SOD% GlobalLT("bd_plot","global",410) GlobalLT("C#Husam_SoD_CaelInfoPID","LOCALS",3)~ + @9 /* Husam, I want you to tell me any information your sources gather about Caelar. Anything that might be important to our cause. */ DO ~SetGlobal("C#Husam_SoD_CaelInfoPID","LOCALS",3)~ + general_info_PID
+ ~%IT_IS_SOD% GlobalLT("bd_plot","global",410) GlobalLT("C#Husam_SoD_CaelInfoPID","LOCALS",2)~ + @10 /* You don't need to tell me informations about Caelar's crusade, Husam. I am sure we'll learn about it anyway. */ DO ~SetGlobal("C#Husam_SoD_CaelInfoPID","LOCALS",2)~ + general_info_PID_00

/* before castle assault */
+ ~%IT_IS_SOD% 
GlobalLT("bd_plot","global",410)
GlobalGT("C#Husam_SoD_CaelInfoPID","LOCALS",2)
!Global("C#Husam_SoD1stCamp","GLOBAL",2)
!Global("C#Husam_SoD1stCamp","GLOBAL",5)~ + @11 /* I have questions about Caelar and her crusade. */ + crusade_questions

/* before castle assault */
+ ~%IT_IS_SOD% GlobalLT("bd_plot","global",410)
OR(2)
Global("C#Husam_SoD1stCamp","GLOBAL",2)
Global("C#Husam_SoD1stCamp","GLOBAL",5)~ + @12 /* You said you had current information about the crusade? */ + crusade_questions


/* after castle assault; before portal is opened */
+ ~%IT_IS_SOD% GlobalGT("bd_plot","global",409) GlobalLT("bd_plot","global",490)~ + @11 /* I have questions about Caelar and her crusade. */ + no_more_crusade_questions

/* BGII */

+ ~%IT_IS_BG2%  Global("C#HusamSoA_PID_career","LOCALS",0)~ + @14 /* So, watching me didn't turn out to be the career boost you hoped for, hmm? */ DO ~SetGlobal("C#HusamSoA_PID_career","LOCALS",1)~ + career2



/* inventory management.  - if Husam is not in party but following as companion he has to join the group so the player has access to the inventory.
This is what usually is dealt with by the kicked out "P" dialogue for re-joining */

+ ~!InParty(Myself) Global("C#HusamJoined","GLOBAL",2) NumInPartyLT(6)~ + @15 /* Husam, would you grant me access to your inventory? */ DO ~RemoveFamiliar() SetGlobal("C#HusamJoined","GLOBAL",1) JoinParty()~ EXIT

+ ~!InParty(Myself) Global("C#HusamJoined","GLOBAL",2) NumInParty(6)~ + @15 /* Husam, would you grant me access to your inventory? */ + join

+ ~Global("C#%NPCname%Joined","GLOBAL",2)~ + @200020 /* ~I want to give you instructions how to follow me.~ */ + script_chose

+ ~%IT_IS_SOD%~ + @13 /* About our alliance... */ + st_alliance

++ @16 /* Nothing at the moment. */ EXIT
END

IF ~~ THEN join
SAY @17 /* With pleasure - if someone else moves away. */
IF ~~ THEN DO ~RemoveFamiliar() 
ChangeAIScript("",DEFAULT)
ChangeEnemyAlly(Myself,NEUTRAL)
SetGlobal("C#HusamJoined","GLOBAL",1) JoinParty()~ EXIT
END

IF ~~ THEN hp_alarm
SAY @18 /* As you wish. */
IF ~~ THEN EXIT
END


IF ~~ THEN script_chose
SAY @200015 /* ~What do you want me to do?~ */
+ ~Global("c#gotopc","LOCALS",0)~ + @200001 /* ~I want you to stay in sight.~ */ DO ~SetGlobal("c#gotopc","LOCALS",1)~ + i_will
+ ~GlobalGT("c#gotopc","LOCALS",0)~ + @200002 /* ~Stop staying in sight.~ */ DO ~SetGlobal("c#gotopc","LOCALS",0) ChangeAIScript("",DEFAULT)~ + i_will
+ ~Global("c#traps","LOCALS",0)
Class(Myself,THIEF_ALL)~ + @200003 /* ~I want you to look out out for traps.~ */ DO ~SetGlobal("c#traps","LOCALS",1)~ + i_will
+ ~Global("c#traps","LOCALS",1)
Class(Myself,THIEF_ALL)~ + @200004 /* ~Stop looking for traps.~ */ DO ~SetGlobal("c#traps","LOCALS",0)~ + i_will
+ ~Global("C#HPAlarm","LOCALS",0)~ + @200017 DO ~SetGlobal("C#HPAlarm","LOCALS",1)~ + i_will
+ ~Global("C#HPAlarm","LOCALS",1)~ + @200018 DO ~SetGlobal("C#HPAlarm","LOCALS",0)~ + i_will
++ @200005 /* ~If we encounter enemies...~ */ + script_chose_01
++ @200006 /* ~Leave everything as it is.~ */ EXIT
END

IF ~~ THEN script_chose_01
SAY @200016 /* ~Yes?~ */
+ ~Global("c#mage1","LOCALS",0)
Class(Myself,MAGE_ALL)~ + @200007 /* ~I want you to fight enemies you see with magic.~ */ DO ~SetGlobal("c#mage1","LOCALS",1)
SetGlobal("c#mage2","LOCALS",0)
SetGlobal("c#cautio","LOCALS",0)
SetGlobal("c#melee","LOCALS",0)
SetGlobal("c#ranged","LOCALS",0)
SetGlobal("c#defend","LOCALS",0)
SetGlobal("c#nothin","LOCALS",0)~ + i_will
+ ~Global("c#mage2","LOCALS",0)
Class(Myself,MAGE_ALL)~ + @200008 /* ~I want you to first prepare yourself and fight enemies with magic if you see them.~ */ DO ~SetGlobal("c#mage1","LOCALS",0)
SetGlobal("c#mage2","LOCALS",1)
SetGlobal("c#cautio","LOCALS",0)
SetGlobal("c#melee","LOCALS",0)
SetGlobal("c#ranged","LOCALS",0)
SetGlobal("c#defend","LOCALS",0)
SetGlobal("c#nothin","LOCALS",0)~ + i_will

+ ~Global("c#cautio","LOCALS",0)~ + @200009 /* ~I want you to run away from enemies so you don't have to fight.~ */ DO ~SetGlobal("c#mage1","LOCALS",0)
SetGlobal("c#mage2","LOCALS",0)
SetGlobal("c#cautio","LOCALS",1)
SetGlobal("c#melee","LOCALS",0)
SetGlobal("c#ranged","LOCALS",0)
SetGlobal("c#defend","LOCALS",0)
SetGlobal("c#nothin","LOCALS",0)~ + i_will
+ ~Global("c#melee","LOCALS",0)~ + @200010 /* ~I want you to fight with melee weapons if you see enemies.~ */ DO ~SetGlobal("c#mage1","LOCALS",0)
SetGlobal("c#mage2","LOCALS",0)
SetGlobal("c#cautio","LOCALS",0)
SetGlobal("c#melee","LOCALS",1)
SetGlobal("c#ranged","LOCALS",0)
SetGlobal("c#defend","LOCALS",0)
SetGlobal("c#nothin","LOCALS",0)~ + i_will
+ ~Global("c#ranged","LOCALS",0)~ + @200011 /* ~I want you to fight with ranged weapons if you see enemies.~ */ DO ~SetGlobal("c#mage1","LOCALS",0)
SetGlobal("c#mage2","LOCALS",0)
SetGlobal("c#cautio","LOCALS",0)
SetGlobal("c#melee","LOCALS",0)
SetGlobal("c#ranged","LOCALS",1)
SetGlobal("c#defend","LOCALS",0)
SetGlobal("c#nothin","LOCALS",0)~ + i_will
+ ~Global("c#defend","LOCALS",0)~ + @200012 /* ~I want you to only defend yourself if attacked.~ */ DO ~SetGlobal("c#mage1","LOCALS",1)
SetGlobal("c#mage2","LOCALS",0)
SetGlobal("c#cautio","LOCALS",0)
SetGlobal("c#melee","LOCALS",0)
SetGlobal("c#ranged","LOCALS",0)
SetGlobal("c#defend","LOCALS",1)
SetGlobal("c#nothin","LOCALS",0)~ + i_will
+ ~Global("c#nothin","LOCALS",0)~ + @200013 /* ~I want you to do absolutely nothing in a fight.~ */ DO ~SetGlobal("c#mage1","LOCALS",1)
SetGlobal("c#mage2","LOCALS",0)
SetGlobal("c#cautio","LOCALS",0)
SetGlobal("c#melee","LOCALS",0)
SetGlobal("c#ranged","LOCALS",0)
SetGlobal("c#defend","LOCALS",0)
SetGlobal("c#nothin","LOCALS",1)~ + i_will

++ @200014 /* ~I have no new order for fights.~ */ + script_chose
END

IF ~~ THEN i_will
SAY @200019 /* @18 /* As you wish. */ */
IF ~~ THEN EXIT
END
END //APPEND

/* SoD */

/* Grey's quest */
CHAIN
IF ~~ THEN C#HusamJ stolen_ham_grey_sod
@19 /* Yes - I have an interest in this being solved myself, because these things tend to be blamed on any rogue in range if things get hot. */
== C#HusamJ IF ~AreaCheck("bd3000") Global("C#Grey_SoDKnowScald","GLOBAL",2)~ THEN @20 /* Give me a day and I will tell you the name of the soldier this Scald pointed us at. */
== C#HusamJ IF ~AreaCheck("bd3000") GlobalLT("C#Grey_SoDKnowScald","GLOBAL",2)~ THEN @21 /* Give me a day and I will tell you whether anyone in the coalition camp *or* the crusader camp tried to fence pieces of an exquisite ham. */
== C#HusamJ IF ~!AreaCheck("bd3000")~ THEN @22 /* I will tell you as soon as I'll know anything. */
END
IF ~~ THEN DO ~SetGlobal("C#HU_SoD_GreyQuestInquiries","GLOBAL",2)~ EXIT

APPEND C#HusamJ

IF ~~ THEN stolen_ham_grey_sod_01
SAY @23 /* [Husam]The soldier's name is Lester. He should be between the tents on the west side of the camp. You can't miss him - he is carrying a bag. And yes, that's where the ham is in. */
IF ~~ THEN + stolen_ham_grey_sod_03
END

IF ~~ THEN stolen_ham_grey_sod_02
SAY @24 /* [Husam]]We are looking for a soldier from the Flaming Fist. His name is Lester. He should be between the tents on the west side of the camp. You can't miss him - he is carrying a bag. And yes, that's where the ham is in. */
IF ~~ THEN + stolen_ham_grey_sod_03
END

IF ~~ THEN stolen_ham_grey_sod_03
SAY @25 /* [Husam]Seems my spies are good for *something* at least - they can't get a hold of Hephernaan, but they do find missing ham. Tch. */
IF ~~ THEN DO ~SetGlobal("C#HU_SoD_GreyQuestInquiries","GLOBAL",5)~ EXIT
END

IF ~~ THEN st_alliance
SAY @26 /* Which is very beneficial for me. What of it? */
++ @27 /* I want to end it. I don't want you to follow me around any more. */ + go_away
++ @28 /* Nothing. */ + pid
END

IF ~~ THEN go_away
SAY @29 /* If I go now it will be final, <CHARNAME>. I will not sit around for you to come back. */
++ @30 /* My mistake - stay where you were. */ + pid
++ @31 /* I'm aware. I want you to leave. */ + go_away_01
END

IF ~~ THEN go_away_01
SAY @32 /* Hm, that's a pity, <CHARNAME>. Farewell, then. */
/* Husam in Party */
IF ~InParty("C#Husam1")~ THEN DO ~SetInterrupt(FALSE)
SetGlobal("C#HusamJoined","GLOBAL",0)
LeaveParty()
ChangeAIScript("",DEFAULT)
//DestroyItem("##")
EscapeAreaDestroy(5)
SetInterrupt(TRUE)~ EXIT
/* Husam was 7th party member */
IF ~Global("C#HusamJoined","GLOBAL",2)~ THEN DO ~SetInterrupt(FALSE)
MakeGlobal()
SetGlobal("C#HusamJoined","GLOBAL",0)
RemoveFamiliar()
ChangeEnemyAlly(Myself,NEUTRAL)
ChangeAIScript("",DEFAULT)
//DestroyItem("##")
EscapeAreaDestroy(5)
SetInterrupt(TRUE)~ EXIT
END

IF ~~ THEN bren_quest_01
SAY @33 /* Yes, <CHARNAME>. He had no good standing inside the crusade any more, always drawing suspicion. And - he failed me, so there is no place in the Shadow Thieves for him. */
IF ~~ THEN + bren_quest_02
END

IF ~~ THEN bren_quest_02
SAY @34 /* He's smart. He'll stay out of our way - and alive. */
IF ~~ THEN EXIT
END

IF ~~ THEN sell_goldburst
SAY @35 /* I will. Let me take it right away, I will pass it on and report to you when it's sold. */
IF ~~ THEN DO ~SetGlobal("C#Husam_SoDbdmisc57","GLOBAL",3) RealSetGlobalTimer("C#HusamDialogTimer","GLOBAL",2400) ActionOverride(Player1,TakePartyItem("bdmisc57")) ActionOverride(Player1,DestroyItem("bdmisc57"))~ EXIT
END

IF ~~ THEN no_more_crusade_questions
SAY @36 /* There is nothing I could tell you that we didn't learn already. The war is here, let's face our foes. */
IF ~~ THEN EXIT
END
END //APPEND

CHAIN
IF ~~ THEN c#husamJ general_info_PID
@37 /* [Husam]Of course. We have a deal - I will know what you know, and you will learn what I know about the crusade and Caelar. */
/* before leaving BG city */
== c#husamJ IF ~GlobalLT("BD_plot","global",60)~ THEN @38 /* Right now, I know as much as the Dukes do. But I hope to get deeper intel soon and will let you know when I do. */
END
++ @39 /* Let me ask something else. */ + pid
++ @40 /* I have no more questions. */ EXIT

APPEND c#husamJ 

IF ~~ THEN general_info_PID_00
SAY @41 /* [Husam]If you tell me to I will be quiet, although I do not think it is wise. We have a deal - I will know what you know, and you will learn what I know about the crusade and Caelar. I will inform you if I'll receive a report. I'll leave it to you whether to profit from what I know. */
++ @39 /* Let me ask something else. */ + pid
++ @40 /* I have no more questions. */ EXIT
END

/* special questions regarding the crusade */
IF ~~ THEN crusade_questions
SAY @42 /* What do you want me to tell you? */
/* before coming to bd3000 */
+ ~Global("C#Husam_SoD1stCamp","GLOBAL",2) GlobalLT("bd_plot","global",300)~ + @43 /* Tell me the newest info you gathered. */ DO ~SetGlobal("C#Husam_SoD1stCamp","GLOBAL",3)~ + 1st_camp_07
/* after coming to bd3000; before castle assault (is checked in transition to this state) */
+ ~Global("C#Husam_SoD1stCamp","GLOBAL",5)~ + @43 /* Tell me the newest info you gathered. */ DO ~SetGlobal("C#Husam_SoD1stCamp","GLOBAL",6)~ + update_bd3000

+ ~GlobalGT("C#Husam_Dialog","GLOBAL",4)
!GlobalGT("C#RtD_KnowsPortalBlood","GLOBAL",2)
Global("C#HusamSoD_PID_WhyKN","LOCALS",0)~ + @129 /* If Caelar wants to kidnap me, I want to know why. Can you provide any intel on that?~ */ DO ~SetGlobal("C#HusamSoD_PID_WhyKN","LOCALS",1)~ + why_kidnap+ ~GlobalGT("C#Husam_Dialog","GLOBAL",4)
!GlobalGT("C#RtD_KnowsPortalBlood","GLOBAL",2)
Global("C#HusamSoD_PID_WhyKN","LOCALS",1)~ + @130 /* Any news on what Caelar wanted to kidnap me for?~ */ DO ~IncrementGlobal("C#HusamSoD_PID_WhyKN","LOCALS",1)~ + why_kidnap
+ ~GlobalGT("C#Husam_Dialog","GLOBAL",4)
!GlobalGT("C#RtD_KnowsPortalBlood","GLOBAL",2)
Global("C#HusamSoD_PID_WhyKN","LOCALS",2)~ + @130 /* Any news on what Caelar wanted to kidnap me for?~ */ DO ~IncrementGlobal("C#HusamSoD_PID_WhyKN","LOCALS",1)~ + why_kidnap

+ ~Global("C#Husam_HephernaanBetrayal","GLOBAL",2)
Global("C#RtD_HepherFiend","GLOBAL",0)
Global("C#HusamSoD_PID_UmbAcc","LOCALS",0)~ + @44 /* Any insight on how Hephernaan is betraying Caelar? */ DO ~SetGlobal("C#HusamSoD_PID_UmbAcc","LOCALS",1)~ + hephernaan_betrayal_pid

+ ~Global("C#Husam_HepherScryPool","GLOBAL",4)
Global("C#HusamSoD_PID_UmbAcc","LOCALS",0)~ + @45 /* Any news on what "Umbral Accord" stands for? */ + umbral_accord_inquiry_01

+ ~Global("C#HusamSoD_CaelarBC","GLOBAL",0)
GlobalGT("C#HusamSoD_PID_CC1","LOCALS",0)
Global("C#RtD_CaelarBhaalChild","GLOBAL",0)~ + @46 /* You said Caelar was of divine heritage. Do you have more detailed information about that? */ DO ~SetGlobal("C#HusamSoD_CaelarBC","GLOBAL",1)~ + caelar_child_bhaal

+ ~Global("C#HusamSoD_CaelarBC","GLOBAL",0)
Global("C#RtD_CaelarBhaalChild","GLOBAL",1)~ + @47 /* Can you confirm the rumor that Caelar is a child of Bhaal, too? */ DO ~SetGlobal("C#HusamSoD_CaelarBC","GLOBAL",1)~ + caelar_child_bhaal 

+ ~Global("C#Husam_SoDDauston","GLOBAL",4)
GlobalLT("C#RtD_KnowsAunArgent","GLOBAL",4)
GlobalLT("#L_SoDStat_DaustonTalk","GLOBAL",3)~ + @48 /* You said you have information about Aun Argent, Caelar's uncle and what happpened at the Order of the Aster? */ DO ~SetGlobal("C#Husam_SoDDauston","GLOBAL",5)~ + auns_story
+ ~Global("C#Husam_SoDDauston","GLOBAL",4)
OR(2)
GlobalGT("C#RtD_KnowsAunArgent","GLOBAL",3)
Global("#L_SoDStat_DaustonTalk","GLOBAL",3)~ + @48 /* You said you have information about Aun Argent, Caelar's uncle and what happpened at the Order of the Aster? */ DO ~SetGlobal("C#Husam_SoDDauston","GLOBAL",5)~ + auns_story_00
+ ~Global("C#Husam_SoDDauston","GLOBAL",1) Global("C#Husam_BDDAUSTO_4","GLOBAL",1)
GlobalLT("C#RtD_KnowsAunArgent","GLOBAL",4)~ + @49 /* Would you gather more information about what the drunk paladin talked about - Caelar being the doom of her uncle? */ DO ~SetGlobal("C#Husam_SoDDauston","GLOBAL",2)~ + set_spies
+ ~Global("C#Husam_SoDDauston","GLOBAL",1) Global("C#Husam_BDDAUSTO_4","GLOBAL",0)
GlobalLT("C#RtD_KnowsAunArgent","GLOBAL",4)~ + @50 /* There was a drunk paladin at the Flaming Fist Headquarters, talking about Caelar being the doom of her uncle. Could you gather more information about what he talked about? */ DO ~SetGlobal("C#Husam_SoDDauston","GLOBAL",2)~ + set_spies
+ ~GlobalLT("C#RtD_KnowsAunArgent","GLOBAL",4)
GlobalGT("C#RtD_KnowsAunArgent","GLOBAL",0)
Global("C#Husam_SoDDauston","GLOBAL",0)~ + @51 /* About the rumors about Caelar and some troubles with the Order of the Aster. Could you learn more about this? */ DO ~SetGlobal("C#Husam_SoDDauston","GLOBAL",2)~ + set_spies

/* general questions regarding the crusade */

+ ~Global("C#HusamSoD_PID_CC1","LOCALS",0)~ + @52 /* What can you tell me about the crusade? */ DO ~SetGlobal("C#HusamSoD_PID_CC1","LOCALS",1)~ + caelars_crusade

/* before leaving BG city */
+ ~Global("C#HusamSoD_PID_CC1","LOCALS",1)
GlobalLT("C#RtD_CaelarPlan","GLOBAL",2)
GlobalLT("bd_plot","global",100)~ + @53 /* What do you know about Caelar's plans? */ DO ~SetGlobal("C#HusamSoD_PID_CC1","LOCALS",2)
SetGlobal("C#HusamSoD_PID_CC3","LOCALS",1)~ + 1st_camp_03_B

/* before coming to bd3000 */
+ ~Global("C#HusamSoD_PID_CC1","LOCALS",1)
GlobalLT("C#RtD_CaelarPlan","GLOBAL",2)
GlobalLT("bd_plot","global",300)~ + @53 /* What do you know about Caelar's plans? */ DO ~SetGlobal("C#HusamSoD_PID_CC1","LOCALS",2)
SetGlobal("C#RtD_CaelarPlan_SET","GLOBAL",2) 
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ + 1st_camp_03
+ ~Global("C#HusamSoD_PID_CC1","LOCALS",1)
GlobalGT("C#RtD_CaelarPlan","GLOBAL",1)
GlobalLT("bd_plot","global",300)~ + @53 /* What do you know about Caelar's plans? */ DO ~SetGlobal("C#HusamSoD_PID_CC1","LOCALS",2)~ + 1st_camp_03_A

/* after reaching the big coalition camp */
+ ~GlobalLT("C#HusamSoD_PID_CC1","LOCALS",3)
GlobalLT("C#RtD_CaelarPlan","GLOBAL",3)
GlobalGT("bd_plot","global",299)~ + @54 /* Any new information about Caelar's plans? */ DO ~SetGlobal("C#HusamSoD_PID_CC1","LOCALS",3)~ + update_bd3000_caelars_plans
+ ~GlobalLT("C#HusamSoD_PID_CC1","LOCALS",3)
GlobalGT("C#RtD_CaelarPlan","GLOBAL",2)
GlobalGT("bd_plot","global",299)~ + @54 /* Any new information about Caelar's plans? */ DO ~SetGlobal("C#HusamSoD_PID_CC1","LOCALS",3)~ + 1st_camp_03_A

+ ~Global("C#HusamSoD_PID_CC2","LOCALS",0)~ + @55 /* Are there any other important people in the crusade I should be aware of? */ DO ~SetGlobal("C#HusamSoD_PID_CC2","LOCALS",1)~ + 1st_camp_05

+ ~OR(2)
	Global("C#HusamSoD_PID_CC1","LOCALS",2)
	Global("C#HusamSoD_PID_CC1","LOCALS",3)
Global("C#HusamSoD_PID_CC3","LOCALS",0)
GlobalLT("C#RtD_CaelarPlan","GLOBAL",3)~ + @56 /* Do you have an idea how Caelar will free the souls from Avernus? */ DO ~SetGlobal("C#HusamSoD_PID_CC3","LOCALS",1)~ + 1st_camp_04

+ ~GlobalLT("C#HusamSoD_PID_CC3","LOCALS",2)
GlobalGT("C#RtD_CaelarPlan","GLOBAL",2)~ + @57 /* So, Caelar is planning on leading her army into Avernus. What do the crusaders think about it? Are they aware and ready for this? */ DO ~SetGlobal("C#HusamSoD_PID_CC3","LOCALS",2)~ + god_bless

/* doesn't have Crusader Uniform or Seal of Caelar */
+ ~Global("C#HusamSoD_PID_SoC","GLOBAL",0)
OR(2) !PartyHasItem("bdchan03") !PartyHasItem("bdmisc04")~ + @58 /* Is there any more special crusader wear or crest or symbol or something that would help us for disguise? */ DO ~SetGlobal("C#HusamSoD_PID_SoC","GLOBAL",1)~ + crusader_symbol_uniform
/* doesn't have Crusader Uniform */
+ ~Global("C#HusamSoD_PID_SoC","GLOBAL",1) !PartyHasItem("bdchan03") PartyHasItem("bdmisc04")~ + @59 /* Can you obtain a Crusader Uniform for us? */ DO ~SetGlobal("C#HusamSoD_PID_SoC","GLOBAL",2)~ + get_items_sod
/* doesn't have Seal of Caelar */
+ ~Global("C#HusamSoD_PID_SoC","GLOBAL",1) PartyHasItem("bdchan03") !PartyHasItem("bdmisc04")~ + @60 /* Can you obtain a Seal of Caelar for us? */ DO ~SetGlobal("C#HusamSoD_PID_SoC","GLOBAL",2)~ + get_items_sod
/* doesn't have either */
+ ~Global("C#HusamSoD_PID_SoC","GLOBAL",1) !PartyHasItem("bdchan03") !PartyHasItem("bdmisc04")~ + @61 /* Can you obtain a Crusader Uniform and a Seal of Caelar for us? */ DO ~SetGlobal("C#HusamSoD_PID_SoC","GLOBAL",2)~ + get_items_sod 

++ @39 /* Let me ask something else. */ + pid
++ @40 /* I have no more questions. */ EXIT
END


IF ~~ THEN why_kidnap
SAY @131 /* ~Not yet. I have my spies on that - of course. This knowledge is imperative to understand our foe. I'll let you know if I gather any intel.~ */
IF ~~ THEN EXIT
END

IF ~~ THEN why_kidnap_01
SAY @132 /* ~No, nothing besides what the *crusaders* think Caelar wants you for - prestige, fighting power, moral support for them, weaken the coalition, showing dominance against their enemies. This sounds awfully nice, but it's not a reason to kidnap someone. I'll let you know if I'll learn anything new.~ */
IF ~~ THEN EXIT
END

IF ~~ THEN why_kidnap_02
SAY @133 /* ~No - nothing yet, <CHARNAME>. Whatever Caelar *really* wants from you is a secret very well hidden in the crusade.~ */
IF ~~ THEN EXIT
END

IF ~~ THEN caelar_child_bhaal 
SAY @62 /* We are already on it. The rumor that Caelar is a Bhaalchild is palpable everywhere, but so far our sources only confirm that she is of Aasimar origin - clearly visible by her characteristically glowing eyes. My gut tells me that her Aasimar heritage is the reason for the Bhaalchild rumors, especially after Sarevok and what he's done, and that it would be a great coincidence if she would be a descendant of Bhaal as well. I'll let you know if I'll learn more. */
++ @63 /* Let me ask another question. */ + crusade_questions
++ @40 /* I have no more questions. */ EXIT
END

IF ~~ THEN crusader_symbol_uniform
SAY @64 /* Indeed, there is. Many - but not all - crusaders wear a uniform that show Caelar's symbol. The more elite crusaders also have a 'Seal of Caelar', a medal with Caelar's symbol on it, but I haven't seen one yet. */
+ ~!PartyHasItem("bdchan03") PartyHasItem("bdmisc04")~ + @59 /* Can you obtain a Crusader Uniform for us? */ DO ~SetGlobal("C#HusamSoD_PID_SoC","GLOBAL",2)~ UNSOLVED_JOURNAL @100023 + get_items_sod
/* doesn't have Seal of Caelar */
+ ~PartyHasItem("bdchan03") !PartyHasItem("bdmisc04")~ + @60 /* Can you obtain a Seal of Caelar for us? */ DO ~SetGlobal("C#HusamSoD_PID_SoC","GLOBAL",2)~ UNSOLVED_JOURNAL @100023 + get_items_sod
/* doesn't have either */
+ ~!PartyHasItem("bdchan03") !PartyHasItem("bdmisc04")~ + @61 /* Can you obtain a Crusader Uniform and a Seal of Caelar for us? */ DO ~SetGlobal("C#HusamSoD_PID_SoC","GLOBAL",2)~ UNSOLVED_JOURNAL @100023 + get_items_sod 
++ @63 /* Let me ask another question. */ + crusade_questions
++ @40 /* I have no more questions. */ EXIT
END


IF ~~ THEN get_items_sod 
SAY @65 /* Definitely, but it will take a while. Unlike information, items have the disadvantage of having to travel the distance physically, and the crusade is holding all bridges that would enable them to arrive in a timely fashion. I will tell you as soon as they will be in our reach. */
++ @63 /* Let me ask another question. */ + crusade_questions
++ @40 /* I have no more questions. */ EXIT
END

IF ~~ THEN update_bd3000
SAY @66 /* There is a crusader camp protected by pallisades in the castle courtyard at Castle Dragonspear, and the crusaders also hold an entrance to an underground river from which the castle's basement can be reached. Caelar and her advisor Hephernaan retreated into Dragonspear Castle and neither have shown themselves in the common crusaders' campsites for some time, so approaching any crusades' settlements should at least be possible without running into either of them. */
++ @63 /* Let me ask another question. */ + crusade_questions
++ @40 /* I have no more questions. */ EXIT
END

END //APPEND
/* upon reaching bd3000 coalition camp */
CHAIN
IF ~~ THEN c#husamJ update_bd3000_caelars_plans
@67 /* I know for sure that Caelar is planning on marching her army into Avernus. */
== c#husamJ IF ~GlobalLT("C#RtD_KnowsPortalBlood","GLOBAL",3)~ THEN @68 /* My sources think that she didn't chose Dragonspear Castle for historic value alone, but hopes to be able to connect to the rift that formed there during the wars. They have no details about how she is going to do that, though. I had no luck in gathering further intel. All briefing between Caelar and Hephernaan are in secret and very well guarded from unwanted ears. */
END
+ ~OR(2) CheckStatGT(Player1,15,WIS) CheckStatGT(Player1,15,INT)~ + @69 /* That means she wants to open a portal! */ DO ~SetGlobal("C#RtD_CaelarPlan_SET","GLOBAL",4) 
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ + update_bd3000_caelars_plans_01
++ @63 /* Let me ask another question. */ DO ~SetGlobal("C#RtD_CaelarPlan_SET","GLOBAL",3) 
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ + crusade_questions
++ @40 /* I have no more questions. */ DO ~SetGlobal("C#RtD_CaelarPlan_SET","GLOBAL",3) 
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ EXIT

APPEND c#husamJ 


IF ~~ THEN hephernaan_betrayal_pid
SAY @70 /* No, nothing. His security is tighter than any I ever tried to overcome. */
IF ~~ THEN EXIT
END

IF ~~ THEN update_bd3000_caelars_plans_01
SAY @71 /* That... would be the logical consequence, I guess. Yes, we can assume that is what she is up to. */
++ @63 /* Let me ask another question. */ + crusade_questions
++ @40 /* I have no more questions. */ EXIT
END

IF ~~ THEN god_bless
SAY @72 /* The crusaders know - they are aware they will march down into the abyss. But they believe that Caelar is divinely blessed and powerful enough to protect them. */
++ @73 /* They seriously believe that they can march into Avernus, and come out with the trapped souls? */ DO ~SetGlobal("C#RtD_CaelarProtection_SET","GLOBAL",2)  
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ + god_bless_01
++ @63 /* Let me ask another question. */ DO ~SetGlobal("C#RtD_CaelarProtection_SET","GLOBAL",2)  
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ + crusade_questions
++ @40 /* I have no more questions. */ DO ~SetGlobal("C#RtD_CaelarProtection_SET","GLOBAL",2)  
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ EXIT
END

IF ~~ THEN god_bless_01
SAY @74 /* It appears so, yes. Caelar is a very charismatic leader. Add desperation, childish hope, and exaggerated believe of godly powers to the mix and you have a good idea of the general crusader following her. */
++ @63 /* Let me ask another question. */ + crusade_questions
++ @40 /* I have no more questions. */ EXIT
END

IF ~~ THEN auns_story
SAY @75 /* Caelar was about ten when she tampered with forces she couldn't control in the Order of the Aster. She lost her soul to a fiend. Her uncle, Sir Aun Argent, well respected paladin of the order, let himself be imprisoned in Avernus by the fiend holding Caelar's life so his niece could go free. */
++ @76 /* Her uncle is in Avernus? Due to her inadvertence? That's a little detail she doesn't go around telling I would say. */ + auns_story_01
++ @77 /* Ouch. */ + auns_story_01
+ ~OR(2)
	GlobalGT("C#RtD_CaelarPlan","GLOBAL",1)
	Global("C#RtD_RoadToDiscovery","GLOBAL",0)
OR(3)
	GlobalGT("C#RtD_CaelarPlan","GLOBAL",1)
	GlobalGT("bd_plot","global",169) //after CWC Parley with Caelar
	Global("C#RtD_RoadToDiscovery","GLOBAL",1)
GlobalLT("C#RtD_CaelarPlan","GLOBAL",5) 
OR(2) CheckStatGT(Player1,15,WIS) CheckStatGT(Player1,15,INT)~ + @78 /* Alright, there we have Caelar's ulterior motive for all she's doing right there. She's aiming at the trapped souls in Avernus, all to free her uncle! */ DO ~SetGlobal("C#Husam_SoDDauston","GLOBAL",6) SetGlobal("C#RtD_CaelarPlan_SET","GLOBAL",5) 
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ + auns_story_02
++ @79 /* Misses "I'm so righteous" wasn't so righteous back as a child, huh? */ + auns_story_01
END

/* ## same line as in husam_sod_reaction_main_events.d! */
IF ~~ THEN auns_story_00
SAY @80 /* It's a confirmation about what we learned in the meantime about Aun going into Avernus to save Caelar. I have nothing more to report. */
++ @63 /* Let me ask another question. */ + crusade_questions
++ @40 /* I have no more questions. */ EXIT
END

IF ~~ THEN auns_story_01
SAY @81 /* As I said, it's an impressing story about guilt and failure - as well as selflessness, come to think about it. (Tch) */ 
IF ~~ THEN DO ~SetGlobal("C#RtD_KnowsAunArgent_SET","GLOBAL",4) 
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ EXIT
END

IF ~~ THEN auns_story_02
SAY @82 /* That is very likely. */ 
IF ~~ THEN + auns_story_01
END

IF ~~ THEN caelars_crusade
SAY @83 /* A warlady named Caelar, calling herself 'The Shining Lady', is marching an army towards Dragonspear Castle. She is said to be of divine descendants, but the exact origin is unknown. She is highly charismatic and manages to sway the masses into giving their common life up for her cause. Her crest is a sun on the horizon; her followers wear tunics embedded with this symbol, some even have tattoos on their forearms. */
/* before leaving BG city */
+ ~GlobalLT("C#RtD_CaelarPlan","GLOBAL",2)
GlobalLT("bd_plot","global",100)~ + @53 /* What do you know about Caelar's plans? */ DO ~SetGlobal("C#HusamSoD_PID_CC1","LOCALS",2)
SetGlobal("C#HusamSoD_PID_CC3","LOCALS",1)~ + 1st_camp_03_B

/* before coming to bd3000 */
+ ~GlobalLT("C#RtD_CaelarPlan","GLOBAL",2)
GlobalGT("bd_plot","global",99)
GlobalLT("bd_plot","global",300)~ + @53 /* What do you know about Caelar's plans? */ DO ~SetGlobal("C#HusamSoD_PID_CC1","LOCALS",2)
SetGlobal("C#HusamSoD_PID_CC3","LOCALS",1)
SetGlobal("C#RtD_CaelarPlan_SET","GLOBAL",2) 
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ + 1st_camp_03
+ ~GlobalGT("C#RtD_CaelarPlan","GLOBAL",1)
GlobalLT("bd_plot","global",300)~ + @53 /* What do you know about Caelar's plans? */ DO ~SetGlobal("C#HusamSoD_PID_CC1","LOCALS",2)
SetGlobal("C#HusamSoD_PID_CC3","LOCALS",1)~ + 1st_camp_03_A
+ ~Global("C#HusamSoD_CaelarBC","GLOBAL",0)
Global("C#RtD_CaelarBhaalChild","GLOBAL",0)~ + @46 /* You said Caelar was of divine heritage. Do you have more detailed information about that? */ DO ~SetGlobal("C#HusamSoD_CaelarBC","GLOBAL",1)~ + caelar_child_bhaal
++ @63 /* Let me ask another question. */ + crusade_questions
++ @40 /* I have no more questions. */ EXIT
END

IF ~~ THEN 1st_camp_03
SAY @84 /* I know now that Caelar is planning on bringing back the lost souls from the Dragonspear Wars. The souls lost in Avernus. This is what she is promising her followers. */
++ @85 /* Avernus! And how would she do that? */ + 1st_camp_04
++ @63 /* Let me ask another question. */ + crusade_questions
++ @40 /* I have no more questions. */ EXIT
END

IF ~~ THEN 1st_camp_03_A
SAY @86 /* I know about Caelar's plans to bring back the lost souls from Avernus as much as you do. */
++ @63 /* Let me ask another question. */ + crusade_questions
++ @40 /* I have no more questions. */ EXIT
END

IF ~~ THEN 1st_camp_03_B
SAY @87 /* There is a lot of rumors, but they are irritatingly unspecific. I'll let you know as soon as I have more intel. */
++ @63 /* Let me ask another question. */ + crusade_questions
++ @40 /* I have no more questions. */ EXIT
END

IF ~~ THEN 1st_camp_04
SAY @88 /* I am not too sure yet. But she is gathering an army for a reason, so I fear we have to take into account that she is at least considering battling fiends to achieve it. */
++ @63 /* Let me ask another question. */ + crusade_questions
++ @40 /* I have no more questions. */ EXIT
END

END //APPEND

CHAIN
IF ~~ THEN c#husamJ 1st_camp_05
@89 /* Her advisor Hephernaan is the only one worth listing. */
== c#husamJ IF ~GlobalLT("C#RtD_CaelarGodBless","GLOBAL",2)~ THEN @90 /* I know he claimes to be a priest of several gods, therefore proclaiming that Caelar's crusade is blessed by the whole of the pantheon - and crusaders believe this blasphemy. Apart from that, I know surprisingly little about him. */ DO ~SetGlobal("C#RtD_CaelarGodBless_SET","GLOBAL",2) SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~
== c#husamJ @91 /* Hephernaan's security is mouse tight. I don't seem to get spies near him - some just disappeared. Either they were killed, or he bribes or threatens them away. I can't yet put my finger on it, but there is something off - he is either very good at setting traps and his guards are as eager as they are fanatic - or he uses powerful magic my spies fall prey to. The amateurish attack on you at the palace does not speak for the existence of highly trained assassins needed to brush off mine - unless he has his own. */
== c#husamJ IF ~Global("C#RtD_HephernaanIdentity","GLOBAL",0)
Global("C#Husam_SoD_SawHeph","LOCALS",0)~ THEN @92 /* I saw a scetch of him so I will be able to recognize him when I see him. */
END
+ ~Global("C#RtD_HephernaanIdentity","GLOBAL",0)
Global("C#Husam_SoD_SawHeph","LOCALS",0)~ + @93 /* A scetch? Can you show it to me? */ DO ~SetGlobal("C#Husam_SoD_HepScetch","LOCALS",1)
SetGlobal("C#RtD_HephernaanName_SET","GLOBAL",1) 
SetGlobal("C#RtD_CaelarGodBless_SET","GLOBAL",2) 
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ + 1st_camp_06
++ @63 /* Let me ask another question. */ DO ~SetGlobal("C#RtD_HephernaanName_SET","GLOBAL",1)
SetGlobal("C#RtD_CaelarGodBless_SET","GLOBAL",2) SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ + crusade_questions
++ @40 /* I have no more questions. */ DO ~SetGlobal("C#RtD_HephernaanName_SET","GLOBAL",1)
SetGlobal("C#RtD_CaelarGodBless_SET","GLOBAL",2) SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ EXIT

APPEND c#husamj
IF ~~ THEN 1st_camp_06
SAY @94 /* I do no longer have it with me - I apologize. I will arrange for a copy to be delivered as soon as possible. */
++ @63 /* Let me ask another question. */ + crusade_questions
++ @40 /* I have no more questions. */ EXIT
END

IF ~~ THEN 1st_camp_07
SAY @95 /* The main arm of the crusade has taken Dragonspear Castle. Since then, nothing seem to have happened, at least nothing that could be detected from the outside. */
+ ~GlobalLT("C#RtD_KnowsPortalBlood","GLOBAL",3)~ + @96 /* Maybe something is going on inside? */ + 1st_camp_08
+ ~GlobalGT("C#RtD_CaelarPlan","GLOBAL",3)
GlobalLT("bd_plot","global",170)~ + @97 /* So they are still working on getting that portal open, as it seems. */ + 1st_camp_08_1
+ ~GlobalGT("C#RtD_CaelarPlan","GLOBAL",3)
GlobalGT("bd_plot","global",169)~ + @97 /* So they are still working on getting that portal open, as it seems. */ + 1st_camp_11
+ ~GlobalLT("C#RtD_KnowsPortalBlood","GLOBAL",3)~ + @98 /* Anything else? */ + 1st_camp_09
+ ~GlobalGT("C#RtD_KnowsPortalBlood","GLOBAL",2)
GlobalLT("bd_plot","global",170)~ + @99 /* So she's still waiting for the right blood to open the portal, huh. */ + 1st_camp_08_1
+ ~GlobalGT("C#RtD_KnowsPortalBlood","GLOBAL",2)
GlobalGT("bd_plot","global",169)~ + @99 /* So she's still waiting for the right blood to open the portal, huh. */ + 1st_camp_11
++ @63 /* Let me ask another question. */ + crusade_questions
++ @40 /* I have no more questions. */ EXIT
END

IF ~~ THEN 1st_camp_08
SAY @100 /* The crusaders around the castle seem to be put on hold, so Caelar seems to be waiting for something - or they are preparing something inside. */
IF ~~ THEN + 1st_camp_09
END
END //APPEND

CHAIN
IF ~~ THEN c#husamj 1st_camp_08_1
@101 /* I have information that Caelar went on a mission with her advisor, but the exact goal is unclear. */
== c#husamj IF ~GlobalGT("C#RtD_KnowsPortalBlood","GLOBAL",2)~ THEN @102 /* We do know that she needs your blood, and what for - we should be on alert, that much is clear. */ 
END
+ ~GlobalGT("C#RtD_KnowsPortalBlood","GLOBAL",2)~ + @103 /* You mean she could on a mission to get to me, directly? */ + 1st_camp_10
++ @63 /* Let me ask another question. */ + crusade_questions
++ @40 /* I have no more questions. */ EXIT


CHAIN
IF ~~ THEN c#husamj 1st_camp_09
@104 /* What they are preparing or waiting for I do not know, but she is planning on bringing back the souls that were taken to Avernus at Dragonspear Castle - maybe she is hoping to be able to connect to the magic that happened there all these years ago. */
== c#husamj IF ~Global("C#RtD_KnowsPortalBlood","GLOBAL",1)~ THEN @105 /* We already know that there was a rift that could be there still - dormant. */
END
IF ~~ THEN + 1st_camp_11
IF ~GlobalLT("bd_plot","global",170)~ THEN + 1st_camp_08_1

APPEND c#husamJ

IF ~~ THEN 1st_camp_10
SAY @106 /* You are all she still needs - I would be on such a mission, was I her. */
++ @63 /* Let me ask another question. */ + crusade_questions
++ @40 /* I have no more questions. */ EXIT
END

IF ~~ THEN 1st_camp_11
SAY @107 /* I had information that Caelar went on a mission with her advisor but not about the exact goal - I guess after you confronted her at Coastway Crossing we can assume that that is where they went, and that they are now returning to Dragonspear Castle - should this not be the case I'll be notified. I'm not letting them out of my sight again. */
++ @63 /* Let me ask another question. */ + crusade_questions
++ @40 /* I have no more questions. */ EXIT
END

IF ~~ THEN set_spies
SAY @108 /* [Husam]Sure, I will set my spies on this. I'll let you know when I'll receive any information. */
++ @63 /* Let me ask another question. */ + crusade_questions
++ @40 /* I have no more questions. */ EXIT
END

IF ~~ THEN umbral_accord_inquiry_01
SAY @109 /* No - nothing. *Absolutely* nothing, <CHARNAME>. */
++ @63 /* Let me ask another question. */ DO ~SetGlobal("C#HusamSoD_PID_UmbAcc","LOCALS",1)~ + crusade_questions
++ @40 /* I have no more questions. */ DO ~SetGlobal("C#HusamSoD_PID_UmbAcc","LOCALS",1)~ EXIT
END

IF ~~ THEN career
SAY @110 /* (laughs amiably) Can you blame me for it? A man has to take his opportunities as they come - and a thief will take even more, if he is smart. */
++ @111 /* Why going with me, the Bhaalspawn? */ + career_01
++ @112 /* Still, it is unsettling, having a companion who is only joining so he can keep an eye on me. */ + career_02
++ @113 /* Whatever the reason, I am glad to have you join me. */ + career_03
++ @114 /* Be aware that I'll watch you wherever we go just as well, Husam. */ + career_04
END

IF ~~ THEN career_01
SAY @115 /* Well, for some reason I wasn't really considering asking the Flaming Fist or the Waterhavian forces... (smiles) */
++ @112 /* Still, it is unsettling, having a companion who is only joining so he can keep an eye on me. */ + career_02
++ @113 /* Whatever the reason, I am glad to have you join me. */ + career_03
++ @114 /* Be aware that I'll watch you wherever we go just as well, Husam. */ + career_04
END

IF ~~ THEN career_02
SAY @116 /* Oh, but surely I am not the first and I definitely won't be the last who will join you because you are a Bhaalspawn. */
IF ~~ THEN + career_05
END

IF ~~ THEN career_03
SAY @117 /* I will make sure it is worth your time. */
IF ~~ THEN + career_05
END

IF ~~ THEN career_04
SAY @118 /* Why, excellent! I wouldn't want to travel with a leader who doesn't have <PRO_HISHER> companions exactly where <PRO_HESHE> wants them. */
IF ~~ THEN + career_05
END

IF ~~ THEN career_05
SAY @119 /* I *was* assigned to work with you by my Shadow Master first, but that doesn't explain why he took an interest in you, of course. Let's say you made a name of yourself. The decision to join you was my idea, though. I have certain... freedom to fulfill my orders. */ 
= @120 /* Don't forget that I did not join merely to watch your Bhaalspawn's steps, but to have a front-row look at how the crisis with the Crusade is handled. And the reason why you are the right person for that is nothing I decided, it's what the Dukes of Baldur's Gate are thinking, as well. */
= @121 /* Do not worry, <CHARNAME>. We Shadow Thieves do have a code of honor, even if using that very word makes a do-gooder snort with distaste. I know very well which incidents to report and which to consider private... and I do have a sense of loyalty to my leader - and the readiness to... "surpass" Shadow Thieves dogmas if loyalty requires it - as long as it does not mean giving away my guild or my Shadow Master. */
IF ~~ THEN EXIT
END

IF ~~ THEN career_followup
SAY @126 /* [Husam]I understand where you come from. That's why I said *an* honor code.~ */
IF ~~ THEN + career_followup_02
END

IF ~~ THEN career_followup_01
SAY @127 /* [Husam]Yes, <CHARNAME>, absolutely.~ */
IF ~~ THEN + career_followup_02
END

IF ~~ THEN career_followup_02
SAY @128 /* [Husam]The words do not necessarily mean the same as when a paladin uses them - but we Shadow Tieves *do* have a code of conduct and honor our word. You'll only have bad surprises with the Shadow Thieves if you do not understand the rules we are playing by - well, and if you dispise of theft, torture, and assassinations, of course. */ 
IF ~~ THEN EXIT
END

IF ~~ THEN marching_law_order
SAY @122 /* I could start hairsplitting by saying that many a Shadow Thief walked alongside official authorities as well as law and that the actual thing is that I am doing it in plain sight and with my comrades aware of what I am - but to answer your question: it feels good - only thing I haven't decided yet is whether I can sleep more at ease because I do not have to fear soldiers storming for a razzia any time soon or whether I should be even more on edge for walking right inside the hornests' nest. */ 
IF ~~ THEN EXIT
END

/* BGII */

IF ~~ THEN career2
SAY @123 /* Oh, but that is not decided just yet, <CHARNAME>. Yes, it surely got me into trouble, but don't you go thinking a Shadow Thief would need a Bhaalspawn to get into trouble - there are a lot more ways to achieve that. As it turns out, sometimes a traiterous fellow Shadow Thief is all it takes. */
IF ~~ THEN EXIT
END



/* ##
IF ~Global("C#Husam2_Dialog","GLOBAL",##)~ THEN about_maevar2
SAY ~I am surprised Mae'Var didn't get suspicious when you came as a member of the Thieves' Guild. He seemed to be very sure of himself, indeed. First, he lets you be kidnapped and delivers you to an over-powerful client. Then, he watches the Shadow Thieves be decimated by a public fight that sets you free. And yet, he thought he could use you to his own liking. What a fool!~
IF ~~ THEN DO ~IncrementGlobal("C#Husam2_Dialog","GLOBAL",1)~ EXIT
END
*/


END //APPEND