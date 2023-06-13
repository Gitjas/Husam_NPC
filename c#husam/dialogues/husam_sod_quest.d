/*
Global("C#HU_SoD_BrensQuest","GLOBAL",1) - got quest to rearrange evidence from bren
Global("C#HU_SoD_BrensQuest","GLOBAL",2) - set via area script: mark Bren's stash location on map. [Active quest variable as long as evidence can be rearranged]
Global("C#HU_SoD_BrensQuest","GLOBAL",3) - Kharm started the trial.

Global("C#HU_SoD_BrensQuest","GLOBAL",4) - Bren was judged innocent.
Global("C#HU_SoD_BrensQuest","GLOBAL",5) - Bren told Husam that he will try to get closer to Hephernaan&Caelar.
Global("C#HU_SoD_BrensQuest","GLOBAL",6) - Husam tells that he no longer has contact to Bren
Global("C#HU_SoD_BrensQuest","GLOBAL",7) - closing variable

Global("C#HU_SoD_BrensQuest","GLOBAL",8) - Husam killed Bren.

Global("C#HU_SoD_BrensQuest","GLOBAL",9) - Noone was convicted guilty.
Global("C#HU_SoD_BrensQuest","GLOBAL",10) - Husam let Bren live but told him to flee for good.

Global("C#HU_SoD_BrensQuest","GLOBAL",11) - Bren was convicted and fled.
Global("C#HU_SoD_BrensQuest","GLOBAL",12) - camp went hostile and quest broke.
Global("C#HU_SoD_BrensQuest","GLOBAL",13) - Bren was found dead in Dragonspear Castle.
Global("C#HU_SoD_BrensQuest","GLOBAL",14) - Bren was found dead in Dragonspear Castle. - closing variable
Global("C#HU_SoD_BrensQuest","GLOBAL",15) - quest broke - guard was hostile
*/


/* dialogues for Husam's SoD quest */

APPEND c#husamJ

/* bd7100 after arriving and talking with Bence */

IF ~Global("C#Husam_SoDInformantBB","GLOBAL",1)~ THEN informant
SAY @0 /* I have no current information about the status of the siege camp at Bridgefort, <CHARNAME>. */
++ @1 /* What happened? */ + informant_01
++ @2 /* Your informant not so informative currently? */ + informant_01
++ @3 /* No matter. We will see for ourselves. */ + informant_05
END

IF ~~ THEN informant_01
SAY @4 /* My informant did not get in contact with me as he should. */
++ @5 /* Meaning what? */ + informant_03
++ @6 /* We could have a look for him. */ + informant_04
++ @7 /* Thanks for the info. We will see how it plays out. */ + informant_05
++ @8 /* I don't care about your man, Husam. Your man, your problem. */ + informant_05
END

IF ~~ THEN informant_02
SAY @9 /* Even if he would talk about us, there is nothing he could tell them that they wouldn't know or expect already - that <CHARNAME> is coming their way, that <PRO_HESHE> has help from the Shadow Thieves - nothing that would come to a real surprise to them. */
++ @10 /* Do you want us to look for him? */ + informant_04
++ @7 /* Thanks for the info. We will see how it plays out. */ + informant_05
++ @8 /* I don't care about your man, Husam. Your man, your problem. */ + informant_05
END

IF ~~ THEN informant_03
SAY @11 /* He is either dead - or he was exposed, which makes him a dead man. */
++ @12 /* Is there the risk that he talked about us? */ + informant_02
++ @10 /* Do you want us to look for him? */ + informant_04
++ @7 /* Thanks for the info. We will see how it plays out. */ + informant_05
++ @8 /* I don't care about your man, Husam. Your man, your problem. */ + informant_05
END

IF ~~ THEN informant_04
SAY @13 /* I would be thrilled if we would keep our eyes open for him, yes. */
= @14 /* If he revealed himself as the Shadow Thief he is, this man sealed his death - by my hand. */
++ @15 /* That's not what I meant, Husam. We could try and save him. */ + informant_06
++ @12 /* Is there the risk that he talked about us? */ + informant_02
++ @7 /* Thanks for the info. We will see how it plays out. */ + informant_05
++ @8 /* I don't care about your man, Husam. Your man, your problem. */ + informant_05
END

IF ~~ THEN informant_05
SAY @16 /* We will go against the crusader camp at Bridgefort more blindly than I expected. It's an unsatisfying situation, to say the least. */
IF ~~ THEN DO ~SetGlobal("C#Husam_SoDInformantBB","GLOBAL",2)~ UNSOLVED_JOURNAL @100009 EXIT
END

IF ~~ THEN informant_06
SAY @17 /* If this man cracked, then he is a risk, <CHARNAME>. I wish for him that he rather died. */
++ @12 /* Is there the risk that he talked about us? */ + informant_02
++ @7 /* Thanks for the info. We will see how it plays out. */ + informant_05
++ @8 /* I don't care about your man, Husam. Your man, your problem. */ + informant_05
END


/* follow up in bd3000 / before finding Bren's corpse */
IF ~Global("C#HU_SoD_BrensQuest","GLOBAL",6)~ THEN missing_informant
SAY @18 /* I lost contact to Bren, my spy who went after Hephernaan, <CHARNAME>. Again, my man does not report back. */
++ @19 /* I hope he's not in some sort of trouble. */ + missing_informant_01
++ @20 /* Maybe we'll find him in another cell? */ + missing_informant_01
++ @21 /* Do you think he bailed? */ + missing_informant_01
++ @22 /* Tsk, what a useless idiot. */ + missing_informant_02
END

IF ~~ THEN missing_informant_01
SAY @23 /* Well, I do believe that he did not bail nor made a stupid mistake this time. */
IF ~~ THEN + missing_informant_02
END

IF ~~ THEN missing_informant_02
SAY @24 /* Hephernaan is the best guarded warlord's advisor I ever knew. That man makes my well-trained headhunters disappear - and that does not fit with the amateurish approach Caelar is showing. What this means for Bren, I can only fear the worst - for Bren. With regard to us, there is nothing Bren could have spoiled, as he didn't know anything about your progress with the coalition. */
IF ~~ THEN DO ~SetGlobal("C#HU_SoD_BrensQuest","GLOBAL",7)~ EXIT
END
END //APPEND

/* bd2000 prison cages */

/* if PC was put in cages: not before "cages_right" isn't opened / PC freed himself (Bren's cage door will also be open then - the doors are opened at the same time.)
*/
BEGIN c#hubren

IF ~~ THEN husam_and_bren_01
SAY @25 /* [Bren, Shadow Thief]It's fairly simple. Just make sure there is something personal of Dyal inside my secret stash when they investigate it thoroughly. Stove it a bit deeper into the hole so it looks like it was missed before. Maybe you'll find something on him - or you can use his stupid victory cup, he didn't use this yet with the fight going on. You'll find his bedroll open between the tents, he's the only one too lazy to roll it up during the day. */
= @26 /* My stack is between the trees on the east palisade wall, near the tents. They put a guard there until Lieutenant Kharm had the time to investigate it personally. I don't have to tell you to make absolutely sure noone spots you when putting Dyal's stuff into the secret stash. And that, when you rearranged the evidence, you should hurry to talk to Lieutenant Kharm about my pending trial in the hopes that he will take time for it then - before Dyal can extract his stuff again. */ 
IF ~~ THEN EXTERN C#HusamJ bren_and_husam_09
END

IF ~Global("C#HU_SoDBrenGreeting","LOCALS",0)~ THEN first_greeting
SAY @27 /* [Bren, Shadow Thief]Hello! Nice of you to talk to me. You don't have any water by any chance? */
+ ~OR(3) Global("C#HusamJoined","GLOBAL",0) !Detect("C#Husam1") StateCheck("C#Husam1",CD_STATE_NOTVALID)~ + @28 /* Why are you here? */ DO ~SetGlobal("C#HU_SoDBrenGreeting","LOCALS",1)~ + first_greeting_01
+ ~OR(3) Global("C#HusamJoined","GLOBAL",0) !Detect("C#Husam1") StateCheck("C#Husam1",CD_STATE_NOTVALID)~ + @29 /* I'm not talking to prisoners. */ + first_greeting_02
IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) Detect("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN DO ~SetGlobal("C#HU_SoDBrenGreeting","LOCALS",2)~ EXTERN c#husamj bren_and_husam
END

IF ~~ THEN first_greeting_01
SAY @30 /* [Bren, Shadow Thief]Had a little... misunderstanding. It should be sorted soon. */
IF ~~ THEN EXIT
END

IF ~~ THEN first_greeting_02
SAY @31 /* [Bren, Shadow Thief]Alright then. */
IF ~~ THEN EXIT
END

IF ~Global("C#HU_SoDBrenGreeting","LOCALS",1)~ THEN greeting
SAY @32 /* [Bren, Shadow Thief]Hi again! I'm still waiting for them to decide... */
IF ~~ THEN EXIT
IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) Detect("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN DO ~SetGlobal("C#HU_SoDBrenGreeting","LOCALS",2)~ EXTERN c#husamj bren_and_husam
END

IF ~~ THEN dyals_cup
SAY @33 /* [Bren, Shadow Thief]I see you found Dyal's "Victory Cup" (snort). He didn't take this out since the siege on the fort started, at least not that I know - it's his *victory* cup so he only drinks out of it after a victory. That should do the trick - there is enough people about who know who it belongs to. */
IF ~~ THEN + hurry
END

IF ~~ THEN brens_knife
SAY @34 /* [Bren, Shadow Thief]Oh, you found my butter knife. I left it with my things - you found this inside the *stash*? Dyal, you little sneaky bastard - he can play that game, too, as it seems, as it must have been him who placed it in there with the guard around. */
= @35 /* [Bren, Shadow Thief]It's good you removed it, because people definitely know that this was mine, they made enough fun about it. I'd love to have it back, but I guess I couldn't explain how I got it if I'd take it now - they took all my stuff when arresting me, so finding hidden knives on me will not exactly help with refuting the accusation of being a spy rogue. But - well done. Very well done. */
IF ~~ THEN EXIT
END

IF ~~ THEN dyals_letter
SAY @36 /* [Bren, Shadow Thief]Oh yes. This is perfect. */
IF ~~ THEN + hurry
END

IF ~~ THEN hurry
SAY @37 /* [Bren, Shadow Thief]But now hurry to place the evidence! As soon as Dyal'll notice it's gone and tells Kharm - or removes it from the stash again! - we'll be back at where we started. */
IF ~~ THEN EXIT
END

IF ~Global("C#HU_SoDBrenGreeting","LOCALS",4)~ THEN hurry_01
SAY @38 /* [Bren, Shadow Thief]Be quick and talk to Kharm! Dyal will notice his missing stuff eventually. */
IF ~OR(2)
!PartyHasItem("c#husknf") !Global("C#HU_SoDBrenKnife","LOCALS",0)~ THEN DO ~SetGlobal("C#HU_SoDBrenGreeting","LOCALS",4)~ EXIT
+ ~PartyHasItem("c#husknf") Global("C#HU_SoDBrenKnife","LOCALS",0)~ + @39 /* [PC Reply]I found this small knife in your stash. Do you know who it is from? */ DO ~SetGlobal("C#HU_SoDBrenKnife","LOCALS",1) SetGlobal("C#HU_SoDBrenGreeting","LOCALS",4)~ + brens_knife

END

/* c#huslet */
/* c#husmug */
/* c#husknf */
IF ~Global("C#HU_SoDBrenGreeting","LOCALS",2)~ THEN greeting
SAY @40 /* [Bren, Shadow Thief]You are back! */
IF ~~ THEN DO ~SetGlobal("C#HU_SoDBrenGreeting","LOCALS",3)~ + waiting
END

IF ~Global("C#HU_SoD_BrensQuest","GLOBAL",2) Global("C#HU_SoDBrenGreeting","LOCALS",3)~ THEN waiting
SAY @41 /* [Bren, Shadow Thief]How is it going? Did you manage to prepare the evidence? */
+ ~PartyHasItem("c#husmug") Global("C#HU_SoDBrenMug","LOCALS",0)~ + @42 /* I[PC Reply]s this mug really Dyal's? How are the chances he used this not so long ago, making placing it into the stash a bit weird? */ DO ~SetGlobal("C#HU_SoDBrenMug","LOCALS",1)~ + dyals_cup
+ ~PartyHasItem("c#husknf") Global("C#HU_SoDBrenKnife","LOCALS",0)~ + @39 /* [PC Reply]I found this small knife in your stash. Do you know who it is from? */ DO ~SetGlobal("C#HU_SoDBrenKnife","LOCALS",1)~ + brens_knife
+ ~PartyHasItem("c#huslet") Global("C#HU_SoDBrenLetter","LOCALS",0)~ + @43 /* [PC Reply]I found this note on Dyal which states clearly that it's his and rather important. */ DO ~SetGlobal("C#HU_SoDBrenLetter","LOCALS",1)~ + dyals_letter
++ @44 /* [PC Reply]I'm on it. */ + first_greeting_02
+ ~OR(2)
Global("C#HuS_bhs_c#huslet","MYAREA",1) Global("C#HuS_bhs_c#husmug","MYAREA",1)~ + @45 /* [PC Reply]I think I did, yes. */ + hurry_01
++ @46 /* [PC Reply]I'll be on my way. */ EXIT
END

CHAIN
IF ~~ THEN c#husamJ bren_and_husam
@47 /* [Husam]Hello, Bren. <CHARNAME>, this is Bren, the informant I talked about. Bren - why are you in here? And, more importantly - why don't I *know* why you are in here? <CHARNAME> has important business here. We came almost unprepared because of your silence. */
== c#hubren @48 /* [Bren, Shadow Thief]I was called out and couldn't risk my disguise. They do not have any proof against me, Husam - I'll walk out of here a free man. My failure was not considering my trial and time in prison would take so long. I did not fail in my profession - but as your eyes and ears I did. */
== c#husamJ @49 /* [Husam]So, to be able to stay my informant you had to stop being my informant? Does that make any sense to you, Bren? */
== c#hubren @50 /* [Bren, Shadow Thief]Give me a chance to make up for it, Husam. With a little help we could turn this around and make me look like the victim of a wrong accusation as well as someone who revealed a conspiracy inside the camp. My stand inside the crusade would improve significantly! */
== c#husamJ @51 /* [Husam]"We"? You expect us to risk our cover going around and "rearranging" evidence to your favor? I haven't even decided whether I will punish you or not. <CHARNAME>, you are the one who was affected negatively by Bren's outage. Did he fail us? */
END
++ @52 /* You are asking *me*? */ + bren_and_husam_12
+ ~Global("C#HU_SoD_BrenDialogue_1","LOCALS",0)~ + @53 /* You told him my name! Was that necessary? */ DO ~SetGlobal("C#HU_SoD_BrenDialogue_1","LOCALS",1)~ + bren_and_husam_01
+ ~Global("C#HU_SoD_BrenDialogue_2","LOCALS",0)~ + @54 /* What exactly happened, and how can you be sure they will not find you guilty? */ DO ~SetGlobal("C#HU_SoD_BrenDialogue_2","LOCALS",1)~ EXTERN c#hubren bren_and_husam_chain_00
+ ~Global("C#HU_SoD_BrenDialogue_3","LOCALS",0)
GlobalGT("C#HU_SoD_BrenDialogue_2","LOCALS",0)~ + @55 /* Bren, what would we need to do to improve your standing here, exactly? */ DO ~SetGlobal("C#HU_SoD_BrenDialogue_3","LOCALS",1)~ EXTERN c#hubren husam_and_bren_01
+ ~Global("C#HU_SoD_BrenDialogue_4","LOCALS",0)~ + @56 /* What is the punishment if I'd say he failed? */ DO ~SetGlobal("C#HU_SoD_BrenDialogue_4","LOCALS",1)~ + bren_and_husam_02
+ ~Global("C#HU_SoD_BrenDialogue_5","LOCALS",0)~ + @57 /* Do you think your man is a threat to us being here, Husam? */ DO ~SetGlobal("C#HU_SoD_BrenDialogue_5","LOCALS",1)~ + bren_and_husam_10
+ ~Global("C#HU_SoD_BrenDialogue_6","LOCALS",0)
GlobalGT("C#HU_SoD_BrenDialogue_2","LOCALS",0)~ + @58 /* What is your opinion, Husam? */ DO ~SetGlobal("C#HU_SoD_BrenDialogue_6","LOCALS",1)~ + bren_and_husam_07
+ ~Global("C#HU_SoD_BrenDialogue_3","LOCALS",1)~ + @59 /* He might have missed his objective, but we could have use for someone closer to Caelar and her advisor. Let's place evidence like suggested and make Bren a crusader hero. */ EXTERN C#husamj bren_and_husam_chain_03
++ @60 /* I don't think he failed, but we will not risk anything to help a prisoner here. */ + bren_and_husam_chain_02
++ @61 /* He failed, Husam. You were flying blind the last days, that's unacceptible. */ + bren_and_husam_11
++ @62 /* He failed out flat. Why are we discussing this? */ + bren_and_husam_11
++ @63 /* He is your rogue, Husam. Do what you want, I won't meddle with Shadow Thieves' affairs. */ + bren_and_husam_14
++ @64 /* This has nothing to with me. Deal with this on your own, Husam. */ + bren_and_husam_13

CHAIN
IF ~~ THEN c#hubren bren_and_husam_chain_00
@65 /* [Bren, Shadow Thief]Dyal found my secret stash and concluded it's mine. Don't look like that, Husam - he's a pretty good thief himself. It's of no consequence, though, because noone - including Dyal - saw me using it, and even *if* he'd actually caught me at it, he still can't prove it's mine, since I put nothing personal inside. I'm in here because push came to shove since they are a bit over suspicious for traitors. */
END
IF ~~ THEN EXTERN c#husamJ bren_and_husam_09

CHAIN
IF ~~ THEN c#husamJ bren_and_husam_chain_01
@66 /* [Husam]That he could, indeed, if he thinks that his fate is sealed, seeing what a wonderful *scheemer* he turned into. */
== c#hubren @67 /* [Bren, Shadow Thief]I would never, Husam. I knew the moment you spoke to me that you are ready to cut my throat, yet I stayed calm. Let me convince you that we can turn this around! */
END
IF ~~ THEN EXTERN C#HusamJ bren_and_husam_09

CHAIN
IF ~~ THEN c#husamJ bren_and_husam_chain_02
@68 /* [Husam]So your decision is to let it play out? Bren, <CHARNAME> just saved your life today. */
END
IF ~~ THEN SOLVED_JOURNAL @100011 + bren_and_husam_chain_02_b

CHAIN
IF ~~ THEN c#husamJ bren_and_husam_chain_02_b
@69 /* [Husam]But you know what it means. You'll disappear from here on the next occation - and I will never see you again. */
== c#hubren @70 /* [Bren]Yes, I... I understand. Thank you, Husam - and <CHARNAME>. I'll be gone as soon as noone will be watching. */
END
IF ~~ THEN DO ~EraseJournalEntry(@100009) SetGlobal("C#HU_SoD_BrensQuest","GLOBAL",10)~ EXIT

CHAIN
IF ~~ THEN c#husamJ bren_and_husam_chain_03
@71 /* [Husam](sigh) Very well. I will honor <CHARNAME>'s wishes and salut to <PRO_HISHER> decision. */
== c#hubren @72 /* [Bren, Shadow Thief]Thank you - thank you so much! Like I said, Dyal's bed roll should be between the tents, the only one ready to sneak in. And talk to Lieutenant Kharm when you're done putting Dyal's stuff into my stash - this is a crucial step in the process, because once Dyal reports it missing, we'd be back at zero. */
END
IF ~~ THEN DO ~EraseJournalEntry(@100009) SetGlobal("C#HU_SoD_BrensQuest","GLOBAL",1)~ UNSOLVED_JOURNAL @100010 EXIT


APPEND c#husamJ

IF ~~ THEN bren_and_husam_01
SAY @73 /* [Husam]Oh, but Bren already knew your name, <CHARNAME>. My rogues know exactly who you are. */
IF ~~ THEN + bren_and_husam_09
END

IF ~~ THEN bren_and_husam_02
SAY @74 /* [Husam]There is only one way to treat such failure amongst the Shadow Thieves - death. The question is - *did* he fail? */
++ @75 /* You are considering to kill this man but aren't even sure he *did* fail you? */ + bren_and_husam_16
++ @76 /* Well, I guess that was to be expected. */ + bren_and_husam_09
++ @77 /* Clear and easy rules. Nice. */ + bren_and_husam_09
END

IF ~~ THEN bren_and_husam_03
SAY @78 /* [Husam]You want me to say it? Fine. I say he failed, because his task was to keep me informed, be my eyes and ears in this crusader camp - and to *inform me* if he can't perform the task so I can assign someone else. On top of that, he lost his stash - which is called *secret* for a reason. And yet, I bow to being found out by a fellow thief. This Dyal seems to be a very capable rogue, it is a pity he is lost to the crusade or I'd try to recruit him. */
++ @79 /* So you see Bren guilty, yet leaving the final decision to me. */ + bren_and_husam_08
++ @80 /* He's locked up - how do you expect him to inform you from inside a cage? */ + bren_and_husam_04
++ @81 /* How was he supposed to inform you without revealing himself now that he's imprisoned? */ + bren_and_husam_05
++ @82 /* I see. */ + bren_and_husam_09
END

IF ~~ THEN bren_and_husam_04
SAY @83 /* [Husam](scoffs) He is one of my rogues, <CHARNAME>. */
IF ~~ THEN + bren_and_husam_06
END

IF ~~ THEN bren_and_husam_05
SAY @84 /* [Husam]A good rogue knows when to retreat. */
IF ~~ THEN + bren_and_husam_06
END

IF ~~ THEN bren_and_husam_06
SAY @85 /* [Husam]He could free himself from this cell any time. But he didn't, because scheeming and "protecting his disguise" was more important than keeping me informed - which was his *primary objective*. */
IF ~~ THEN + bren_and_husam_09
END

IF ~~ THEN bren_and_husam_07
SAY @86 /* [Husam]Oh, I know what I think. The question is, what you expect me to do. I joined your cause and agreed to be your eyes and ears. I'll leave the decision to you, <CHARNAME>, whether Bren's silence endangered your mission. */
++ @87 /* I asked for your opinion, Husam, so have the decency to answer. */ + bren_and_husam_03
++ @88 /* You don't want to influence my decision. Fine, then I'll make it on my own. */ + bren_and_husam_09
END

IF ~~ THEN bren_and_husam_08
SAY @89 /* [Husam]I meant what I said with regard to our agreement to join forces, <CHARNAME>. If you see further use in this man, I'll accept your decision. If not, I know what I'll do. */
++ @80 /* He's locked up - how do you expect him to inform you from inside a cage? */ + bren_and_husam_04
++ @81 /* How was he supposed to inform you without revealing himself now that he's imprisoned? */ + bren_and_husam_05
++ @82 /* I see. */ + bren_and_husam_09
END

IF ~~ THEN bren_and_husam_09
SAY @90 /* [Husam]How would you decide the matter? */
+ ~Global("C#HU_SoD_BrenDialogue_1","LOCALS",0)~ + @53 /* You told him my name! Was that necessary? */ DO ~SetGlobal("C#HU_SoD_BrenDialogue_1","LOCALS",1)~ + bren_and_husam_01
+ ~Global("C#HU_SoD_BrenDialogue_2","LOCALS",0)~ + @54 /* What exactly happened, and how can you be sure they will not find you guilty? */ DO ~SetGlobal("C#HU_SoD_BrenDialogue_2","LOCALS",1)~ EXTERN c#hubren bren_and_husam_chain_00
+ ~Global("C#HU_SoD_BrenDialogue_3","LOCALS",0)
GlobalGT("C#HU_SoD_BrenDialogue_2","LOCALS",0)~ + @55 /* Bren, what would we need to do to improve your standing here, exactly? */ DO ~SetGlobal("C#HU_SoD_BrenDialogue_3","LOCALS",1)~ EXTERN c#hubren husam_and_bren_01
+ ~Global("C#HU_SoD_BrenDialogue_4","LOCALS",0)~ + @56 /* What is the punishment if I'd say he failed? */ DO ~SetGlobal("C#HU_SoD_BrenDialogue_4","LOCALS",1)~ + bren_and_husam_02
+ ~Global("C#HU_SoD_BrenDialogue_5","LOCALS",0)~ + @57 /* Do you think your man is a threat to us being here, Husam? */ DO ~SetGlobal("C#HU_SoD_BrenDialogue_5","LOCALS",1)~ + bren_and_husam_10
+ ~Global("C#HU_SoD_BrenDialogue_6","LOCALS",0)
GlobalGT("C#HU_SoD_BrenDialogue_2","LOCALS",0)~ + @58 /* What is your opinion, Husam? */ DO ~SetGlobal("C#HU_SoD_BrenDialogue_6","LOCALS",1)~ + bren_and_husam_07
+ ~Global("C#HU_SoD_BrenDialogue_3","LOCALS",1)~ + @59 /* He might have missed his objective, but we could have use for someone closer to Caelar and her advisor. Let's place evidence like suggested and make Bren a crusader hero. */ EXTERN C#husamj bren_and_husam_chain_03
++ @60 /* I don't think he failed, but we will not risk anything to help a prisoner here. */ + bren_and_husam_chain_02
++ @61 /* He failed, Husam. You were flying blind the last days, that's unacceptible. */ + bren_and_husam_11
++ @62 /* He failed out flat. Why are we discussing this? */ + bren_and_husam_11
++ @63 /* He is your rogue, Husam. Do what you want, I won't meddle with Shadow Thieves' affairs. */ + bren_and_husam_14
++ @64 /* This has nothing to with me. Deal with this on your own, Husam. */ + bren_and_husam_13
END

IF ~~ THEN bren_and_husam_10
SAY @91 /* [Husam]No, he is not a threat. If he is guilty, even turning the whole camp against us will not save him from the Shadow Thieves' wrath, and he knows that very well, don't you, Bren? */
++ @92 /* But he could stirr a distraction and use it to flee. */ + bren_and_husam_chain_01
++ @93 /* If you say so then I'll trust he won't stirr the camp. */ + bren_and_husam_09
END

IF ~~ THEN bren_and_husam_11
SAY @94 /* [Husam]I agree with you, <CHARNAME>. */
IF ~~ THEN + bren_and_husam_15
END

IF ~~ THEN bren_and_husam_12
SAY @95 /* [Husam]Yes, to honor our alliance I am ready to follow your decision with regard to this rogue's punishment. */
IF ~~ THEN + bren_and_husam_09
END

IF ~~ THEN bren_and_husam_13
SAY @96 /* [Husam]Simple enough. */
IF ~~ THEN + bren_and_husam_15
END

IF ~~ THEN bren_and_husam_14
SAY @97 /* [Husam]Thank you for honoring my guild's laws in this, <CHARNAME>. */
IF ~~ THEN + bren_and_husam_15
END

IF ~~ THEN bren_and_husam_15
SAY @98 /* [Husam]And you know what this means, Bren. */
IF ~~ THEN DO ~SetInterrupt(FALSE) EraseJournalEntry(@100009)
SetGlobal("C#HU_SoD_BrensQuest","GLOBAL",8) ClearAllActions() StartCutSceneMode() StartCutScene("c#husqc2")~ SOLVED_JOURNAL @100012 EXIT
END

IF ~~ THEN bren_and_husam_16
SAY @99 /* [Husam]I didn't say that. */
IF ~~ THEN + bren_and_husam_09
END

IF ~Global("C#HU_SoD_BrensQuest","GLOBAL",8)~ THEN bren_dead
SAY @100 /* [Husam]There. He will not give us away. Do not worry, noone was watching us. As far as the crusaders go, this man killed himself with a knife he hid in his boot. So sad. */
++ @101 /* You cut his throat - just like that! */ + bren_dead_01
++ @102 /* Nicely done. */ + bren_dead_03
++ @103 /* I envy you for your cold professionalism, Husam. I wished I could handle my followers this way - but noooo, they are all *individuals*. */ + bren_dead_03
++ @104 /* Are we done here? Good. We've got things to do, you know. */ + bren_dead_02
END

IF ~~ THEN bren_dead_01
SAY @105 /* [Husam]He sealed his fate, and I would have killed him anyways. This was faster and easier than risking him spilling his knowledge to the crusaders or having to search for him first. You are aware that he would have died in all instances, <CHARNAME>, yes? I decided to do it here, in front of you, to honor our alliance. I said I will not do anything behind your back, so here we are. */
++ @106 /* You... you're a monster. */ + bren_dead_04
++ @107 /* I am shocked, to be honest. */ + bren_dead_04_b
++ @108 /* I'm not happy, but I will accept the outcome due to a lack of other possibilities. */ + bren_dead_03
++ @102 /* Nicely done. */ + bren_dead_03
++ @103 /* I envy you for your cold professionalism, Husam. I wished I could handle my followers this way - but noooo, they are all *individuals*. */ + bren_dead_03
++ @104 /* Are we done here? Good. We've got things to do, you know. */ + bren_dead_02
END

IF ~~ THEN bren_dead_02
SAY @109 /* [Husam]Lead the way. */
IF ~~ THEN EXIT
END

IF ~~ THEN bren_dead_03
SAY @110 /* [Husam]We should move away from the cages. */
IF ~~ THEN EXIT
END

IF ~~ THEN bren_dead_04
SAY @111 /* [Husam]No, not a monster, just a well-considered assassin. */
IF ~~ THEN + bren_dead_04_b
END

IF ~~ THEN bren_dead_04_b
SAY @112 /* [Husam]I will spare examples of where the righteous would kill out of strategic considerations just as well, as I guess that you are not open to such a discussion. Let us clear an immanent question first: do you still want me to accompany you, or do you want me to go? */
++ @113 /* Neither! I will end you here! */ + bren_dead_05
++ @114 /* I want you to go. You are not what I imagined. I had the illusion you were different, but I see I was mistaken - you are a cold-blooded assassin and nothing more. */ + bren_dead_06
++ @115 /* I apologize for calling you that. I had to swallow hard, but I guess I should have known better than to think that you wouldn't live by your guild's rules because of me. That man sealed his death by your guild's hands the moment he got himself caught, and even though I loath this with all my heart, you are still the same man you were half an hour ago. Stay then. */ + bren_dead_07
++ @116 /* Whatever. Stay in the group. */ + bren_dead_07
END

IF ~~ THEN bren_dead_05
SAY @117 /* [Husam]Here? Inside the crusader camp? I don't think so, <CHARNAME>. I apologize, but there will be no hostile confrontation. You are much too valuable to battle over some personal grudge. */
IF ~~ THEN + bren_dead_06
END

IF ~~ THEN bren_dead_06
SAY @118 /* [Husam]I will just fall back into the shadows, as I probably should have done right from the start. Our alliance is over - the Shadow Thieves aren't done with you yet. */
/* Husam in Party */
IF ~InParty("C#Husam1")~ THEN DO ~SetGlobal("C#Husam_SoDEnd","GLOBAL",6)
SetGlobal("C#HusamJoined","GLOBAL",0)
LeaveParty()
SetLeavePartyDialogFile()
ChangeAIScript("",DEFAULT)
//DestroyItem("##")
GivePartyAllEquipment()
EscapeAreaDestroy(5)~ EXIT

/* Husam was 7th party member */
IF ~Global("C#HusamJoined","GLOBAL",2)~ THEN DO ~SetGlobal("C#Husam_SoDEnd","GLOBAL",6)
SetGlobal("C#HusamJoined","GLOBAL",0)
RemoveFamiliar()
ChangeEnemyAlly(Myself,NEUTRAL)
SetLeavePartyDialogFile()
ChangeAIScript("",DEFAULT)
//DestroyItem("##")
GivePartyAllEquipment()
EscapeAreaDestroy(5)~ EXIT
END

IF ~~ THEN bren_dead_07
SAY @119 /* [Husam]Alright then. This assassin is ready to follow your orders once more. */
IF ~~ THEN EXIT
END
END //APPEND

/* bd2000 crusader guard */
BEGIN c#husgrd
IF ~Global("C#HuS_c#husgrd_1","LOCALS",0)~ THEN too_near
SAY @120 /* Don't linger here, move away! I'm not standing here because I'm so good looking. */
++ @121 /* What is this about? */ + too_near_02
++ @122 /* Alright, I'll move away. */ + too_near_01
END

IF ~~ THEN too_near_01
SAY @123 /* That's right, you go elsewhere. There is nothing to see here. Noone is supposed to be here in the bushes until this is settled. */
IF ~~ THEN DO ~SetGlobal("C#HuS_c#husgrd_1","LOCALS",1) RealSetGlobalTimer("C#HuS_c#husgrd","LOCALS",5)~ EXIT
END

IF ~~ THEN too_near_02
SAY @124 /* What do you think? I'm *guarding* something. A crime scene, so to speak. */
IF ~~ THEN + too_near_01
END

IF ~Global("C#HuS_c#husgrd_2","MYAREA",1)
GlobalLT("C#HU_SoD_BrensQuest","GLOBAL",3)~ THEN opened_it
SAY @125 /* You... did you just tinker with the evidence? Do you think I am here for show?! */
IF ~~ THEN DO ~EraseJournalEntry(@100009)
		EraseJournalEntry(@100010)
		EraseJournalEntry(@100013)
SetGlobal("C#HU_SoD_BrensQuest","GLOBAL",15) ActionOverride("c#husgrd",Enemy())~ SOLVED_JOURNAL @100021 EXIT
END

IF ~Global("C#HuS_c#husgrd_1","LOCALS",1)
GlobalLT("C#HU_SoD_BrensQuest","GLOBAL",3)~ THEN too_near_03
SAY @126 /* Hey, what are you doing there? Get away from that tree! */
IF ~~ THEN DO ~RealSetGlobalTimer("C#HuS_c#husgrd","GLOBAL",5)~ EXIT
END



/* bd2000 Dyal */
BEGIN c#husdya
IF ~True()~ THEN dyal_01
SAY @127 /* Waiting and being patient. I am so sick of it! There is enemies right between us but nobody wants to listen! */
IF ~~ THEN EXIT
END


/* add reply options to Kharm */

EXTEND_BOTTOM BDKHARM 0
+ ~Global("C#HU_SoD_BrensQuest","GLOBAL",2)~ + @128 /* One question to this possible traitor thief, Bren. */ + about_bren
END

EXTEND_BOTTOM BDKHARM 20
+ ~Global("C#HU_SoD_BrensQuest","GLOBAL",2)~ + @128 /* One question to this possible traitor thief, Bren. */ + about_bren
END

CHAIN 
IF ~~ THEN BDKHARM about_bren
@129 /* What of him? I know this is pending. I didn't have time to deal with Dyal's accusations yet. */
== c#husamj IF ~!GlobalTimerExpired("C#HU_SoD_DyalItemsT","GLOBAL")
Global("C#HuS_bhs_c#husmug","MYAREA",0)
Global("C#HuS_bhs_c#huslet","MYAREA",0)~ THEN @130 /* And things like these should not be hasted, considering the risk is the life of an innocent man. We should leave the Lieutenant to his tasks and see that we make ourselves as *helpful* as possible until then, yes? */
== c#husamj IF ~GlobalTimerExpired("C#HU_SoD_DyalItemsT","GLOBAL")~ THEN @131 /* If it's not already going in Dyal's favor. We waited a long time with speaking up about this, my friend. */
END
+ ~!GlobalTimerExpired("C#HU_SoD_DyalItemsT","GLOBAL")
Global("C#HuS_bhs_c#husmug","MYAREA",0)
Global("C#HuS_bhs_c#huslet","MYAREA",0)~ + @132 /* My comrade is right. This trial should not be hasted - not yet, anyway. I just remembered I have something to do. */ + 10
++ @133 /* Some of us think this should not wait any longer. We will need every manpower we have for the ongoing siege, sir. */ + kharm_01
++ @134 /* Nothing, actually. I'll leave you to your tasks. */ + 10

APPEND BDKHARM 
IF ~~ THEN kharm_01
SAY @135 /* Hrmph. I won't let a recruit tell me what to do, but I was planning on holding the trial soon anyway. Having a guard occupied for this is indeed a waste of resources. Call the guard and bring the prisoner! */
IF ~~ THEN DO ~SetInterrupt(FALSE) SetGlobal("C#HU_SoD_BrensQuest","GLOBAL",3) ClearAllActions() StartCutSceneMode() StartCutScene("c#husqc1")~ EXIT
END
END //APPEND

/* c#huslet Global("C#HuS_bhs_c#huslet","MYAREA",1) */
/* c#husmug Global("C#HuS_bhs_c#husmug","MYAREA",1) */
/* c#husknf Global("C#HuS_bhs_c#husknf","MYAREA",1) */
/* GlobalTimerExpired("C#HU_SoD_DyalItemsT","GLOBAL") */

CHAIN
IF WEIGHT #-1
~Global("C#HU_SoD_BrensQuest","GLOBAL",3)~ THEN BDKHARM trial
@136 /* Bren, you are accused of being a spy by Dyal. The only evidence we have is a secret stash Dyal claims to be yours. We guarded the hideout since we found it, so I will take anything we'll find in there as evidence for this case. */
== BDKHARM IF ~Global("C#HuS_bhs_c#husknf","MYAREA",1)~ THEN @137 /* This little knife was found in the stash. It is said to be yours, Bren. Even I saw you use it. Finding this inside the stash seems like evidence to me. */
== c#hubren IF ~Global("C#HuS_bhs_c#husknf","MYAREA",1)
Global("C#HU_SoDBrenKnife","LOCALS",0)~ THEN @138 /* (mutters) Dyal, you sneaky bastard. Smuggeling in my knife? Well played, I guess. */
== c#hubren IF ~Global("C#HuS_bhs_c#husknf","MYAREA",1)
Global("C#HU_SoDBrenKnife","LOCALS",1)~ THEN @139 /* What? Why would it be... Damn it, I am being played?! */
== BDKHARM IF ~Global("C#HuS_bhs_c#husmug","MYAREA",1)~ THEN @140 /* Hmm, this cup is Dyal's victory cup! We all saw him stow it away with the proclamation of only using it once the fort has fallen. */
== BDKHARM IF ~Global("C#HuS_bhs_c#huslet","MYAREA",1)~ THEN @141 /* This letter is even signed by you, Dyal. Finding this inside the satsh... */
== c#husdya IF ~OR(2) Global("C#HuS_bhs_c#huslet","MYAREA",1)
Global("C#HuS_bhs_c#husmug","MYAREA",1)~ THEN @142 /* What?! This is rediculous. Why would I put my own stuff in there if I want to accuse someone else? */
== c#husdya IF ~Global("C#HuS_bhs_c#husmug","MYAREA",1)
Global("C#HuS_bhs_c#huslet","MYAREA",0)~ THEN @143 /* Anyone could have taken the cup out of my bedroll! I left it there unguarded! */

/* stuff of Dyal and Bren was in there - noone is guilty */
== BDKHARM IF ~Global("C#HuS_bhs_c#husknf","MYAREA",1)
OR(2) Global("C#HuS_bhs_c#huslet","MYAREA",1)
Global("C#HuS_bhs_c#husmug","MYAREA",1)~ THEN @144 /* So, I see personal stuff of Bren - and Dyal. One's belongings I would understand, but from both? This is clearly a staged coup. But from whom, I can't say. */ 

/* no stuff of anyone was in there - noone is guilty */
== BDKHARM IF ~Global("C#HuS_bhs_c#husknf","MYAREA",0)
Global("C#HuS_bhs_c#huslet","MYAREA",0)
Global("C#HuS_bhs_c#husmug","MYAREA",0)~ THEN @145 /* There is nothing inside that I could relate to anyone in particular. It is a thief's stash alright, but whether it belongs to Bren - or Dyal, for that matter - I can't say. */
== c#hubren IF ~Global("C#HuS_bhs_c#husknf","MYAREA",0)
Global("C#HuS_bhs_c#huslet","MYAREA",0)
Global("C#HuS_bhs_c#husmug","MYAREA",0)~ THEN @146 /* (mutters) Damned the gods - Dyal, you sneaky bastard. */
== c#husdya IF ~GlobalTimerExpired("C#HU_SoD_DyalItemsT","GLOBAL")
Global("C#HuS_bhs_c#huslet","MYAREA",0)
Global("C#HuS_bhs_c#husmug","MYAREA",0)~ THEN @147 /* What is it, Bren, did you expect to be something else in there? */
END
/* noone is guilty: items of both */
IF ~Global("C#HuS_bhs_c#husknf","MYAREA",1)
OR(2) Global("C#HuS_bhs_c#huslet","MYAREA",1)
Global("C#HuS_bhs_c#husmug","MYAREA",1)~ THEN + noone_guilty
/* nooone is guilty: no personal items */
IF ~Global("C#HuS_bhs_c#husknf","MYAREA",0)
Global("C#HuS_bhs_c#huslet","MYAREA",0)
Global("C#HuS_bhs_c#husmug","MYAREA",0)~ THEN + noone_guilty
/* only Bren's butterknife was in there - Bren is guilty */
IF ~Global("C#HuS_bhs_c#husknf","MYAREA",1)
Global("C#HuS_bhs_c#huslet","MYAREA",0)
Global("C#HuS_bhs_c#husmug","MYAREA",0)~ THEN + bren_guilty
/* Dyal's letter is in there but not Bren's knife - Dyal is found to be guilty */
IF ~Global("C#HuS_bhs_c#husknf","MYAREA",0)
Global("C#HuS_bhs_c#huslet","MYAREA",1)~ THEN + dyal_guilty
/* Dyal's cup is in there but not Bren's knife - Kharm needs some persuation */
IF ~Global("C#HuS_bhs_c#husknf","MYAREA",0)
Global("C#HuS_bhs_c#huslet","MYAREA",0)
Global("C#HuS_bhs_c#husmug","MYAREA",1)~ THEN + dyal_discussion

/* only Bren's butterknife was in there - Bren is guilty */
CHAIN
IF ~~ THEN BDKHARM bren_guilty
@148 /* And Bren's butterknife would be the only personal item in there. The case is clear now. It *is* Bren who is the traitor! Guard, stand ready for Bren to get his rightful punishment. */
== c#hubren IF ~Global("C#HuS_bhs_c#husknf","MYAREA",1)
Global("C#HuS_bhs_c#huslet","MYAREA",0)
Global("C#HuS_bhs_c#husmug","MYAREA",0)~ THEN @149 /* What - damned the gods. No, I will not wait for you to kill me. I'll show myself out. */
END
IF ~~ THEN DO ~EraseJournalEntry(@100010) EraseJournalEntry(@100013)
SetGlobal("C#HU_SoD_BrensQuest","GLOBAL",11)~ SOLVED_JOURNAL @100014 EXIT

/* Dyal's letter is in there but not Bren's knife - Dyal is found to be guilty */
CHAIN
IF ~~ THEN BDKHARM dyal_guilty
@150 /* The case is clear now. Bren was right - it's not him, it is *Dyal* who is the traitor! Guard, stand ready for Dyal to get his rightful punishment. */
== c#husdya @151 /* Damn it, Kharm - you have no idea what you are up against here. Don't you see what this is about? Had I known my things were in there I would have reported them missing right away! You are convicting the wrong one! */
== BDKHARM @152 /* Silence, Dyal. You tried to betray our trust in Bren, but I see clearly that he is our true brother. Bren - once you are ready to travel, you will go to Dragonspear Castle as you requested. We need every good man to hold the fort. */
END
IF ~~ THEN DO ~SetInterrupt(FALSE) 
EraseJournalEntry(@100010) EraseJournalEntry(@100013)
SetGlobal("C#HU_SoD_BrensQuest","GLOBAL",4)
SetInterrupt(TRUE)~ SOLVED_JOURNAL @100015 EXIT

/* Dyal's cup is in there but not his letter and not Bren's knife - Kharm needs some persuation */
CHAIN
IF ~~ THEN BDKHARM dyal_discussion
@153 /* As I said before, Dyal, the hideout was guarded, so anything I find in there I have to assume was in there when you raised your accusations. But I agree that someone could have put the cup in there *before* the whole thing started, since it *was* openly accessible, at least we all know where you kept it. */
== c#hubren @154 /* And that makes sense how, Dyal not noticing his missing cup for all this time? No, the evidence is clear. Either someone else stashed it recently - then it couldn't have been *me*, right? Or it was in from the beginning, but Dyal didn't report it missing - I wonder why? */
END
IF ~~ THEN + dyal_guilty


APPEND BDKHARM 
/* nooone is guilty */
IF ~~ THEN noone_guilty
SAY @155 /* We'll need to investigate this further once the siege is done. For now, we will increase being on alert, and fight on! Everyone back at their posts! */
IF ~~ THEN DO ~SetGlobal("C#HU_SoD_BrensQuest","GLOBAL",9)
ActionOverride("c#husdya",EscapeAreaDestroy(5))
ActionOverride("c#husgrd",EscapeAreaDestroy(5))~ EXIT
END
END //APPEND

CHAIN
IF WEIGHT #-1
~Global("C#HU_SoD_BrensQuest","GLOBAL",4)~ THEN c#hubren trial_done_01
@156 /* Well, didn't this went very well. */
== c#husamj IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) Detect("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @157 /* No thanks to you, Bren. Wipe that smirk off your face. So, how will you be of bombastic help for me in the future, hmm? */
== c#hubren @158 /* I am as good as on my way to Dragonspear Castle, like you already heard. But not only that - I was about to be sent to the inner circle. Yes, you heard right - nearer to Caelar, nearer to Hephernaan! */
== c#hubren IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) Detect("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @159 /* I will infiltrate those bastards for you, Husam. You will see that I am worthy of your trust and mercy! */
== c#hubren IF ~OR(3) Global("C#HusamJoined","GLOBAL",0) !Detect("C#Husam1") StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @160 /* Tell Husam when he's back on his feet that I will infiltrate those bastards for him. He will see that I am worthy of his trust and mercy! */
== c#husamj IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) Detect("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)
GlobalGT("C#Husam_HepherFiend","GLOBAL",0)~ THEN @161 /* Very good. But you be careful around Hephernaan. That bastard is in liege with what we believe to be a fiend. His security measures won't be easy to penetrate. */
== c#husamj IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) Detect("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)
Global("C#Husam_HepherFiend","GLOBAL",0)~ THEN @162 /* Very good. But you be careful around Hephernaan. That bastard's security measures don't seem to be easy to penetrate. */
END
IF ~~ THEN DO ~SetGlobal("C#HU_SoD_BrensQuest","GLOBAL",5)~ UNSOLVED_JOURNAL @100017 EXIT

CHAIN
IF WEIGHT #-1
~Global("C#HU_SoD_BrensQuest","GLOBAL",9)~ THEN c#hubren trial_done_02
@163 /* Well, this could have gone better - but at least I am not convicted. */
END
IF ~~ THEN DO ~EraseJournalEntry(@100010) EraseJournalEntry(@100013)~ SOLVED_JOURNAL @100016 EXTERN c#husamj bren_and_husam_chain_02_b

/* when finding sick Bren in bd5200 */
CHAIN
IF WEIGHT #-1
~Global("C#HU_SoD_BrensQuest","GLOBAL",13)~ THEN c#hubren final_meeting
@164 /* (moan) */
== c#husamj IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) Detect("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @165 /* Bren! What the hells happened to you - no, you can't see me, can you? With that wound on your head, you probably have forgotten your name, too. */
== BDPOLVI IF ~Detect("BDPOLVI") !StateCheck("BDPOLVI",CD_STATE_NOTVALID)~ THEN @166 /* There is nothing we can do for our poor fellow follower of the light. He fell down the shaft from the castle - very tragic and mysterious, with noone who saw what happened. Keeping him out of pain is all we can do for him. */
== c#husamj IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) Detect("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @167 /* Putting you out of your pain and misery is all we can do for you, indeed. Never had I thought it comes to this. I was ready to kill you back at Boareskyr Bridge, but - not like this... */
== c#husamj IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) Detect("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @168 /* (sigh) This was nothing I am fond of, there is no satisfaction in ending this life. It is just a useless death. "Accident" - no, this was no accident. We will find who did this to you, my friend, and we will make them pay. */
== c#husamj IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) Detect("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @169 /* No wonder I didn't hear back from him... He vanished while trying to get near Hephernaan, like several of my rogues before. Their bones might be in the cracks of this cave as well. Let us go. There is nothing left to see here. */
END
IF ~~ THEN EXIT
IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) Detect("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN DO ~EraseJournalEntry(@100017) SetGlobal("C#HU_SoD_BrensQuest","GLOBAL",14) Kill("c#hubren")~ SOLVED_JOURNAL @100020 EXIT
