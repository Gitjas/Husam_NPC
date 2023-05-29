
I_C_T C#HUSAM1 %brage_int% C#BESoD_Husam_Int1
== c#bragej IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @8 /* ~[Brage]I do not need to warn you about how powerful and shady this organisation is, <CHARNAME>.~ */
END

I_C_T C#HusamJ %brage_int2% C#BE_SoDHusamweak_poison_10
== c#bragej IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @9 /* ~[Brage]Still, the hero of Baldur's Gate incapacitated would lead to shaken morale in the Baldur Gate forces. It's a main theme and used often...~ */
== c#husamj IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @10 /* ~[Husam]True, but it would be much effort to just cause a little drop in morale when it would be much easier to weaken them significantly by killing.~ */
END

/* @126 ~[Tilda]What?! You are... you are so mean! You can't do that... (sob)~ */
I_C_T c#besq0a %c#besq0a_126% C#HU_c#besq0a_126
== C#HusamJ IF ~InParty("C#Husam1")
See("C#Husam1")
!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @0 /* [Husam]As little as I'd care about the child's emotional state, the boost in people's perception of you that saving a child can cause will be utterly spoiled if you threaten or frighten her in the process. */
END

/* @99 ~Why are you still here? Go away!~ */
I_C_T c#besq0a %c#besq0a_99% C#HU_c#besq0a_99
== C#HusamJ IF ~InParty("C#Husam1")
See("C#Husam1")
!StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @1 /* [Husam]As tedious as this seems, there is nothing that gets you the hearts of the masses like saving children who are lost. Getting her safely to her uncle will be a counterbalance to the fearful rumors circulating about you, so I can only encourage you to take the time to do so. */
END

CHAIN
IF WEIGHT #-1 
~%IT_IS_SOD%
CombatCounter(0) !See([ENEMY]) 
InParty("C#Brage")
InParty("C#Husam1")
!StateCheck("C#Husam1",CD_STATE_NOTVALID)
!StateCheck("C#Brage",CD_STATE_NOTVALID)
See("C#Brage") See(Player1)
Global("C#HusamBrage","GLOBAL",0)~ THEN C#HusamB husam_brage_1
@2 /* [Husam]I heard the tale of Commander Brage of the Nashkel Guard with his cursed sword back in Athkatla, Brage. It seems you fell victim to a rather desparate plan to weaken the Nashkel authorities. */
DO ~SetGlobal("C#HusamBrage","GLOBAL",1)~
== C#BrageB @3 /* [Brage]"Tale"? I was fooled into killing my own family and several others, Shadow Thief! Don't you dare call this a tale. Not you, with your organization of thieves behind you who make such deals for gold and power profit. But I am not surprised you look at what happened to me and call it a "plan". */
== C#HusamB @4 /* [Husam]I understand your anger, and I don't mind you letting it out on me verbally. But if you are surprised that you as the commander of the Nashkel forces were a target from an organization who apparently operated cross-country wide, I must accuse you of naivety. You were in the way of a powerful organization who didn't stop at killing people and replacing them with doppelgangers to get their way. */
== C#BrageB @5 /* [Brage]I'm not "surprised"! I mourn the tragedy and the loss of everything I loved and lived for! Don't you dare talk to me about this as if it was a faceless tale. */
== C#HusamB @6 /* [Husam]I did not raise the topic to rub salt into your wound, Brage, although I understand that I did. I called the scheme against you desparate, because the outcome was rather unpredictable. Let me add the following in an attempt to let you profit from my experience in these matters: be assured that, had this plan failed, you and your family, your soldiers would most probably have been direct targets for further attacks. You were up against a powerful organization with almost endless ressources. To put it plainy - you didn't have a chance, Brage. You, far away from Amn's central authorities, a commander under pressure of having to protect his village and men in chaotic times, didn't stand a chance against Sarevok's scheme and the Iron Throne. Don't make the mistake to think you could have prevented anything that happened. */
== C#BrageB @7 /* [Brage]To think that I would be comforted by a Shadow Thief - and yet, your words sound reasonable and have a logic that, albeit sending shivers down my spine, also seems to take some of the pressure off my chest. But no - just as I swore to myself not to lose myself into "what ifs" about how it could have been prevented, I will not take comfort in thoughts about how it could have been *worse*. We are done talking about this, Husam. Do not raise the topic with me again. */
EXIT