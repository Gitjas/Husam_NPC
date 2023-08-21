/* drunken fallen paladin Dauston */
/* Themed Tweaks: 
Global("#L_SoDStat_DaustonTalk","GLOBAL",2) - PC asked Duke Eltan to interrogate Dauston
Global("#L_SoDStat_DaustonTalk","GLOBAL",3) - PC got information about Dauston from Dukes.
*/

/*
IF ~~ THEN BEGIN 4 // from: 3.1 3.2 5.0
  SAY #58423 /* ~The tales I could tell you of Caelar, my friend. She was a hellacious child, but her uncle, noble Aun, was patient with her. It cost him everything. It cost ME everything. I—I...~ */
  IF ~~ THEN DO ~DialogueInterrupt(FALSE)
SetGlobal("BD_PASSOUT_DAUSTON","BD0030",1)
~ EXIT
END
*/
ADD_TRANS_ACTION BDDAUSTO BEGIN 4 END BEGIN END ~SetGlobal("C#Husam_SoDDauston","GLOBAL",1)~

I_C_T BDDAUSTO 4 C#Husam_BDDAUSTO_4
== c#husamJ IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @0 /* There he goes, passed out due to his liquer abuse. What he said might be of importance, though. It's a pity we won't be around to interrogate him further - but that can be delegated, if you wish. */
END


/* player asked about Aun and Caelar */
/* Husam will get the answer in the big coalition camp. */
/* compatibility Themed Tweaks: if player already heard the answer via the Dukes, Husam will refer to it. */
CHAIN
IF ~Global("C#Husam_SoDDauston","GLOBAL",3)~ THEN c#husamJ knows_about_aun_story
@1 /* I got a report about what happened with Caelar and her uncle Aun. */
== c#husamJ IF ~OR(2)
GlobalGT("C#RtD_KnowsAunArgent","GLOBAL",3)
Global("#L_SoDStat_DaustonTalk","GLOBAL",3)~ @2 /* It's a confirmation about what we learned in the meantime about Aun going into Avernus to save Caelar. I have nothing more to report. */ DO ~SetGlobal("C#Husam_SoDDauston","GLOBAL",5)~
== c#husamJ IF ~GlobalLT("C#RtD_KnowsAunArgent","GLOBAL",4)
GlobalLT("#L_SoDStat_DaustonTalk","GLOBAL",3)~ @3 /* It's quite an interesting tale about failure and guilt. Ask me if you want me to tell the details. */ DO ~SetGlobal("C#Husam_SoDDauston","GLOBAL",4)~
EXIT

APPEND c#husamJ

/* player asked about Crusader Uniform and/or Seal of Caelar */

IF ~Global("C#HusamSoD_PID_SoC","GLOBAL",3)~ THEN seal_of_caelar
SAY @4 /* <CHARNAME>, my sources left a Crusader Uniform and a Seal of Caelar in a hideout for us. They are in the Bloodbark Grove, in the big rock by the Belladonna bushes. */
IF ~~ THEN DO ~EraseJournalEntry(@100023) SetGlobal("C#HusamSoD_PID_SoC","GLOBAL",4)~ SOLVED_JOURNAL @100024 EXIT
END

/* Player asked about Caelar Bhaalchild */

/* PC doesn't know yet */
IF ~Global("C#HusamSoD_CaelarBC","GLOBAL",2)
GlobalLT("C#RtD_CaelarBhaalChild","GLOBAL",2)
Global("bd_mdd018","global",0)~ THEN caelar_no_bhaalchild
SAY @5 /* <CHARNAME>, my ressources could not find any evidence for Caelar being a descendant of Bhaal. She has Aasimar heritage, quite diluted actually which is showing in her unusually strong compared to the rest of her family, but she is no child of a god as many believe. */
++ @6 /* Thanks for the information. */ + caelar_no_bhaalchild_02
++ @7 /* Well, at least it's not another half-sibling I'm up against. */ + caelar_no_bhaalchild_02
+ ~OR(2)
GlobalGT("C#RtD_KnowsPortalBlood","GLOBAL",1)
GlobalGT("C#Husam_SoD_Foundbdbook11","GLOBAL",0)~ + @8 /* That means she can't open the portal under Dragonspear Castle herself? */ + caelar_no_bhaalchild_01
++ @9 /* It wouldn't have changed the fact we need to fight her, anyway. */ + caelar_no_bhaalchild_02
++ @10 /* Oh, and I was so much looking foreward to meeting another half-sister. */ + caelar_no_bhaalchild_02
END

/* PC already got the information */
IF ~Global("C#HusamSoD_CaelarBC","GLOBAL",2)
OR(2)
  	GlobalGT("bd_mdd018","global",0)
	GlobalGT("C#RtD_CaelarBhaalChild","GLOBAL",1)~ THEN caelar_no_bhaalchild_00
SAY @11 /* <CHARNAME>, we already got to know that Caelar is no child of Bhaal. My resources confirmed that she has Aasimar heritage, quite weak actually which is showing in her unusually strong compared to the rest of her family, but she is no child of a god as many believe. */
IF ~~ THEN + caelar_no_bhaalchild_02
END

IF ~~ THEN caelar_no_bhaalchild_01
SAY @12 /* That is to be assumed, yes. */
IF ~~ THEN + caelar_no_bhaalchild_02
END

IF ~~ THEN caelar_no_bhaalchild_02
SAY @13 /* She is playing her godly heritage card very well to motivate her followers, though. Her actual divine powers might be weak, but the tale about it is a strong factor for moving the crusade. */
IF ~~ THEN DO ~SetGlobal("C#HusamSoD_CaelarBC","GLOBAL",4)
SetGlobal("C#RtD_CaelarBhaalChild_SET","GLOBAL",2)
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ EXIT
END

/* in case PC did not ask Husam about the rumor and heard about Caelar not being a Bhaalchild, anyway */
IF ~Global("C#HusamSoD_CaelarBC","GLOBAL",3)~ THEN caelar_no_bhaalchild_03
SAY @14 /* Interesting to know that the rumors about Caelar being a child of Bhaal would not be true. I had spies on that, too. */
IF ~~ THEN + caelar_no_bhaalchild_02
END

/* Husam informs about more information about the crusade / Caelar:
1: in the first camp, after leaving the camp the first time 
4: in big coalition camp, after gathering of the officers. 
*/

IF ~OR(2)
Global("C#Husam_SoD1stCamp","GLOBAL",1)
Global("C#Husam_SoD1stCamp","GLOBAL",4)~ THEN 1st_camp
SAY @15 /* I have some interna from the crusaders, <CHARNAME>. Ask me if you are interested in hearing the information I could gather so far. */
+ ~Global("C#Husam_SoD1stCamp","GLOBAL",1)~ + @16 /* Oh, using the Shadow Thieves' Information Service? I am curious what intel you could gather. */ DO ~IncrementGlobal("C#Husam_SoD1stCamp","GLOBAL",1)~ + 1st_camp_01
+ ~Global("C#Husam_SoD1stCamp","GLOBAL",4)~ + @17 /* That's convenient. It might be useful for when I'll meet up with the officers. */ DO ~IncrementGlobal("C#Husam_SoD1stCamp","GLOBAL",1)~ + 1st_camp_02
++ @18 /* I will do so. */ DO ~IncrementGlobal("C#Husam_SoD1stCamp","GLOBAL",1)~ + 1st_camp_02
+ ~Global("C#Husam_SoD1stCamp","GLOBAL",1)~ + @19 /* You won't spoil too much, I hope? Takes the fun of finding out myself. */ DO ~IncrementGlobal("C#Husam_SoD1stCamp","GLOBAL",1)~  + 1st_camp_02
++ @20 /* Don't bother. I am sure we'll know most of it soon enough. */ DO ~IncrementGlobal("C#Husam_SoD1stCamp","GLOBAL",1)~ + 1st_camp_03
END
END //APPEND

CHAIN
IF ~~ THEN c#husamJ 1st_camp_01
@21 /* (smile) Anything regarding the crusade will be for free, <CHARNAME>. */
== c#husamJ IF ~GlobalGT("C#Husam_SoD_CaelInfoPID","LOCALS",0)~ THEN @22 /* - As I already assured you. */
END
IF ~~ THEN + 1st_camp_02

APPEND c#husamJ 
IF ~~ THEN 1st_camp_02
SAY @23 /* My knowledge is far from complete, but I will share whatever I know. Ask me anything you want. */
IF ~~ THEN EXIT
END

IF ~~ THEN 1st_camp_03
SAY @24 /* Let me know if you change your mind. */
IF ~~ THEN EXIT
END

END //APPEND


/* bd1000 after meeting Caelar and Hephernaan */
CHAIN
IF ~Global("C#Husam_SoD_CWC","GLOBAL",1)~ THEN c#husamj caelar_at_ccw
@25 /* [Husam]So that is where they went - Caelar and her advisor on a mission away from Dragonspear Castle. */ 
DO ~SetGlobal("C#Husam_SoD_CWC","GLOBAL",2)~
== c#husamj IF ~//Global("C#RtD_HephernaanIdentity","GLOBAL",0)
Global("C#Husam_SoD_SawHeph","LOCALS",0)
Global("C#Husam_SoD_HepScetch","LOCALS",0)~ THEN @26 /* That man next to Caelar was Caelar's advisor, by the way - Hephernaan. */ DO ~SetGlobal("C#Husam_SoD_SawHeph","LOCALS",1) SetGlobal("C#RtD_HephernaanIdentity_SET","GLOBAL",1) SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ 
== c#husamj IF ~//Global("C#RtD_HephernaanIdentity","GLOBAL",0)
Global("C#Husam_SoD_SawHeph","LOCALS",0)
Global("C#Husam_SoD_HepScetch","LOCALS",1)~ THEN @27 /* That man next to Caelar was Caelar's advisor, by the way - Hephernaan. Seems I do no longer need to organize a scetch to show him to you. */ DO ~SetGlobal("C#Husam_SoD_HepScetch","LOCALS",2)
SetGlobal("C#Husam_SoD_SawHeph","LOCALS",1) SetGlobal("C#RtD_HephernaanIdentity_SET","GLOBAL",1) SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~
== c#husamj IF ~GlobalLT("C#RtD_KnowsPortalBlood","GLOBAL",3)~ THEN @28 /* Where they waiting for The Flaming Fist forces? */
== c#husamj IF ~GlobalGT("C#RtD_KnowsPortalBlood","GLOBAL",2)~ THEN @29 /* I guess we know why they were here at this place where you were meant to pass through. */
== bdimoen IF ~GlobalGT("C#RtD_KnowsPortalBlood","GLOBAL",2) InParty("%IMOEN_DV%")
See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @30 /* Ooh yes, we know why they would try to come near <CHARNAME>. */
== bdimoen IF ~InParty("%IMOEN_DV%")
See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @31 /* Guess the barrels were supposed to explode while we are *on* the bridge, or something, eh? */
END
+ ~GlobalLT("C#RtD_KnowsPortalBlood","GLOBAL",3)~ + @32 /* Seemed a bit like they were waiting, yes. */ + caelar_at_ccw_01
+ ~GlobalLT("C#RtD_KnowsPortalBlood","GLOBAL",3)~ + @33 /* If I understood all the yelling correctly, they weren't really pleased with the outcome, whatever their reason to be here. */ + caelar_at_ccw_01
+ ~GlobalLT("C#RtD_KnowsPortalBlood","GLOBAL",3)~ + @34 /* What do you mean, Husam? */ + caelar_at_ccw_01

+ ~GlobalGT("C#RtD_KnowsPortalBlood","GLOBAL",2)~ + @32 /* Seemed a bit like they were waiting, yes. */ + caelar_at_ccw_03
+ ~GlobalGT("C#RtD_KnowsPortalBlood","GLOBAL",2)~ +  @35 /* If I understood all the yelling correctly, they weren't really pleased with the outcome. */ + caelar_at_ccw_03
+ ~GlobalGT("C#RtD_KnowsPortalBlood","GLOBAL",2)~ + @36 /* Well, seems the broken bridge spares us from sparring with Caelar personally, for now. */ + caelar_at_ccw_03

++ @37 /* It's a pity the bridge was destroyed. I would have liked to do more than just *parley* with Caelar. */ + caelar_at_ccw_02

APPEND c#husamj 

IF ~~ THEN caelar_at_ccw_01
SAY @38 /* [Husam]It can't be a coincidence they were *here* of all places, prepared like this. */
IF ~~ THEN + caelar_at_ccw_03
END

IF ~~ THEN caelar_at_ccw_02
SAY @39 /* [Husam]It would have been interesting to see the outcome of such a confrontation, yes. */
IF ~~ THEN + caelar_at_ccw_03
END

END //APPEND

CHAIN
IF ~~ THEN c#husamJ caelar_at_ccw_03
@40 /* If they tried to intercept it went wrong - apart from the time we will lose for taking a detour. Well, it seems they do not plan on intercepting a second time, if we can trust Caelar's words about meeting at Dragonspear Castle - at least not personally. */
== IF_FILE_EXISTS c#brageJ IF ~InParty("c#brage")
See("c#brage") !StateCheck("c#brage",CD_STATE_NOTVALID)~ THEN @41 /* Or they know that they can't easily cross the river just like we can't. A good leader needs to be ready to delegate delicate operations if they can't execute them personally. */
== c#husamJ @42 /* We will be ready for their assassins, <CHARNAME>, I assure you that. */
EXIT



/* bd1000, after bridge is destroyed and it's clear the way will go via Boareskyr Bridge. FF soldiers left. */
CHAIN
IF ~Global("C#Husam_SoD_BBridgeInfo","GLOBAL",1)~ THEN c#husamj bbridge_info
@43 /* [Husam]Using Boareskyr Bridge might prove difficult, <CHARNAME>. My informant told me that the crusade is about to take Bridgefort - that includes the bridge. */
DO ~SetGlobal("C#Husam_SoD_BBridgeInfo","GLOBAL",2)~
== bdcorwij IF ~InParty("CORWIN") See("CORWIN") !StateCheck("CORWIN",CD_STATE_NOTVALID)~ THEN @44 /* [Corwin]That is bad news. - Don't think I value you or your "informants" any more than I did before, Husam. */
== c#husamj @45 /* [Husam]They didn't take the bridge the time my spy talked to me, but seeing the delay and the time it will take us to get there, I am sure we will have to face a siege camp. */
EXIT

/* deprecated! -----
= @46 /* One thing - there is a mage with this delegation of crusaders, by the name of Oloneiros. *She* knows your face, <CHARNAME>. She drew a sketch herself, so everyone would recognize you. */
END
++ @47 /* Dang, that's bad. */ + bbridge_info_01
++ @48 /* That means all of those crusaders know who I am and there is no possibility to infiltrate them undetected? */ + bbridge_info_01
++ @49 /* Can't your spies place wrong bounty notes about me? You know, as a diversion. */ + bbridge_info_02
++ @50 /* Thank you for the info, we need to get going. */ + bbridge_info_03

APPEND c#husamj 

IF ~~ THEN bbridge_info_01
SAY @51 /* [Husam]Not necessarily. */
IF ~~ THEN + bbridge_info_04
END

IF ~~ THEN bbridge_info_02
SAY @52 /* [Husam]That's a good idea, but it might not be necessary here. */
IF ~~ THEN + bbridge_info_04
END

IF ~~ THEN bbridge_info_03
SAY @53 /* [Husam]Just one more thing, to make my point clear. */
IF ~~ THEN + bbridge_info_04
END
END //APPEND

CHAIN
IF ~~ THEN c#husamj bbridge_info_04
@54 /* [Husam]Oloneiros needed to draw a sketch, which means that noone *else* seems to know you. And she drew it herself - that is the advantage if the arrogance of people grows at the same rate as their power. It is a real bad sketch. It could be you or any other <PRO_MANWOMAN>. */
= @55 /* [Husam]It still doesn't mean noone else will know you - but chances are rather high. Oloneiros is the one we need to avoid on all costs, should we ever have to infiltrate the crusader's forces at Bridgefort.  */
EXIT
----- */

/* witnessed scrying pool - Hooded man scene */
ADD_TRANS_ACTION BDIRENI BEGIN 78 END BEGIN END ~IncrementGlobal("C#Husam_HepherScryPool","GLOBAL",1)~

/* after scrying pool */
CHAIN
IF ~Global("C#Husam_HepherScryPool","GLOBAL",3)
Global("C#RtD_HephernaanIdentity","GLOBAL",0)
Global("C#Husam_SoD_SawHeph","LOCALS",0)~ THEN c#husamJ heph_in_scrying_pool
@56 /* It seems the scrying pool showed us crucial information. That man next to the hooded figure was Hephernaan - Caelar's advisor. */ 
== c#husamJ IF ~Global("C#Husam_SoD_HepScetch","LOCALS",1)~ THEN @57 /* Seems I do no longer need to organize a scetch to show him to you. */ DO ~SetGlobal("C#Husam_SoD_HepScetch","LOCALS",2)~
END
IF ~~ THEN DO ~SetGlobal("C#Husam_SoD_SawHeph","LOCALS",1) SetGlobal("C#RtD_HephernaanIdentity_SET","GLOBAL",1) SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ + heph_in_scrying_pool_01

APPEND c#husamJ 
IF ~Global("C#Husam_HepherScryPool","GLOBAL",3)
OR(2)
Global("C#RtD_HephernaanIdentity","GLOBAL",1)
Global("C#Husam_SoD_SawHeph","LOCALS",1)~ THEN heph_in_scrying_pool_00
SAY @58 /* It seems the scrying pool showed us crucial information about Hephernaan. */
IF ~~ THEN + heph_in_scrying_pool_01
END

IF ~~ THEN heph_in_scrying_pool_01
SAY @59 /* He seems to have powerful connections - by a name I never heard before. */
++ @60 /* I also think that it refers to something powerful. Question is, what it is. */ + heph_in_scrying_pool_03
++ @61 /* Do you think you can gather information what this "Umbral Accord" would be? */ + heph_in_scrying_pool_03
+ ~Gender(Player1,FEMALE)~ + @62 /* Aww, Shadow Thieves' information service lacking intel? Seems some rogues need a few lashes! */ + heph_in_scrying_pool_04
+ ~GlobalGT("C#RtD_HephernaanBetrayal","GLOBAL",0)
Global("C#RtD_HephernaanFiend","GLOBAL",0)~ + @63 /* Now we know how he is betraying Caelar, I guess. */ + heph_in_scrying_pool_02
++ @64 /* It's of no use to dwell on this. Let's move on. */ + heph_in_scrying_pool_03
END

IF ~~ THEN heph_in_scrying_pool_02
SAY @65 /* That we know, indeed. */
IF ~~ THEN + heph_in_scrying_pool_03
END

IF ~~ THEN heph_in_scrying_pool_03
SAY @66 /* I don't know what the term "Umbral Accord" stands for. I don't even know whether it is an organisation or whether it's referring to a contracted alliance of sorts. - It has nothing to do with the Shadow Thieves, I can assure you that. I'll ask for further intel and let you know if I get any information on this. */
IF ~~ THEN DO ~SetGlobal("C#Husam_HepherScryPool","GLOBAL",4)~ EXIT
END

IF ~~ THEN heph_in_scrying_pool_04
SAY @67 /* Hmm... now that sounds interesting indeed, <CHARNAME>. */
IF ~~ THEN + heph_in_scrying_pool_03
END

/* know about Hephernaan working for a fiend */
/* before or after portal scene. The betrayal and their obliviousness about it occupies Husam */
IF ~Global("C#Husam_HepherFiend","GLOBAL",1)~ THEN heph_traitor_01
SAY @68 /* Hephernaan, Caelar's "right hand" working for a fiend. *Tch* - and Caelar, the "Shining Lady" walking alongside him in obliviousness. */
IF ~~ THEN + heph_traitor_00
END

IF ~~ THEN heph_traitor_00
SAY @69 /* So *typical* - the more ambitious and visionary the leader, the easier they fall prey to such schemes. */
++ @70 /* Seems so, yes. */ + heph_traitor_03
++ @71 /* And probabaly lacking intelligence, wisdom, or due to blind faith and trust in the wrong people. */ + heph_traitor_02
++ @72 /* Is that your experience? Why would this be the case? */ + heph_traitor_09
++ @73 /* I wouldn't know why these kind of leaders are more at risk than any other. */ + heph_traitor_09
++ @74 /* I don't want to talk about this. */ + heph_traitor_end
END

IF ~~ THEN heph_traitor_02
SAY @75 /* That, too - and missing control instances. */
IF ~~ THEN + heph_traitor_03
END

IF ~~ THEN heph_traitor_03
SAY @76 /* Blind trust in your people is only wise if you have security measures against treachery. */  
++ @77 /* ...Which is, like, the opposite of what blind trust actually means. */ + heph_traitor_05
+ ~Global("C#HU_HephFiend_1","LOCALS",0)~ + @78 /* If only they had used the Shadow Thieves' information service! */ DO ~SetGlobal("C#HU_HephFiend_1","LOCALS",1)~ + heph_traitor_04
+ ~Global("C#HU_HephFiend_1","LOCALS",1)~ + @78 /* If only they had used the Shadow Thieves' information service! */ + heph_traitor_04_b
++ @79 /* Not necessarily. If the followers are as driven by the goal as the leader, the danger shouldn't exist. */ + heph_traitor_06
++ @74 /* I don't want to talk about this. */ + heph_traitor_end
END

IF ~~ THEN heph_traitor_04
SAY @80 /* (scoff) Which would have done them no good in this case. To my utmost frustration I have to admit that I knew *nothing* about it. None of my rogues were able to report back to me regarding *this*. */
IF ~~ THEN + heph_traitor_07
END

IF ~~ THEN heph_traitor_04_b
SAY @81 /* (scoff) Which would have done them no good in this case. None of my rogues were able to report back to me regarding *this*. */
IF ~~ THEN + heph_traitor_07
END

IF ~~ THEN heph_traitor_05
SAY @82 /* "Blind" never descibes anything positive, <CHARNAME>. */
IF ~~ THEN + heph_traitor_07
END

IF ~~ THEN heph_traitor_06
SAY @83 /* If they burn for the *same* goal - yes. But look at what we have here - Hephernaan wants to achieve the same thing Caelar does - reaching into Avernus, but their goals couldn't be any more different. */
IF ~~ THEN + heph_traitor_07
END

IF ~~ THEN heph_traitor_07
SAY @84 /* It's not that this couldn't happen to *any* leader - it's a matter of putting trust on the one hand and being aware of possible betrayal on the other. To have the team work as one and have them keep an eye on each other at the same time. It's a delicate matter. Usually, the most amitious, driven leaders do not have an eye for this kind of intelligent micromanagement. They just expect everyone to follow their vision. */
IF ~~ THEN + heph_traitor_10
IF ~Global("C#HU_HephFiend_1","LOCALS",0)~ THEN DO ~SetGlobal("C#HU_HephFiend_1","LOCALS",1)~ + heph_traitor_08
END

IF ~~ THEN heph_traitor_08
SAY @85 /* I pride myself with having a net of independently working cells to safeguard myself against such a betrayal. I'm not arrogant enough to think it could never happen inside the Shadow Thieves, but I think we are well set against it. At least if it comes to our own standing - to my utmost frustration I have to admit that I knew *nothing* about Hephernaan's master. */
IF ~~ THEN + heph_traitor_chain
END

IF ~~ THEN heph_traitor_09
SAY @86 /* The main problem is being blinded. In my experience, the bigger the leader's vision, the more they believe everyone would share it. */
IF ~~ THEN + heph_traitor_03
END

IF ~~ THEN heph_traitor_10
SAY @87 /* I pride myself with having a net of independently working cells to safeguard myself against such a betrayal - I'm not arrogant enough to think it could never happen inside the Shadow Thieves, but I think we are well set - at least if it comes to our own standing. */
IF ~~ THEN + heph_traitor_chain
END

IF ~~ THEN heph_traitor_end
SAY @88 /* Then I will be quiet about it. */
IF ~~ THEN DO ~SetGlobal("C#Husam_HepherFiend","GLOBAL",2)~ EXIT
END

END //APPEND

CHAIN
IF ~~ THEN c#husamj heph_traitor_chain
@89 /* Now I know why I got no intel on Hephrnaan and all my spies vanished before being able to report back - I knew something was off, but it could have been good traps and eager guards. But with this secret, it is no wonder he made sure noone will be able to spy on him - or live to tell. */
== c#husamJ IF ~GlobalLT("bd_plot","global",485)
!Global("C#HU_SoD_BrensQuest","GLOBAL",5)
!Global("C#HU_SoD_BrensQuest","GLOBAL",6)
!Global("C#HU_SoD_BrensQuest","GLOBAL",7)
!Global("C#HU_SoD_BrensQuest","GLOBAL",13)
!Global("C#HU_SoD_BrensQuest","GLOBAL",14)~ THEN @90 /* Hephernaan is an enemy we should not underestimate, <CHARNAME>. He seems to be master of deception, and I am completely blind when it comes to him. */
== c#husamJ IF ~GlobalLT("bd_plot","global",485)
OR(3) Global("C#HU_SoD_BrensQuest","GLOBAL",5)
Global("C#HU_SoD_BrensQuest","GLOBAL",6)
Global("C#HU_SoD_BrensQuest","GLOBAL",7)~ THEN @91 /* Hephernaan is an enemy we should not underestimate, <CHARNAME>. He seems to be master of deception. I was so far completely blind when it comes to him - and Bren didn't report back any details, either. */
== c#husamJ IF ~GlobalLT("bd_plot","global",485)
OR(2) Global("C#HU_SoD_BrensQuest","GLOBAL",13)
Global("C#HU_SoD_BrensQuest","GLOBAL",14)~ THEN @92 /* Hephernaan is an enemy we should not underestimate, <CHARNAME>. He seems to be master of deception. I was so far completely blind when it comes to him - Bren was only one victim of several of Hephernaan's power. */
END
IF ~~ THEN DO ~SetGlobal("C#Husam_HepherFiend","GLOBAL",2)~ EXIT

APPEND c#husamJ 

/* Hephernaan betrays Caelar somehow */
IF ~Global("C#Husam_HephernaanBetrayal","GLOBAL",1)~ THEN hephernaan_betraying_caelar
SAY @93 /* Hephernaan would betray Caelar? We need to know how, and what he is planning. To my utmost frustration I have to admit that I know *nothing* about it. I will do my best to gather intel about this, but I start to understand why gathering intel about Hephernaan and his doings is such a frustratingly difficult task. His security means have to be unmeasurable to protect his secret. This man is not a fool, <CHARNAME>. */
IF ~~ THEN DO ~SetGlobal("C#Husam_HephernaanBetrayal","GLOBAL",2)
SetGlobal("C#HU_HephFiend_1","LOCALS",1)~ EXIT
END
END //APPEND

/* 5.4 General reaction: Caelar wants to open a portal to Avernus. */
CHAIN
IF ~Global("C#Husam_PortalAvernus","GLOBAL",1)~ THEN c#husamJ open_portal
@94 /* [Husam]So we know for sure what the plan of this "crusade" would be - opening a portal to Avernus. Opening a portal means giving fiends the possibility to come *out*. I'm a tactician, <CHARNAME>. Caelar's crusade is of impressive size, and except for a minority, her followers are fully committed to her plans. */
== c#husamJ IF ~Global("C#RtD_HephernaanFiend","GLOBAL",0)~ THEN @95 /* It might even have been realistic for them to go to Avernus and return - not *all* of them, of course, but as a crusade - where it not for the losses due to the fights with the coalition. As it is, their strength gets too much divided and they will not have the power needed for Avernus. */
== c#husamJ IF ~GlobalGT("C#RtD_HephernaanFiend","GLOBAL",0)~ THEN @96 /* It might even have been realistic for them to go to Avernus and return - not *all* of them, of course, but as a crusade - where it not for Hephernaan preparing an army of fiends waiting on them, and the losses due to the fights with the coalition. As it is, their strength gets too much divided and they will not have the power needed for Avernus. */
END
++ @97 /* I agree with you that her plans are megalomaniac. Just putting the Sword Coast into such dangers is unbelievable. */ + open_portal_01
++ @98 /* I still think her crusade is quite impressive. */ + open_portal_01
++ @99 /* You make it sound as if it's the coalition's fault in case there will be another fiend war. */ + open_portal_05
++ @100 /* You say the majority of crusaders is supporting her plans, but what makes them think they could just enter Avernus? */ + open_portal_04
++ @101 /* It's still a blessing the coalition is here to stop them. */ + open_portal_03
++ @102 /* I'd rather work on stopping them than speculate about it. Let's move on. */ + open_portal_02
++ @103 /* I don't want to talk about it. */ + open_portal_02


APPEND c#husamJ 
IF ~~ THEN open_portal_01
SAY @104 /* Caelar wasn't completely delusional when setting the plan up. It would have been possible to save souls from Avernus with all her forces had they not been diminished by all the fights and sieges along the way. A lot of crusaders would have died in Avernus, of course, too. But the fact that she will fail is not her vision, but the execution - including the resitance of opposing parties she didn't take into account. */
IF ~~ THEN + open_portal_05
END

IF ~~ THEN open_portal_02
SAY @105 /* Then we should stop talking. */
IF ~~ THEN DO ~SetGlobal("C#Husam_PortalAvernus","GLOBAL",2)~ EXIT
END

IF ~~ THEN open_portal_03
SAY @106 /* For the lands it is still advantageous we are already here - and know about the threat, I agree on that. */
IF ~~ THEN + open_portal_05
END

IF ~~ THEN open_portal_04
SAY @107 /* I am not sure. All feedback I got indicates that she radiates the certainty that the crusader's goal to enter Avernus and emerge victorious will come true, but I see nothing to back it up. */
IF ~~ THEN + open_portal_07
IF ~Global("C#Husam_SoDDauston","GLOBAL",4)~ THEN + open_portal_08
IF ~GlobalGT("C#Husam_AllForAun","GLOBAL",0)~ THEN + open_portal_06
END

IF ~~ THEN open_portal_05
SAY @108 /* I didn't mean to imply Caelar would succeed in her plans like she presents it - rescuing everyone, without any losses. I merely think that her army would have been big enough to stop fiends from crossing over. As it is, the crusade will not stop a possible fiend war alone - there were two, and it took big coalitons and heavy losses to win them. These lands - these authorities, forming the coalition, setting out to face the threat the crusade is posing, can be glad they are already here. */
IF ~~ THEN DO ~SetGlobal("C#Husam_PortalAvernus","GLOBAL",2)~ EXIT
END

IF ~~ THEN open_portal_06
SAY @109 /* We know who is Caelar's priority - her uncle. But even if he were her *only* motive, this plan to free him is risky at best. */
IF ~~ THEN + open_portal_05
END

IF ~~ THEN open_portal_07
SAY @110 /* I understand well how Caelar collected her followers. What I don't understand is why *Caelar* is going through with this. */
IF ~~ THEN + open_portal_05
END

IF ~~ THEN open_portal_08
SAY @111 /* Ask me about what I found out about Caelar's possible motivation - what happened with her and her uncle Aun over a decade ago. It might shed a little light on her priorities. */
IF ~~ THEN + open_portal_05
END


/* 6.2 Reaction after learning that Caelar needs the PC / PC's blood for something */
/* PC's divinely powered body */
IF ~GlobalGT("C#IM_SoD_PortalPCBlood","GLOBAL",1)
Global("C#Husam_SoDCaelarWantsPC","GLOBAL",1)~ THEN bhaalchild_items
SAY @112 /* <CHARNAME>, Imoen might have spoken in jest, but she raised a valid point. */
IF ~~ THEN + bhaalchild_items_2
END

/* Imoen's dialogue didn't fire yet */
IF ~Global("C#Husam_SoDCaelarWantsPC","GLOBAL",1)~ THEN bhaalchild_items_2
SAY @113 /* There is a huge black market for all kind of trinkets and potions and blood of mystic creatures - up to the whole creatures - assumed to give people a boost of power and whatnot. It seems Caelar is your first foe who realised the possibilities of a divinly touched Bhaalchild <PRO_RACE>. */
= @114 /* There will be increasing interest for your blood, maybe even parts of you - or you as a whole as a means to harvest your divine power. Whether this is really possible or just in people's believes will not matter to you at some point. You will have to fight them off no matter their motives. */
++ @115 /* I fear you are right. */ + bhaalchild_items_01
++ @116 /* I always knew I was something special. */ + bhaalchild_items_03
++ @117 /* Are you already counting your possible earnings for the Shadow Thieves if you could "harvest" me yourself, hmm? */ + bhaalchild_items_02
++ @118 /* I guess it doesn't make much of a difference why they will be coming at me. */ + bhaalchild_items_01
++ @119 /* I am not scared. */ + bhaalchild_items_01
END

IF ~~ THEN bhaalchild_items_01
SAY @120 /* I give you my word of honor that I will stand up to my guild master for you being a more valuable asset alive and as a possible *ally* than sold or gutted, should he ever consider otherwise. But you need to brace yourself that not all thieving and smuggler organisation will be so farsighted not to fence you off for a good sum of gold - alive or in pieces. */
IF ~~ THEN DO ~SetGlobal("C#Husam_SoDCaelarWantsPC","GLOBAL",2)~ EXIT
END

IF ~~ THEN bhaalchild_items_02
SAY @121 /* No. I am not that short sighted, but I assume you did not really mean this. */
IF ~~ THEN + bhaalchild_items_01
END

IF ~~ THEN bhaalchild_items_03
SAY @122 /* You definitely are. */
IF ~~ THEN + bhaalchild_items_01
END


/* 2.2 General reaction to the knowledge that Caelar's ulterior motive was to free her uncle. */

IF ~Global("C#Husam_AllForAun","GLOBAL",1)~ THEN all_for_aun
SAY @123 /* Caelar's uncle being in Avernus makes her dangerous. She *will* see this through. */
++ @124 /* I fear so, too. */ + all_for_aun_01
++ @125 /* Well, I understand her motive, at least. */ + all_for_aun_01
++ @126 /* She lost sight of the proportions of what she's doing, I think. */ + all_for_aun_01
++ @127 /* We can't change it. Let's move on. */ + all_for_aun_01
END

IF ~~ THEN all_for_aun_01
SAY @128 /* She's not the first warlord who caused a lot of destruction and pain for personal goals aimed way too high - and I'm afraid she won't be the last. */
IF ~~ THEN DO ~SetGlobal("C#Husam_AllForAun","GLOBAL",2)~ EXIT
END
END //APPEND

/* 8. Reaction to betrayal at the portal */
/* Husam will not react to needed blood */
I_C_T3 BDHEPHER 16 C#Husam_SoDPortalScene
/* 8.A. PC didn't suspect anything about Hephernaan's plans */
== c#husamJ IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
See("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)
Global("C#RtD_HephernaanBetrayal","GLOBAL",0)
Global("C#RtD_HephernaanFiend","GLOBAL",0)~ THEN @129 /* A trap! Planned to the second, and we went right into it. (Tch!) I never felt so *blind* in my life. Well, maybe I won't have much time left to fret - the portal is open! */
/* 8.B PC knew about Hephernaan's own plans before */
== c#husamJ IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
See("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)
OR(2)
	GlobalGT("C#RtD_HephernaanBetrayal","GLOBAL",0)
	GlobalGT("C#RtD_HephernaanFiend","GLOBAL",0)~ THEN @130 /* A trap, and we went right into it, although we knew about the planned betrayal! (Tch!) I never felt so *blind* in my life. Well, maybe I won't have much time left to fret - the portal is open! */
END

APPEND c#husamJ
/* after incident at Boareskyr Bridge */

IF ~Global("C#Husam_SoDBoareskyrBridgeScene","GLOBAL",1)
Global("C#Husam_c#stff24_10","GLOBAL",0)~ THEN bhaal_bridge
SAY @154 /* ~I know you received powers through dreams. But this - this was something different.~ */
++ @131 /* What *was* that? */ + bhaal_bridge_01
++ @132 /* You don't say! */ + bhaal_bridge_01
++ @133 /* That it was, indeed. */ + bhaal_bridge_01
++ @134 /* Well, it's over now. Let's move on. */ + bhaal_bridge_06
END

IF ~Global("C#Husam_SoDBoareskyrBridgeScene","GLOBAL",1)
Global("C#Husam_c#stff24_10","GLOBAL",1)
!AreaCheck("bd2000")~ THEN bhaal_bridge_00
SAY @135 /* All seems to indicate that what happened on Boareskyr Bridge was caused by divine magic. */
++ @132 /* You don't say! */ + bhaal_bridge_02
++ @133 /* That it was, indeed. */ + bhaal_bridge_02
++ @134 /* Well, it's over now. Let's move on. */ + bhaal_bridge_06
END

IF ~Global("C#Husam_SoDBoareskyrBridgeScene","GLOBAL",1)
Global("C#Husam_c#stff24_10","GLOBAL",1)
AreaCheck("bd2000")~ THEN bhaal_bridge_01
SAY @136 /* All seems to indicate that what happened here was caused by divine magic. */
+ ~Global("C#Husam_c#stff24_10","GLOBAL",1)~ + @132 /* You don't say! */ + bhaal_bridge_02
+ ~Global("C#Husam_c#stff24_10","GLOBAL",1)~ + @133 /* That it was, indeed. */ + bhaal_bridge_02
+ ~Global("C#Husam_c#stff24_10","GLOBAL",1)~ + @134 /* Well, it's over now. Let's move on. */ + bhaal_bridge_06
IF ~Global("C#Husam_c#stff24_10","GLOBAL",0)~ THEN + bhaal_bridge_02
END

IF ~~ THEN bhaal_bridge_02
SAY @137 /* Bhaal's sign appearing like this has never happened before, and I can tell you that you were not the first Bhaalchild coming here - although maybe the most powerful one. Seems the decision to monitor you was the right one. Your Bhaal heritage will play an important role in the future, be it due to people's perception or because of the divine power you will be able to wield. */
= @138 /* Politically, this was a desaster. It is one thing to hear or suspect that you are a Bhaalchild, but it is something completely different to witness or learn about such a happening. It will lead common folks to associate you with Bhaal, and in a fearful manner. And anyone with power will notice you now because of your power's potential - be it to profit from you or because they see you as a threat. */
++ @139 /* And then there are those who will not be frightened but turn to admirers who think that I will be their villaneous savior. */ + bhaal_bridge_09
++ @140 /* I guess you are right. Oh well. */ + bhaal_bridge_04
++ @141 /* Yes, I could figure that out myself, thank you. */ + bhaal_bridge_06
++ @142 /* It's not like I did that on purpose, you know. */ + bhaal_bridge_07
++ @143 /* Are you sure it will make so huge ripples? */ + bhaal_bridge_08
++ @144 /* Why so paranoid? Magic is normal in this world, as is divine interference. */ + bhaal_bridge_08
++ @145 /* Maybe it was all just a show to frighten our foes - how would they know? */ + bhaal_bridge_03
++ @146 /* Let them come. */ + bhaal_bridge_05
END

IF ~~ THEN bhaal_bridge_03
SAY @147 /* This surely looked like an event created so your heritage would frighten people. But it also frightened you allies - which would be bad design for a planned coup. */
IF ~~ THEN + bhaal_bridge_06
END

IF ~~ THEN bhaal_bridge_04
SAY @148 /* We need to be weary - now a bit more than we already were. */
IF ~~ THEN + bhaal_bridge_06
END

IF ~~ THEN bhaal_bridge_05
SAY @149 /* Oh, they will come. A lot of people, <CHARNAME>. You will be surprised. */
IF ~~ THEN + bhaal_bridge_06
END

IF ~~ THEN bhaal_bridge_06
SAY @150 /* Tread carefully, as many eyes are watching you now - allies' as much as foes'. Know that I am watching your back - as best as I can. */
IF ~~ THEN DO ~SetGlobal("C#Husam_SoDBoareskyrBridgeScene","GLOBAL",2)~ EXIT
END

IF ~~ THEN bhaal_bridge_07
SAY @151 /* Then the gods decided for you. Make the best out of it - it's all you can do. */
IF ~~ THEN + bhaal_bridge_06
END

IF ~~ THEN bhaal_bridge_08
SAY @152 /* I do not know much about magic - but I *do* know a thing or two about manipulation - and this event was perfect for turning how the masses perceive you. */
IF ~~ THEN + bhaal_bridge_06
END

IF ~~ THEN bhaal_bridge_09
SAY @153 /* indeed, and I am not sure which of these groups will be more dangerous to your mission and you, personally, in the long run. */
++ @140 /* I guess you are right. Oh well. */ + bhaal_bridge_04
++ @141 /* Yes, I could figure that out myself, thank you. */ + bhaal_bridge_06
++ @142 /* It's not like I did that on purpose, you know. */ + bhaal_bridge_07
++ @143 /* Are you sure it will make so huge ripples? */ + bhaal_bridge_08
++ @144 /* Why so paranoid? Magic is normal in this world, as is divine interference. */ + bhaal_bridge_08
++ @145 /* Maybe it was all just a show to frighten our foes - how would they know? */ + bhaal_bridge_03
++ @146 /* Let them come. */ + bhaal_bridge_05
END
END //APPEND