/*
Husam in BGII

(post from redline at BeamDog forums) "Personality-wise, we don't have much to go on from the first game, but it seems like he could potentially bring a bit of cold professionalism to the party, which could be a welcome counterweight to the self-righteousness/self-pity/sociopathy most of the other NPCs offer." 


compatibility: "C#HUSAM.cre" is used by bg1re
bg1re: BG1 AR0153.are - "C#HUSAM" has to DestroySelf() in case the PC didn't talk to him

BG1: one of his states let him stand in the Thieves' Guild at first meeting. Fix this with
ALTER_TRANS ~%tutu_var%SKIE~ BEGIN 1 END BEGIN 0 END BEGIN "EPILOGUE" ~GOTO 3~ END

*/

/* Gaelan gives the first hint */
/* Fare ye well, then... an' give me greetings to Lehtinan if ye happens by 'im, heh...
(StrRef: 47108) */
I_C_T GAELAN 71 C#Husam2_GAELAN_71
== GAELAN IF ~!Dead("HUSAM") !Dead("HUSAM2") !Dead("C#HUSAM") !Dead("JA#HUSAM") !Dead("C#HUSAM1")~ THEN ~Oh, and also look for work in the Dock's District. There's an orange brick building west of the area entrance. You will find good information there - if you are willing to do a thing or two for them.~
END



/* Pc can ask in Shadow Thieves' Guild */

/* Sidge */

/* This place?  Well, the guards let you in, so you must belong here.  This is the guildhall for the Shadow Thieves.  Let me bid you welcome, friend.
(StrRef: 21358) */
EXTEND_BOTTOM THIEF1 1 
+ ~GlobalLT("C#HusamSpawn","GLOBAL",11) !Dead("HUSAM") !Dead("HUSAM2") !Dead("C#HUSAM") !Dead("JA#HUSAM") !Dead("C#HUSAM1") Global("C#Husam2_AskedSidge","LOCALS",0)~ + ~The Shadow Thieves' Guild! I am looking for Husam. I know he is one of you.~ DO ~SetGlobal("C#Husam2_AskedSidge","LOCALS",1)~ UNSOLVED_JOURNAL ~Finding Husam

If I want to know more about Husam, I should talk to The Bloodskalp in the Shadow Thieves' Guild in Athkatla.~ + husam_1
END

/* Heh.  If you have to ask, you sure haven't been here long.  I be Sidge, one of the good fellows here in the Shadow Thieves.
(StrRef: 21362) */ 
EXTEND_BOTTOM THIEF1 2 
+ ~GlobalLT("C#HusamSpawn","GLOBAL",11) !Dead("HUSAM") !Dead("HUSAM2") !Dead("C#HUSAM") !Dead("JA#HUSAM") !Dead("C#HUSAM1") Global("C#Husam2_AskedSidge","LOCALS",0)~ + ~The Shadow Thieves' Guild! I am looking for Husam. I know he is one of you.~ DO ~SetGlobal("C#Husam2_AskedSidge","LOCALS",1)~ UNSOLVED_JOURNAL ~Finding Husam

If I want to know more about Husam, I should talk to The Bloodskalp in the Shadow Thieves' Guild in Athkatla.~ + husam_2
END

/* Bite yer tongue, I'm no thief!  I'm an assassin of the highest order.  You'd be well-advised to guard your tongue here amongst the Shadow Thieves.
(StrRef: 21371) */
EXTEND_BOTTOM THIEF1 5 
+ ~GlobalLT("C#HusamSpawn","GLOBAL",11) !Dead("HUSAM") !Dead("HUSAM2") !Dead("C#HUSAM") !Dead("JA#HUSAM") !Dead("C#HUSAM1") Global("C#Husam2_AskedSidge","LOCALS",0)~ + ~The Shadow Thieves' Guild! I am looking for Husam. I know he is one of you.~ DO ~SetGlobal("C#Husam2_AskedSidge","LOCALS",1)~ UNSOLVED_JOURNAL ~Finding Husam

If I want to know more about Husam, I should talk to The Bloodskalp in the Shadow Thieves' Guild in Athkatla.~ + husam_5
END

/* Renal Bloodscalp runs this place.  Chances are he has business with you if he let you in.  You can find him upstairs, on the second floor.  I'd watch yourself around him... 
(StrRef: 21375) */
EXTEND_BOTTOM THIEF1 6
+ ~GlobalLT("C#HusamSpawn","GLOBAL",11) !Dead("HUSAM") !Dead("HUSAM2") !Dead("C#HUSAM") !Dead("JA#HUSAM") !Dead("C#HUSAM1") Global("C#Husam2_AskedSidge","LOCALS",0)~ + ~I am looking for Husam. I know he is one of you.~ DO ~SetGlobal("C#Husam2_AskedSidge","LOCALS",1)~ UNSOLVED_JOURNAL ~Finding Husam

If I want to know more about Husam, I should talk to The Bloodskalp in the Shadow Thieves' Guild in Athkatla.~ + husam_6
END

/* Good day, once again.  Somethin' you needed?
(StrRef: 21380) */
EXTEND_BOTTOM THIEF1 8
+ ~GlobalLT("C#HusamSpawn","GLOBAL",11) !Dead("HUSAM") !Dead("HUSAM2") !Dead("C#HUSAM") !Dead("JA#HUSAM") !Dead("C#HUSAM1") Global("C#Husam2_AskedSidge","LOCALS",0)~ + ~I am looking for Husam. I know he is one of you.~ DO ~SetGlobal("C#Husam2_AskedSidge","LOCALS",1)~ UNSOLVED_JOURNAL ~Finding Husam

If I want to know more about Husam, I should talk to The Bloodskalp in the Shadow Thieves' Guild in Athkatla.~ + husam_8
END

APPEND THIEF1

IF ~~ THEN husam_1
SAY ~Husam, ey? That's a complex topic. Best you talk to the Bloodskalp.~
++ #21369 /* ~The Bloodscalp?  Who is that? */ + 6
COPY_TRANS THIEF1 1
END

IF ~~ THEN husam_2
SAY ~Husam, ey? That's a complex topic. Best you talk to the Bloodskalp.~
++ #21369 /* ~The Bloodscalp?  Who is that? */ + 6
COPY_TRANS THIEF1 2
END

IF ~~ THEN husam_5
SAY ~Husam, ey? That's a complex topic. Best you talk to the Bloodskalp.~
++ #21369 /* ~The Bloodscalp?  Who is that? */ + 6
COPY_TRANS THIEF1 5
END

IF ~~ THEN husam_6
SAY ~Husam, ey? That's a complex topic. Best you talk to the Bloodskalp.~
COPY_TRANS THIEF1 6
END

IF ~~ THEN husam_8
SAY ~Husam, ey? That's a complex topic. Best you talk to the Bloodskalp.~
++ #21369 /* ~The Bloodscalp?  Who is that? */ + 6
COPY_TRANS THIEF1 8
END

END //APPEND


/* PC talks with Renal */

INTERJECT RENAL 24 c#Husam2_RENAL_24
== RENAL IF ~!Dead("HUSAM") !Dead("HUSAM2") !Dead("C#HUSAM") !Dead("JA#HUSAM") !Dead("C#HUSAM1")~ THEN ~Before you answer, let me tell you that there is another thing which might increase your interest in persuing Mae'Var. Two, actually. The first is that he helds captive one of my loyalst rogues. You know him, I am talking about Husam. He disappeared the same time you did, <CHARNAME>.~
END
+ ~Global("C#Husam_SoDEnd","GLOBAL",6)~ + ~Husam? Why would I be interested in the wereabouts of this cutthroat assassin? Did you forget how we parted ways near Dragonspear Castle?~ + husam_sod
++ ~One of your loyalst rogues is held captive and you don't do anything about it?~ + husam_05
++ ~You know of my capture?~ + husam_02
++ ~Husam disappeared the same time I did?~ + husam_03
++ ~Husam? Remind me who that was.~ + husam_01

APPEND RENAL

IF ~~ THEN husam_sod
SAY ~No, I didn't forget it.~
++ ~One of your loyalst rogues is held captive and you don't do anything about it?~ + husam_05
++ ~You know of my capture?~ + husam_02
++ ~Husam disappeared the same time I did?~ + husam_03
++ ~What are you suggesting?~ + husam_04
END

IF ~~ THEN husam_01
SAY ~Let's say, he approached you in Baldur's Gate and made sure the Shadow Thieves weren't used as scapegoat for accusations of a murder someone else did. I am sure you will remember.~ 
++ ~One of your loyalst rogues is held captive and you don't do anything about it?~ + husam_05
++ ~You know of my capture?~ + husam_02
++ ~Husam disappeared the same time I did?~ + husam_03
++ ~What are you suggesting?~ + husam_04
END

IF ~~ THEN husam_02
SAY ~We noticed you being kidnapped, <CHARNAME>, but we didn't know by whom or where to.~
++ ~One of your loyalst rogues is held captive and you don't do anything about it?~ + husam_05
++ ~Husam disappeared the same time I did?~ + husam_03
++ ~Husam? Remind me who that was.~ + husam_01
++ ~What are you suggesting?~ + husam_04
END

IF ~~ THEN husam_03
SAY ~Well, 'disappeared' is not the exact term. We know where he is - held captive by Mae'var. But it *happened* the same time you were captured, too. The moment you were taken captive, he was taken by Mae'Var, too - and all of his rogues vanished. They are dead, presumably.~
++ ~One of your loyalst rogues is held captive and you don't do anything about it?~ + husam_05
++ ~You know of my capture?~ + husam_02
++ ~Husam? Remind me who that was.~ + husam_01
++ ~What are you suggesting?~ + husam_04
END

IF ~~ THEN husam_04
SAY ~This is the second reason you might have an own interest in persuing the task I offered, <CHARNAME>. Let's put it like this. You were taken captive and transferred to an unknown client in a shady fashion, unnoticed by city or other authorities - and it wasn't *us* - not the Shadow Thieves, officially. And yet, it was our style. Don't you think a rebellious guild master would be the ideal person to start searching? Mae'Var has accepted one or two assignments not authorised by me, lately - not that I could prove anything, but I have my sources. Maybe your captor offered him a good price - gold that helped him making his rogues loyal while planning my fall.~
IF ~~ THEN DO ~EraseJournalEntry(%Finding Husam

If I want to know more about Husam, I should talk to The Bloodskalp in the Shadow Thieves' Guild in Athkatla.%)~ UNSOLVED_JOURNAL ~Finding Husam

Renal, the head of Shadow Thieves' in Athkatla, told me that I might find Husam with one of his guild masters, Mae'Var, one he suspects to plan treason. Rumor is that Husam is a traitor! The question is - to whom? This guild master could also be the one responsible for my capture!~ + husam_06
END

IF ~~ THEN husam_05
SAY ~The matter is more complex than it seems, <CHARNAME>. Mae'Var says Husam planned to murder him, and for that it is his right to take measures. I can't just stomp in and free one of my rogues if he is accused of treason! Mae'Var is still one of my official guild masters, after all. Why do you think I need your help in finding proof?~
++ ~You know of my capture?~ + husam_02
++ ~Husam disappeared the same time I did?~ + husam_03
++ ~Husam? Remind me who that was.~ + husam_01
++ ~What are you suggesting?~ + husam_04
END

IF ~~ THEN husam_06
SAY ~I will be honest with you. If Husam indeed tried to kill Mae'Var, then I believe he had justifiable reasons - reasons that are in line with his mother guild's interests. I am not content at *all* that I have to sit here and watch while Mae'Var is torturing one of my best rogues, probably enjoying every minute of it. So, if you are interested in either helping Husam or just getting information about what happened to you, Mae'Var's guild is a good place to start looking. Find the proof I need, and I am sure you will find proof about Mae'Var's role in your kidnapping, as well.~
COPY_TRANS RENAL 24
END

END //APPEND

/* ask Edwin about Husam */

EXTEND_BOTTOM EDWIN 0 55
+ ~!Dead("HUSAM") !Dead("HUSAM2") !Dead("C#HUSAM") !Dead("JA#HUSAM") !Dead("C#HUSAM1")~ + ~What is it with Husam down in the cell? Why is he here?~ + husam
END

APPEND EDWIN
IF ~~ THEN husam
SAY ~Husam, hm. Yes, you know him from earlier, I presume. Well, that simian thought he could threaten my benefactor. That is all I know and that is all you need to know. (I need to spell this out for them. You never know what those apes are capable of if they think they have to help another.) Husam is where he *be-longs*, <CHARNAME>. You un-der-stand?~
COPY_TRANS EDWIN 55 
END

END //APPEND


/* confront Mae'Var with the proof of his treason */

APPEND MAEVAR

IF WEIGHT #-1
~OR(5)
PartyHasItem("c#hu2let")
HasItem("c#hu2let","C#Husam1")
HasItem("c#hu2let","C#Solaufein")
HasItem("c#hu2let","C#Grey")
HasItem("c#hu2let","C#Brandock")
Global("C#Husam2_ConfrontMaeVar","GLOBAL",0)~ THEN confront_maevar
SAY ~Why do you disturb me now? You know your orders!~
++ ~You are right. I will not risk upsetting anyone with authority by talking to you before finishing my tasks.~ + confront_maevar_01
++ ~You were the one kidnapping me and delivering me to Irenicus! Admit it!~ + confront_maevar_02
END

IF ~~ THEN confront_maevar_01
SAY ~Wise, very wise.~
IF ~~ THEN DO ~SetGlobal("C#Husam2_ConfrontMaeVar","GLOBAL",1)~ EXIT
END

IF ~~ THEN confront_maevar_02
SAY ~What? Who gave you permission to open that drawer?! Edwin! This is treachery! Now you will die!~
  IF ~~ THEN DO ~SetGlobal("C#Husam2_ConfrontMaeVar","GLOBAL",2)
Shout(89)
Enemy()~ EXIT
END

END //APPEND


/* Husam is in Mae'Var's hideout. */

BEGIN C#Husam2

IF ~!Dead("MaeVar") Global("C#HusamSpawn","GLOBAL",10)~ meeting_bg2
SAY ~(cough) There won't be much time for words before they silence me, even spoken so they can't make out the meaning. It is good to see you walk free, <CHARNAME>.~
++ ~Husam!~ DO ~SetGlobal("C#HusamSpawn","GLOBAL",11) EraseJournalEntry(%Finding Husam

Renal, the head of Shadow Thieves' in Athkatla, told me that I might find Husam with one of his guild masters, Mae'Var, one he suspects to plan treason. Rumor is that Husam is a traitor! The question is - to whom? This guild master could also be the one responsible for my capture!%)~ UNSOLVED_JOURNAL ~Finding Husam

I found Husam! He is held captive in Mae'Var's guild house. There seems no possibility to free him other than to play along with our disguise and perform Mae'Var's tasks until Renal agrees to killing Mae'Var.~ EXTERN MAEVAR husam 
++ ~Do I know you?~ DO ~SetGlobal("C#HusamSpawn","GLOBAL",11) EraseJournalEntry(%Finding Husam

Renal, the head of Shadow Thieves' in Athkatla, told me that I might find Husam with one of his guild masters, Mae'Var, one he suspects to plan treason. Rumor is that Husam is a traitor! The question is - to whom? This guild master could also be the one responsible for my capture!%)~ UNSOLVED_JOURNAL ~Finding Husam

I found Husam! He is held captive in Mae'Var's guild house. There seems no possibility to free him other than to play along with our disguise and perform Mae'Var's tasks until Renal agrees to killing Mae'Var.~ EXTERN MAEVAR husam 
++ ~Why are you here?~ DO ~SetGlobal("C#HusamSpawn","GLOBAL",11) EraseJournalEntry(%Finding Husam

Renal, the head of Shadow Thieves' in Athkatla, told me that I might find Husam with one of his guild masters, Mae'Var, one he suspects to plan treason. Rumor is that Husam is a traitor! The question is - to whom? This guild master could also be the one responsible for my capture!%)~ UNSOLVED_JOURNAL ~Finding Husam

I found Husam! He is held captive in Mae'Var's guild house. There seems no possibility to free him other than to play along with our disguise and perform Mae'Var's tasks until Renal agrees to killing Mae'Var.~ EXTERN MAEVAR husam 
+ ~Global("C#Husam_SoDEnd","GLOBAL",6)~ + ~So, you managed not only to ruin your alliance with me, but also with your fellow rogues? A masterpiece.~ DO ~SetGlobal("C#HusamSpawn","GLOBAL",11) EraseJournalEntry(%Finding Husam

Renal, the head of Shadow Thieves' in Athkatla, told me that I might find Husam with one of his guild masters, Mae'Var, one he suspects to plan treason. Rumor is that Husam is a traitor! The question is - to whom? This guild master could also be the one responsible for my capture!%)~ UNSOLVED_JOURNAL ~Finding Husam

I found Husam! He is held captive in Mae'Var's guild house. There seems no possibility to free him other than to play along with our disguise and perform Mae'Var's tasks until Renal agrees to killing Mae'Var.~ EXTERN MAEVAR husam 
END

IF ~!Dead("MaeVar") Global("C#HusamSpawn","GLOBAL",11)~ THEN meeting_bg2_01
SAY ~(Husam looks you in the eye, but otherwise does not show a reaction.)~
IF ~~ THEN EXIT
END 


CHAIN
IF ~~ THEN MAEVAR husam
~This man is here because he deserves it. Do not talk to him, or I'll decide you are planning treason, as well.~ 
== MAEVAR IF ~Global("MaeVarWork","GLOBAL",1)~ THEN ~Go and do what you were told, and do not linger too long, or you will learn that it is not good for your health.~
EXIT

APPEND C#Husam2

IF ~Dead("MaeVar") GlobalLT("C#HusamSpawn","GLOBAL",12)~ meeting_bg2_02
SAY ~You killed Mae'var. So that is already settled, then. (cough).~
++ ~You don't look good. Let me see to your healing.~ + meeting_bg2_03
++ ~You have an interesting way to say 'thank you'.~ + meeting_bg2_02a
++ ~Why are you here?~ + meeting_bg2_04
++ ~You are free to go, I guess.~ + meeting_bg2_05
++ ~I didn't do it for you.~ + meeting_bg2_05
END

IF ~~ THEN meeting_bg2_02a
SAY ~(smiles).~
IF ~~ THEN + meeting_bg2_06
END

IF ~~ THEN meeting_bg2_03
SAY ~I will be fine.~
++ ~You have an interesting way to say 'thank you'.~ + meeting_bg2_02a
++ ~Why are you here?~ + meeting_bg2_04
++ ~You are free to go, I guess.~ + meeting_bg2_05
END

IF ~~ THEN meeting_bg2_04
SAY ~I am here because I'm a fool.~
IF ~~ THEN + meeting_bg2_06
END

IF ~~ THEN meeting_bg2_05
SAY ~Then I will go, but not without telling you what happened, because it is of your interest, as well.~
IF ~~ THEN + meeting_bg2_06
END

END //APPEND C#Husam2

CHAIN
IF ~~ THEN C#Husam2 meeting_bg2_06
~Mae'Var betrayed my mother guild.~
== C#Husam2 ~I followed you out of Baldur's Gate. I did not conceal that we find you very interesting, so I was ordered to watch you after we parted, which I did. What I didn't consider was treachery. Mae'Var's followers infiltrated ours, and I was captured just as were you.~
= ~Yes, in case you didn't figure it out by now: Mae'Var and his men were the ones taking you captive and delivering you to this mage Irenicus, a name Mae'Var liked to tell me when he poked hot iron into my sides.~
= ~I was held prisoner since. Mae'Var tried to get secrets from me, but I told him *nothing*. (cough)~
= ~So, he is dead now, no revenge for me. But it leaves the client, this Irenicus. Heard he wrecked a quarter of the Promenade, something Mae'Var whined about, fearing for his last payment. I also heard about him decimating my fellow guild members. Is it true?~
END
++ ~Oh yes. They fought him, which gave me possibility to escape.~ + meeting_bg2_09
++ ~It was a massacre.~ + meeting_bg2_07
++ ~Why don't you go and ask your fellow guild members, instead of wasting my time.~ + meeting_bg2_12


APPEND C#Husam2

IF ~~ THEN meeting_bg2_07
SAY ~(grimasses) As I thought.~
IF ~~ THEN + meeting_bg2_08
END

IF ~~ THEN meeting_bg2_08
SAY ~This Irenicus had quite an impact, on my life as well, <CHARNAME>. You are going after him?~
++ ~Yes, that's what I'll do.~ + meeting_bg2_10
+ ~Global("C#IM_ImoenStays","GLOBAL",0)~ + ~Him and Imoen against the Cowled Wizards, Husam.~ + meeting_bg2_11
+ ~!Global("C#IM_ImoenStays","GLOBAL",0)~ + ~After him and against the Cowled Wizards, Husam.~ + meeting_bg2_11
++ ~Why would that be of your business?~ + meeting_bg2_12
END

IF ~~ THEN meeting_bg2_09
SAY ~So *something* good came out of it?~
IF ~~ THEN + meeting_bg2_08
END

IF ~~ THEN meeting_bg2_10
SAY ~Good.~
IF ~~ THEN + meeting_bg2_12
END

IF ~~ THEN meeting_bg2_11
SAY ~The Cowled Wizards? (cough) Well, it was to be expected they'd turn up, eventually. Nothing the Shadow Thieves wouldn't have ways to defeat or prevent, whichever suits most.~
IF ~~ THEN + meeting_bg2_12
END

IF ~~ THEN meeting_bg2_12
SAY ~After the attack The Shadowmaster launched against Irenicus and the losses it cost us, be asured the Shadow Thieves are the enemy of your enemy.~
= ~You have my thanks for freeing me. I will return now to the mother guild. I am not as naive as to think that my long absence didn't invoke others to thrive for my former position. I might get some credits back by telling Renal what I heard while being held captive in what was Mae'Var's interrogation room, but apart from that, it is clear that I have to work my way back to my glorious days as representative of the Shadow Thieves.~
+ ~Global("C#HusamSoDInParty","GLOBAL",1)~ + ~Would it be possible you come along, again?~ + meeting_bg2_13
++ ~Join me, Husam.~ + meeting_bg2_13
+ ~Global("C#HusamSoDInParty","GLOBAL",1)~ + ~Why not secure your position as an informant, Husam. Come with me! I think it worked well the last time.~ + meeting_bg2_13
++ ~Fine, but never forget I helped you. You are in my dept.~ + meeting_bg2_21
++ ~Farewell, then.~ + meeting_bg2_22
END

IF ~~ THEN meeting_bg2_13
SAY ~Join you instead of retrieving my position?~
++ ~You want me to bribe you into joining me?~ + meeting_bg2_15b
++ ~The fight against Irenicus is important for the Shadow Thieves. Plus it is a personal one for you now, too - in a way. I'll persue him and make him account for his deeds!~ + meeting_bg2_14
++ ~Retrieve your position *by* joining me. I'm the famous Bhaalspawn-hero-of-Baldur's-Gate everyone has an interest in, remember?~ + meeting_bg2_16
+ ~Global("C#HusamSoDInParty","GLOBAL",1)~ + ~Right back to business, Husam. Be an informant at the front row, just as you were!~ + meeting_bg2_16
++ ~I need a capable rogue, and you are one.~ + meeting_bg2_15
++ ~Well, maybe it's not such a good idea. Never forget I helped you, though. You are in my dept.~ + meeting_bg2_21
++ ~Maybe not. Farewell, then.~ + meeting_bg2_22
END

IF ~~ THEN meeting_bg2_14
SAY ~I *would* be interested in seeing this Irenicus. To see who conspired Mae'Var with to betray his own mother guild, to kidnap you - the hero of Baldur's Gate, without fear of having you as an enemy in the long run.~
IF ~~ THEN + meeting_bg2_16
END

IF ~~ THEN meeting_bg2_15
SAY ~I am still a quite capable thief, weeks of torture or no, that is true. But as this, I also know I have to sell me at the highest possible price.~
++ ~You want me to bribe you into joining me?~ + meeting_bg2_15b
++ ~The fight against Irenicus is important for the Shadow Thieves. Plus it is a personal one for you now, too - in a way. I'll persue him and make him account for his deeds!~ + meeting_bg2_14
++ ~Retrieve your position *by* joining me. I'm the famous Bhaalspawn-hero-of-Baldur's-Gate everyone has an interest in, remember?~ + meeting_bg2_16
+ ~Global("C#HusamSoDInParty","GLOBAL",1)~ + ~Right back to business, Husam. Be an informant at the front row, just as you were!~ + meeting_bg2_16
++ ~Well, maybe it's not such a good idea. Never forget I helped you, though. You are in my dept.~ + meeting_bg2_21
++ ~Maybe not. Farewell, then.~ + meeting_bg2_22
END

IF ~~ THEN meeting_bg2_15b
SAY ~(smiles) Not with gold, <CHARNAME>. Offer me someting else.~
++ ~The fight against Irenicus is important for the Shadow Thieves. Plus it is a personal one for you now, too - in a way. I'll persue him and make him account for his deeds!~ + meeting_bg2_14
++ ~Retrieve your position *by* joining me. I'm the famous Bhaalspawn-hero-of-Baldur's-Gate everyone has an interest in, remember?~ + meeting_bg2_16
+ ~Global("C#HusamSoDInParty","GLOBAL",1)~ + ~Right back to business, Husam. Be an informant at the front row, just as you were!~ + meeting_bg2_16
++ ~Well, maybe it's not such a good idea. Never forget I helped you, though. You are in my dept.~ + meeting_bg2_21
++ ~Maybe not. Farewell, then.~ + meeting_bg2_22
END

IF ~~ THEN meeting_bg2_16
SAY ~(smiles) Well, I *was* assigned to watch you. I could continue to do it by walking at your side, indeed.~
= ~<CHARNAME>. What I had for loyal companions were either killed by Mae'Var or probably died in an attempt to overtake Irenicus. I am filled with rage. My heart wants revenge. The Shadow Thieves already tackled Irenicus and failed. Maybe it is a good idea to join you. Maybe I can have it both: revenge and reputation in my guild.~ 
= ~We already worked together, and I would say it worked well. Yes, take me along, and we will both profit.~
++ ~You look battled. You'd need a rest before going adventuring, I think.~ + meeting_bg2_17
++ ~Do you expect me to heal and equipp you?~ + meeting_bg2_17
++ ~Yes, Husam, come along.~ + meeting_bg2_18
++ ~Well, maybe it's not such a good idea. Never forget I helped you, though. You are in my dept.~ + meeting_bg2_21
++ ~Maybe not. Farewell, then.~ + meeting_bg2_22
END

IF ~~ THEN meeting_bg2_17
SAY ~Do not worry. I don't expect you to take me along unequipped and hurt. I know a thing or two about Mae'Var's hideout, and also know that my things are still here.~
++ ~Yes, Husam, come along.~ + meeting_bg2_18
++ ~Well, maybe it's not such a good idea. Never forget I helped you, though. You are in my dept.~ + meeting_bg2_21
++ ~Maybe not. Farewell, then.~ + meeting_bg2_22
END

IF ~~ THEN meeting_bg2_18
SAY ~So I will join you, then. Give me a small moment to collect my things - and maybe drink a healing potion or two. Mae'Var doesn't need them any more, does he?~
IF ~~ THEN DO ~FadeToColor([20.0],0)
	SetGlobal("C#HusamSpawn","GLOBAL",12)
	SetGlobal("C#Husam2_Dialog","GLOBAL",1)
	Wait(2)
		GiveItemCreate("LEAT07","C#Husam1",0,0,0)
		ActionOverride("C#Husam1",FillSlot(SLOT_ARMOR))
		GiveItemCreate("SW1H10","C#Husam1",0,0,0)
		ActionOverride("C#Husam1",FillSlot(SLOT_WEAPON0))
		GiveItemCreate("AROW02","C#Husam1",20,0,0)
		ActionOverride("C#Husam1",FillSlot(SLOT_AMMO0))
		GiveItemCreate("BOW18","C#Husam1",0,0,0)
		GiveItemCreate("POTN52","C#Husam1",5,0,0)
	EraseJournalEntry(%Finding Husam

I found Husam! He is held captive in Mae'Var's guild house. There seems no possibility to free him other than to play along with our disguise and perform Mae'Var's tasks until Renal agrees to killing Mae'Var.%)
	FadeFromColor([20.0],0)~ SOLVED_JOURNAL ~Finding Husam

I freed Husam from Mae'Var.~ EXIT
END

IF ~Global("C#HusamSpawn","GLOBAL",12)~ THEN meeting_bg2_19
SAY ~I'm ready to go.~
IF ~NumInPartyLT(6)~ THEN DO ~SetGlobal("C#HusamSpawn","GLOBAL",14)
RealSetGlobalTimer("C#HusamDialogTimer","GLOBAL",20)
SetGlobal("C#HusamJoined","GLOBAL",1) JoinParty()~ EXIT
IF ~NumInParty(6)~ THEN + meeting_bg2_20
END

IF ~~ THEN meeting_bg2_20
SAY ~I'll stay in the back.~
IF ~~ THEN DO ~SetGlobal("C#HusamSpawn","GLOBAL",14)
//##RealSetGlobalTimer("C#HusamNPCBanterTimer","GLOBAL",400)
RealSetGlobalTimer("C#HusamDialogTimer","GLOBAL",60)
SetGlobal("C#HusamJoined","GLOBAL",2) 
MakeGlobal()
ChangeEnemyAlly(Myself, FAMILIAR)
SetDialog("C#Husamj")
AddFamiliar()
SetGlobal("C#LevelUp","LOCALS",0)~ EXIT
END

IF ~~ THEN meeting_bg2_21
SAY ~Do not worry, I will not forget.~
IF ~~ THEN + meeting_bg2_22
END

IF ~~ THEN meeting_bg2_22
SAY ~You'll find me in the Thieves' Guild.~
IF ~~ THEN DO ~SetGlobal("C#Husam2_WentHome","GLOBAL",1)~ SOLVED_JOURNAL ~Finding Husam

I freed Husam from Mae'Var.~ EXIT
END

IF ~Global("C#HusamSpawn","GLOBAL",13)~ THEN meeting2_bg2
SAY ~<CHARNAME>.~
+ ~OR(2)
	GlobalLT("C#Husam3_AgainstBodhi","GLOBAL",1)
	GlobalGT("C#Husam3_AgainstBodhi","GLOBAL",3)~ + ~Husam! Would you join me now?~ DO ~SetGlobal("C#Husam2_Dialog","GLOBAL",3)~ + meeting2_bg2_01
+ ~OR(2)
	GlobalLT("C#Husam3_AgainstBodhi","GLOBAL",1)
	GlobalGT("C#Husam3_AgainstBodhi","GLOBAL",3)~ + ~Nothing, farewell.~ EXIT
IF ~GlobalGT("C#Husam3_AgainstBodhi","GLOBAL",0)
GlobalLT("C#Husam3_AgainstBodhi","GLOBAL",4)~ THEN + meeting2_bg2_02
END

IF ~~ THEN meeting2_bg2_01
SAY ~(smiles) Well, I *was* assigned to watch you. I could continue to do it by walking at your side, indeed.~
++ ~Join me, Husam.~ + meeting_bg2_19
++ ~Nothing, farewell.~ EXIT
END

IF ~~ THEN meeting2_bg2_02
SAY ~I stand ready to fight Bodhi with you.~
++ ~Join me, Husam.~ DO ~SetGlobal("C#Husam3_AgainstBodhi","GLOBAL",4) ChangeAIScript("c#husam2",OVERRIDE) ChangeAIScript("",DEFAULT)~ + meeting_bg2_19
++ ~Very well.~ EXIT
END

END //APPEND


APPEND C#HusamJ

IF ~Global("C#Husam2_Dialog","GLOBAL",2) GlobalLT("RenalJob","GLOBAL",4)~ THEN about_maevar
SAY ~Did you have an order from Renal to kill Mae'Var when you did? If not, he won't be happy at all. I can only guess but I am pretty sure I know why it had to be you doing the infiltration. It was not only between Renal and Mae'Var and me, as you surely know. There is a lot of other guild masters like Mae'Var was, and there is a higher level of hirarchy Renal has to reply to, as well. Acting on Renal's order will have given you a mighty ally. Rushing Mae'Var's death will have angered one, instead.~
++ ~Are you making your stay in my group dependent on this?~ + about_maevar_01
+ ~Global("RenalJob","GLOBAL",1)~ + ~Then I'm afraid he will be angered.~ + about_maevar_02
+ ~OR(2)
Global("RenalJob","GLOBAL",2)
Global("RenalJob","GLOBAL",3)~ + ~Don't worry, it was on Renal's order.~ + about_maevar_03
END

IF ~~ THEN about_maevar_01
SAY ~No, or I would have asked before. I joined you for the reason I said, and that didn't change.~
+ ~Global("RenalJob","GLOBAL",1)~ + ~Then I'm afraid he will be angered.~ + about_maevar_02
+ ~OR(2)
Global("RenalJob","GLOBAL",2)
Global("RenalJob","GLOBAL",3)~ + ~Don't worry, it was on Renal's order.~ + about_maevar_03
END

IF ~~ THEN about_maevar_02
SAY ~Well, Renal will be furious, but that's how it is. You had a right to take your revenge on Mae'Var for what he did to you. Do not forget to remind Renal of this.~
IF ~~ THEN + about_maevar_04
END

IF ~~ THEN about_maevar_03
SAY ~Good. You had a right to take your revenge on Mae'Var for what he did to you. Seeing you waiting until the mother guild gave the order is refreshingly mature behavior. Assuming the right profession, one like you could come high in the Shadow Thieves' hirarchy.~
IF ~~ THEN + about_maevar_04
END

IF ~Global("C#Husam2_Dialog","GLOBAL",2) Global("RenalJob","GLOBAL",4)~ THEN about_maevar_04
SAY ~I am thankful, <CHARNAME>. You killing Mae'Var spared me weeks of torture, the least. Although I do admit I am sad I couldn't do it myself. I would have liked to hear him plead for his life at least once, and I would have known how to achieve it.~
IF ~~ THEN DO ~IncrementGlobal("C#Husam2_Dialog","GLOBAL",1)~ EXIT
END

END //APPEND





/* Renal after Mae'Var is finished */


I_C_T3 RENAL 48 C#Husam2_RENAL_48
== RENAL IF ~Global("C#Husam2_WentHome","GLOBAL",0)
	InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Ah, and I see Husam at your side. Welcome back, my loyal rogue. So our suspicion about Mae'Var being the capturer of <CHARNAME> and you was correct?~
== C#HusamJ IF ~Global("C#Husam2_WentHome","GLOBAL",0)
	InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Yes, it was. It was a nice move, getting <CHARNAME> into there. Bold, but clever. Mae'Var stumbled over his own megalomania.~
== RENAL IF ~!Dead("C#Husam1") GlobalGT("C#HusamSpawn","GLOBAL",12)~ THEN ~I do appreciate you freeing Husam, <CHARNAME>.~
END

I_C_T3 RENAL 49 C#Husam2_RENAL_49
== RENAL IF ~Global("C#Husam2_WentHome","GLOBAL",0)
	InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Ah, but at least I see Husam at your side. Welcome back, my loyal rogue. So our suspicion about Mae'Var being the capturer of <CHARNAME> and you was correct?~
== C#HusamJ IF ~Global("C#Husam2_WentHome","GLOBAL",0)
	InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Yes, it was. It was a nice move, getting <CHARNAME> into there. Bold, but clever. Mae'Var stumbled over his own megalomania.~
== RENAL IF ~!Dead("C#Husam1") GlobalGT("C#HusamSpawn","GLOBAL",12)~ THEN ~I do appreciate you freeing Husam, <CHARNAME>.~
== RENAL IF ~!Dead("C#Husam1") GlobalGT("C#HusamSpawn","GLOBAL",12)~ THEN ~Only that you did a bad job out of what could have been a great possibility, nevertheless expecting your reward?~
END

EXTEND_BOTTOM RENAL 51 53
IF ~OR(6) PartyHasItem("c#hu2let") 
HasItem("c#hu2let","C#Husam1")
HasItem("c#hu2let","C#Solaufein")
HasItem("c#hu2let","C#Grey")
HasItem("c#hu2let","C#Brandock")
Global("C#Husam2_ConfrontMaeVar","GLOBAL",2)~ THEN DO ~SetGlobal("RenalJob","GLOBAL",4)~ + revenge
END

APPEND RENAL 

IF ~~ THEN revenge
SAY ~To think that I thought I could profit from an outsider like you!~
++ ~I killed him because he was the one who kidnapped me and brought me into Irenicus' custody! This was a personal matter and had nothing to do with you or your orders, Renal. Surely you see the difference?~ DO ~SetGlobal("C#Husam2_RenalRevenge","GLOBAL",1)~ + revenge_02
++ ~I had my revenge and I won't let anyone decide when I will take it!~ DO ~SetGlobal("C#Husam2_RenalRevenge","GLOBAL",1)~ + revenge_01
++ ~Whatever, Renal, my business with you is done.~ + revenge_04
END

IF ~~ THEN revenge_01
SAY ~I do like the fierceness with which you claim your right for revenge. Hmm.~
IF ~~ THEN + revenge_03
END

IF ~~ THEN revenge_02
SAY ~Well... You do have a point. Maybe the situation is not as tricky as I thought.~ 
IF ~~ THEN + revenge_03
END

IF ~~ THEN revenge_03
SAY ~Very well. Because of your strong motive of personal revenge I think I can turn this to prevent a war inside the guild - if you hand me back the documents I handed to you for your passage to Mae'Var. Give these back to me and I can be sure that your revenge will not be seen as my tactic to let an unwanted guild master disappear.~
+ ~OR(5)
PartyHasItem("MISC4T")
HasItem("MISC4T","C#Husam1")
HasItem("MISC4T","C#Solaufein")
HasItem("MISC4T","C#Grey")
HasItem("MISC4T","C#Brandock")~ + ~I have it right here.~ DO 
~ActionOverride("C#Husam1",GiveItem("MISC4T","Renal Bloodscalp"))
ActionOverride("C#Solaufein",GiveItem("MISC4T","Renal Bloodscalp"))
ActionOverride("C#Grey",GiveItem("MISC4T","Renal Bloodscalp"))
ActionOverride("C#Brandock",GiveItem("MISC4T","Renal Bloodscalp"))
ActionOverride("Renal Bloodscalp",TakePartyItem("MISC4T")) ActionOverride("Renal Bloodscalp",DestroyItem("MISC4T"))~ + revenge_05
+ ~!PartyHasItem("MISC4T")
!HasItem("MISC4T","C#Husam1")
!HasItem("MISC4T","C#Solaufein")
!HasItem("MISC4T","C#Grey")
!HasItem("MISC4T","C#Brandock")~ + ~I don't have it with me but will get it as soon as possible.~ + revenge_06
++ ~Whatever, Renal, my business with you is done.~ + revenge_04
END

IF ~~ THEN revenge_04
SAY ~Done, indeed. Begone!~
COPY_TRANS RENAL 52
END

IF ~~ THEN revenge_05
SAY ~Yes, this will work. I will give you your reward, then.~
IF ~~ THEN + 59
IF ~Global("PlayerHasStronghold","GLOBAL",0)
Class(Player1,THIEF_ALL)~ THEN + 60
END

IF ~~ THEN revenge_06
SAY ~Be quick about it, or it might fall into the wrong hands.~
IF ~~ THEN DO ~SetGlobal("C#Husam2_RenalWaits","GLOBAL",1)~ EXIT
END

IF WEIGHT #-1
~Global("C#Husam2_RenalWaits","GLOBAL",1) Global("RenalJob","GLOBAL",4)~ THEN waits
SAY ~Could you retrieve the document?~
+ ~OR(5)
PartyHasItem("MISC4T")
HasItem("MISC4T","C#Husam1")
HasItem("MISC4T","C#Solaufein")
HasItem("MISC4T","C#Grey")
HasItem("MISC4T","C#Brandock")~ + ~I have it right here.~ DO ~ActionOverride("C#Husam1",GiveItem("MISC4T","Renal Bloodscalp"))
ActionOverride("C#Solaufein",GiveItem("MISC4T","Renal Bloodscalp"))
ActionOverride("C#Grey",GiveItem("MISC4T","Renal Bloodscalp"))
ActionOverride("C#Brandock",GiveItem("MISC4T","Renal Bloodscalp"))
ActionOverride("Renal Bloodscalp",TakePartyItem("MISC4T")) ActionOverride("Renal Bloodscalp",DestroyItem("MISC4T")) SetGlobal("C#Husam2_RenalWaits","GLOBAL",2)~ + revenge_05
+ ~!PartyHasItem("MISC4T")
!HasItem("MISC4T","C#Husam1")
!HasItem("MISC4T","C#Solaufein")
!HasItem("MISC4T","C#Grey")
!HasItem("MISC4T","C#Brandock")~ + ~I don't have it with me but will get it as soon as possible.~ + revenge_06
++ ~I don't, and I fear I can't, either.~ DO ~SetGlobal("C#Husam2_RenalWaits","GLOBAL",2)~ + waits_01
END

IF ~~ THEN waits_01
SAY ~That is too bad. Very well, I can at least give you a reward.~
IF ~~ THEN + 59
END

END //APPEND



/* this is for compatibility with NPC strongholds, which replaces the existing dialogue with a new one. Renal will greet Husam after the mod dialogue is done */

/* Global("RenalJob","GLOBAL",4) Global("C#Husam2_RENAL_48","GLOBAL",0)
!Dead("C#HUSAM1") 

triggger per area script, because Renal.cre doesn't have a custom one. AR0306.are needs patching. */

CHAIN
IF WEIGHT #-1
~Global("C#Husam2_RENAL_48","GLOBAL",2)
~ THEN RENAL husam_greeting
~Ah, and you freed Husam.~ DO ~SetGlobal("C#Husam2_RENAL_48","GLOBAL",3)~
== RENAL IF ~Global("C#Husam2_WentHome","GLOBAL",0)
	InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Welcome back, my loyal rogue.~ 
== C#HusamJ IF ~Global("C#Husam2_WentHome","GLOBAL",0)
	InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Hello, Renal. It was a nice move, getting <CHARNAME> into there. Bold, but clever. Mae'Var stumbled over his own megalomania.~
== RENAL IF ~GlobalGT("C#Husam2_WentHome","GLOBAL",0)~ THEN ~He already found his way back to us.~
== RENAL ~I do appreciate you freeing our rogue, <CHARNAME>.~
EXIT

APPEND C#HusamJ

/* follow up if PC persuaded Renal to give the reward nontheless 
Global("C#Husam2_RenalRevenge","GLOBAL",1) */

IF ~Global("C#Husam2_RenalRevenge","GLOBAL",2)~ THEN renal_reward
SAY ~I am impressed of how you soozed Renal into giving you the reward albeit disobeying his order, <CHARNAME>. If I wouldn't know Renal better, I would think he is easily influenced. But that he is definitely not. Not at all.~
= ~I think it is you, <CHARNAME>. You have a certain way of demeanor others react to. It is fascinating to witness. It also tells me I should watch myself while being around you. (smiles)~
IF ~~ THEN DO ~SetGlobal("C#Husam2_RenalRevenge","GLOBAL",3)~ EXIT
END

END //APPEND


/* PC has thief guild */

/* thieves know Husam */


ADD_STATE_TRIGGER SHTH01 0 ~!IsGabber("C#Husam1")~

APPEND SHTH01

IF WEIGHT #3 
~IsGabber("C#Husam1")
~ THEN BEGIN husam
  SAY ~Hullo Husam, I know ye but <CHARNAME>'s me boss, and <PRO_HESHE>'s the one I talk to.~ 
  IF ~~ THEN EXIT
END

END

ADD_STATE_TRIGGER SHTH02 0 ~!IsGabber("C#Husam1")~

ADD_STATE_TRIGGER SHTH02 15 ~!IsGabber("C#Husam1")~

APPEND SHTH02

IF WEIGHT #3 
~IsGabber("C#Husam1")
~ THEN BEGIN husam
  SAY ~Hello there Husam. I'll speak to guildmaster <CHARNAME> if you please, and none other.~ 
  IF ~~ THEN EXIT
END

IF WEIGHT #1 ~Global("PGFailed","GLOBAL",1)
IsGabber("C#Husam1")
~ THEN BEGIN 15 // from:
  SAY ~Your friend is not guildmaster any more. Kindly leave.~ 
  IF ~~ THEN EXIT
END

END

I_C_T SHTH03 8 C#Husam2_SHTH03_8
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Hm, when one of your rogues admits that he has reached his limits, you should consider his words, <CHARNAME>. It is not an environment where people tend to show their weaknesses too openly, so when someone does, it is important to take it seriously.~
END

ADD_STATE_TRIGGER SHTH04 14 ~!IsGabber("C#Husam1")~

APPEND SHTH01

IF WEIGHT #1 
~IsGabber("C#Husam1")
~ THEN BEGIN husam
  SAY ~Hi Husam! Sorry about your friend not being guildboss no more.~ 
  IF ~~ THEN EXIT
END

END

I_C_T SHTH05 3 C#Husam2_SHTH05_3
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Yes, you start with high ideals and then it all comes down to counting coins.~
END


I_C_T SHTH06 0 C#Husam2_SHTH06_01
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Watch your tongue, young one. I'm not just one of <CHARNAME>'s friends. You should know your guildmaster's friends, Varia - and their friends.~
== SHTH06 IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Yes, I know your face well enough, Husam. Didn't think you'd come here without chains, eh?~
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Careful there, Varia. <CHARNAME> is not too fond of your friend Mae'Var, you know. You don't want <PRO_HIMHER> to be supicious you helped your former guild master with his little undertaking, do you?~ 
== SHTH06 IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~I'm not gonna take no threats by a guildmaster's friend, Shadow Thief or no!~
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~If you think this was a threat, girl, you have a lot to learn.~
END

I_C_T SHTH06 0 C#Husam2_SHTH06_01
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Yes, seems he also liked to keep his foes close, didn't it.~
== SHTH06 IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Yes, I know your face well enough, Husam. Didn't think you'd come here without chains, eh?~
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Careful there, Varia. <CHARNAME> is not too fond of your friend Mae'Var, you know. You don't want <PRO_HIMHER> to be supicious you helped your former guild master with his little undertaking, do you?~ 
== SHTH06 IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~I'm not gonna take no threats by a guildmaster's friend, Shadow Thief or no!~
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~If you think this was a threat, girl, you have a lot to learn.~
END



I_C_T SHTHLT01 26 C#Husam2_SHTHLT01_prison
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Oh, yes, prison. Bribe your thieves out soon and they will be thankful, but lose respect for the risk, and maybe also for your authority. Let them wait and they will start to be angry, but also have higher respects for a guild master who won't hopp every time they clap their hands. It's always an interesting decision to make, <CHARNAME>, and something you'll have to decide on your own.~
END

I_C_T SHTHLT01 52 C#Husam2_SHTHLT01_prison
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Oh, yes, prison. Bribe your thieves out soon and they will be thankful, but lose respect for the risk, and maybe also for your authority. Let them wait and they will start to be angry, but also have higher respects for a guild master who won't hopp every time they clap their hands. It's always an interesting decision to make, <CHARNAME>, and something you'll have to decide on your own.~
END

I_C_T SHTHLT01 78 C#Husam2_SHTHLT01_prison
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Oh, yes, prison. Bribe your thieves out soon and they will be thankful, but lose respect for the risk, and maybe also for your authority. Let them wait and they will start to be angry, but also have higher respects for a guild master who won't hopp every time they clap their hands. It's always an interesting decision to make, <CHARNAME>, and something you'll have to decide on your own.~
END

I_C_T SHTHLT01 104 C#Husam2_SHTHLT01_prison
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Oh, yes, prison. Bribe your thieves out soon and they will be thankful, but lose respect for the risk, and maybe also for your authority. Let them wait and they will start to be angry, but also have higher respects for a guild master who won't hopp every time they clap their hands. It's always an interesting decision to make, <CHARNAME>, and something you'll have to decide on your own.~
END

I_C_T SHTHLT01 149 C#Husam2_SHTHLT01_prison
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Oh, yes, prison. Bribe your thieves out soon and they will be thankful, but lose respect for the risk, and maybe also for your authority. Let them wait and they will start to be angry, but also have higher respects for a guild master who won't hopp every time they clap their hands. It's always an interesting decision to make, <CHARNAME>, and something you'll have to decide on your own.~
END

I_C_T SHTHLT01 189 C#Husam2_SHTHLT01_prison
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Oh, yes, prison. Bribe your thieves out soon and they will be thankful, but lose respect for the risk, and maybe also for your authority. Let them wait and they will start to be angry, but also have higher respects for a guild master who won't hopp every time they clap their hands. It's always an interesting decision to make, <CHARNAME>, and something you'll have to decide on your own.~
END

I_C_T SHTHLT01 196 C#Husam2_SHTHLT01_196
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~To steal from one's thief companions! They are lucky they already left, because some rules are not to be trifled with. This is sad, <CHARNAME>, but things like these happen more often than any guild master would admit freely.~
END

I_C_T SHTHLT01 197 C#Husam2_SHTHLT01_197
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~To steal from one's thief companions! They are lucky they already left, because some rules are not to be trifled with. This is sad, <CHARNAME>, but things like these happen more often than any guild master would admit freely.~
END

I_C_T SHTHLT01 198 C#Husam2_SHTHLT01_198
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~This is sad, <CHARNAME>, but things like these happen more often than any guild master would admit freely.~
END





/* Ama's trap 
Global("AmaWaukeen","GLOBAL",1) */

I_C_T SHTHASS1 9 C#Husam2_SHTHASS1_9
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~This is a great honor indeed, Shadowmaster Ama of eastern Esmeltaran.~
END


APPEND C#HusamJ

IF ~Global("C#Husam2_SHTHASS1_9","GLOBAL",2)~ THEN ama
SAY ~<CHARNAME>, a word, please. I did not want to talk in front of that thief to avoid making her supicious, but I need to warn you. I know her face, I've seen it several times in good light while mine seemed to have been hidden in the dark. Now that I think of it - Mae'Var never gloated about my capture in front of *other* thieves, so this seems to come to our advantage now. I tested her response with my devote comment, and conclude from her unsuspicious reaction that she really doesn't seem to know me as the witness I am.~
= ~This Ama is no Shadowmaster. She is one of Mae'Var's whores, visiting several times while I was held captive. They planned a lot of things, *becoming* Shadowmasters was one of them, but she is a local thief, nothing more. This is bound to be a trap, so watch out.~
++ ~Thank you for the warning.~ + ama_03
++ ~Indeed! What do you suggest?~ + ama_02
++ ~The signet seemed true enough.~ + ama_01
END

IF ~~ THEN ama_01
SAY ~It looked true enough, I agree. But I do not need to draw your attention to the fact that you are surrounded by people of a profession where gathering 'true enough' signet rings can be called a daily routine.~
++ ~Thank you for the warning.~ + ama_03
++ ~Indeed! What do you suggest?~ + ama_02
++ ~We'll see.~ + ama_03
END 

IF ~~ THEN ama_02
SAY ~Play along and then take them by surprise. Attack while they are still gathering, before they are fully grouped, but not before you know you can hit all of them.~
IF ~~ THEN + ama_03
END

IF ~~ THEN ama_03
SAY ~I like the thought of having one or two of Mae'var's followers in front of my blade. If this trap gives me the opportunity, the better.~
IF ~~ THEN DO ~SetGlobal("C#Husam2_SHTHASS1_9","GLOBAL",3)~ EXIT
END

END //APPEND


EXTEND_BOTTOM MAEGUY01 17 
+ ~GlobalGT("C#Husam2_SHTHASS1_9","GLOBAL",1)~ + ~Yes, Husam already told me about her, but I thank you for the warning nontheless.~ + 19
END


APPEND C#HusamJ

IF ~Global("C#Husam2_Dialog","GLOBAL",4)~ THEN about_gaelan
SAY ~So, Gaelan was the messenger bringing the offer about the Shadow Thieves' help, but he didn't tell who sent him? Ah well, we do like to stay hidden as long as we can.~
++ ~Yes, it was quite a surprise, being approached by him more or less directly after I got out.~ + about_gaelan_01
++ ~Why do they want so much gold, Husam?~ + about_gaelan_02
++ ~A costly help it is, considering the sum.~ + about_gaelan_02
++ ~Let's stop talking and focus on what we need to do.~ DO ~IncrementGlobal("C#Husam2_Dialog","GLOBAL",1)~ EXIT 
END

IF ~~ THEN about_gaelan_01
SAY ~(smiles) We do have our sources.~
++ ~Why do they want so much gold, Husam?~ + about_gaelan_02
++ ~A costly help it is, considering the sum.~ + about_gaelan_02
++ ~Let's stop talking and focus on what we need to do.~ DO ~IncrementGlobal("C#Husam2_Dialog","GLOBAL",1)~ EXIT 
END

IF ~~ THEN about_gaelan_02
SAY ~Ah, but do you think you get anything for free? Yes, I understand that it is irritating. But there you have it - after spending years of training and learning to be the quickest, the most silent, the most dexterous, the best of your trade, you learn that there is only one thing in a thief's life that counts - gold.~
= ~Linvail has to make his help costly. For one, otherwise there would be half of town wanting help tomorrow if he wouldn't. And secondly, such a costly help it is, <CHARNAME>. Getting you to a hidden place, unnoticed by the city authorities and the Cowled Wizards, bribing not only for the travel but also a safe passage...~
= ~But be sure about one thing, <CHARNAME>. The Shadow Thieves do not raise the price after it is agreed upon. This is something you can rely on. Sometimes they might lower it, if they think it wise, but a deal is a deal.~
IF ~~ THEN DO ~IncrementGlobal("C#Husam2_Dialog","GLOBAL",1)~ EXIT
END

END //APPEND

/* Bodhi offers her help */

I_C_T BODHI 6 C#Husam2_BODHI_6
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~<CHARNAME>, I can't get rid of the feeling that she is a representative of the mysterious guild that is making us Shadow Thieves so much trouble. Be careful.~
END

I_C_T BODHI 12 C#Husam2_BODHI_12
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~I knew it! <CHARNAME>, my finges are itching to reach for my dagger.~
== BODHI IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~Cute. Maybe you should keep your little thief on a shorter leash, <CHARNAME>, hm?~
END

/* Husam will leave if the PC accepts Bodhi's offer */

I_C_T3 BODHI 18 C#Husam2_BODHI_12
== C#HusamJ IF ~InMyArea("C#Husam1")
	InParty("C#Husam1")
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~<CHARNAME>, this was a mistake. You helped me, so I'll refrain from murdering you in your sleep tonight, but will wait until we cross blades next time we meet - probably in a guild fight. It's a pity we lose you to our enemy, but that is how life goes. I can't say 'Farewell' because we are enemies now, but I can say 'Take care'.~ DO ~SetGlobal("C#HusamJoined","GLOBAL",3) SetGlobal("C#Husam2_PCAttacksGuild","GLOBAL",1) DestroyItem("LEAT07") DestroyItem("SW1H10") GivePartyAllEquipment() SetLeavePartyDialogFile() LeaveParty() EscapeArea()~

== C#HusamJ IF ~InMyArea("C#Husam1")
	Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~<CHARNAME>, this was a mistake. You helped me, so I'll refrain from murdering you in your sleep tonight, but will wait until we cross blades next time we meet - probably in a guild fight. It's a pity we lose you to our enemy, but that is how life goes. I can't say 'Farewell' because we are enemies now, but I can say 'Take care'.~ DO ~SetGlobal("C#HusamJoined","GLOBAL",3) SetGlobal("C#Husam2_PCAttacksGuild","GLOBAL",1) DestroyItem("LEAT07") DestroyItem("SW1H10") GivePartyAllEquipment() SetLeavePartyDialogFile() RemoveFamiliar()
ChangeEnemyAlly(Myself,NEUTRAL) EscapeArea()~
END




APPEND C#HusamJ

/* Aran sends the PC to do some tasks 
GlobalGT("AranJob","GLOBAL",0) 

~Ich weiß, was Ihr sagen wollt. 'Weitere Dienste für Linvail waren nicht Teil der Abmachung.' Das Problem ist nur folgendes: Seid Ihr sicher? Linvail hat Euch überbringen lassen, dass er Euch für die vereinbarte Summe helfen kann und wird, zu Imoen zu gelangen. Er hat nicht gesagt, dass Ihr nicht noch ein bisschen Arbeiten müsst.~
*/

IF ~Global("C#Husam2_AboutLinvail","GLOBAL",1)~ THEN aran_tasks
SAY ~I sense a thought that might be in your head: 'I didn't agree to any further services for the Shadow Thieves. They are not part of the deal.' Then consider this: Are you sure? For the gold you paid, Linvail made you the offer to help you to get to Ireniucs. He didn't exclude that you might have to work a bit for it, too.~
++ ~No, actually I didn't think this thought.~ + aran_tasks_07
++ ~I can't help feeling used, Husam.~ + aran_tasks_01
++ ~If this is how the Shadow Thieves keep their deals then 'thank you very much'!~ + aran_tasks_03
++ ~Don't tell me this isn't some scheme to test me out.~ + aran_tasks_03
++ ~Your guild must be very desperate indeed. First Renal sent me on errands, now Linvail.~ + aran_tasks_03
++ ~Linvail better keeps his promise soon, Husam. My patience has limits.~ + aran_tasks_04
++ ~What I thought is of no importance, Husam. And I don't want to talk about it.~ + aran_tasks_06
END

IF ~~ THEN aran_tasks_01
SAY ~Because you are used! As a Shadow Thief's minion. As a helper. As a supporter, <CHARNAME>.~
++ ~I can't believe you are admitting it so freely!~ + aran_tasks_02
++ ~If this is how the Shadow Thieves keep their deals then 'thank you very much'!~ + aran_tasks_03
++ ~Don't tell me this isn't some scheme to test me out.~ + aran_tasks_03
++ ~Your guild must be very desperate indeed. First Renal sent me on errands, now Linvail.~ + aran_tasks_03
++ ~Linvail better keeps his promise soon, Husam. My patience has limits.~ + aran_tasks_04
END

IF ~~ THEN aran_tasks_02
SAY ~I am admitting it freely because being used doesn't necessarily mean being *abused*, <CHARNAME>.~
IF ~~ THEN + aran_tasks_05
END

IF ~~ THEN aran_tasks_03
SAY ~*Or* we simply understood your value as a fighting ally, <CHARNAME>.~
IF ~~ THEN + aran_tasks_05
END

IF ~~ THEN aran_tasks_04
SAY ~He will. But I am afraid it is him defining the time line of 'soon'.~
IF ~~ THEN + aran_tasks_05
END

IF ~~ THEN aran_tasks_05
SAY ~Linvail *is* testing you out, <CHARNAME>. Of course he is! Because he has to know you, if the time will come. He would be a bad Shadowmaster if he wouldn't. See it like this - for the upcoming task, you paid a sum and have a right that the Shadow Thieves will hold their deal. But in the future, when you might need their help, they will remember how well you helped them now. And we need the help. It is no lie the Shadow Thieves suffered severe blows due to the guild war, and Mae'Var's treachery and the fight with Irenicus made it worse. And this new guild... If you think the Shadow Thieves are reckless, than there is no term that would describe *them*.~
= ~I also happen to know that the help you need is costly - very costly, and a very delicate thing to organize. Do not fret, <CHARNAME>. Might as well be Linvail wants to keep you busy while he is waiting himself.~
++ ~Dealing with the Shadow Thieves is hard enough for me, Husam. Having to run their errands is more than I like to bear.~ + aran_tasks_06
++ ~I trust you, Husam. I guess it's alright.~ + aran_tasks_11
++ ~Fine. But in all these intelligent thoughts the Shadow Thieves should not forget that *I* am evaluating their help, too.~ + aran_tasks_06
++ ~It's alright, I do not mind the tasks, whatever their reasons.~ + aran_tasks_11
++ ~Whatever.~ + aran_tasks_11
END

IF ~~ THEN aran_tasks_06
SAY ~Valid point and duly noted.~
IF ~~ THEN + aran_tasks_11
END

IF ~~ THEN aran_tasks_07
SAY ~You didn't?~
++ ~No. I don't mind the tasks.~ + aran_tasks_05
++ ~I'm fine with the tasks, it's the delay I do not like.~ + aran_tasks_05
++ ~My thought was: 'Yes, I didn't expect anything else from the Shadow Thieves.'~ + aran_tasks_09
++ ~It was more like: 'How many obstacles will there be before I can get to Irenicus?'~ + aran_tasks_05
++ ~I was thinking something very unfriendly. Your phrased thought would have been my next one.~ + aran_tasks_10
++ ~I didn't evaluate the situation, because I know I have to do it before I get passage to Irenicus.~ + aran_tasks_05
++ ~If this is how the Shadow Thieves keep their deals then 'thank you very much'!~ + aran_tasks_03
++ ~Don't tell me this isn't some scheme to test me out.~ + aran_tasks_03
++ ~Your guild must be very desperate indeed. First Renal sent me on errands, now Linvail.~ + aran_tasks_03
++ ~Linvail better keeps his promise soon, Husam. My patience has limits.~ + aran_tasks_04
++ ~What I thought is of no importance, Husam. And I don't want to talk about it.~ + aran_tasks_06
END

IF ~~ THEN aran_tasks_09
SAY ~(smiles) Then you either have a bad opinion about us - or you understood perfectly how we operate.~
IF ~~ THEN + aran_tasks_05
END

IF ~~ THEN aran_tasks_10
SAY ~(smiles)~
IF ~~ THEN + aran_tasks_05
END

IF ~~ THEN aran_tasks_11
SAY ~Come then, let's go and finish our work. If there is one thing about Linvail, then it's the fact that he won't take his orders back, but expects us to fulfill them.~
IF ~~ THEN DO ~SetGlobal("C#Husam2_AboutLinvail","GLOBAL",2)~ EXIT
END

END //APPEND

/* Aran notices Husam in PC's group */
CHAIN
IF WEIGHT #-1
~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)
Global("C#Husam2_AranGreeting","GLOBAL",0)~ THEN ARAN husam_greeting
~Husam! You found your way into <CHARNAME>'s group, I see.~ DO ~SetGlobal("C#Husam2_AranGreeting","GLOBAL",1)~
== C#HusamJ ~Yes, <PRO_HESHE> saved me from Mae'Var's capture, Aran. Which you already know, of course.~
== ARAN ~(smiles) Indeed.~
EXIT

/* add some reply options because it's not surprise any more that it was the Shadow Thieves attacking Irenicus in ID */

EXTEND_BOTTOM ARAN 34
+ ~GlobalGT("C#HusamSpawn","GLOBAL",12)~ + ~Yes, I figured that out by now.~ + 35
END

I_C_T ARAN 67 C#Husam2_ARAN_67
== ARAN IF ~!Dead("HUSAM") !Dead("HUSAM2") !Dead("C#HUSAM") !Dead("JA#HUSAM")~ THEN ~We are wiser now, especially about the persons doing the kidnapping. Back then, we only noticed you being kidnapped, but not where to, and obviously, also not by whom, but we didn't pay it much heed.~
END


/* Saemon Havarian inside the Asylum. Note: this will not happen if Suna Seni component of UB is installed! */
I_C_T PPSAEM2 4 C#Husam2_PPSAEM2_4
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)
GlobalGT("C#Husam2_SaemonBetrayal","GLOBAL",0)~ THEN ~You won't profit much in the future, Havarian. You betrayed <CHARNAME>. Do you realize that you are dead? <CHARNAME>, tell me one reason not to cut his throat right now.~
== PPSAEM IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)
GlobalGT("C#Husam2_SaemonBetrayal","GLOBAL",0)~ THEN ~Now, but really! Don't you see that you have more important things to do than to fret over the past?~
END


/* Saemon Havarian after first fight against Irenicus */

/* in case Saemon did not spawn inside the Asylum */
I_C_T PPSAEM2 21 C#Husam2_PPSAEM2_4 //same variable as above
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)
GlobalGT("C#Husam2_SaemonBetrayal","GLOBAL",0)~ THEN ~You won't profit much in the future, Havarian. You betrayed <CHARNAME>. Do you realize that you are dead? <CHARNAME>, tell me one reason not to cut his throat right now.~
== PPSAEM IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)
GlobalGT("C#Husam2_SaemonBetrayal","GLOBAL",0)~ THEN ~Now, but really! Don't you see that you have more important things to do than to fret over the past?~
END

I_C_T PPSAEM2 16 C#Husam2_PPSAEM2_12
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)
GlobalGT("C#Husam2_SaemonBetrayal","GLOBAL",0)~ THEN ~I stand corrected, as it seems. You're a lone wolf if I ever saw one - ready to eat its own, if necessary. <CHARNAME>, I wouldn't trust this man as far as I can spit if I were you.~
END

/* Saeman in Brannlaw after Irenicus went into the UnderdarK */
I_C_T PPSAEM3 1 C#Husam2_PPSAEM3_1
== C#HusamJ IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
	!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN ~A-hahaha! *Now* I know why he wanted to 'help' us so badly. I'm starting to admire his recklessness.~
END



/* After arriving in Brynnlaw: Husam ponders about Saemon */
CHAIN
IF ~Global("C#Husam2_SaemonBetrayal","GLOBAL",1)~ THEN C#HusamJ saemon_brynnlaw
~I am surprised this Havarian committed treachery, considering who hired him. He must be very sure about himself - or very desperate to avert a threat Bodhi put him into.~
== C#HusamJ IF ~GlobalGT("WorkingForAran","GLOBAL",0)~ THEN ~One could think Aran Linvail chose the captain of the ship badly. But I know better - he chose with care, considering the circumstances.~
== C#HusamJ IF ~Global("B!Alternatives","GLOBAL",10)~ THEN ~Since the Shadow Thieves made inquiries, as well, I know that he wasn't the worst choice available.~
== C#HusamJ ~And yet the sum did not suffice to guarantee us safe passage.~
END
++ ~Are you surprised?~ + saemon_brynnlaw_01
++ ~He's a very shady character - and not an honest man, as it seems.~ + saemon_brynnlaw_04
++ ~He better watch out next time we meet.~ + saemon_brynnlaw_02
++ ~Some people just try to get as much gold as they can.~ + saemon_brynnlaw_04
++ ~Well, he's a real thief, as it seems. Taking gold and lying to get it.~ + saemon_brynnlaw_03
++ ~Whatever, we have things to do.~ + saemon_brynnlaw_05


APPEND C#HusamJ

IF ~~ THEN saemon_brynnlaw_01
SAY ~I *am* surprised he doesn't dread the punishment of his employers more.~
IF ~~ THEN + saemon_brynnlaw_04
END

IF ~~ THEN saemon_brynnlaw_02
SAY ~Oh, yes.~
IF ~~ THEN + saemon_brynnlaw_04
END

IF ~~ THEN saemon_brynnlaw_03
SAY ~(smiles) The way you say it, it sounds like an insult.~
IF ~~ THEN + saemon_brynnlaw_04
END

IF ~~ THEN saemon_brynnlaw_04
SAY ~He's not a true thief - not a thief who wants to get along in a city like Athkatla, at least. You do not trick your employer, not after collecting the fee for a safe passage. Not with this employer, I would think.~
= ~There is two possibilities for a man to behave this way. Either he is part of a very large organisation he can rely on for backup - or he is working alone, and completely so. No others to care and watch out for - nothing stopping him from weasling out of any situation he comes into. Seeing he is with Bodhi, it seems he is playing the first card? We will see.~
IF ~~ THEN + saemon_brynnlaw_05
END

IF ~~ THEN saemon_brynnlaw_05
SAY ~Next time this fool will step into our path, I will have my blade ready.~
++ ~Leave him to me.~ + saemon_brynnlaw_06
++ ~Husam, you will not kill him - not without my consent.~ + saemon_brynnlaw_06
++ ~Feel free to use it.~ + saemon_brynnlaw_06
++ ~Ah, don't bother. He's not worth it.~ + saemon_brynnlaw_06
END

END //APPEND

CHAIN
IF ~~ THEN C#HusamJ saemon_brynnlaw_06
~I won't act without your order, <CHARNAME>. Sometimes even a liar can be of use. But his life is forfeit - one way or the other.~ DO ~SetGlobal("C#Husam2_SaemonBetrayal","GLOBAL",2)~
== C#HusamJ IF ~GlobalGT("WorkingForAran","GLOBAL",0)~ THEN ~We'll do the fool a favor, though. As soon as Linvail gets word about his treason, his death will be certain - and slow, and painful.~ 
EXIT





/* Brynnlaw: Husam could "organise" the amulett... (obwohl er hier natürlich keine Leute hat?)
Chremy 	1.100
	Tag der Abrechnung - Medaillon der Kurtisanen-Gilde, mit dem man sich als Angestellter in das Bordell einschleichen kann. */



/* Chapter 6: Husam advises to ask Shadow Thieves for help against Bodhi */

CHAIN
IF ~Global("C#Husam2_AskLinvailCh6","GLOBAL",1)~ THEN C#HusamJ against_bodhi
~We need every help we can get against Bodhi, <CHARNAME>. The Shadow Thieves have a great interest in killing her. Linvail didn't send you after her out of mere pleasure. The question is, whether he will be willing to send rogues to fight alongside you now.~ 
DO ~SetGlobal("C#Husam2_AskLinvailCh6","GLOBAL",2)~ 
= ~Make sure to ask Linvail for the Shadow Thieves' support. I'll make sure he'll have an open ear to your request.~

/* Chapter 6: low rep - Husam warns before going to Linvail */
== C#HusamJ IF ~ReputationLT(Player1,7)
OR(2)
	Global("PlayerThiefGuild","GLOBAL",0)
	Global("PGFailed","GLOBAL",1)~ THEN ~One advice, <CHARNAME>, before you seek the help of the Shadow Thieves. As surprising as it might sound, but we do like our allies to be well respected by commoners and city authorities alike. Your presence currently resembles that of a force of terror. As much as we respect that, Linvail will not  - could not - risk sending our rogues into a fight alongside you if he has to suspect that you do not care for their lives.~
== C#HusamJ IF ~ReputationLT(Player1,7)
OR(2)
	Global("PlayerThiefGuild","GLOBAL",0)
	Global("PGFailed","GLOBAL",1)~ THEN ~Also, there could be many voices inside the currently weakened guild stating doubts about supporting someone so openly in clash with city authorities as you are - and we can't risk drawing even more attention to us currently. Let us go into a temple and... soften the situation a bit, before asking Linvail for support in the fight against Bodhi.~ 
EXIT

/* change Aran's dialogue - he will always help the PC in his fight against Bodhi */

INTERJECT ARAN 100 C#Husam2_AranWillHelp
== ARAN IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)~ THEN ~(sigh) We heard a lot about you, in fact. So much that I will ignore your attitude - and also my better judgement of the situation. You can thank Husam for that, <CHARNAME>.~
END
IF ~~ THEN + 88

INTERJECT ARAN 102 C#Husam2_AranWillHelp
== ARAN IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)~ THEN ~(sigh) At least that is what I would like to tell you. But there is an important voice who vouched for you. So I will ignore your attitude - and also my better judgement of the situation. You can thank Husam for that, <CHARNAME>.~
END
IF ~~ THEN + 88

INTERJECT ARAN 103 C#Husam2_AranWillHelp
== ARAN IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)~ THEN ~I should call my rogues and rid myself of your presence at once, considering how you dare talk to me. (sigh) And yet, there is an important voice who vouched for you. So I will ignore your attitude - and also my better judgement of the situation. You can thank Husam for that, <CHARNAME>.~
END
IF ~~ THEN + 88

INTERJECT ARAN 105 C#Husam2_AranWillHelp
== ARAN IF ~InMyArea("C#Husam1")
	OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)~ THEN ~I should call my rogues and rid myself of your presence at once, considering how you dare talk to me. (sigh) And yet, there is an important voice who vouched for you. So I will ignore your attitude - and also my better judgement of the situation. You can thank Husam for that, <CHARNAME>.~
END
IF ~~ THEN + 88

I_C_T ARAN 88 C#Husam2_AranSendsHusam
== ARAN IF ~!InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",0) !Dead("C#Husam1") GlobalGT("C#HusamSpawn","GLOBAL",12)~ THEN ~Husam will be there as well, of course.~
END




/*

/* tree of life */

~Yes, I will come down with you, <CHARNAME>. I told you I want revenge, and that is still true. Irenicus is down there, so that is where I'll go, too.~








Reaktion auf intoxicated:
[HUSAM04] ~I... I think I had too much to drink! (hickup)~

/* crossmod: Husam - Xan BGII */

X: ~We are all doomed.~
H: ~No, Xan, only you - if I get the impression that your state of mind might pose a threat to the safety in this group.~





*/