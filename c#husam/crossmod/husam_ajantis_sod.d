/* Ajantis - Husam */
//#1
CHAIN
IF 
~!StateCheck("Ajantis",CD_STATE_NOTVALID)
InParty("Ajantis")
CombatCounter(0)
!See([ENEMY])
OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
See("C#Husam1")
!StateCheck("C#Husam1",CD_STATE_NOTVALID)
Global("C#HusamAjantisSoD","GLOBAL",0)~ THEN BDAJANTB HusamAjantisSoD1
@0 /* [Ajantis]Husam, your presence aches me! I would rather you were not be part of this group. */
DO ~SetGlobal("C#HusamAjantisSoD","GLOBAL",1)~
== C#HusamJ IF ~Global("C#AjantisBG1Husam2_6","GLOBAL",1)~ THEN @1 /* [Husam]I know, you already made that quite clear. Yet you chose your words surprisingly gentle, paladin. I guess I can leave my knife where it is? */
== C#HusamJ IF ~Global("C#AjantisBG1Husam2_6","GLOBAL",0)~ THEN @2 /* [Husam]I suppose so, anything else would be rather unexpected. Yet you chose your words surprisingly gentle, paladin. I guess I can leave my knife where it is? */
== BDAJANTB @3 /* [Ajantis]It would be naive to believe that the Shadow Thieves would not have their spies in the coalition forces, as well. I see why <CHARNAME> chose to have you right under <PRO_HISHER> nose, instead of in the shadows around us. I, too, prefer to have you near where I can see you. */
= @4 /* This does not mean I approve working with you - not in the slightest! I am ready to tolerate your presence because <CHARNAME> said so and I see the advantages. But I will watch you closely, rogue. One false step and I will strike you down with all of Helm's justice! */
== C#HusamJ @5 /* [Husam]What a relief, now you sound normal again. I was a bit worried the gods silently transferred me into some parallel reality of sorts - and I wasn't sure I liked it. Be assured, Ajantis - I have no intention whatsoever to be unloyal to <CHARNAME> on this endeavor. For that, I'm afraid, you will have to accept the word of this Shadow Thief. */
EXIT

//#2
CHAIN
IF WEIGHT #-1
~!StateCheck("Ajantis",CD_STATE_NOTVALID)
InParty("Ajantis")
CombatCounter(0)
!See([ENEMY])
OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
See("C#Husam1")
!StateCheck("C#Husam1",CD_STATE_NOTVALID)
GlobalGT("bd_plot","global",300) //met Nederlok at the coalition camp entrance
Global("C#HusamAjantisSoDbd3000","GLOBAL",0)~ THEN BDAJANTB HusamAjantisSoD2
@6 /* [Ajantis]You would have spies in the camp already? I demand you reveal them, Husam! <CHARNAME> has a right to know them. */
DO ~SetGlobal("C#HusamAjantisSoDbd3000","GLOBAL",2)~
== C#HusamJ @7 /* [Husam]<CHARNAME> or you, Ajantis? I don't see a reason to expose them. */
== BDAJANTB @8 /* [Ajantis]So you prefer to work in the shadows, and even leave your allies in the dark. */
== C#HusamJ @9 /* [Husam]Why - yes, and I have good reason to. <CHARNAME> and I combined forces. If you want to profit best from me, let me work with my ressources the way I see fit. I tell you another reason why I will not reveal my spies to you: they do not only watch, but also watch *over* my allies. And this is far more easily done without anyone knowing them. */
== BDAJANTB @10 /* [Ajantis]Our safety would profit from your unknown spies? I highly doubt it, thief. It's a rediculous thought in itself. */
== C#HusamJ @11 /* [Husam]From your perspective, I agree. It's just as rediculous as the idea that my safety would be higher with a paladin around - and yet, here we are, aren't we. */
EXIT

/* Ajantis' interjection into Husam's Thieves' Guild dialogue */
/* ~Why - but yes, <CHARNAME>, as does any other greater organisation - or do you seriously believe that the Order of the Radiant Heart, the Zentharim, the Harper, the Red Mages of Thay are *not* monitoring and meddling in affairs so the outcome would be to their preference?~ */
I_C_T C#HusamJ %thievesguild_contact_14% C#AjSoD_HusamIntTG
== bdajantJ IF ~InParty("Ajantis") See("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @12 /* Watch your phrasings if talking about the Order of the Most Radiant Heart! Do not group an order of knights together with your guild or the Red Wizards. We do not "meddle"! */
== C#HusamJ IF ~InParty("Ajantis") See("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @13 /* Says the squire who was send to help against the crusade. Blessed be your blind trust in your superiors. It's like watching a puppy facing the dangers of the outside world for the first time. */
== bdajantJ IF ~InParty("Ajantis") See("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @14 /* Watch your tone - */
== C#HusamJ IF ~InParty("Ajantis") See("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @15 /* I will, paladin. It was not my intention to offend you, but I fear you will learn politics the hard way eventually. */
END

/* interjection into Husam's greetings dialogue */
/* @22  = ~[Husam]I will join you and support you in your fight - and in exchange I will have first-hand information about your march against the crusade.~ */
I_C_T3 C#HUSAM1 %ajantis_int% C#AjSoD_Husam_Ajantis_Int
== bdajantJ IF ~Global("C#AjantisBG1Husam2_6","GLOBAL",1)
InParty("Ajantis") See("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @16 /* ~[Ajantis]The Shadow Thief - again.~ */
== C#Husam1 IF ~Global("C#AjantisBG1Husam2_6","GLOBAL",1)
InParty("Ajantis") See("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @17 /* ~[Husam]The paladin and squire of the Order of the Radiant Heart. I am *thankful* you didn't fell me right there in front of the Ilmater shrine when I revealed myself back then.~ */
END

I_C_T C#HUSAM1 %ajantis_int% C#AjantisBG1Husam2_6
== bdajantJ IF ~InParty("Ajantis") See("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @18 /* ~[Ajantis]A Shadow Thief - walking openly, revealing himself. The organisation behind him is a powerful and evil one - one I would rather not join forces with!~ */
END
