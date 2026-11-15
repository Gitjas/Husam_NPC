/* If they met before (BG1 / SoD) */
CHAIN
IF WEIGHT #-1
~!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
CombatCounter(0)
!See([ENEMY])
InParty("C#Ajantis")
See("C#Ajantis")
!StateCheck("C#Ajantis",CD_STATE_NOTVALID)
OR(2)
	Global("HusamMove","GLOBAL",7)
	GlobalGT("C#HusamAjantisSoD","GLOBAL",0)
Global("C#HusamAjantisExtra","GLOBAL",0)~ THEN ~C#HusamB~ HusamAjantis0
~[Husam]Ajantis, why do you dislike working with the Shadow Thieves so much? We worked together quite well already, I would say.~
DO ~SetGlobal("C#HusamAjantisExtra","GLOBAL",1)~
== C#AjanB ~[Ajantis]Do I really have to spell it out for you?! - Our past alliances were something completely different!~
== C#HusamB IF ~GlobalGT("WorkingForAran","GLOBAL",0)~ THEN ~[Husam]Indeed. This time, the Shadow Thieves are a viable option to reach where <CHARNAME> needs to go, and desparetly so - while the last time we worked together was nothing but convenience. Is that what you meant?~
== C#HusamB IF ~Global("WorkingForAran","GLOBAL",0)~ THEN ~[Husam]Indeed. This time, the Shadow Thieves offered a viable option to reach where <CHARNAME> needed to go, and desparetly so - while the last time we worked together was nothing but convenience. Is that what you meant?~
== C#AjanB ~[Ajantis]That's not what I was referring to at all! Our past alliances were on... on a level of information exchange, of preventing diplomatic complications and keeping an eye on your evil organization's doings - not being *dependent* on them like here!~
== C#HusamB ~[Husam]Ah, so joining forces with us evil Shadow Thieves in no problem for a paladin of Helm, as long as it isn't *crucial* for your goals. Did I understand it correctly now?~
== C#AjanB ~[Ajantis]That's not...! You are twisting the words in my mouth!~
== C#HusamB ~[Husam]Do I really? Well, as long as you can allign your actions with your god's dogmas, Ajantis... Let me assure you: I'm not overly happy to be depentent on a paladin from such a powerful order, either. But here I am - beaten and defenseless, and thankful for our alliance. You should consider this a success.~
EXIT


CHAIN
IF WEIGHT #-1
~!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
CombatCounter(0)
!See([ENEMY])
InParty("C#Ajantis")
See("C#Ajantis")
!StateCheck("C#Ajantis",CD_STATE_NOTVALID)
OR(2)
	Global("C#HusamAjantisExtra","GLOBAL",1)
	!Global("HusamMove","GLOBAL",7)
OR(2)
	Global("C#HusamAjantisExtra","GLOBAL",1)
	!GlobalGT("C#HusamAjantisSoD","GLOBAL",0)
Global("C#HusamAjantis","GLOBAL",0)~ THEN ~C#HusamB~ HusamAjantis0
~So, Ajantis. You don't like travelling with me, because I am 'evil'.~
DO ~SetGlobal("C#HusamAjantis","GLOBAL",1)~
== C#AjanB ~That you are! If I only imagine the things you did in the name of your guild I feel my heart ache. I tolerate your presence out of respect for <CHARNAME>'s decision, only.~
== C#HusamB ~That is fine by me. Especially, since I feel the same about you.~
EXIT

//#2
CHAIN
IF WEIGHT #-1
~!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
CombatCounter(0)
!See([ENEMY])
InParty("C#Ajantis")
See("C#Ajantis")
!StateCheck("C#Ajantis",CD_STATE_NOTVALID)
Global("C#HusamAjantis","GLOBAL",1)~ THEN ~C#HusamB~ HusamAjantis1
~So, Ajantis - as a paladin, you do what is good and righteous?~
DO ~SetGlobal("C#HusamAjantis","GLOBAL",2)~
== C#AjanB ~(sigh) I know where this is leading, it is always the same meager attempt of evil people by using an exaggerated, very special example to ensnarl me into contradicting myself.~
== C#HusamB ~Well, it's not that hard to get there. Upholding the laws of an evil landlord isn't necessarily good, so there you have your contradiction.~
== C#AjanB ~If it is an evil landlord, the laws are probably evil. An evil landlord has to be faught, for the sake of righteousness.~
= ~I *know* what you are about to say. When do we know whether we have to obide the laws or fight the people making them? There is a higher order to things, Thief.~
== C#HusamB ~A higher order? You are referring to the gods?~
== C#AjanB ~Yes, Husam. I serve my Lord Helm, and I follow his dogmas, which define what is good and righteous.~
== C#HusamB ~Which are?~
== C#AjanB ~Vigilance for the weak, fulfilling your duty, and upholding the... (pauses) ...law. - Wipe that smile off your face, thief, or I will!~
EXIT

//#3 
CHAIN
IF WEIGHT #-1
~!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
CombatCounter(0)
!See([ENEMY])
InParty("aerie")
!Dead("aerie")
See("aerie")
!StateCheck("aerie",CD_STATE_NOTVALID)
AreaType(DUNGEON) 
Global("C#HusamAjantis","GLOBAL",2)~ THEN ~C#AjanB~ HusamAjantis2
~Husam, you of course would prefer having an evil landlord, with evil laws that allow yourself to berich yourself.~
DO ~SetGlobal("C#HusamAjantis","GLOBAL",3)~
== C#HusamJ ~On the contrary, Ajantis. I, also, do enjoy the stability of a good-reigned land, with a law that gives stable possibilities for all inhabitants to prosper.~
== C#AjanB ~Prosper? So that you have more you can steal!~
== C#HusamJ ~When you put it that way, it sounds unattractively short-sighted. I, also, think it's best if every citizen has a good set of laws they *want* to obey. It keeps the folks calm. I would advice every landlord to rule this way.~
== C#AjanB ~I cannot believe you truly mean this. You and your organization of thieves profit from power struggles and general discontentment. Do not insult my senses!~
== C#HusamJ ~Oh, but I do mean it. I didn't say I would see myself oblidged to obey these laws *myself* now, of course.~
== C#AjanB ~I knew it. Discussing with you is more than fruitless.~
EXIT


