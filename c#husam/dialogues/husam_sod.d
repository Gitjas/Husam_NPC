/* "C#HUSAM" is used by bg1re! */

/* meeting dialogue 

bd0020.are [1080.120],S */

BEGIN C#HUSAM1

IF ~Global("C#HusamSpawn","GLOBAL",1)~ THEN meeting
SAY @4 /* [Husam]<CHARNAME>! */
++ @5 /* Husam! */ + meeting_02
++ @6 /* Do I know you? */ + meeting_01
END

IF ~~ THEN meeting_01
SAY @7 /* [Husam]We had the honor, yes. I am Husam, representative of the Shadow Thieves' Guild. */
IF ~~ THEN + meeting_03
END

IF ~~ THEN meeting_02
SAY @8 /* [Husam]I see you did not forget about me. */
IF ~~ THEN + meeting_03
END

IF ~~ THEN meeting_03
SAY @9 /* [Husam]I need to approach you, again. My sources told me there was an attack aimed at you inside the Palace. I need you to know that - again - it was not the Shadow Thieves. */
++ @10 /* No worries. We already know it was Caelar's doing. */ + meeting_04
++ @11 /* You are approaching me directly with information like these? */ + meeting_10
++ @12 /* Why would I believe you? */ + meeting_11
END

IF ~~ THEN meeting_04
SAY @13 /* [Husam]Is that so! Interesting. */
IF ~~ THEN + meeting_10
END

IF ~~ THEN meeting_05
SAY @14 /* [Husam]We Shadow Thieves watch this Caelar with great interest. Any warlord with an army of this size should be watched carefully. But... as embarrassing as it is to admit, we are not so good stationed with informants if it comes to her opponents - the Flaming Fist forces, to be precise. */
IF ~~ THEN + meeting_06
IF ~AreaCheck("bd0101")~ THEN + meeting_08
IF ~GlobalGT("#L_Transitions","GLOBAL",0)
Global("#L_PCArmyStatus","GLOBAL",2)~ THEN + meeting_16
END

IF ~~ THEN meeting_06
SAY @15 /* [Husam]My sources are good enough to know that you will be marching against this Caelar. */
++ @16 /* This is true. */ + meeting_08
++ @17 /* What concern of yours would this be? */ + meeting_08
++ @18 /* That is nothing I will discuss with you. */ + meeting_07
END

IF ~~ THEN meeting_07
SAY @19 /* [Husam]Maybe you want to hear me out before deciding. */
IF ~~ THEN + meeting_08
END

CHAIN
IF ~~ THEN C#HUSAM1 meeting_08
@20 /* [Husam]We need first-hand information from the forces against Caelar, as well as information about her ongoings. We also want to get to know you better, the Bhaal Spawn who killed Sarevok and prevented a war between Amn and Baldur's Gate. */
= @21 /* [Husam]You did the Shadow Thieves a good service, cleansing our name from the Scar murder accusations. I don't see a reason why I should try to infiltrate your forces with hidden informants if I can get what I want the direct way. We worked quite well together in the past, <CHARNAME>. I would like to join you. */
= @22 /* [Husam]I will join you and support you in your fight - and in exchange I will have first-hand information about your march against the crusade. */
== BDSCHAEL IF ~See("BDSCHAEL") !StateCheck("BDSCHAEL",CD_STATE_NOTVALID)~ THEN @23 /* [Corwin]<CHARNAME>, you are not seriously considering this? Joining forces with a representative of an illegal organisation might not be the best preparation for our cause. */
== C#Husam1 IF ~See("BDSCHAEL") !StateCheck("BDSCHAEL",CD_STATE_NOTVALID)~ THEN @24 /* [Husam]Oh, but the Shadow Thieves are no illegal organisation. Shadowy, yes, but that comes with our profession. I'm offering to accompany your hero in plain sight, instead of stalking <PRO_HIMHER> from the shadows. The thought of having me in front of your nose must be appealing to you, fightress of the law. */
== BDSCHAEL IF ~See("BDSCHAEL") !StateCheck("BDSCHAEL",CD_STATE_NOTVALID)~ THEN @25 /* [Corwin]Pff, it would sit better with me if bad lots like you would be out of sight completely. */
== C#Husam1 IF ~See("BDSCHAEL") !StateCheck("BDSCHAEL",CD_STATE_NOTVALID)~ THEN @26 /* [Husam]Oh, but there is no need for name calling. In the past, <CHARNAME> was approached by Zentharim, by Harpers, by Red Wizard's of Thay, and now by the Flaming Fist. Don't you agree that it is advantageous to combine forces with potent allies against a foe like Caelar? Look around you. Don't you think having a capable rogue alongside you would be the best choice for this city, your home, your responsibility? */
== BDSCHAEL IF ~See("BDSCHAEL") !StateCheck("BDSCHAEL",CD_STATE_NOTVALID)~ THEN @27 /* [Corwin]You leave my *home* out of this, rogue. <CHARNAME> - this is your decision, but I advise strongly against opening the door to a Shadow Thief like this. */
== C#Husam1 @28 /* [Husam]You'll have a patient companion with me, <CHARNAME>. Let me join, and I promise you I will not judge your decisions - as long as they do not explicitely harm me or my guild. I can even follow further back, if you want other people to take the valuable spots next to you. */
END
IF ~~ THEN + meeting_20

CHAIN
IF ~~ THEN meeting_09
SAY @29 /* [Husam]Oh, but I am not 'the' Shadow Thieves, <CHARNAME>. I am merely a rogue with, let's say, very good connections. A very good rogue, I might add. */
== C#HUSAM1 IF ~Class(Player1,THIEF_ALL)~ THEN @41 /* [Husam]Not that you would need one, considering your own profession... But I am offering it nontheless. Two pairs of eyes see better in the dark than one. */
END
++ @31 /* Information about me? What do you mean? */ + meeting_21
+ ~GlobalGT("RE1_HusamFlirt","GLOBAL",0)~ + @250 /* ~Yes, I know you know how to handle your 'tools'... after the *detailed* demonstration back in Badur's Gate.~ */ + meeting_09a
+ ~GlobalGT("RE1_HusamFlirt","GLOBAL",0)~ + @32 /* Are you offering me to 'relieve the tension' again, my dextrous rogue? */ DO ~Global("C#HU_HeSaidInsists","LOCALS",1)~ + meeting_12
++ @33 /* Yes, I would like you to join me. */ + meeting_14
++ @249 /* I will not join forces with you, Husam. */ + meeting_13


APPEND C#HUSAM1

IF ~~ THEN meeting_09a
SAY @30 /* [Husam]That you do. (He smiles.) */
++ @31 /* Information about me? What do you mean? */ + meeting_21
+ ~GlobalGT("RE1_HusamFlirt","GLOBAL",0)~ + @32 /* Are you offering me to 'relieve the tension' again, my dextrous rogue? */ DO ~Global("C#HU_HeSaidInsists","LOCALS",1)~ + meeting_12
++ @33 /* Yes, I would like you to join me. */ + meeting_14
++ @249 /* I will not join forces with you, Husam. */ + meeting_13
END

IF ~~ THEN meeting_10
SAY @35 /* [Husam]Up to now the blame was always laid onto the Shadow Thieves in cases like these. */
++ @36 /* Caelar doesn't seem to have a need for these kinds of games. */ + meeting_05
++ @37 /* Your informants aren't that good, eh? */ + meeting_05
++ @38 /* What is your piont? */ + meeting_05
END

IF ~~ THEN meeting_11
SAY @39 /* [Husam]Maybe because I never lied to you in the past. The Shadow Thieves have no interest in harming you, <CHARNAME>. */
IF ~~ THEN + meeting_05
END

END

CHAIN
IF ~~ THEN C#HUSAM1 meeting_12
@40 /* [Husam]That - if you insist on it. But I offer so much more this time. I can keep you save from traps and poisoned ale, and whatever else your foes might have planned at you.~ */
END
++ @31 /* Information about me? What do you mean? */ + meeting_21
++ @42 /* Join forces with the Shadow Thieves alongisde the Flaming Fist? */ + meeting_09
++ @33 /* Yes, I would like you to join me. */ + meeting_14
++ @249 /* I will not join forces with you, Husam. */ + meeting_13

APPEND C#HUSAM1

IF ~~ THEN meeting_13
SAY @43 /* [Husam]A pity. We do wish you good fortune in this fight, <CHARNAME>. Do not mistake the Shadow Thieves as your enemies - in this war, we are not. */
IF ~~ THEN DO ~SetGlobal("C#HusamSpawn","GLOBAL",2) EscapeArea()~ EXIT
END

IF ~~ THEN meeting_14
SAY @44 /* [Husam]It is my pleasure, <CHARNAME>. */
IF ~NumInPartyLT(6)~ THEN DO ~SetGlobal("C#HusamSoDInParty","GLOBAL",1) SetGlobal("C#HusamSpawn","GLOBAL",3) SetGlobal("C#HusamJoined","GLOBAL",1) 
RealSetGlobalTimer("C#HusamDialogTimer","GLOBAL",900)
SetGlobal("C#Husam_Dialog","GLOBAL",1) 
SetDialog("C#Husamj")
JoinParty()~ EXIT
IF ~NumInParty(6)~ THEN + meeting_15
END

IF ~~ THEN meeting_15
SAY @45 /* [Husam]I'll stay in the back. */
IF ~~ THEN DO ~SetGlobal("C#HusamSoDInParty","GLOBAL",1) SetGlobal("C#HusamSpawn","GLOBAL",3) 
RealSetGlobalTimer("C#HusamDialogTimer","GLOBAL",900)
RealSetGlobalTimer("C#HusamNPCBanterTimer","GLOBAL",1200)
SetGlobal("C#Husam_Dialog","GLOBAL",1)  
MakeGlobalOverride()
SetGlobal("C#HusamJoined","GLOBAL",2)
ChangeEnemyAlly(Myself, FAMILIAR)
SetDialog("C#Husamj")
AddFamiliar()
ChangeAIScript("",CLASS)
ChangeAIScript("",RACE)
ChangeAIScript("",GENERAL)
ChangeAIScript("",DEFAULT)
SetGlobal("C#LevelUp","LOCALS",0)~ EXIT
END

/* Transitions */

IF ~~ THEN meeting_16
SAY @46 /* [Husam]My sources are good enough to know that you declined to march against this Caelar. */
++ @16 /* This is true. */ + meeting_19
++ @17 /* What concern of yours would this be? */ + meeting_18
++ @18 /* That is nothing I will discuss with you. */ + meeting_17
END

IF ~~ THEN meeting_17
SAY @47 /* [Husam]I do not expect you to. */
IF ~~ THEN + meeting_18
END

IF ~~ THEN meeting_18
SAY @48 /* [Husam]Non, to be honest. */
IF ~~ THEN + meeting_19
END

IF ~~ THEN meeting_19
SAY @49 /* [Husam]We will find a way to get the information we seek. I am here for another reason: We want first-hand information about the doings of the Bhaal spawn that defeated Sarevok and prevented a war between Amn and Baldur's Gate - you. */
= @50 /* [Husam]You did the Shadow Thieves a good service, cleansing our name from the Scar murder accusations. I don't see a reason why I should try to spy on and stalk you with hidden informants if I can get what I want the direct way. We worked quite well together in the past, <CHARNAME>. I would like to join you. */
= @51 /* [Husam]I will support you in your endeavors, and in exchange I will have first-hand information about what you will be doing next, learning what kind of person you are, and whether you might become a threat to the Shadow Thieves. */
IF ~~ THEN DO ~SetGlobal("C#HU_JoinedPCNoColaition","GLOBAL",1)~ + meeting_20
END

IF ~~ THEN meeting_20
SAY @52 /* [Husam]I have only one condition. Once I join you, I will not leave your side. Tell me to fall behind if you need, but the moment you send me away I will retreat to the shadows and be gone from your sight. What say you? */
++ @31 /* Information about me? What do you mean? */ + meeting_21
++ @42 /* Join forces with the Shadow Thieves alongisde the Flaming Fist? */ + meeting_09
+ ~GlobalGT("RE1_HusamFlirt","GLOBAL",0)~ + @53 /* Are you offering me to 'relieve the tention' again, my dextrous rogue? */ DO ~Global("C#HU_HeSaidInsists","LOCALS",1)~ + meeting_12
++ @54 /* I can't let myself be connected to the Shadow Thieves, Husam. This would come with a certain reputation I can't afford. */ + meeting_24
++ @55 /* Does "support me in my endeavors" also include that you'll share anything you'll learn about Caelar and the crusade with me and the Dukes? */ + meeting_25
++ @33 /* Yes, I would like you to join me. */ + meeting_14
++ @34 /* No, definitely not. */ + meeting_13
END

IF ~~ THEN meeting_21
SAY @56 /* [Husam]What will be your next move? What kind of person are you? Will you become a threat to the stability in the region in general, or the Shadow Thieves at least? It is our speciality to know the forces that influence the power structure, <CHARNAME> - preferably before they start shifting. */
++ @57 /* Are the Shadow Thieves scared of me then? */ + meeting_23
++ @58 /* So I'm considered to be such a powerful person? */ + meeting_22
++ @42 /* Join forces with the Shadow Thieves alongisde the Flaming Fist? */ + meeting_09
++ @54 /* I can't let myself be connected to the Shadow Thieves, Husam. This would come with a certain reputation I can't afford. */ + meeting_24
++ @55 /* Does "support me in my endeavors" also include that you'll share anything you'll learn about Caelar and the crusade with me and the Dukes? */ + meeting_25
++ @33 /* Yes, I would like you to join me. */ + meeting_14
++ @34 /* No, definitely not. */ + meeting_13
END

IF ~~ THEN meeting_22
SAY @59 /* [Husam]After what you achieved? Yes, definitely. */
++ @57 /* Are the Shadow Thieves scared of me then? */ + meeting_23
++ @42 /* Join forces with the Shadow Thieves alongisde the Flaming Fist? */ + meeting_09
++ @54 /* I can't let myself be connected to the Shadow Thieves, Husam. This would come with a certain reputation I can't afford. */ + meeting_24
++ @55 /* Does "support me in my endeavors" also include that you'll share anything you'll learn about Caelar and the crusade with me and the Dukes? */ + meeting_25
++ @33 /* Yes, I would like you to join me. */ + meeting_14
++ @34 /* No, definitely not. */ + meeting_13
END

IF ~~ THEN meeting_23
SAY @60 /* [Husam]Well, *scared* might not be the exact term, but after what you achieved, we prefer to be... prepared. */
++ @58 /* So I'm considered to be such a powerful person? */ + meeting_22
++ @42 /* Join forces with the Shadow Thieves alongisde the Flaming Fist? */ + meeting_09
++ @54 /* I can't let myself be connected to the Shadow Thieves, Husam. This would come with a certain reputation I can't afford. */ + meeting_24
++ @55 /* Does "support me in my endeavors" also include that you'll share anything you'll learn about Caelar and the crusade with me and the Dukes? */ + meeting_25
++ @33 /* Yes, I would like you to join me. */ + meeting_14
++ @34 /* No, definitely not. */ + meeting_13
END

IF ~~ THEN meeting_24
SAY @61 /* [Husam]Oh, but none other than the people who already know would have to know who I am, <CHARNAME>. You know best that I can and will disguise myself to stay unnoticed. So, what do you say? */
++ @31 /* Information about me? What do you mean? */ + meeting_21
++ @42 /* Join forces with the Shadow Thieves alongisde the Flaming Fist? */ + meeting_09
+ ~GlobalGT("RE1_HusamFlirt","GLOBAL",0)~ + @53 /* Are you offering me to 'relieve the tention' again, my dextrous rogue? */ DO ~Global("C#HU_HeSaidInsists","LOCALS",1)~ + meeting_12
++ @55 /* Does "support me in my endeavors" also include that you'll share anything you'll learn about Caelar and the crusade with me and the Dukes? */ + meeting_25
++ @33 /* Yes, I would like you to join me. */ + meeting_14
++ @34 /* No, definitely not. */ + meeting_13
END

IF ~~ THEN meeting_25
SAY @62 /* [Husam]That it would, yes. Any information related to the crusade which will help the coalition forces to defeat Caelar and her minions I will share willingly and for free. */
++ @31 /* Information about me? What do you mean? */ DO ~SetGlobal("C#Husam_SoD_CaelInfoPID","LOCALS",1)~ + meeting_21
++ @42 /* Join forces with the Shadow Thieves alongisde the Flaming Fist? */ DO ~SetGlobal("C#Husam_SoD_CaelInfoPID","LOCALS",1)~ + meeting_09
+ ~GlobalGT("RE1_HusamFlirt","GLOBAL",0)~ + @53 /* Are you offering me to 'relieve the tention' again, my dextrous rogue? */ DO ~SetGlobal("C#Husam_SoD_CaelInfoPID","LOCALS",1) Global("C#HU_HeSaidInsists","LOCALS",1)~ + meeting_12
++ @54 /* I can't let myself be connected to the Shadow Thieves, Husam. This would come with a certain reputation I can't afford. */ DO ~SetGlobal("C#Husam_SoD_CaelInfoPID","LOCALS",1)~ + meeting_24
++ @33 /* Yes, I would like you to join me. */ DO ~SetGlobal("C#Husam_SoD_CaelInfoPID","LOCALS",1)~ + meeting_14
++ @34 /* No, definitely not. */ DO ~SetGlobal("C#Husam_SoD_CaelInfoPID","LOCALS",1)~ + meeting_13
END

END //APPEND



/* Herod tells about the missing refugees */
I_C_T ~BDHEROD~ 1 C#Husam_BDHEROD_1
== C#HusamJ IF ~GlobalGT("C#Husam_SoDStonePeople","GLOBAL",0)
OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN
@63 /* [Husam]Hm, this would at least explain the angle of their petrified gaze. Not a proof, of course, but a valid theory. */
END



APPEND C#HUSAMJ

/* stone statues in BD1000 */

IF ~Global("C#Husam_SoDStonePeople","GLOBAL",1) GlobalGT("BD_PET_MAIN","MYAREA",0)~ THEN statues
SAY @64 /* [Husam]Hm, seems we found the missing 5 friends - and the reason why they didn't return yet. */
IF ~~ THEN + statues_01
END

IF ~Global("C#Husam_SoDStonePeople","GLOBAL",1) Global("BD_PET_MAIN","MYAREA",0)~ THEN statues_01
SAY @65 /* [Husam]We have to watch out, <CHARNAME>, as something - or someone - turned these people to stone, obviously. I do not think it was basilisks. Their gaze is not turned downward enough for that - and how *neatly* they are arranged in a half-circle. This does not mean this will make the threat any less dangerous, though. */
IF ~~ THEN DO ~SetGlobal("C#Husam_SoDStonePeople","GLOBAL",2)~ EXIT
END

END //APPEND


/* Vampire Tsolak */


I_C_T BDTSOLAK 2 C#Husam_BDTSOLAK_2
== C#HUSAMJ IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @66 /* [Husam]Interesting situation, <CHARNAME>. You'll have to evaluate: which one would be the better ally, which one the worse foe? And last but not least - which one gives a higher reward. */
= @67 /* [Husam]My personal opinion, although it shouldn't matter: as much as I dislike vampire hunters as they usually turn out to be do-gooders who turn against me just as easily, it's vampires I really do not like at all. Me and my brethren had one or two fights with them in Athkatla and it never was pleasant. I believe the vampire to be the more dangerous foe, so the question is whether you can afford to let it live, risking of having to face it again, later. */
END

I_C_T BDTSOLAK 3 C#Husam_BDTSOLAK_3
== C#HUSAMJ IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @66 /* [Husam]Interesting situation, <CHARNAME>. You'll have to evaluate: which one would be the better ally, which one the worse foe? And last but not least - which one gives a higher reward. */
= @67 /* [Husam]My personal opinion, although it shouldn't matter: as much as I dislike vampire hunters as they usually turn out to be do-gooders who turn against me just as easily, it's vampires I really do not like at all. Me and my brethren had one or two fights with them in Athkatla and it never was pleasant. I believe the vampire to be the more dangerous foe, so the question is whether you can afford to let it live, risking of having to face it again, later. */
END


/* PC handed over the Bridgefort Castle to the crusaders */

I_C_T BDKHALIJ 33 C#Husam_bd_betrayal_discussion
== C#Husamj IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @68 /* [Husam]This saved us a lot of time - and strength. It was a rational decision. Well done, <CHARNAME>. */
== BDCORWIJ IF ~InParty("CORWIN") See("CORWIN") !StateCheck("CORWIN",CD_STATE_NOTVALID)
OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @69 /* [Corwin]"Well done"?! Please remind me why I am tolerating you in this group, Shadow Thief! This was not "well done" at *all*! */
== BDKHALIJ IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @70 /* [Khalid]Do you also think it was "well done", <CHARNAME>? */
END

/* chicken in the well easter egg */
I_C_T BDDOGW01 3 C#Husam_BDDOGW01_3
== C#Husamj IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @71 /* [Husam]You'd be surprised to know how many villages hide their treasures in their wells - thinking it's safe from raiders down there. Seeing the chicken down there reminds me of a story about a farmer who tried to hide his pigs. They were not taken by the foes, but when he returned to get them, death had taken them nontheless. It took the villagers a whole day to get the carcasses out again, and the well was spoilt for months. */
END

/* coalition camp - training the recruits */


/* Danine */
EXTEND_BOTTOM BDDANINE 3
+ ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ + @72 /* Husam, you watched the fight intensely. Do you think you can teach this recruit to improve her skills? */ EXTERN C#Husamj teach_danine
END

EXTEND_BOTTOM BDDANINE 4
IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN DO ~SetGlobal("BD_DANINE_INTRO","BD3000",2)
SetGlobal("C#Husam1_BD_DANINE","BD3000",1)
PlaySound("ACT_07")
ReallyForceSpellRES("BDDANIN2",Myself)
JumpToPoint([108.656])
FaceObject("BDCLOVIS")
Wait(1)
ReallyForceSpellRES("BDDANIN1",Myself)
ApplyDamage("BDCLOVIS",1,1)
SetSequence(SEQ_ATTACK)
ActionOverride("BDCLOVIS",SetSequence(SEQ_DIE))
Wait(1)
ActionOverride("BDCLOVIS",SetSequence(SEQ_AWAKE))
Wait(1)
ActionOverride("C#Husam1",StartDialogNoSet("bddanine"))
~ EXIT
END



APPEND C#Husamj

IF ~~ THEN teach_danine
SAY @73 /* [Husam]I do. Private, your real 'strength' is your agility. You are using it for your fighting moves, but there is a lot more you can do with being quick. Try to be at places the foe doesn't expect you to be, be it yourself - or just your knife. */
  IF ~~ THEN EXTERN ~BDDANINE~ 4
END

IF WEIGHT #-1
~Global("C#Husam1_BD_DANINE","BD3000",1)~ THEN teach_danine_01
  SAY @74 /* [Husam]Yes, that's it. There is no need to break the foe's defenses - if you can just get behind them with the right twist of your body and knife. */
  IF ~~ THEN DO ~IncrementGlobal("BD_FIGHTERS_SKILL","BD3000",2)
SetGlobal("bd_sdd301_danine_skill","global",2)
SetGlobal("C#Husam1_BD_DANINE","BD3000",2)
~ EXTERN ~BDDANINE~ 5
END

END //APPEND

/* bd3000 Safana's traitor quest */
I_C_T BDSAFANJ 221 C#Husam_BDSAFANA_tq1
== C#Husamj IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @75 /* [Husam]It is obvious what these are for. This is fortunate, Safana. I was about to investigate this after getting note from my informant in the crusader camp about a possible spy here. This should enable us to identify them. */
END

I_C_T BDSAFANJ 230 C#Husam_BDSAFANA_tq2
== C#Husamj IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @76 /* [Husam]This is a priest's candle. I recognize them only too well - nothing you want to try to fence off unless you know your clients. */
END

I_C_T BDSAFANA 82 C#Husam_BDSAFANA_tq1
== C#Husamj IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @75 /* [Husam]It is obvious what these are for. This is fortunate, Safana. I was about to investigate this after getting note from my informant in the crusader camp about a possible spy here. This should enable us to identify them. */
END

I_C_T BDSAFANA 89 C#Husam_BDSAFANA_tq2
== C#Husamj IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @76 /* [Husam]This is a priest's candle. I recognize them only too well - nothing you want to try to fence off unless you know your clients. */
END

/* catapult at castle */
I_C_T BDHELDMO 5 C#Husam_BDHELDMO_5
== C#Husamj IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @77 /* [Husam]And that is the reason why you need to know your men - and not place one weak of nerves at such a weapon. How fortunate for us our foes didn't consider this. */
END

/* first time at commander tent, coalition camp */
I_C_T BDSTONEH 16 C#Husam_BDSTONEH_16
== C#Husamj IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @78 /* [Husam]Although I agree that such an event is less suitable to boost morale if it looks like the leader was surprised by it <PRO_HIMHER>self, something like this *can* be especially helpful to fluster the foe's morale. */
== BDSTONEH IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @79 /* [Stonehammer]Well, maybe it's not such a good idea to do this while the *own* men and women are watching and the foe is elsewhere, then! */
END


/* Torsin de Lancie, poison the crusader provisions */
I_C_T BDDELANC 22 C#Husam_BDDELANC_Poison
== C#Husamj IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @80 /* [Husam]Incapacitating the foe before the fight. A swift and effective way to tip the scales to one's favor. I like it. */
END

/* portal is open, talk to Torsin de Lancie through the closed door */
I_C_T BDDELANC 75 C#Husam_BDDELANC_75
== C#Husamj IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @81 /* There is no way to stealth around this or stay concealed through invisibility - this time, we are the cannon fodder. */ DO ~RealSetGlobalTimer("C#Husam_DialogTimer","GLOBAL",420)~
END

/* after return from Avernus, Torsin de Lancie */
I_C_T BDDELANC 79 C#Husam_BDDELANC_79
== C#Husamj IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @82 /* [Husam]And a second time you are victorious against an overpowering foe, <CHARNAME> - and this time it was not only against the demons inside a man, but real ones! */
END


/* ~BDXHOST~ Fiend in Avernus 
IF ~~ THEN BEGIN 3 // from: 2.0 2.1
  SAY #45175 /* ~I shall take my leave of you. There are many plans I have to foil, many preparations to ruin. Take this blade as my gift. Treat it well. A boon from my kind is rare.~ [BD45175] */
*/
I_C_T BDXHOST 3 C#Husam_BDXHOST3
== C#HUSAMJ IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @83 /* [Husam]Good choice, not fighting this demon. One demon more or less will do not much difference, but to us, it could mean a lot of trouble. And judging from his words, he might even be of help to us here - by being a foe to our enemies. */
END

/* Thrix's game in Avernus */

ADD_TRANS_TRIGGER BDTHRIX 13 ~OR(3) Global("C#HusamJoined","GLOBAL",0) !InMyArea("C#Husam1") StateCheck("C#Husam1",CD_STATE_NOTVALID)~ DO 2 IF ~!Is?f?ValidForPartyDialogue("Rasaad")~


EXTEND_BOTTOM BDTHRIX 21 26 30 34 38 42 46 50 54 58 62 66 70 74 78 82 86 90
IF ~Global("C#Husam_SoDThrix","GLOBAL",0) OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN + husam
END

EXTEND_TOP BDTHRIX 22 27 31 35 39 43 47 51 55 59 63 67 71 75 79 83 87 91 #1
IF ~Global("C#Husam_SoDThrix","GLOBAL",0) OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN + husam
END

EXTEND_TOP BDTHRIX 23 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 #10
IF ~Global("C#Husam_SoDThrix","GLOBAL",0) OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN + husam
END

EXTEND_TOP BDTHRIX 24 29 33 37 41 45 49 53 57 61 65 69 73 77 81 85 89 93 #5
IF ~Global("C#Husam_SoDThrix","GLOBAL",0) OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN + husam
END


EXTEND_BOTTOM BDTHRIX 117 118 119 120 
IF ~Global("C#Husam_SoDThrix","GLOBAL",2) OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN + husam_01
END

APPEND BDTHRIX

IF ~~ THEN BEGIN husam
  SAY @84 /* [Thrix]Maybe I'll take the one accustomed to hide in shadows. Thrix will play hide and kill with your thief tonight. */
  IF ~~ THEN REPLY @85 /* You want Husam? Fine, if I'll lose your game he will be yours! */ DO ~SetGlobal("C#Husam_SoDThrix","GLOBAL",2)
SetGlobal("bd_thrix_sacrifice_companion","global",1)~ + 116

  IF ~RandomNum(4,1)~ THEN REPLY @86 /* Husam joined forces with me but this didn't include his soul for trading. Pick another of my party as a prize or stand aside and let me pass. */ DO ~SetGlobal("C#Husam_SoDThrix","GLOBAL",1) IncrementGlobal("BD_NumInParty","bd4500",1)~ + 70
  IF ~RandomNum(4,2)~ THEN REPLY @86 /* Husam joined forces with me but this didn't include his soul for trading. Pick another of my party as a prize or stand aside and let me pass. */ DO ~SetGlobal("C#Husam_SoDThrix","GLOBAL",1) IncrementGlobal("BD_NumInParty","bd4500",1)~ + 71
  IF ~RandomNum(4,3)~ THEN REPLY @86 /* Husam joined forces with me but this didn't include his soul for trading. Pick another of my party as a prize or stand aside and let me pass. */ DO ~SetGlobal("C#Husam_SoDThrix","GLOBAL",1) IncrementGlobal("BD_NumInParty","bd4500",1)~ + 72
  IF ~RandomNum(4,4)~ THEN REPLY @86 /* Husam joined forces with me but this didn't include his soul for trading. Pick another of my party as a prize or stand aside and let me pass. */ DO ~SetGlobal("C#Husam_SoDThrix","GLOBAL",1) IncrementGlobal("BD_NumInParty","bd4500",1)~ + 73

  IF ~~ THEN REPLY @87 /* He has his faults, but I'll not risk Husam's soul in so blithe a fashion. If I cannot answer your riddle, mine is the soul you will take. Agreed? */ GOTO 113
  IF ~~ THEN REPLY @88 /* I'll feed you your own limbs if you don't let me into the tower, you wretched creature. I'm done playing games with you. */ GOTO 12
END

IF ~~ THEN husam_01
SAY @89 /* [Thrix]Thrix has marked your soul, thief. Your soul is mine! */ 
++ @90 /* Well, I guess that settles it, then. Go with your new master, Husam. */ DO ~SetGlobal("C#Husam_SoDThrix","GLOBAL",3)~ EXTERN C#HusamJ thrix_01
++ @91 /* No, you will not take his soul, devil. We will fight you! */ GOTO 10
END

END //APPEND



APPEND C#HUSAMJ

IF ~~ THEN thrix_01
  SAY @92 /* [Husam]My soul holds no-one else than me! You will learn this soon enough, fiend! */
  IF ~~ THEN DO ~SetGlobal("bd_thrix_won","global",1)~ EXTERN ~BDTHRIX~ 140
END


/* after thrix */

/*

OR(2)
Global("BD_THRIX_ANGERED","GLOBAL",1)
Global("BD_Thrix_riddle_won","GLOBAL",1)

Global("bd_thrix_sacrifice_companion","global",1)

Global("bd_thrix_sacrifice_self","global",1)

Global("C#Husam_SoDThrix","GLOBAL",1): PC declined Thrix' choice

Global("C#Husam_SoDThrix","GLOBAL",2): PC agreed on Husam's soul before the riddle

Global("C#Husam_SoDThrix","GLOBAL",3): PC gave Husam to Thrix after riddle was lost

*/

IF ~OR(2)
Global("C#Husam_SoDThrix","GLOBAL",6)
Global("C#Husam_SoDThrix","GLOBAL",5)~ THEN after_thrix
SAY @93 /* [Husam]You traded my soul to a fiend. */

++ @94 /* That I did, yes. It granted us passage! */ + after_thrix_01

/* !Global("BD_Thrix_riddle_won","GLOBAL",1) */
+ ~!Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @95 /* I gambled, I lost. Such is life. */ + after_thrix_02
+ ~Global("C#Husam_SoDThrix","GLOBAL",6) !Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @96 /* I am sorry I traded your soul, Husam. I thought you and your comrades are strong enough to handle a demon. */ + after_thrix_03
+ ~Global("C#Husam_SoDThrix","GLOBAL",5) !Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @97 /* I am sorry I traded your soul, Husam. I thought I could beat it. */ + after_thrix_04
+ ~!Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @98 /* And? */ + after_thrix_04

/* Global("BD_Thrix_riddle_won","GLOBAL",1) */
+ ~Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @99 /* I gambled, I won. */ + after_thrix_06
+ ~Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @100 /* I regret doing it, Husam. I am glad I won the bet. */ + after_thrix_06
+ ~Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @98 /* And? */ + after_thrix_06
END

IF ~~ THEN after_thrix_01
SAY @101 /* [Husam]That it did, indeed. */
IF ~!Global("BD_Thrix_riddle_won","GLOBAL",1)~ THEN + after_thrix_04
IF ~Global("BD_Thrix_riddle_won","GLOBAL",1)~ THEN + after_thrix_06
END

IF ~~ THEN after_thrix_02
SAY @102 /* [Husam]With the slight difference that this time, the gambler is not the loser. */
IF ~~ THEN + after_thrix_04
END

IF ~~ THEN after_thrix_03
SAY @103 /* [Husam]I will be. Or maybe I won't. Time will tell. */
IF ~~ THEN + after_thrix_04
END

END //APPEND

CHAIN
IF ~~ THEN C#HusamJ after_thrix_04
@104 /* [Husam]You promised my soul to a fiend in hell. Originally, I had planned to fight you once we are back. But that was my first, heated impulse. */
== C#HusamJ IF ~Global("C#Husam_SoDThrix","GLOBAL",6)~ THEN @105 /* [Husam]I should know better than to trust myself with a rising Bhaalspawn such as you. Know better than to expect you not to try and profit from others. */
== C#HusamJ IF ~Global("C#Husam_SoDThrix","GLOBAL",5)~ THEN @106 /* [Husam]You tried to reverse it. I see now that you gambled with more than just my soul in mind. A pity the fiend did not stay to fight us. */
END
IF ~~ THEN + after_thrix_05

APPEND C#HusamJ

IF ~~ THEN after_thrix_05
SAY @107 /* [Husam]You gambled, and lost. You saved us a fight - and yourself the hassle to deal with a fiend. It was smart. From your perspective, it was the best outcome you could achieve. I probably would have done the same. */
IF ~~ THEN + after_thrix_06
END

IF ~~ THEN after_thrix_06
SAY @108 /* [Husam]I bow to the readiness with which you gave another's soul to be granted passage. You will be an interesting business partner, would you to come to Athkatla one day. */ 
IF ~~ THEN DO ~SetGlobal("C#Husam_SoDThrix","GLOBAL",8)~ EXIT
END


/* PC agreed on another  */

IF ~Global("C#Husam_SoDThrix","GLOBAL",7)~ THEN after_thrix_08
SAY @109 /* [Husam]You traded a companion's soul to a fiend. */
+ ~Global("BD_THRIX_ANGERED","GLOBAL",1) !Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @110 /* I tried to reverse it. It wasn't my intention to go with this deal! */ + after_thrix_05
+ ~!Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @95 /* I gambled, I lost. Such is life. */ + after_thrix_05
+ ~Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @111 /* It doesn't matter any more, does it? I won. */ + after_thrix_06
++ @112 /* I don't have to justify my actions to you. */ + after_thrix_06
END 



/* back from Avernus */

IF ~Global("C#Husam_SoDEnd","GLOBAL",1)~ THEN avernus_done
SAY @113 /* [Husam]We did it - we defeated a demon and closed a portal to hell. I hope my Shadow Master gets enough information from other sources, or noone will believe my tale. */
++ @114 /* I can hardly believe it's done myself. */ + avernus_done_05
++ @115 /* We were great! */ + avernus_done_05
++ @116 /* It's over, thank the gods. */ + avernus_done_05
END

IF ~~ THEN avernus_done_01
SAY @117 /* [Husam](smile) I am good at pretending to be a drunk, but try to prevent myself from impersonating one. */
++ @118 /* Back to Athkatla? */ + avernus_done_02
++ @119 /* I'll need a rogue for a little longer. Please stay until tonight. */ + avernus_done_06
++ @120 /* Farewell, Husam. Maybe we meet again. */ + avernus_done_04
++ @121 /* Well, then go. */ + avernus_done_03
END

IF ~~ THEN avernus_done_02
SAY @122 /* [Husam]Yes, back there. */
++ @123 /* Already? Won't you stay for the celebrations? */ + avernus_done_01
++ @119 /* I'll need a rogue for a little longer. Please stay until tonight. */ + avernus_done_06
++ @120 /* Farewell, Husam. Maybe we meet again. */ + avernus_done_04
++ @121 /* Well, then go. */ + avernus_done_03
END

IF ~~ THEN avernus_done_03
SAY @124 /* [Husam]Our collaboration ends here. It was... interesting, indeed. Farewell, <CHARNAME>. Enjoy the praises of the masses while they'll last. */

/* Husam in Party */
IF ~InParty("C#Husam1")~ THEN DO ~SetInterrupt(FALSE)
SetGlobal("C#Husam_SoDEnd","GLOBAL",3)
SetGlobal("C#HusamJoined","GLOBAL",0)
LeaveParty()
ChangeAIScript("",DEFAULT)
//DestroyItem("##")
GivePartyAllEquipment()
EscapeAreaDestroy(5)
SetInterrupt(TRUE)~ EXIT

/* Husam was 7th party member */
IF ~Global("C#HusamJoined","GLOBAL",2)~ THEN DO ~SetInterrupt(FALSE)
MakeGlobal()
SetGlobal("C#Husam_SoDEnd","GLOBAL",3)
SetGlobal("C#HusamJoined","GLOBAL",0)
RemoveFamiliar()
ChangeEnemyAlly(Myself,NEUTRAL)
ChangeAIScript("",DEFAULT)
//DestroyItem("##")
GivePartyAllEquipment()
EscapeAreaDestroy(5)
SetInterrupt(TRUE)~ EXIT
END

IF ~~ THEN avernus_done_04
SAY @125 /* [Husam]Maybe we will. */
IF ~~ THEN + avernus_done_03
END

IF ~~ THEN avernus_done_05 
SAY @126 /* [Husam]And with that, it is done. Caelar's crusade is defeated, the danger is gone. Whatever happens now does not require my first hand attention. This is where I'll take my leave, <CHARNAME>. */
++ @123 /* Already? Won't you stay for the celebrations? */ + avernus_done_01
++ @118 /* Back to Athkatla? */ + avernus_done_02
++ @119 /* I'll need a rogue for a little longer. Please stay until tonight. */ + avernus_done_06
++ @120 /* Farewell, Husam. Maybe we meet again. */ + avernus_done_04
++ @121 /* Well, then go. */ + avernus_done_03
END

IF ~~ THEN avernus_done_06
SAY @127 /* [Husam]Very well. */
IF ~~ THEN DO ~SetGlobal("C#Husam_SoDEnd","GLOBAL",2)~ EXIT
END

END //APPEND

/* before PC goes to rest that night. Husam takes his final leave */

I_C_T3 BDDAZZO 2 C#Husam_BDDAZZO_2
/* Husam is party member */
== C#HusamJ IF ~InParty("C#Husam1")
InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @128 /* [Husam]Our collaboration ends here. It was... interesting, indeed. Farewell, <CHARNAME>. */
DO ~SetInterrupt(FALSE)
MakeGlobal()
SetGlobal("C#HusamJoined","GLOBAL",0)
SetGlobal("C#Husam_SoDEnd","GLOBAL",3)
ChangeAIScript("",DEFAULT)
LeaveParty()
EscapeAreaDestroy(5)
SetInterrupt(TRUE)~ 
/* Husam is 7th party member */
== C#HusamJ IF ~Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @128 /* [Husam]Our collaboration ends here. It was... interesting, indeed. Farewell, <CHARNAME>. */ 
DO ~SetInterrupt(FALSE)
MakeGlobal()
SetGlobal("C#HusamJoined","GLOBAL",0)
SetGlobal("C#Husam_SoDEnd","GLOBAL",3)
RemoveFamiliar()
ChangeEnemyAlly("C#Husam1",NEUTRAL)
ChangeAIScript("",DEFAULT)
EscapeAreaDestroy(5)
SetInterrupt(TRUE)~ 
END

I_C_T3 BDDAZZO 3 C#Husam_BDDAZZO_3
/* Husam is party member */
== C#HusamJ IF ~InParty("C#Husam1")
InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @128 /* [Husam]Our collaboration ends here. It was... interesting, indeed. Farewell, <CHARNAME>. */
DO ~SetInterrupt(FALSE)
MakeGlobal()
SetGlobal("C#HusamJoined","GLOBAL",0)
SetDialog("C#HusamS")
ChangeAIScript("",DEFAULT)
LeaveParty()
MoveBetweenAreas("bd6000",[2137.3105],E)
SetInterrupt(TRUE)~ 
/* Husam is 7th party member */
== C#HusamJ IF ~Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @128 /* [Husam]Our collaboration ends here. It was... interesting, indeed. Farewell, <CHARNAME>. */ 
DO ~SetInterrupt(FALSE)
MakeGlobal()
SetGlobal("C#HusamJoined","GLOBAL",0)
RemoveFamiliar()
ChangeEnemyAlly("C#Husam1",NEUTRAL)
SetDialog("C#HusamS")
ChangeAIScript("",DEFAULT)
MoveBetweenAreas("bd6000",[2137.3105],E)
SetInterrupt(TRUE)~ 
END

APPEND C#HusamJ


/* game reaction and reflection dialogues */


/* Takos' burnt-down inn: after receiving quest for his personal items */

IF ~Global("C#Husam_SoDTakosHeirlooms","GLOBAL",1)~ THEN takos_heirlooms
SAY @129 /* [Husam]We can sift through the ashes of the ruin for those items you promised to return, but I bet my knife that they already found 'new' owners in a place and times like these. Let me know if you want me to have a... look into pockets that are not our own. */
IF ~~ THEN DO ~SetGlobal("C#Husam_SoDTakosHeirlooms","GLOBAL",2)~ EXIT
END



/*
bddagg03 "Gemblade +1"
" 20% chance per hit that a random gem will be generated in the wielder's inventory"
*/
IF ~Global("C#Husam_SoDbddagg03","GLOBAL",1)~ THEN gemblade
SAY @130 /* [Husam]This Gemblade is more of a trinket than a real weapon. And yet - I'd know people who would stab themselves just to get the gems they want, and for some of them, that would be the less violent option. */
IF ~~ THEN DO ~SetGlobal("C#Husam_SoDbddagg03","GLOBAL",2)~ EXIT
END

/* Gold Bust bdmisc57 */
IF ~Global("C#Husam_SoDbdmisc57","GLOBAL",1)~ THEN goldbust
SAY @131 /* [Husam]Yes, this gold bust looks like what some rich nobles would spend their gold for. Albeit, mostly it would be their own bust, of course. But if that's not impressing enough, a gold bust from a hero always works. Let me know if you want me to make this to gold for you, <CHARNAME>. I could probably get a good prize for it. */
IF ~~ THEN DO ~SetGlobal("C#Husam_SoDbdmisc57","GLOBAL",2)~ EXIT
END

/* Husam sold the gold bust */
IF ~Global("C#Husam_SoDbdmisc57","GLOBAL",4)~ THEN goldbust
SAY @132 /* [Husam]We managed to sell the gold bust, <CHARNAME>. This is what we got for it - it now decorates the home of a rich salesman in Tethyr. */
IF ~~ THEN DO ~GiveGoldForce(3000) SetGlobal("C#Husam_SoDbdmisc57","GLOBAL",5)~ EXIT
END

/* Friendship dialogues */

IF ~Global("C#Husam_Dialog","GLOBAL",2)~ THEN sarevok
SAY @133 /* [Husam]So, your "half-brother" Sarevok knew about your heritage way sooner than you did, as it seems. */
++ @134 /* (scoff) You think? */ + sarevok_02
++ @135 /* So it seemed, indeed. */ + sarevok_02
++ @136 /* Look, I get it. I'm a Bhaalspawn, evil god's heritage, blahblah, people get nervous. But *do* I have to talk about this with literally *everyone*? */ + sarevok_01
++ @137 /* That topic is closed. We have other problems now. */ + sarevok_06
++ @138 /* I don't want to talk about it, Husam. */ + sarevok_06
END

IF ~~ THEN sarevok_01
SAY @139 /* [Husam]Absolutely not. I'll let this rest as soon as you tell me to. */
++ @140 /* Fine, so what is it you want to know? */ + sarevok_02
++ @137 /* That topic is closed. We have other problems now. */ + sarevok_06
++ @138 /* I don't want to talk about it, Husam. */ + sarevok_06
END

IF ~~ THEN sarevok_02
SAY @141 /* [Husam]Did it never vex you that you seemed to be the very last one to actually get to know about your heritage? */
++ @142 /* Wait a minute - you are not trying to sell the Shadow Thieves' information services to me, are you? */ + sarevok_03
COPY_TRANS_LATE C#HusamJ sarevok_03
END

IF ~~ THEN sarevok_03
SAY @143 /* [Husam](smiles) Now that is an intriguing throught. But no, that was not my intention. */
++ @144 /* I wouldn't say it like this. Yes, Sarevok and his associates knew it sooner, and Gorion did, who didn't tell me for some reason I will never know. But apart from that, it's not as if *everyone* would have known, and especially not before I did. */ + sarevok_05
++ @145 /* I still don't see what your actual point is, Husam. */ + sarevok_04
++ @138 /* I don't want to talk about it, Husam. */ + sarevok_06
END

IF ~~ THEN sarevok_04
SAY @146 /* [Husam]I was asking out of curiosity. */
IF ~~ THEN + sarevok_05
END

IF ~~ THEN sarevok_05
SAY @147 /* [Husam]I am not sure how I would have reacted on your behalf. Being chased throughout the lands, not knowing oneself's unique heritage - a very unsatisfactory scenario. Of course, as a Shadow Thief, being chased through the lands is not an unknown situation to me. But usually I know *why*. */
IF ~~ THEN DO ~IncrementGlobal("C#Husam_Dialog","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarevok_06
SAY @148 /* [Husam]Then I will let it rest. */
IF ~~ THEN DO ~IncrementGlobal("C#Husam_Dialog","GLOBAL",1)~ EXIT
END


/* weak poison in palace */

/* starting line */
IF ~Global("C#Husam_Dialog","GLOBAL",4)~ THEN weak_poison
SAY @149 /* [Husam]My sources told me that the poison used in the palace attack was narcotic in nature. */
++ @150 /* You are well informed, it seems. */ + weak_poison_01
COPY_TRANS_LATE C#HusamJ weak_poison_01
END

IF ~~ THEN weak_poison_01
SAY @151 /* [Husam]I have my ressources. Like I mentioned, we feared the Shadow Thieves would be accused of the attack. */
+ ~OR(2)
GlobalGT("#L_WeakPoison","GLOBAL",0)
Global("C#RtD_WeakPoison","GLOBAL",1)~ + @152 /* Yes, I am already aware it was a weak poison. */ + weak_poison_03
++ @153 /* Narcotic? You mean it was made for knocking us out without killing us? */ + weak_poison_02
++ @154 /* I heard it being mentioned the poison being too weak to kill in the palace. */ + weak_poison_03
++ @155 /* What of it? */ + weak_poison_03
++ @156 /* I don't want to talk about it. */ + weak_poison_07
END

IF ~~ THEN weak_poison_02
SAY @157 /* [Husam]Exactly. */
IF ~~ THEN + weak_poison_03
END

END //APPEND

CHAIN
IF ~~ THEN c#husamJ weak_poison_03
@158 /* [Husam]This poison could not kill. Not on its own. But it was a strong poison nontheless, ideal to incapacitate and weaken for a longer time. */
== bdimoen IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @159 /* Yep - been there, done that. Definitely done that! */
END
IF ~~ THEN + weak_poison_05
IF ~GlobalGT("C#RtD_KnowsPortalBlood","GLOBAL",2)~ THEN + weak_poison_04


APPEND c#husamJ 
/* knows it's the PC's blood that is wanted */
IF ~~ THEN weak_poison_04
SAY @160 /* [Husam]We already know why they did it - they need your blood, and that either fresh or greater amounts of it, as it seems. They were trying to kidnap you indeed. */
IF ~~ THEN DO ~IncrementGlobal("C#Husam_Dialog","GLOBAL",1)
SetGlobal("C#RtD_CaelarKidnap_SET","GLOBAL",1) SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ EXIT
END

/* doesn't know it's the PC's blood Caelar&HN are after */
IF ~~ THEN weak_poison_05
SAY @161 /* [Husam]There are three reasons an assassin would use a weak poison for. First is that he is badly trained and wasn't aware it's not strong enough to kill the way it is used. Second is that the victim was meant to be incapacitated to buy the other side some time, and third is that the victim was supposed to be kidnapped after being incapacitated. The latter two meaning that there was no intention to kill - at least not upon the attack. */
++ @162 /* Do you believe option one to be realistic? */ + weak_poison_06
++ @163 /* Why would this interest me? */ + weak_poison_09
++ @164 /* What do you think happened? */ + weak_poison_07
++ @165 /* I am sure they didn't mind causing some chaos by attacking inside the palace, though. It worked, partly at least. */ + weak_poison_10
+ ~Global("#L_WeakPoison","GLOBAL",0)
Global("C#RtD_CaelarKidnap","GLOBAL",0)~ + @166 /* My gut says it was option three. */ + weak_poison_15
+ ~Global("#L_WeakPoison","GLOBAL",1)~ + @167 /* As I already said to Duke Jannath - I am convinced it was option three. */ + weak_poison_15
+ ~Global("C#RtD_CaelarKidnap","GLOBAL",1)~ + @168 /* I already came to the conclusion that they were trying to kidnap me. */ + weak_poison_15
++ @169 /* No intention to kill but only to incapacitate? Well, I *am* the hero of Baldur's Gate and obviously, I am here and going against the crusade. Maybe Caelar just wanted to prevent that? */ + weak_poison_08
++ @170 /* I don't care what the assassins' purpose were, Husam. */ + weak_poison_14
END

IF ~~ THEN weak_poison_06
SAY @171 /* [Husam]You'd be surprised. There is a reason assassins are trained for years. The attack was amateurish to no end. That, or driven by a melagomaniac. Attacking inside the palace? In a way that all the guards are roused? This is not the doing of an assassin's guild. */
++ @245 /* Wait, I know where this ends - the *Shadow Thieves* would have done it *so* much better! Right?~ */ + weak_poison_17
++ @165 /* I am sure they didn't mind causing some chaos by attacking inside the palace, though. It worked, partly at least. */ + weak_poison_10
+ ~Global("#L_WeakPoison","GLOBAL",0)
Global("C#RtD_CaelarKidnap","GLOBAL",0)~ + @166 /* My gut says it was option three. */ + weak_poison_15
+ ~Global("#L_WeakPoison","GLOBAL",1)~ + @167 /* As I already said to Duke Jannath - I am convinced it was option three. */ + weak_poison_15
+ ~Global("C#RtD_CaelarKidnap","GLOBAL",1)~ + @168 /* I already came to the conclusion that they were trying to kidnap me. */ + weak_poison_15
++ @169 /* No intention to kill but only to incapacitate? Well, I *am* the hero of Baldur's Gate and obviously, I am here and going against the crusade. Maybe Caelar just wanted to prevent that? */ + weak_poison_08
++ @172 /* I don't want to speculate about it. */ + weak_poison_14
END

IF ~~ THEN weak_poison_07
SAY @173 /* [Husam]I believe that the weak poison was on purpose. The attack was amateurish, but it would fit to a war lord who is marching with an army - Caelar was not exactly subtle in her performance so far. */
IF ~~ THEN + weak_poison_11
END

IF ~~ THEN weak_poison_08
SAY @174 /* [Husam]Maybe. And yet, there is no reports from other coalition parties being attacked this way. */ 
IF ~~ THEN + weak_poison_11
END

IF ~~ THEN weak_poison_09
SAY @175 /* [Husam]But it is always good to understand your foe, <CHARNAME>. It's the only chance we have to be one step ahead of them. Humor me. */
++ @162 /* Do you believe option one to be realistic? */ + weak_poison_06
++ @165 /* I am sure they didn't mind causing some chaos by attacking inside the palace, though. It worked, partly at least. */ + weak_poison_10
+ ~Global("#L_WeakPoison","GLOBAL",0)
Global("C#RtD_CaelarKidnap","GLOBAL",0)~ + @166 /* My gut says it was option three. */ + weak_poison_15
+ ~Global("#L_WeakPoison","GLOBAL",1)~ + @167 /* As I already said to Duke Jannath - I am convinced it was option three. */ + weak_poison_15
+ ~Global("C#RtD_CaelarKidnap","GLOBAL",1)~ + @168 /* I already came to the conclusion that they were trying to kidnap me. */ + weak_poison_15
++ @169 /* No intention to kill but only to incapacitate? Well, I *am* the hero of Baldur's Gate and obviously, I am here and going against the crusade. Maybe Caelar just wanted to prevent that? */ + weak_poison_08
++ @172 /* I don't want to speculate about it. */ + weak_poison_14
END
END //APPEND

CHAIN
IF ~~ THEN c#husamJ weak_poison_10
@176 /* [Husam]No weak poison would have been necessary for that. And a murder causes so much more chaos, <CHARNAME>, let me assure you. */
END
+ ~Global("#L_WeakPoison","GLOBAL",0)
Global("C#RtD_CaelarKidnap","GLOBAL",0)~ + @166 /* My gut says it was option three. */ + weak_poison_15
+ ~Global("#L_WeakPoison","GLOBAL",1)~ + @167 /* As I already said to Duke Jannath - I am convinced it was option three. */ + weak_poison_15
+ ~Global("C#RtD_CaelarKidnap","GLOBAL",1)~ + @168 /* I already came to the conclusion that they were trying to kidnap me. */ + weak_poison_15
++ @169 /* No intention to kill but only to incapacitate? Well, I *am* the hero of Baldur's Gate and obviously, I am here and going against the crusade. Maybe Caelar just wanted to prevent that? */ + weak_poison_08
++ @170 /* I don't care what the assassins' purpose were, Husam. */ + weak_poison_12

APPEND c#husamJ

IF ~~ THEN weak_poison_11
SAY @177 /* [Husam]The whole Sword Coast is preparing to march against Caelar. Why only incapacitate you? You are a strong opponent, but removing only you from the board would not tip the scales much. Why come with so many attackers if all that they were meant to do was scratch you with a dagger? Of course one would go with a lot of fighting power if the foe is expected to be very strong - but if Caelar would be *so* afraid of you, she would have gone for "kill". */
IF ~~ THEN + weak_poison_12
END

IF ~~ THEN weak_poison_12
SAY @178 /* [Husam]I am sure Caelar would have made sure you'd be killed by the poison, were killing you her goal. I am convinced there was a plan to kidnap you. */
++ @179 /* Yes, I agree. */ + weak_poison_13
++ @180 /* You may be right. And maybe they didn't plan on killing anyone in the process. It would explain why they used the weak poison on Imoen, too. */ + weak_poison_16
+ ~Global("#L_WeakPoison","GLOBAL",0)
Global("C#RtD_CaelarKidnap","GLOBAL",0)~ + @170 /* I don't care what the assassins' purpose were, Husam. */ + weak_poison_14
END

IF ~~ THEN weak_poison_13
SAY @181 /* [Husam]Now we only have to learn what for. */
IF ~~ THEN DO ~IncrementGlobal("C#Husam_Dialog","GLOBAL",1)
SetGlobal("C#Husam_SoDKidnapConclusion","GLOBAL",2) //KidnapConclusion
SetGlobal("C#SoD_KidnapConclusion","GLOBAL",1) //cross-mod variable: prevent other NPCs to come with the same conclusion.
SetGlobal("C#RtD_CaelarKidnap_SET","GLOBAL",1) 
SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~  EXIT
END

IF ~~ THEN weak_poison_14
SAY @182 /* [Husam]Then I will let the topic drop. */
IF ~~ THEN DO ~IncrementGlobal("C#Husam_Dialog","GLOBAL",1)
SetGlobal("C#SoD_KidnapConclusion","GLOBAL",1) //cross-mod variable: prevent other NPCs to come with the same conclusion.
~ EXIT
END

IF ~~ THEN weak_poison_15
SAY @183 /* [Husam]That is what I think, too. */
IF ~~ THEN + weak_poison_11
END


IF ~~ THEN weak_poison_16
SAY @184 /* [Husam]Hmm, interesting thought. Unusual, but not uncommon, especially if the target is a needed asset of which one wants to ensure cooperation in the long run. */
IF ~~ THEN + weak_poison_13
END

IF ~~ THEN weak_poison_17
SAY @246 /* ~[Husam](smiles) We would have, indeed. After an attack orchestrated by the Shadow Thieves, you would not wonder whether it was meant to kill - or not.~ */
++ @247 /* (teasingly) Now I get it - you came to clearify that the attack wasn't the Shadow Thieves' doing to prevent your reputation as an assassin guild to drop!~ */ + weak_poison_18
++ @165 /* I am sure they didn't mind causing some chaos by attacking inside the palace, though. It worked, partly at least. */ + weak_poison_10
+ ~Global("#L_WeakPoison","GLOBAL",0)
Global("C#RtD_CaelarKidnap","GLOBAL",0)~ + @166 /* My gut says it was option three. */ + weak_poison_15
+ ~Global("#L_WeakPoison","GLOBAL",1)~ + @167 /* As I already said to Duke Jannath - I am convinced it was option three. */ + weak_poison_15
+ ~Global("C#RtD_CaelarKidnap","GLOBAL",1)~ + @168 /* I already came to the conclusion that they were trying to kidnap me. */ + weak_poison_15
++ @169 /* No intention to kill but only to incapacitate? Well, I *am* the hero of Baldur's Gate and obviously, I am here and going against the crusade. Maybe Caelar just wanted to prevent that? */ + weak_poison_08
++ @172 /* I don't want to speculate about it. */ + weak_poison_14
END

IF ~~ THEN weak_poison_18
SAY @248 /* ~[Husam]Hahaha! There is some truth to that, I guess. But can I hope for an answer regarding my original question?~ */
++ @165 /* I am sure they didn't mind causing some chaos by attacking inside the palace, though. It worked, partly at least. */ + weak_poison_10
+ ~Global("#L_WeakPoison","GLOBAL",0)
Global("C#RtD_CaelarKidnap","GLOBAL",0)~ + @166 /* My gut says it was option three. */ + weak_poison_15
+ ~Global("#L_WeakPoison","GLOBAL",1)~ + @167 /* As I already said to Duke Jannath - I am convinced it was option three. */ + weak_poison_15
+ ~Global("C#RtD_CaelarKidnap","GLOBAL",1)~ + @168 /* I already came to the conclusion that they were trying to kidnap me. */ + weak_poison_15
++ @169 /* No intention to kill but only to incapacitate? Well, I *am* the hero of Baldur's Gate and obviously, I am here and going against the crusade. Maybe Caelar just wanted to prevent that? */ + weak_poison_08
++ @172 /* I don't want to speculate about it. */ + weak_poison_14
END

END //APPEND


/* after meeting Caelar at the bridge */
CHAIN
IF ~Global("C#Husam_Dialog","GLOBAL",6)~ THEN C#husamJ caelar
@185 /* [Husam]Hmm. If we would not go to war against her already I would warn you to keep a close eye on that Caelar, <CHARNAME>. She is a woman with a clear vision - very dangerous. She is clearly meddling with forces beyond her power and imagination. */
== C#husamJ IF ~GlobalGT("C#Husam_HepherFiend","GLOBAL",0)~ THEN @186 /* [Husam]Especially with an advisor who has his own plans. */ 
END
+ ~Global("C#Husam_HepherFiend","GLOBAL",0)
Global("C#RtD_HephernaanBetrayal","GLOBAL",0)~ + @187 /* I can't shake that feeling, too. How can someone so powerful appear so naive? */ + caelar_01
+ ~GlobalGT("C#Husam_HepherFiend","GLOBAL",0)~ + @188 /* Meddling with forces beyond her imagination indeed - we know what Hephernaan is planning. */ + caelar_03
++ @189 /* She is meddling with one Bhaalspawn too many, if you get my meaning. */ + caelar_02
++ @190 /* How can she collect so many followers? Don't they see the threat? */ + caelar_08
++ @191 /* I haven't decided what to think of her. My feeling tells me there is more than black and white. */ + caelar_03
++ @192 /* I think what she is planning is impressive. */ + caelar_03
++ @193 /* (sarcastically) Well, thank you for your helpful insight, Husam. Never it would have occurred to me that Caelar is someone I should be wary of. */ + caelar_02


APPEND C#husamJ 

IF ~~ THEN caelar_01
SAY @194 /* [Husam]Usually I would say it's the advisers pulling the strings in such cases. But I am not sure here. She clearly has a strong vision of what she is about to achieve - and how to achieve it. */
IF ~~ THEN + caelar_04
END

IF ~~ THEN caelar_02
SAY @195 /* [Husam](smiles) I am well aware of your capabilities, <CHARNAME>. */
IF ~~ THEN + caelar_04
END

IF ~~ THEN caelar_03
SAY @196 /* [Husam]I'd be the last to disagree, <CHARNAME>. Yet I fear we won't have a chance to prevent war - even if we wanted to. */ 
IF ~~ THEN + caelar_04
END

IF ~~ THEN caelar_04
SAY @197 /* [Husam]I do believe Caelar overestimates her influence on all of the crusaders if their bloodlust awakes - or if she can't deliver her promise. The most visionary leaders usually do, and the way the crusade leaves burnt villages shows me that Caelar's influence is either too weak or not as righteous as she wants to believe herself. As much sense as it does to let followers do crimes, it was unwise to let get out of hand as much as it did here. */
++ @198 /* It makes sense to let the followers do crimes? What do you mean? */ + caelar_05
++ @199 /* She is a paladin and sees herself as a force of righteousness. Why do you say it makes sense that her followers do crimes? */ + caelar_05
++ @200 /* Unwise? You mean because the coalition formed to stop her? */ + caelar_06
++ @201 /* Let's move on. */ + caelar_07
END

IF ~~ THEN caelar_05
SAY @202 /* [Husam]The more crimes the followers commit, the more they identify themselves with the crusade - as well as they lose the possibility to leave and take refuge elsewhere. It's basic psychology, and often used by warlords to secure their followers' loyalty. But in this case, it got out of hand, and drew too much attention, leading to the three cities forming a coalition to stop her. */
IF ~~ THEN + caelar_07
END

IF ~~ THEN caelar_06
SAY @157 /* [Husam]Exactly. */
IF ~~ THEN + caelar_05
END

IF ~~ THEN caelar_07
SAY @203 /* [Husam]We need to be ready, because stopping these kind of visionary leaders is usually only possible by force, not by persuasion. */
IF ~~ THEN DO ~IncrementGlobal("C#Husam_Dialog","GLOBAL",1)~ EXIT
END

IF ~~ THEN caelar_08
SAY @204 /* [Husam]Caelar has unbelievable strong charisma, if you experience her in a trustful setting. Add desparation and false hope to the mix and you have the two thirds of the crusaders who follow her out of their free choice. */
IF ~~ THEN + caelar_04
END

/* in between - sometime after incident at the bridge */

IF ~Global("C#Husam_Dialog","GLOBAL",8)~ THEN perception
SAY @205 /* [Husam]<CHARNAME>, how do you think people see you? */
++ @206 /* What do you mean? */ + perception_02
++ @207 /* Er, with their eyes? */ + perception_01
++ @208 /* You mean because I can't conceal my Bhaal heritage any longer? */ + perception_03
COPY_TRANS_LATE C#HusamJ perception_02
END

IF ~~ THEN perception_01
SAY @209 /* [Husam](smiles) I think you know what I mean. */
IF ~~ THEN + perception_02
END

IF ~~ THEN perception_02
SAY @210 /* [Husam]How do you think they perceive you? You, as the powerful person you are. */
++ @211 /* I'm the hero of Baldur's Gate. */ + perception_06
++ @212 /* I'm the next Bhaalspawn with power... */ + perception_04
++ @213 /* Why don't you tell me? I guess you have more information on that topic than me. I can only guess. */ + perception_05
++ @156 /* I don't want to talk about it. */ + perception_07
END

IF ~~ THEN perception_03
SAY @214 /* [Husam]Exactly that, yes. */
IF ~~ THEN + perception_02
END

IF ~~ THEN perception_04
SAY @215 /* [Husam]Interesting answer. That is exactly where I was aiming at. */
IF ~~ THEN + perception_05
END

IF ~~ THEN perception_05
SAY @216 /* [Husam]There are rising voices talking about your godly heritage, and fearing you might go the path of Sarevok. The incident at Boareskyr Bridge fuelled it the most. Anyone interested between here and Baldur's Gate knows of your godly heritage. Actually, anyone having ears and not being deaf knows about it by now. */
++ @217 /* I will prove them wrong. I will not leave the path of good. */ + perception_07
++ @218 /* That is good. I will find my power, and anyone coming in my way will regret doing so. */ + perception_07
++ @219 /* I don't care about what people know. */ + perception_07
++ @220 /* Well, there is nothing I can do about it, is there. */ + perception_07
END

IF ~~ THEN perception_06
SAY @221 /* [Husam]You earned the title hero indeed, <CHARNAME>. But... */
IF ~~ THEN + perception_05
END

IF ~~ THEN perception_07
SAY @222 /* [Husam]Be cautious. The higher the rise, the deeper the fall. People tend to be especially unforgiving towards those they praised the most. */
IF ~~ THEN DO ~IncrementGlobal("C#Husam_Dialog","GLOBAL",1)~ EXIT
END

END //APPEND



/* end of SoD - at sewer exit */

BEGIN C#HusamS

CHAIN
IF ~Global("C#Husam_SoDEnd","GLOBAL",4)~ THEN C#HusamS pc_free
@223 /* [Husam]<CHARNAME>! What an unexpected surprise. Unexpected, but pleasant - except for the fact that I seem to be *too late* and out of the loop - again. Seems my resources are slacking off again, just like regarding Hephernaan's master. I returned as fast as possible when I heard what was going on, and was searching for a way to sneak in - to get to you. They are guarding the grounds with the intensity of a watch dog! */
== C#HusamS IF ~Global("C#AfHSoD_RevisedEnd","GLOBAL",0)~ THEN @224 /* [Husam]How did you escape? - Well, it doesn't matter now, I guess. But seeing you here tells me it wasn't the official way out. And what can I say... it wasn't the Shadow Thieves this time, either - obviously. */
== C#HusamS IF ~GlobalGT("C#AfHSoD_RevisedEnd","GLOBAL",0)~ THEN @225 /* [Husam]Seeing you here tells me it wasn't the official way out for you, either. */
END
+ ~Global("C#AfHSoD_RevisedEnd","GLOBAL",0)~ + @226 /* You would have freed me from the prison? */ + pc_free_07
+ ~!Global("C#AfHSoD_RevisedEnd","GLOBAL",0)~ + @227 /* Did you think I'd need your guidance out of the city? */ + pc_free_07
++ @228 /* Why did you return and try to reach me? */ + pc_free_07
++ @229 /* You tried to reach me? What for, to kill me before I could spill any intel about you? */ + pc_free_05
++ @230 /* Join me and come along, Husam. */ + pc_free_08

APPEND C#HusamS

IF ~~ THEN pc_free_01
SAY @231 /* [Husam](smiles) I would be careful with these kinds of labelling, but yes, I do have a personal interest in seeing you alive. */
IF ~~ THEN + pc_free_04
END

IF ~~ THEN pc_free_02
SAY @232 /* [Husam]Of course not. */
IF ~~ THEN + pc_free_04
END

IF ~~ THEN pc_free_03
SAY @233 /* [Husam]That would be wise, indeed. */
IF ~~ THEN + pc_free_04
END

IF ~~ THEN pc_free_04
SAY @234 /* [Husam]The city is in chaos! There are people fighting in the streets - your followers against the ones that want to see you dead sooner than later. The Dukes will be happy to be rid of you, one way or the other. Lay low for a while. And do it away from Baldur's Gate, preferably. */
= @235 /* [Husam]Maybe your way leads you to Amn. People there are busy with their own chores and schemes. They do not care what happened somewhere at the Sword Coast. Noone there knows the name Sarevok. And only a few will know the name <CHARNAME>, there. Farewell. */
IF ~~ THEN DO ~SetGlobal("C#Husam_SoDEnd","GLOBAL",5)
EscapeAreaDestroy(5)~ EXIT
END

IF ~~ THEN pc_free_05
SAY @236 /* [Husam]Oh, but no, <CHARNAME>. You are not my minion, and - no offence, but you know nothing that would threaten my mother guild, even if they'd tortured you to get information. */
IF ~~ THEN + pc_free_07
END

IF ~~ THEN pc_free_06
SAY @237 /* [Husam](smiles) I do hope I get assigned to you again. I did enjoy travelling with you, you know. */
++ @238 /* Husam, I think you are a good friend. */ + pc_free_01
++ @239 /* It's alright, I am out now. */ + pc_free_04
++ @240 /* I didn't kill Skie. */ + pc_free_02
++ @241 /* Well, all I can do now is hide for a while, I guess. */ + pc_free_03
END

IF ~~ THEN pc_free_07
SAY @242 /* [Husam]I indeed came to see you guided out of the city safely. You are my asset, remember? */
++ @243 /* Your asset thanks for your affection. */ + pc_free_06
++ @238 /* Husam, I think you are a good friend. */ + pc_free_01
++ @239 /* It's alright, I am out now. */ + pc_free_04
++ @240 /* I didn't kill Skie. */ + pc_free_02
++ @241 /* Well, all I can do now is hide for a while, I guess. */ + pc_free_03
++ @230 /* Join me and come along, Husam. */ + pc_free_08
END

IF ~~ THEN pc_free_08
SAY @244 /* [Husam]I won't, not that I know now that you are safe. */
IF ~~ THEN + pc_free_07
END


END //APPEND