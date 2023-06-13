/* Thieves Guild in Coalition Camp */
/* GlobalLT("bd_sdd305_den_of_thieves","global",4) */
/* BDSTONEH 49 questgiver */

/*
Global("bd_sdd305_den_of_thieves","global",0) - Before receiving quest from Stonehand
Global("bd_sdd305_den_of_thieves","global",1) - After receiving quest from Stonehand

Quest variable:
Global("C#Husam_SoDCampThievesGuild","GLOBAL",0) - Husam never talked about Thieves Guild - before or after quest was given by Stonehand.
Global("C#Husam_SoDCampThievesGuild","GLOBAL",1) - trigger variable
Global("C#Husam_SoDCampThievesGuild","GLOBAL",2) - Husam talked about but was told to stay hidden - before quest was received by Stonehand.
Global("C#Husam_SoDCampThievesGuild","GLOBAL",3) - trigger variable
Global("C#Husam_SoDCampThievesGuild","GLOBAL",4) - PC agreed that Husam reveals himself to Waizahb. In Husam's fist dialogue - before oder after receiving quest from Stonehand.
Global("C#Husam_SoDCampThievesGuild","GLOBAL",5) - trigger variable
Global("C#Husam_SoDCampThievesGuild","GLOBAL",6) - Husam was again told to stay hidden after quest was received by Stonehand.
Global("C#Husam_SoDCampThievesGuild","GLOBAL",7) - Husam's minions will solve the quest without the PC. Guild will be shut down. 
Global("C#Husam_SoDCampThievesGuild","GLOBAL",8) - PC agreed that Husam reveals himself to Waizahb but they never approached her. Status after receiving the quest from Stonehand, independent on whether PC and Husam talked about it before receiving quest.
Global("C#Husam_SoDCampThievesGuild","GLOBAL",9) - Husam talked to Waizahb and revealed himself.
Global("C#Husam_SoDCampThievesGuild","GLOBAL",10) - trigger variable
Global("C#Husam_SoDCampThievesGuild","GLOBAL",11) - PC theatened to kill Rhynwis. husam did not reveal who he is.


Global("C#Husam_SoDCampThievesGuild","GLOBAL",12) - Husam gave Rhynwis advice but didn't reveal himself

Global("C#Husam_SoDCampThievesGuild","GLOBAL",13) - husam talked to Rhynwis, revealing the Shadow Thieves. quest was not given by Stonehand. Also sets "SetGlobal("bd_sdd305_treasure_rocks","GLOBAL",1)
SetGlobal("bd_sdd305_rhynwis_aiding","global",1)
SetGlobal("bd_sdd305_den_of_thieves","global",4)".
Global("C#Husam_SoDCampThievesGuild","GLOBAL",14) - (from "13") set via bd3000.bcs to prevent reply option with Stonehand because quest was not given (also sets 
SetGlobal("bd_sdd305_den_of_thieves","global",5 -> 6)
Global("C#Husam_SoDCampThievesGuild","GLOBAL",15) - husam talked to Rhynwis, revealing the Shadow Thieves. Quest was given by Stonehand. Also sets "SetGlobal("bd_sdd305_treasure_rocks","GLOBAL",1)
SetGlobal("bd_sdd305_rhynwis_aiding","global",1)
SetGlobal("bd_sdd305_den_of_thieves","global",4)".
Global("C#Husam_SoDCampThievesGuild","GLOBAL",16) - PC told Husam to deal with the Thieves Guild without talking to Waizahb: told PC it's done. Also sets "SetGlobal("bd_sdd305_treasure_rocks","GLOBAL",1)
SetGlobal("bd_sdd305_rhynwis_aiding","global",1)
SetGlobal("bd_sdd305_den_of_thieves","global",4)".

Global("C#Husam_SoDCampThievesGuild","GLOBAL",17) - (from "15") set via bd3000.bcs to prevent Waizahb to scold the PC if they had nothing to do with it (also sets 
SetGlobal("bd_sdd305_den_of_thieves","global",5 -> 6)

Global("C#Husam_SoDCampThievesGuild","GLOBAL",18) - (from "16") set via bd3000.bcs to prevent Waizahb to scold the PC if they had nothing to do with it (also sets 
SetGlobal("bd_sdd305_den_of_thieves","global",5 -> 6)
*/

/* fix the "Den of Thieves" quest, at least a little */

/* PC is paladin - spawn Rhynwis since the journal entry says she will be there */
ADD_TRANS_ACTION BDWAIZAH BEGIN 3 END BEGIN 0 END ~SaveLocation("LOCALS","bd_default_loc",[2337.300])
SetGlobal("bd_retreat","locals",1)
CreateCreature("bdrhynwi",[2246.246],SW)~

/* deactivate reply option in BDSTONEH.dlg which would reset the whole quest if talked to again */
ADD_TRANS_TRIGGER BDSTONEH 21 ~Global("bd_sdd305_den_of_thieves","global",0)~ DO 0

/* remove mod added journal entries when PC reported to Stonehand */
ADD_TRANS_ACTION BDSTONEH BEGIN 63 END BEGIN END ~EraseJournalEntry(@100002)
EraseJournalEntry(@100003)
EraseJournalEntry(@100007)~


/* aaand remove the game journal entries because that's not covered? */
ADD_TRANS_ACTION BDRHYNWI BEGIN 0 END BEGIN END ~EraseJournalEntry(%eet_2%61531) EraseJournalEntry(%eet_2%61532)~
ADD_TRANS_ACTION BDSTONEH BEGIN 63 END BEGIN END ~EraseJournalEntry(%eet_2%61530) EraseJournalEntry(%eet_2%61537)~


/* quest path one: Husam approaches the guild leader without PC having heard about it from Stonehand
triggers when near Waizahb */

APPEND c#husamj

IF ~Global("C#Husam_SoDCampThievesGuild","GLOBAL",1)
Global("bd_sdd305_den_of_thieves","global",0)~ THEN thievesguild_contact
SAY @1 /* [Husam]Ah, I am aware of this merchant, <CHARNAME>. She is the contact for the camp's newly formed Thieves' Guild. */
++ @2 /* Thieves' Guild! Why am I not surprised. */ + thievesguild_contact_02
++ @3 /* What of it? */ + thievesguild_contact_02
++ @4 /* I want nothing to do with this, Husam. */ + thievesguild_contact_01
END

IF ~~ THEN thievesguild_contact_01
SAY @5 /* [Husam]I understand. Still, please let me explain the background to this. */
IF ~~ THEN + thievesguild_contact_03
END

IF ~~ THEN thievesguild_contact_02
SAY @6 /* [Husam]The Shadow Thieves want me to make ourselves known to them. Make them aware - and very well so - that the Shadow Thieves have their eyes and ears in this camp. */
IF ~~ THEN + thievesguild_contact_03
END

IF ~~ THEN thievesguild_contact_03
SAY @7 /* [Husam]It's known that the Shadow Thieves are a very... political guild. To know what is going on and where, and to know whom to bribe and whom to look out for is what ensures our influence in the city and the land. This is not common for all thieves' guilds. Most are much less political, like the thieves' guild in Baldur's Gate. The reason we had connections to them and I found shelter there is because *we* approached *them*. */
= @8 /* [Husam]My guild wants to know what kind of guild is forming here. Whether it just focusses on what thieves usually do - to know where is good loot, steal it, and sell it quickly - sometimes in the reverse order, depending on whether it's a buyer or a *client*. Or - whether it tries to gain political influence up to the point where the outcome of the upcoming war could be shifted. */
IF ~~ THEN + thievesguild_contact_03_b
END

/* from here on it is mixed dialogue path: first time with / first time without getting quest from Stonehand */
IF ~~ THEN thievesguild_contact_03_b
SAY @9 /* [Husam]An emissary of the Shadow Thieves will pay them a visit, or let me say pay them our respects. They better not object to our presence - as we do not to *theirs*. To be precise, they should make very sure to be on good terms and not trod on my guild's toes, because in the long run, the Shadow Thieves are more ressourceful, and they better know it. */
+ ~Global("C#HUSoD_CapmTG_1","LOCALS",0)~ + @10 /* Wait - "gain political influence" up to the point where it influences the outcome of the war with Caelar? Is this what the Shadow Thieves are doing, Husam? */ DO ~SetGlobal("C#HUSoD_CapmTG_1","LOCALS",1)~ + thievesguild_contact_14
++ @11 /* The Shadow Thieves would have interest in a bunch of thieves fencing war treasures? */ + thievesguild_contact_15
++ @12 /* You will be this representative in this case? */ + thievesguild_contact_04
++ @13 /* And this representative has to be you? */ + thievesguild_contact_04
+ ~Global("bd_sdd305_den_of_thieves","global",0)~ + @14 /* What am I supposed to do? */ + thievesguild_contact_05
+ ~Global("bd_sdd305_den_of_thieves","global",1)~ + @15 /* Well, General Stonehand expects me to deal with this. What would you suggest? */ + thievesguild_contact_16
+ ~Global("bd_sdd305_den_of_thieves","global",0)~ + @4 /* I want nothing to do with this, Husam. */ + thievesguild_contact_09
+ ~Global("bd_sdd305_den_of_thieves","global",1)~ + @16 /* I know Stonehand put me up to this, but could you just deal with this guild on my stead, please? */ + after_quest_06
+ ~Global("C#Husam_BDSTONEH_51","GLOBAL",1)~ + @17 /* You are assuming I intend to "deal" with this guild. It was your idea as far as I recall - and Stonehands. So - you deal with it, but without revealing our connections. */ + after_quest_06
END

IF ~~ THEN thievesguild_contact_04
SAY @18 /* [Husam]Not necessarily. */
IF ~~ THEN + thievesguild_contact_16
IF ~Global("bd_sdd305_den_of_thieves","global",0)~ THEN + thievesguild_contact_06
END

IF ~~ THEN thievesguild_contact_05
SAY @19 /* [Husam]That is up to you. */
IF ~~ THEN + thievesguild_contact_06
END

END //APPEND

CHAIN
IF ~~ THEN c#husamj thievesguild_contact_06
@20 /* [Husam]If it will be me making contact, I would have you stand next to me when I'll talk to them. We combined forces, so anything I do I will do it so that you know what might be coming. Unless you kick me out now, any repercussions my actions will have might also come for you, so we will do it in a way that you know what might be coming. */
== c#husamj IF ~Class(Player1,PALADIN) !Kit(Player1,BLACKGUARD)~ THEN @21 /* [Husam]Don't worry, we Shadow Thieves have worked with a lot more influencial *righteous* people than a hero metal suit like you. Your presence will be noted, but not disturb the operation. */ 
== c#husamj IF ~OR(2) !Class(Player1,PALADIN) Kit(Player1,BLACKGUARD)
OR(5)
	Class(Player2,PALADIN) 
	Class(Player3,PALADIN) 
	Class(Player4,PALADIN) 
	Class(Player5,PALADIN) 
	Class(Player6,PALADIN) 
!Kit(Player2,BLACKGUARD) 
!Kit(Player3,BLACKGUARD) 
!Kit(Player4,BLACKGUARD) 
!Kit(Player5,BLACKGUARD) 
!Kit(Player6,BLACKGUARD)~ THEN @22 /* [Husam]Don't worry, we Shadow Thieves have worked with a lot more influencial *righteous* people than a hero metal suit like our comrade here. Their presence will be noted, but not disturb the operation. */ 
END
+ ~Class(Player1,PALADIN) !Kit(Player1,BLACKGUARD)~ + @23 /* There is no way I could be involved with the Shadow Thieves, Husam. I am barely tolerating your presence because I prefer to have you near to be able to monitor your actions. */ + thievesguild_contact_13
+ ~Global("C#HUSoD_CapmTG_2","LOCALS",0)~ + @24 /* Repercussions? What are we talking about here? */ DO ~SetGlobal("C#HUSoD_CapmTG_2","LOCALS",1)~ + thievesguild_contact_07
++ @25 /* And if I say no? */ + thievesguild_contact_08
++ @26 /* I'm in. Lead the way. */ + thievesguild_contact_12
++ @27 /* I feel responsible for this camp, so I want to know what is going on and will use your presence to get inside knowledge about this Thieves' Guild, whatever the consequences. */ + thievesguild_contact_12
+ ~Global("bd_sdd305_den_of_thieves","global",1)~ + @28 /* You will not reveal yourself to them. Give them tips if you want when I talk to them, but they will not learn who you are. */ + after_quest_04
+ ~Global("bd_sdd305_den_of_thieves","global",0)~ + @4 /* I want nothing to do with this, Husam. */ + thievesguild_contact_09
+ ~Global("bd_sdd305_den_of_thieves","global",1)~ + @4 /* I want nothing to do with this, Husam. */ + after_quest_06

CHAIN
IF ~~ THEN c#husamj thievesguild_contact_07
@29 /* [Husam]Just a theoretical possibility. You never know how a young guild will react. */
== c#husamj IF ~GlobalGT("bd_plot","global",309)~ THEN @30 /* [Husam]They might want to fight our influence off, silly as it sounds. Not here in the camp, of course, they are not *daft*. But the wilderness around us is fierce and you heard Torsin De Lancie - there will be no rescue party. I *hope* they are smart enough not to fiddle with the Shadow Thieves - but Amn is a long way from here, and they might not be aware that we Shadow Thieves are good in recognizing and finding people, especially the ones that annoyed us. */
== c#husamj IF ~GlobalLT("bd_plot","global",310)~ THEN @31 /* [Husam]They might want to fight our influence off, silly as it sounds. Not here in the camp, of course, they are not *daft*. But the wilderness around us is fierce. I *hope* they are smart enough not to fiddle with the Shadow Thieves - but Amn is a long way from here, and they might not be aware that we Shadow Thieves are good in recognizing and finding people, especially the ones that annoyed us. */
== c#husamj @32 /* [Husam]But they might just think that here, they have higher impact by higher numbers and try a silly fight for the influence in this camp. Plus, everyone knows the final battle after which this camp will be closed is coming soon, which usually makes greedy people quite reckless. I do not expect you to participate in such a fight - but I fear that it will just *happen* that you are there when something like this will go down - if they know who I am. */
= @33 /* [Husam]Plus - there might be someone trying to make riches out of the knowledge about the hero of Baldur's Gate "working with" the Shadow Thieves. I do not expect either of these possibilities to happen - but greed and desparation make people do wonderous things, and some people have no sense about which of their actions *will* result in damage to their health. */ 
END
++ @34 /* I don't care. I've faught worse and was accused of worse, some thieves will not shock me. */ + thievesguild_contact_08
++ @35 /* Well, I guess we are in this together, so lead us whereever we need to go so you can "talk" to these people. */ + thievesguild_contact_08
++ @26 /* I'm in. Lead the way. */ + thievesguild_contact_12
++ @27 /* I feel responsible for this camp, so I want to know what is going on and will use your presence to get inside knowledge about this Thieves' Guild, whatever the consequences. */ + thievesguild_contact_12
+ ~Global("bd_sdd305_den_of_thieves","global",0)~ + @36 /* It's not my business but since we are working together, I am curious to see how this will develop. This will probably be the only time I can witness something like this from the inside. */ + thievesguild_contact_12
+ ~Global("bd_sdd305_den_of_thieves","global",1)~ + @28 /* You will not reveal yourself to them. Give them tips if you want when I talk to them, but they will not learn who you are. */ + after_quest_04
+ ~Global("bd_sdd305_den_of_thieves","global",0)~ + @37 /* This is your business, not mine. I'll fight if they'll attack me, but other than that, this is nothing I wish to be part of. */ + thievesguild_contact_09
+ ~Global("bd_sdd305_den_of_thieves","global",1)~ + @16 /* I know Stonehand put me up to this, but could you just deal with this guild on my stead, please? */ + after_quest_06


CHAIN
IF ~~ THEN c#husamj  thievesguild_contact_08
@38 /* [Husam]You do not have to agree to me being the one approaching them, <CHARNAME>. I would like to do it, as I have some experience with these kind of... *diplomatic* endeavors. But by no means does it have to be me - and you, for that matter. */
== c#husamj IF ~Global("bd_sdd305_den_of_thieves","global",1)~ THEN @39 /* [Husam]Just be aware that if I do not take over here - and I am referring to the actions taken by the Shadow Thieves, not yours - then this will mean the guild will have to shut down. It didn't work out so far, so I will not take any more chances without my direct surveillance. */
END
+ ~Global("C#HUSoD_CapmTG_2","LOCALS",0)~ + @24 /* Repercussions? What are we talking about here? */ DO ~SetGlobal("C#HUSoD_CapmTG_2","LOCALS",1)~ + thievesguild_contact_07
++ @26 /* I'm in. Lead the way. */ + thievesguild_contact_12
++ @27 /* I feel responsible for this camp, so I want to know what is going on and will use your presence to get inside knowledge about this Thieves' Guild, whatever the consequences. */ + thievesguild_contact_12
+ ~Global("bd_sdd305_den_of_thieves","global",0)~ + @36 /* It's not my business but since we are working together, I am curious to see how this will develop. This will probably be the only time I can witness something like this from the inside. */ + thievesguild_contact_12
+ ~Global("bd_sdd305_den_of_thieves","global",1)~ + @28 /* You will not reveal yourself to them. Give them tips if you want when I talk to them, but they will not learn who you are. */ + after_quest_04
+ ~Global("bd_sdd305_den_of_thieves","global",0)~ + @4 /* I want nothing to do with this, Husam. */ + thievesguild_contact_09
+ ~Global("bd_sdd305_den_of_thieves","global",1)~ + @16 /* I know Stonehand put me up to this, but could you just deal with this guild on my stead, please? */ + after_quest_06

APPEND c#husamj 

IF ~~ THEN thievesguild_contact_09
SAY @40 /* [Husam]Very well, then I will stay out of it as well and not reveal myself - for now. They will get a visit from another delegate of the Shadow Thieves then. */
++ @41 /* There are more Shadow Thieves disguised inside this camp? */ + thievesguild_contact_10
++ @42 /* That's settled, then. */ + thievesguild_contact_11
END

IF ~~ THEN thievesguild_contact_10
SAY @43 /* [Husam](smiles) Of course. Why the surprise? It is still true when I told you that we lacked insiders on the Baldur's Gate fraction. */
IF ~~ THEN + thievesguild_contact_11
END

IF ~~ THEN thievesguild_contact_11
SAY @44 /* [Husam]I'm not sure this affair is settled, to be honest... I have a gut feeling about wanting to see this through for myself - but I yield to your wishes and will not get involved directly without your knowledge. You can trust me on that. */
IF ~~ THEN DO ~SetGlobal("C#Husam_SoDCampThievesGuild","GLOBAL",2)~ UNSOLVED_JOURNAL @100003 EXIT
END

IF ~~ THEN thievesguild_contact_12
SAY @45 /* [Husam]Wonderful. I have a gut feeling that this is a good choice - for the camp as well as this 'Thieves Guild'. Now, let us see what we've got, then. Just lead the way over to Waizahb and let me do the talking. */
IF ~~ THEN DO ~EraseJournalEntry(@100003)
SetGlobal("C#Husam_SoDCampThievesGuild","GLOBAL",8)~ UNSOLVED_JOURNAL @100004 EXIT
IF ~Global("bd_sdd305_den_of_thieves","global",0)~ THEN DO ~SetGlobal("C#Husam_SoDCampThievesGuild","GLOBAL",4)~ UNSOLVED_JOURNAL @100005 EXIT
END

IF ~~ THEN thievesguild_contact_13
SAY @46 /* [Husam]I am aware. That is why I am asking you openly. It also applies to this, too - let me deal with this Thieves Guild and you will know first hand what is going on. */
+ ~Global("bd_sdd305_den_of_thieves","global",0)~ + @47 /* I can't go with you here - it is madness to even suggest this! */ + thievesguild_contact_09
+ ~Global("bd_sdd305_den_of_thieves","global",1)~ + @47 /* I can't go with you here - it is madness to even suggest this! */ + thievesguild_contact_08
++ @48 /* Hmmm - you have a point there. Go on. */ + thievesguild_contact_08
+ ~Global("bd_sdd305_den_of_thieves","global",1)~ + @28 /* You will not reveal yourself to them. Give them tips if you want when I talk to them, but they will not learn who you are. */ + after_quest_04
+ ~Global("bd_sdd305_den_of_thieves","global",0)~ + @4 /* I want nothing to do with this, Husam. */ + thievesguild_contact_09
+ ~Global("C#Husam_BDSTONEH_51","GLOBAL",1)~ + @17 /* You are assuming I intend to "deal" with this guild. It was your idea as far as I recall - and Stonehands. So - you deal with it, but without revealing our connections. */ + after_quest_06
+ ~Global("bd_sdd305_den_of_thieves","global",1)~ + @4 /* I want nothing to do with this, Husam. */ + after_quest_06
END

IF ~~ THEN thievesguild_contact_14
SAY @0 /* Why - but yes, <CHARNAME>, as does any other greater organisation - or do you seriously believe that the Order of the Radiant Heart, the Zentharim, the Harper, the Red Mages of Thay are *not* monitoring and meddling in affairs so the outcome would be to their preference? */ /* @0 /* Why - but yes, <CHARNAME>, as does any other greater organisation - or do you seriously believe that the Order of the Radiant Heart, the Zentharim, the Harper, the Red Mages of Thay are *not* monitoring and meddling in affairs so the outcome would be to their preference? */ */
= @49 /* [Husam]What I do assure you, though, is that the Shadow Thieves do not try to *influence* in a way that it would do harm to more people than what is already happening - we want the situation to resolve and the lands to stabilize as soon as possible. This might seem as a good opportunity to make fortunes, but we always look at the bigger picture, and seeing the lands destabilized as they are currently is more threatening to my guild than we could ever profit from the chaos. */
++ @11 /* The Shadow Thieves would have interest in a bunch of thieves fencing war treasures? */ + thievesguild_contact_15
++ @12 /* You will be this representative in this case? */ + thievesguild_contact_04
++ @13 /* And this representative has to be you? */ + thievesguild_contact_04
+ ~Global("bd_sdd305_den_of_thieves","global",0)~ + @14 /* What am I supposed to do? */ + thievesguild_contact_05
+ ~Global("bd_sdd305_den_of_thieves","global",1)~ + @15 /* Well, General Stonehand expects me to deal with this. What would you suggest? */ + thievesguild_contact_16
+ ~Global("bd_sdd305_den_of_thieves","global",0)~ + @4 /* I want nothing to do with this, Husam. */ + thievesguild_contact_09
+ ~Global("bd_sdd305_den_of_thieves","global",1)~ + @16 /* I know Stonehand put me up to this, but could you just deal with this guild on my stead, please? */ + after_quest_06
+ ~Global("C#Husam_BDSTONEH_51","GLOBAL",1)~ + @17 /* You are assuming I intend to "deal" with this guild. It was your idea as far as I recall - and Stonehands. So - you deal with it, but without revealing our connections. */ + after_quest_06
END

IF ~~ THEN thievesguild_contact_15
SAY @50 /* [Husam]The Shadow Thieves monitor the ongoings because this is a war camp where the next years if not decades of the Sword Coast will be decided, <CHARNAME>. I already outlined why the Shadow Thieves would do that. If it means that we need to keep some thieves in check who fence war goods, then that's what we will do. Plus - if this 'guild' besmuches the names of all thieves guilds' by it's amateurish doings, then this would be reason enough to step in. */
+ ~Global("C#HUSoD_CapmTG_1","LOCALS",0)~ + @10 /* Wait - "gain political influence" up to the point where it influences the outcome of the war with Caelar? Is this what the Shadow Thieves are doing, Husam? */ DO ~SetGlobal("C#HUSoD_CapmTG_1","LOCALS",1)~ + thievesguild_contact_14
++ @12 /* You will be this representative in this case? */ + thievesguild_contact_04
++ @13 /* And this representative has to be you? */ + thievesguild_contact_04
+ ~Global("bd_sdd305_den_of_thieves","global",0)~ + @14 /* What am I supposed to do? */ + thievesguild_contact_05
+ ~Global("bd_sdd305_den_of_thieves","global",1)~ + @15 /* Well, General Stonehand expects me to deal with this. What would you suggest? */ + thievesguild_contact_16
+ ~Global("bd_sdd305_den_of_thieves","global",0)~ + @4 /* I want nothing to do with this, Husam. */ + thievesguild_contact_09
+ ~Global("bd_sdd305_den_of_thieves","global",1)~ + @16 /* I know Stonehand put me up to this, but could you just deal with this guild on my stead, please? */ + after_quest_06
+ ~Global("C#Husam_BDSTONEH_51","GLOBAL",1)~ + @17 /* You are assuming I intend to "deal" with this guild. It was your idea as far as I recall - and Stonehands. So - you deal with it, but without revealing our connections. */ + after_quest_06
END

IF ~~ THEN thievesguild_contact_16
SAY @51 /* [Husam]We have several possibilities here. You could talk to them yourself as the General requested, but I will be very direct, <CHARNAME>. I am nervous whether the guild will listen to you in the first place. They might suspect you, the hero, were sent by the authorities - which is never a good start for negociations, not in this context. */
= @52 /* [Husam]If you agree, then this leaves two other possibilities. You leave the dealings with this foolish guild to the Shadow Thieves and I tell my men to shut it down - without revealing us to them. As I said I have an idea how to turn this around, but I need to deal with the guild's leader myself to see whether she is capable of bringing my advice to fruition. */
= @53 /* [Husam]Which leaves us with the third option: I will approach them as a representative of the Shadow Thieves and see to the guild thrive without causing distortions in the commanders' tents. */
IF ~~ THEN + thievesguild_contact_06
END

END //APPEND


/* second quest path: Will get quest from Stonehand as in original 
1. PC didn't let Husam talk to the Thieves Guild. 
2. Player talked to Stonehand before approaching Waizahb. */


EXTEND_BOTTOM BDSTONEH 49
+ ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
  See("C#Husam1") 
  !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ + @54 /* Indeed! I was even told that there might be *Shadow Thieves* from Athkatla around! */ EXTERN c#husamj husam_stoneh_49
END

CHAIN
IF ~~ THEN c#husamj husam_stoneh_49
@55 /* [Husam]Well, now that would be a very alarming thought indeed, considering the Shadow Thieves are a very big, influential, and most powerful guild who do not like being exposed, <CHARNAME> - hmmm? */
== BDSTONEH @56 /* [General Stonehand]Hmph, I know we can't prevent what happens outside of our range of sight, but what we *can* do is put an end to what we are aware of. */
END
IF ~~ THEN EXTERN BDSTONEH 50

I_C_T BDSTONEH 50 C#Husam_BDSTONEH_50
== c#husamj IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
  See("C#Husam1") 
  !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @57 /* [Husam]Tch! How repellent having to *hear* about this. */
END

I_C_T BDSAFANJ 234 C#Husam_BDSAFANJ_234
== c#husamj IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
  See("C#Husam1") 
  !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @58 /* [Husam]Not an uncommon practice - for ruffians and brigands. This is not a guild that deserves this name. */
END

INTERJECT BDSTONEH 51 C#Husam_BDSTONEH_51
== c#husamj IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
  See("C#Husam1") 
  !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @59 /* [Husam]Well, we'll overhear the 'black-hearted villain', for now, and say that we will definitely do something about the vermin, general. */
END
+ ~GlobalLT("C#Husam_SoDCampThievesGuild","GLOBAL",4)~ + @60 /* ...We will? */ EXTERN c#husamj husam_stoneh_51
++ @61 /* Yes, this sounds like a good idea. */ EXTERN c#husamj husam_stoneh_51
++ @62 /* Are you deciding this now? */ EXTERN c#husamj husam_stoneh_51

CHAIN
IF ~~ THEN c#husamj husam_stoneh_51
@63 /* [Husam]Definitely. We can discuss the details in a minute, <CHARNAME> - if you don't want to take this on, I'll do it my way. This "Thieves Guild" forming in this camp needs a... strong hand indeed. */
== BDSTONEH @64 /* [General Stonehand]Excellent. */
END
COPY_TRANS BDSTONEH 51

/*
PC got quest: Global("bd_sdd305_den_of_thieves","global",1)

 */

APPEND c#husamj

/* Husam wanted to talk to Waizahb and PC agreed, but they never did it */
/* Global("C#Husam_SoDCampThievesGuild","GLOBAL",5) */

IF ~Global("C#Husam_SoDCampThievesGuild","GLOBAL",5)~ THEN waited_toolong
SAY @65 /* [Husam]Ah, we daudled too long - I let get myself distracted and now the 'guild' did the greatest mistake an inexperienced guild could make - raise the suspicions of the camp authorities. */
= @66 /* [Husam]It is not too late yet - noone died, at least not by the guild members' hands. I know exactly what the guild would need to change to remain but get off Stonehand's hook. I could delegate this, but I need to talk to the guild's leader myself to see whether they are capable of bringing my advice to fruition. */
= @67 /* [Husam]Let us talk to that Waizahb soon, <CHARNAME>, before more commanders send their mercenaries and this gets out of hand. */
IF ~~ THEN DO ~SetGlobal("C#Husam_SoDCampThievesGuild","GLOBAL",8)~ EXIT
END

/* Husam talked about it before but stepped down when PC wanted him to */
IF ~Global("C#Husam_SoDCampThievesGuild","GLOBAL",3)~ THEN stopped_before
SAY @68 /* [Husam]Ah, my gut feeling was right. It would have been advantageous had I stepped in from the start. But I left the decision to you, and I will not complain. */
IF ~~ THEN + after_quest_01
END

/* Husam didn't talk about it before (group didn't get near Waizahb yet so quest unrelated dialogue didn't trigger) */
IF ~Global("C#Husam_SoDCampThievesGuild","GLOBAL",1)
Global("bd_sdd305_den_of_thieves","global",1)~ THEN first_after_quest
SAY @69 /* [Husam]Ah, I wish I've had time to react to this sooner, but I only learned about this 'guild' recently myself. */
= @70 /* [Husam]My guild wants to know what kind of guild is forming here. Well, seems we already know they just focus on what thieves usually do - and not try to gain political influence, especially not up to the point where the outcome of the upcoming war could be shifted. */
IF ~~ THEN + after_quest_01
END

IF ~~ THEN after_quest_01
SAY @71 /* [Husam]The 'guild' did the greatest mistake an inexperienced guild could make - raise the suspicions of the camp authorities. It is not too late yet - noone died, at least not by the guild members' hands. I know exactly what the guild would need to change to remain but get off Stonehand's hook. */
IF ~~ THEN + thievesguild_contact_03_b
IF ~Global("C#Husam_SoDCampThievesGuild","GLOBAL",3)~ THEN + after_quest_02
END

IF ~~ THEN after_quest_02
SAY @72 /* [Husam]I could delegate this, but I need to talk to the guild's leader myself to see whether she is capable of bringing my advice to fruition. */
= @73 /* [Husam]Would you allow me to reveal myself as a Shadow Thief emissary to them now, <CHARNAME>? */
++ @74 /* Why would I have changed my mind? I didn't. */ + after_quest_03
+ ~Global("C#Husam_BDSTONEH_51","GLOBAL",1)~ + @17 /* You are assuming I intend to "deal" with this guild. It was your idea as far as I recall - and Stonehands. So - you deal with it, but without revealing our connections. */ + after_quest_06
++ @75 /* Would this be necessary? You could give your tips without revealing who you are. */ + after_quest_07
++ @76 /* Someone else could give them those tips instead of you. */ + after_quest_05
++ @77 /* Fine, then do it. */ + thievesguild_contact_12
END

IF ~~ THEN after_quest_03
SAY @78 /* [Husam]Because you can't keep yourself out of this matter any more. */
IF ~~ THEN + after_quest_07
END 

IF ~~ THEN after_quest_04
SAY @79 /* [Husam]Fine. I will yield to your wish. Be aware that this means that I *will* not make use of my authority, no matter how spectacular the guild might shut you out. */
IF ~~ THEN DO ~SetGlobal("C#Husam_SoDCampThievesGuild","GLOBAL",6)~ EXIT
END

IF ~~ THEN after_quest_05
SAY @72 /* [Husam]I could delegate this, but I need to talk to the guild's leader myself to see whether she is capable of bringing my advice to fruition. */
IF ~~ THEN + after_quest_07
END

IF ~~ THEN after_quest_06
SAY @80 /* [Husam]I see. I will tell my folks that they have to take on the guild. You don't need to do anything, <CHARNAME>, that thieves guild will no longer raise the authorities' suspicions. I will take over from here - without revealing myself, of course, as you requested. Best you wait until you tell General Stonehand until I have intel about how it worked out. I will let you know. */ 
IF ~~ THEN DO ~SetGlobal("C#Husam_SoDCampThievesGuild","GLOBAL",7)
SetGlobal("bd_sdd305_den_of_thieves","global",3)
SetGlobalTimer("C#HU_SoDCampTGTimer","GLOBAL",ONE_DAY)~ UNSOLVED_JOURNAL @100006 EXIT
END

IF ~~ THEN after_quest_07
SAY @81 /* [Husam]I am nervous whether the guild will listen to you in the first place. They might suspect that you, the hero, were sent by the authorities - which is never a good start for negociations, not in this context. */
+ ~Global("C#Husam_BDSTONEH_51","GLOBAL",1)~ + @82 /* You are assuming I intend to "deal" with this guild. It was your idea as far as I recall - and Stonehand's. So - you deal with it, but without revealing our connections. */ + after_quest_06
++ @83 /* You will not reveal yourself to them. Give them tips if you want when I talk to them, but they will not know who you are. */ + after_quest_04
++ @84 /* I guess you have a point there. Revealing who you are will give us the best standing in this, I guess. */ + thievesguild_contact_12
END

/* PC left dealings of thieve guild to husam - follow up after one day */

IF ~Global("C#Husam_SoDCampThievesGuild","GLOBAL",10)~ THEN guild_done
SAY @85 /* [Husam]<CHARNAME>, just to let you know - the thieves guild has been dealt with. They bailed as soon as they were approached by us, but they did value our advice. They promised to help in the final fight - on your side, I might add. */
= @86 /* [Husam]And they left us with their loot - under some fallen rocks, in the forest near that underground cavern. Supposedly, the rocks are directly east of the cave entrance where all the crusaders are camped out. We left it for you to collect, if you want. */
++ @87 /* (smirk) What - you left them alive? */ + guild_done_01
++ @88 /* Wait - they stopped the guild, left us their loot, *and* promised to support our fight? That's... quite much. */ + guild_done_03
++ @89 /* What did you do to them to achieve all this? */ + guild_done_02
++ @90 /* So that's settled. Thanks, Husam. */ + guild_done_06
END

IF ~~ THEN guild_done_01
SAY @91 /* [Husam](smiles) Indeed we did. */
++ @88 /* Wait - they stopped the guild, left us their loot, *and* promised to support our fight? That's... quite much. */ + guild_done_03
++ @89 /* What did you do to them to achieve all this? */ + guild_done_02
++ @90 /* So that's settled. Thanks, Husam. */ + guild_done_06
END

IF ~~ THEN guild_done_02
SAY @92 /* [Husam]Nothing, really. */
IF ~~ THEN + guild_done_03
END

IF ~~ THEN guild_done_03
SAY @93 /* [Husam]Telling them that the hero of Baldur's Gate was set on their trail because of their amateurish recklessness was enough to give them cold feet and feelings of professional gratefulness for being warned in time. */
++ @94 /* You what? You used me as scarecrow to make them leave?! */ + guild_done_04
++ @95 /* Did you have to tell them that? I thought I'd stay out of this! */ + guild_done_05
++ @96 /* Hahaha! Well done. */ + guild_done_04
END

IF ~~ THEN guild_done_04
SAY @97 /* [Husam]Well, telling them that the Shadow Thieves are not pleased did some of the trick as well. But when my men came to telling them this warning, they were already stepping down after hearing about you. */
IF ~~ THEN + guild_done_06
END

IF ~~ THEN guild_done_05
SAY @98 /* [Husam]You were given the request by General Stonehand. Don't think there is noone who knows this. This news will travel whether you want it or not, so we went the easy way and used the consistent story to make them aware of the danger they were in. */
IF ~~ THEN + guild_done_04
END

IF ~~ THEN guild_done_06
SAY @99 /* [Husam]You can let General Stonehand know that it is all settled. They will not bother any of the soldiers again. */
IF ~~ THEN DO ~EraseJournalEntry(@100006)
SetGlobal("C#Husam_SoDCampThievesGuild","GLOBAL",16)
SetGlobal("bd_sdd305_treasure_rocks","GLOBAL",1)
SetGlobal("bd_sdd305_rhynwis_aiding","global",1)
SetGlobal("bd_sdd305_den_of_thieves","global",4)~ UNSOLVED_JOURNAL @100007 
EXIT
END

END //APPEND


/* Husam talks to Waizahb in case PC agreed that husam revealed himself - before or after getting quest from Stonehand */

CHAIN
IF WEIGHT #-1
~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
See("C#Husam1") 
!StateCheck("C#Husam1",CD_STATE_NOTVALID)
OR(2)
	Global("C#Husam_SoDCampThievesGuild","GLOBAL",4)
	Global("C#Husam_SoDCampThievesGuild","GLOBAL",8)~ THEN BDWAIZAH husam_approach
#%eet_2%51119 /* ~Greetings, my <PRO_LADYLORD>. In the market for a new weapon? Or perhaps a potion? ~ */
DO ~SetGlobal("C#Husam_SoDCampThievesGuild","GLOBAL",9)~
== c#husamj @100 /* [Husam]More for saying "hello". You recognize these insignia? Yes, I see you do. No reason to get nervous. Just tell whoever you are answering to that we would like to meet. */
== BDWAIZAH #%eet_2%48802 /* ~I should be able to set something up. Come to the camp's northern edge. I'll have someone there to meet with you.~ */
== c#husamj @101 /* [Husam]Hmm. I hope you aren't playing cocky. Making the Shadow Thieves' wait and seek your leader out? Does your guild think they have the power to play games like these? */ 
== BDWAIZAH @102 /* [Waizahb]This... this is not a game. Rhynwis is away I don't know where, I need to send for her first. And I thought you'd prefer to have her wait for you - and not have her approach you unexpectedly. */
== c#husamj @103 /* [Husam]Smart thinking. I like it. I think we have a rendevous, <CHARNAME>. */
END
IF ~~ THEN DO ~EraseJournalEntry(@100004)
EraseJournalEntry(@100005)
CreateCreature("bdrhynwi",[2246.246],SW)~ UNSOLVED_JOURNAL @100025 EXIT


/* talking to Rhynwis - Husam revealed himself as Shadow Thief */
CHAIN
IF WEIGHT #-1
~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
See("C#Husam1") 
!StateCheck("C#Husam1",CD_STATE_NOTVALID)
Global("C#Husam_SoDCampThievesGuild","GLOBAL",9)~ THEN BDRHYNWI husam_meeting
@104 /* [Rhynwis]Hey there. My name is Rhynwis, and I was told who you represent. We are... honored to be contacted by the Shadow Thieves. Welcome to our little camp guild. */

/* PC did not get quest */
== c#husamj IF ~Global("bd_sdd305_den_of_thieves","global",0)~ THEN @105 /* [Husam]Rhynwis, my men told me a little about how you do business. Do you know what the worst mistake is a thieves guild can make? */
== BDRHYNWI IF ~Global("bd_sdd305_den_of_thieves","global",0)~ THEN @106 /* [Rhynwis]To cross the Shadow Thieves, I guess? */
== c#husamj IF ~Global("bd_sdd305_den_of_thieves","global",0)~ THEN @107 /* [Husam]Hahaha! Well spoken, but that was not it. The greatest mistake, Rhynwis, is raising attention of one's activities in the commanders' tents. Your guild is about to get there. You fence the goods of the fallen soldiers, putting geat effort into... convincing the soldiers to collect them at the battle fields. */
= @108 /* [Husam]Do you know what commanders don't like? Seeing their soldiers in distress. You crossed a line and upset quite a few soldiers with your *queries*. It is a mere matter of time some captain will come and take a closer look, or decide you should be estinguished altogether. I am here to prevent that. Are you ready to listen? */

/* PC did receive quest */
== c#husamj IF ~Global("bd_sdd305_den_of_thieves","global",1)~ THEN @109 /* [Husam]Rhynwis, do you know why we are here? We are here because <CHARAME>, the hero of Baldur's Gate, just got the task of annihilating your guild. Do you have an idea why? My men told me a little about how you do business. Do you know what the worst mistake is a thieves guild can make? */
== BDRHYNWI IF ~Global("bd_sdd305_den_of_thieves","global",1)~ THEN @110 /* [Rhynwis]...Doing something that makes the Shadow Thieves intervene, I guess. */
== c#husamj IF ~Global("bd_sdd305_den_of_thieves","global",1)~ THEN @111 /* [Husam]Hahaha! Well spoken, and quite true, although not what I was aiming at. The greatest mistake, Rhynwis, is raising attention of one's activities in the commanders' tents - and I am afraid that is what has happened. You fence the goods of the fallen soldiers, putting great effort into... convincing the soldiers to collect them at the battle fields. */
= @112 /* [Husam]Commanders don't like seeing their soldiers in distress. You crossed a line and upset quite a few soldiers with your *queries*. It was a mere matter of time until a captain would come and take a closer look, or decide you should be estinguished altogether, as it now happened. I am here to prevent that. Are you ready to listen? */

/* all quest paths */
== BDRHYNWI #%eet_2%48833 /* ~When Waizahb told me the hero of Baldur's Gate wanted to meet, I knew our days were numbered. I don't want a massacre, so I'll tell you what—we'll rein in our activities from now on.~ */

/* PC did not get quest */
== c#husamj IF ~Global("bd_sdd305_den_of_thieves","global",0)~ THEN @113 /* [Husam]Oh, but you don't have to. Hear me out, will you? But one thing has to be perfectly clear: <CHARNAME> standing right next to me is a mere coincidence and has nothing to do with you or the Shadow Thieves, you understand? */

/* PC did receive quest */
== c#husamj IF ~Global("bd_sdd305_den_of_thieves","global",1)~ THEN @114 /* [Husam]Oh, but you don't have to. Hear me out, will you? But one thing has to be perfectly clear: <CHARNAME> standing right next to me is because <PRO_HESHE> was given the task to deal with you from General Stonehand and has nothing to do with the Shadow Thieves, you understand? */

/* all quest paths */
== BDRHYNWI @115 /* [Rhynwis]Crystal clear. */
== c#husamj @116 /* [Husam]Fine. Then listen carefully. */
END
++ @117 /* Go on, I'm interested in hearing this, too. */ EXTERN c#husamj husam_meeting_01
++ @118 /* Husam, could you do this so I don't have to sit through it all? */ EXTERN c#husamj husam_meeting_02

CHAIN
IF ~~ THEN c#husamj husam_meeting_01
@119 /* [Husam]You are taking from the dead - pressuring the living to help you with it. You make people *part* with things, and act against their morale. This is destined to fail, Rhynwis, as it is destined to get the knights and other righteous hounds on your trail. You have to do it the other way around. You want the soldier's gold? Make them give it to you - while they are alive. */
== BDRHYNWI @120 /* [Rhynwis]I am sure you do not suggest we should bully the living soldiers now to give us *their* valuables, instead of asking them to bring the fallen ones', considering the course this conversation took so far. */
== c#husamj @121 /* [Husam]Not at all, Rhynwis, indeed. I was talking about offering them something they *want* to have - and to give their gold for. I am talking about smuggling, Rhynwis. Make their wishes come true! We are at a war camp. Everyone here misses something from the comfort of their homes. In case you are worried about supply chains, I can arrange help - for an appropriate share for the Shadow Thieves' efforts. */
== c#husamj @122 /* [Husam]If you fill a gap to satisafy soldiers' needs, any high command with at least a little bit of common sense will turn a bling eye - as long as it does not diminish soldiers' morale and resoluteness to fight. */
END
IF ~~ THEN + husam_meeting_03
IF ~Global("C#Husam_SoDCampThievesGuild","GLOBAL",6)~ THEN EXTERN c#husamj husam_meeting_04

APPEND c#husamj 
IF ~~ THEN husam_meeting_02
SAY @123 /* [Husam]Of course. */
IF ~~ THEN + husam_meeting_03
END
END //APPEND

CHAIN
IF ~~ THEN c#husamj husam_meeting_03
@124 /* [Husam]Rhynwis, now that I've seen you and know who you are I am sure you will make this work. Await one of my men to give you further instructions. Oh - and I expect you show a bit of gratitude towards my friend here.  */
== BDRHYNWI #%eet_2%48839 /* ~And I thought I was cutthroat. Fine, our loot is hidden in under some fallen rocks, in the forest near that underground cavern. The rocks are directly east of the cave entrance where all the crusaders are camped out.~ */
= @125 /* [Rhynwis]Also, I'll have my people come to the coalition's side when the battle breaks to prove our gratitude for your protection. Good enough? */
== c#husamj @126 /* It is a good start, Rhynwis. I look foreward to making business with you. */
END
IF ~~ THEN DO ~EraseJournalEntry(@100005)
EraseJournalEntry(@100025)
EraseJournalEntry(%eet_2%61531) EraseJournalEntry(%eet_2%61532)
SetGlobal("bd_sdd305_treasure_rocks","GLOBAL",1)
SetGlobal("C#Husam_SoDCampThievesGuild","GLOBAL",13)
AddJournalEntry(@100001,QUEST_DONE)~ EXTERN BDRHYNWI 5
IF ~Global("bd_sdd305_den_of_thieves","global",1)~ THEN DO ~EraseJournalEntry(@100004)
EraseJournalEntry(@100025)
EraseJournalEntry(%eet_2%61531) EraseJournalEntry(%eet_2%61532)
SetGlobal("bd_sdd305_treasure_rocks","GLOBAL",1)
SetGlobal("C#Husam_SoDCampThievesGuild","GLOBAL",15)
AddJournalEntry(@100002,QUEST)~ EXTERN BDRHYNWI 5


/* PC got quest and forbid Husam to reveal his Shadow Thieves' connections */

/* track whether PC threatened Rhynwis */
ADD_TRANS_ACTION BDRHYNWI BEGIN 9 END BEGIN END ~SetGlobal("C#Husam_SoDCampThievesGuild","GLOBAL",11)~

EXTEND_BOTTOM BDRHYNWI 1
+ ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
  See("C#Husam1") 
  !StateCheck("C#Husam1",CD_STATE_NOTVALID)
Global("C#Husam_SoDCampThievesGuild","GLOBAL",6)~ + @127 /* I was assigned by General Stonehand to bring an end to your guild. My friend Husam here has an idea how we can come to an agreement that is advantageous for both of us. */ + 6
END

EXTEND_BOTTOM BDRHYNWI 6
+ ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
  See("C#Husam1") 
  !StateCheck("C#Husam1",CD_STATE_NOTVALID)
Global("C#Husam_SoDCampThievesGuild","GLOBAL",6)~ + @128 /* Just hear my friend out how we could turn this into a fruitful event for all of us. Husam? */ EXTERN c#husamj husam_meeting_01
END

I_C_T BDRHYNWI 6 c#HU_BDRHYNWI_6
== c#husamj IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
  See("C#Husam1") 
  !StateCheck("C#Husam1",CD_STATE_NOTVALID)
Global("C#Husam_SoDCampThievesGuild","GLOBAL",6)~ THEN @129 /* [Husam]And we all know that you would never make use of them, because killing the hero of Baldur's Gate on an investigation against your guild will put every righteous hound on your trail immediately. */
END

APPEND c#husamj 
IF ~~ THEN husam_meeting_04
SAY @130 /* [Husam]Do you have anything to add, <CHARNAME>? */
  IF ~~ THEN REPLY #%eet_2%48836 /* ~You'd better use those thieves to our benefit. I'm the hero of Baldur's Gate, and you know I could have your operation and you executed in a heartbeat. No more thieving, and when the time for war comes, I'd better see you on the front lines.~ */ DO ~SetGlobal("C#Husam_SoDCampThievesGuild","GLOBAL",12)~ EXTERN BDRHYNWI 8
 ++ @131 /* No, I think this sounds great. Never forget it was my mercy that let you go on with this, so show a little support. */ DO ~SetGlobal("C#Husam_SoDCampThievesGuild","GLOBAL",12)~ EXTERN BDRHYNWI 8
  IF ~~ THEN REPLY #%eet_2%48838 /* ~I'll kill every one of your minions, but not until I kill you!~ */ EXTERN BDRHYNWI 9 
END

/* PC threatened Rhynwis to kill her- follow up 
Global("C#Husam_SoDCampThievesGuild","GLOBAL",11) */

IF ~Global("C#Husam_SoDCampTGFollowUp","LOCALS",1)
Global("C#Husam_SoDCampThievesGuild","GLOBAL",11)~ THEN threatened_hynwis
SAY @132 /* [Husam]<CHARNAME>, had I known that you'd just go and bully the thieves guild out of the camp I could have saved a lot of effort. Well - the guild is gone now, one way or the other. */
IF ~~ THEN + thievesguild_followup_02
END

/* Follow up dialogue after dealing with Rhynwis - all quest paths */

/* guild got Husam'd advice and is striving */
IF ~Global("C#Husam_SoDCampTGFollowUp","LOCALS",1)
OR(3)
Global("C#Husam_SoDCampThievesGuild","GLOBAL",12)
Global("C#Husam_SoDCampThievesGuild","GLOBAL",14)
Global("C#Husam_SoDCampThievesGuild","GLOBAL",17)~ THEN thievesguild_followup
SAY @133 /* [Husam]I am glad we got to Rhynwis in time - and that she was open to our suggestions. */
IF ~~ THEN + thievesguild_followup_02
END

/* guild was ended */
IF ~Global("C#Husam_SoDCampTGFollowUp","LOCALS",1)
OR(2)
Global("C#Husam_SoDCampThievesGuild","GLOBAL",6)
Global("C#Husam_SoDCampThievesGuild","GLOBAL",18)~ THEN thievesguild_followup_01
SAY @134 /* [Husam]It's no surprise - and no real pity - Rhynwis' thieves guild was annihilated. */
IF ~~ THEN + thievesguild_followup_02
END

IF ~~ THEN thievesguild_followup_02
SAY @135 /* [Husam]This "guild" was a disgrace to its name. It is clear that this formed without the influence or control of a higher hirarchy - someone who would keep an eye on the *political* survival of the guild as well as the profits. Such a guild - I'd rather call it "organisation", though - could only form in a situation like this, where tension is high, nerves are low, and everyone knows it's just a temporary thing anyway. */
= @136 /* [Husam]People tend to get more reckless if they know it's a time limited possibility, and a mix of different parties like we have here with the different army forces is perfect to make use of the confusion and lack of bundled authority. It being a war camp does the rest to remove morale and decorum. These - *amateurs* are driven by greed, for gold as well as power. A "guild" organized like this is doomed to fail because it rises too much opposition - well, here we are, aren't we. */
++ @137 /* Are you saying the Shadow Thieves would never take valuables from fallen soldiers? I have doubts this would be true. Gold and gems are gold and gems, no? */ + thievesguild_followup_03
++ @138 /* Wait - so you didn't disagree with what they did, it was just that their means were lacking? */ + thievesguild_followup_04
++ @139 /* Not everyone would see it that way. Sometimes it's enough to make profit while it lasts. */ + thievesguild_followup_11 
++ @140 /* I'm not really into discussing the pros and cons of successful leadership of a thieves guild, Husam. */ + thievesguild_followup_12
++ @141 /* I don't want to talk about this. */ + thievesguild_followup_15
END

IF ~~ THEN thievesguild_followup_03
SAY @142 /* [Husam]No, I am saying that the Shadow Thieves - or any real thieves guild that deserves that name - have means to get to the valuables of the fallen soldiers other than openly bullying the living ones for it. */
++ @143 /* By secretly bullying them? */ + thievesguild_followup_04
++ @144 /* Such as? */ + thievesguild_followup_05
++ @141 /* I don't want to talk about this. */ + thievesguild_followup_15
END

IF ~~ THEN thievesguild_followup_04
SAY @145 /* [Husam](smiles) You are good at hearing between the lines. */
IF ~~ THEN + thievesguild_followup_05
END

IF ~~ THEN thievesguild_followup_05
SAY @146 /* [Husam]Direct bullying is - well, for brutes. What is needed to make it work without causing ripples of opposition is what I would call "subtle" bullying. For something like this to work you need appropriate political support from the relevant authorities. Make the leaders bully their soldiers themselves. */
IF ~~ THEN + thievesguild_followup_06
END

IF ~~ THEN thievesguild_followup_06
SAY @147 /* [Husam]Doing anything without securing your standing is short-sighted at least, and a disgrace for any guild. You don't need to train as a thief if all you want to do is bullying people into giving you their gold and values. */ 
++ @148 /* You also do not need to train as a rogue if all you then do is politics and persuasion. */ + thievesguild_followup_07
++ @149 /* So you're basically saying that the Shadow Thieves would infiltrate the whole hirarchy to do their business in peace. */ + thievesguild_followup_08
++ @150 /* This is really important to you, isn't it? */ + thievesguild_followup_10
++ @141 /* I don't want to talk about this. */ + thievesguild_followup_15
END

IF ~~ THEN thievesguild_followup_07
SAY @151 /* [Husam]Good point. But it helps a lot in this métier, believe me. */ 
IF ~~ THEN + thievesguild_followup_09
END

IF ~~ THEN thievesguild_followup_08
SAY @152 /* [Husam]That - or win the authorities over with blackmail or promises. It often suffices to have the second or third highest level of command in your hands - high enough to have decision power, but low enough not to be in public monitoring all the time, which simplifies things for us. */
IF ~~ THEN + thievesguild_followup_09
END

IF ~~ THEN thievesguild_followup_09
SAY @153 /* [Husam]I know that it's an uncongenial topic for many, but the Shadow Thieves are an important political influence and important to stabilize the powers in the cities and lands we are active in. We are keeping some of what one would call "negative" forces under check, offering security and protection measures to many authorities and nobles - against their foes, I might add. */
++ @154 /* Threats from other cutthroat guilds, you mean? */ + thievesguild_followup_16
++ @155 /* I have the slight suspicion that there are a lot of people who think differently. */ + thievesguild_followup_13
++ @156 /* You really believe you and your guild are doing 'good' - of sorts, don't you? */ + thievesguild_followup_13
++ @157 /* I understand what you are aiming at, Husam. It's always a tricky thing, balancing the powers in a city or land. */ + thievesguild_followup_14
++ @158 /* I'm well aware of that. You don't have to advertise the importance or greatness of the Shadow Thieves with me. */ + thievesguild_followup_13
END

IF ~~ THEN thievesguild_followup_10
SAY @159 /* [Husam]This guild was a thorn in my side, because - as the Thieves Guild it declares to be - it shed a very negative light on thieves guilds in general, and hence onto the Shadow Thieves as well. Anyone suffering under the influence of this "guild" will not understand the Shadow Thieves' real impact - and function. */
IF ~~ THEN + thievesguild_followup_09
END

IF ~~ THEN thievesguild_followup_11
SAY @160 /* [Husam]And my point is that it wouldn't have lasted - not long enough to make any mentionable profit. */
IF ~~ THEN + thievesguild_followup_06
END

IF ~~ THEN thievesguild_followup_12
SAY @161 /* [Husam]Then we do not have to dwell on this. Let me stress something else instead. */
IF ~~ THEN + thievesguild_followup_10
END

IF ~~ THEN thievesguild_followup_13
SAY @162 /* [Husam]We could discuss the details, but I do believe the Shadow Thieves fill an important space in the overall power distribution. Who knows - maybe you'll come to a point where you will profit from our many connections, as well. */
IF ~~ THEN + thievesguild_followup_15
END

IF ~~ THEN thievesguild_followup_14
SAY @163 /* [Husam]It definitely is, yes. */
IF ~~ THEN + thievesguild_followup_13
END

IF ~~ THEN thievesguild_followup_15
SAY @164 /* [Husam]Which leaves me with my last remark to this topic. */
IF ~~ THEN + thievesguild_followup_18
IF ~OR(3)
Global("C#Husam_SoDCampThievesGuild","GLOBAL",6)
Global("C#Husam_SoDCampThievesGuild","GLOBAL",11)
Global("C#Husam_SoDCampThievesGuild","GLOBAL",18)~ THEN + thievesguild_followup_17
END

IF ~~ THEN thievesguild_followup_16
SAY @165 /* [Husam]And who, you think, engaged those 'other cutthroat guild' assassins to do the bidding? Believe me, nobles do not need us to threaten their like-minded. But we are the best in preventing the sneaky attacks that would make the greatest impact were they successful. */
IF ~~ THEN + thievesguild_followup_13
END

/* dialogue ending: guild was detroyed */
IF ~~ THEN thievesguild_followup_17
SAY @166 /* [Husam]You destroyed the guild, <CHARNAME>. This usually leaves a void - this guild formed for a reason. Let's hope the camp will not exist long enough for another group filling this power vacuum and stirring more trouble in the end. */
IF ~~ THEN DO ~SetGlobal("C#Husam_SoDCampTGFollowUp","LOCALS",2)~ EXIT
END

/* dialogue ending: guild was thriving with Husam's interference */
IF ~~ THEN thievesguild_followup_18
SAY @167 /* [Husam]We stabilized the guild and took the attention of the commanders from their activities. This was neatly done, because this guild formed for a reason. It filled a power void which would have otherwise found someone else to occupy it - assuming the camp would have existed long enough. */
IF ~~ THEN DO ~SetGlobal("C#Husam_SoDCampTGFollowUp","LOCALS",2)~ EXIT
END

END //APPEND