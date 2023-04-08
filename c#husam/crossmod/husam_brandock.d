/* Brandock reacts to Husam's presence */

APPEND C#BrandJ
IF WEIGHT #-1
~Global("C#Brandock_HusamInGroupComment","GLOBAL",1)~ THEN husam_in_group
SAY @0 /* [Brandock]<CHARNAME> - are you sure you want this Shadow Thief to accompany us - that man scares the hells out of me. */
++ @1 /* I know what you mean - he's way too *professional* not to stirr a feeling of uneasiness when around. */ + husam_in_group_03
++ @2 /* He does? But he is always so well-composed, calm - and friendly. */ + husam_in_group_01
++ @3 /* Did he threaten you? */ + husam_in_group_02
++ @4 /* If this is going to become an "either you or him" discussion - don't. */ + husam_in_group_05
END

IF ~~ THEN husam_in_group_01
SAY @5 /* [Brandock]And that's *exactly* why he's scaring the wits out of me! He's a well-composed, calm, and friendly *cutthroat*. */
IF ~~ THEN + husam_in_group_04
END

IF ~~ THEN husam_in_group_02
SAY @6 /* [Brandock]What? No, no - since when would I need to be threatened to be scared? Haha. No, he's just *scaring* me with his calm professionalism. */
IF ~~ THEN + husam_in_group_04
END

IF ~~ THEN husam_in_group_03
SAY @7 /* [Brandock]Exactly! This professionalism of his assassin trade, he is *radiating* it. */
IF ~~ THEN + husam_in_group_04
END

IF ~~ THEN husam_in_group_04
SAY @8 /* [Brandock]He would end our lives in our sleep without flinching if it was for the "good" of his guild. */
++ @9 /* Maybe you are right, but for some reason I trust him, Brandock. */ + husam_in_group_06
++ @10 /* I know he is probably a murderer, but he isn't unpredictable, and on our side. */ + husam_in_group_06
++ @11 /* Maybe, but doing this would be not in his guild's interest, so there is nothing to fear. */ + husam_in_group_06
++ @12 /* Just stay away from him if he makes you uneasy, Brandock. */ + husam_in_group_06
END

IF ~~ THEN husam_in_group_05
SAY @13 /* [Brandock]I was afraid you'd say that. I get that his... profession comes in handy if used for our side. He's just *scaring* me with his calm professionalism. */
IF ~~ THEN + husam_in_group_06
END
END //APPEND

CHAIN
IF ~~ THEN C#BrandJ husam_in_group_06
@14 /* [Brandock](Exhales audibly) Well, let's hope you'll be able to keep him under check then. Oddly enough, I also believe that he wouldn't lie to you - but I am convinced that he is not telling everything he could, either. */
== C#BrandJ IF ~!StateCheck("C#Husam1",CD_STATE_NOTVALID)
See("C#Husam1")~ THEN @15 /* [Brandock]Just look how he is looking into my direction now - I could *swear* he knows exactly what I was talking to you about!... Scary - just scary... */
END
IF ~~ THEN DO ~SetGlobal("C#Brandock_HusamInGroupComment","GLOBAL",2)~ EXIT


/* Crossmod Husam - Brandock */

/* C#HusamB */

CHAIN
IF WEIGHT #-1 
~CombatCounter(0) !See([ENEMY]) 
OR(2) InParty("C#Brandock") Global("C#BrandockJoined","GLOBAL",2)
OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
!StateCheck("C#Husam1",CD_STATE_NOTVALID)
!StateCheck("C#Brandock",CD_STATE_NOTVALID)
See("C#Husam1") See(Player1)
Global("C#HusamBrandock","GLOBAL",0)~ THEN C#BrandB husam_brandock_1
@16 /* [Brandock]Husam - I have to say it. I know it's rediculous to do so, but I can't help myself. Literally. I don't know how to help myself if you'd decide to harm me, so I'll just make my wishes clear so I don't have to blame me for not trying, at least. */
DO ~SetGlobal("C#HusamBrandock","GLOBAL",1)~
= @17 /* Please - do not steal the remains of this book I have in my backpack. It is very important to me. Maybe it's worth something, but please do not fence it off for some gold coins but leave it with me. Yes? */
== IF_FILE_EXISTS bdimoen IF ~See("%IMOEN_DV%")
InParty("%IMOEN_DV%")
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @18 /* [Imoen]What? You never asked me not to steal it, Brandock! Don't you think I could do it? */
== IF_FILE_EXISTS Imoen2J IF ~See("%IMOEN_DV%")
InParty("%IMOEN_DV%")
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @18 /* [Imoen]What? You never asked me not to steal it, Brandock! Don't you think I could do it? */
== C#BrandB IF ~See("%IMOEN_DV%")
InParty("%IMOEN_DV%")
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @19 /* [Brandock]Of course you can, Imoen, but I trust you not to rid me of it completely... as Husam might. */
== C#HusamB @20 /* [Husam]Your book - or what is left of it? Brandock, I assure you that this has much higher value to you than it has to me. Hmmm... although I start to wonder: maybe there *would* be buyers for such a rare magic artefact?... */
== C#BrandB @21 /* [Brandock]W... What? Did I just give you that idea? (moans) */
== C#HusamB @22 /* [Husam]I will not, Brandock. Would I be a normal thief, I might find an interest in trying to fence such a curious "book", but I am not. I will not risk my assignment by stealing from one of my allies. */
== C#BrandB @23 /* [Brandock]Thank the gods! - Now I'd only have to believe that you go by your word and I could set my mind to ease about the matter... */
EXIT

CHAIN
IF WEIGHT #-1 
~CombatCounter(0) !See([ENEMY]) 
OR(2) InParty("C#Brandock") Global("C#BrandockJoined","GLOBAL",2)
OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
!StateCheck("C#Husam1",CD_STATE_NOTVALID)
!StateCheck("C#Brandock",CD_STATE_NOTVALID)
See("C#Brandock") See(Player1)
Global("C#HusamBrandock","GLOBAL",1)~ THEN C#HusamB husam_brandock_2
@24 /* [Husam]Brandock, you took me by surprise with your plea recently. */
DO ~SetGlobal("C#HusamBrandock","GLOBAL",2)~
== C#BrandB @25 /* [Brandock]Why, did you not think I value this book high enough to plead for it to be spared? */
== C#HusamB @26 /* [Husam]On the contrary, I am vey well aware what this "book" means to you. No - because I thought you would plead for your own life to be spared. For me not harming you in your sleep, or not harming <CHARNAME>, or something else of the same impact. Instead, you were pleading for your *book*. I thought it quite peculiar. */
== C#BrandB @27 /* [Brandock]Well, that's because I believe that you won't harm us in our sleep since you want to travel with <CHARNAME>, yes? I mean, *theoretically* you could do so any time, but you *wouldn't*, right? Because <CHARNAME> and her companions are too precious, no? I mean... That's how it is, yes? */
== C#HusamB @28 /* [Husam]That's how it is indeed, Brandock. You understand me well. And you have my word that this will be so as long as I'll travel with you. */
== C#BrandB @29 /* [Brandock]Oh, that is great... That means that now I'll dread the day we part ways, because I can never be sure you won't come for us afterwards. But at least I can relax as long as you are around - *if* I believe you not to talk with a split tongue and leaving out all the possibilities how you could get us killed while being with us without doing so yourself... */
== C#HusamB @30 /* [Husam](smiles) I see you understand the ways of the Shadow Thieves well, Brandock. Let me put your mind at ease, then: I will not harm you or *let* anyone harm you as long as I am an ally to <CHARNAME>, as well as <PRO_HIMHER>self and any other of <PRO_HIMHER> companions. Better? */
== C#BrandB @31 /* [Brandock]Well... Didn't you still say you might harm us once we part ways?... But I guess this is the best I can get. Now all I need is trust your word... */
EXIT

CHAIN
IF WEIGHT #-1 
~CombatCounter(0) !See([ENEMY]) 
OR(2) InParty("C#Brandock") Global("C#BrandockJoined","GLOBAL",2)
OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
!StateCheck("C#Husam1",CD_STATE_NOTVALID)
!StateCheck("C#Brandock",CD_STATE_NOTVALID)
See("C#Husam1") See(Player1)
Global("C#HusamBrandock","GLOBAL",2)~ THEN C#BrandB husam_brandock_3
@32 /* [Brandock]You know, Husam - I did not plead for you not to harm us, because I figured that would you want to, you'd do it anyways, no matter what I make you promise beforehand. */
DO ~SetGlobal("C#HusamBrandock","GLOBAL",3)~
== C#HusamB @33 /* [Husam]Oh, because if I kill people in cold blood, I must also be a liar and psychopath, you mean? */
== C#BrandB @34 /* [Brandock]No, on the contrary... What I believe is that if you can murder someone because that person is in your way, then you *can* also lie with a straight face - and you wouldn't mind doing so. */
EXIT

CHAIN
IF WEIGHT #-1 
~CombatCounter(0) !See([ENEMY]) 
OR(2) InParty("C#Brandock") Global("C#BrandockJoined","GLOBAL",2)
OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
!StateCheck("C#Husam1",CD_STATE_NOTVALID)
!StateCheck("C#Brandock",CD_STATE_NOTVALID)
See("C#Brandock") See(Player1)
Global("C#HusamBrandock","GLOBAL",3)~ THEN C#HusamB husam_brandock_4
@35 /* [Husam]Bandock, there is nothing I can do to convince you that I always, *always* keep my word? */
DO ~SetGlobal("C#HusamBrandock","GLOBAL",4)~
== C#BrandB @36 /* [Brandock]You are one of the few people who can say such an important sentence and give me shivers down the spine while doing so. */
== C#HusamB @37 /* [Husam]It scares you when I say this? */
== C#BrandB @38 /* [Brandock]Oooh yes. Not because I wouldn't believe you - I believe you, oh yes, I do. I *know* you will keep your word. A word like "I will find and kill you", for example. Some would just say that out of spite or anger. You on the other hand - you would say it and *mean* it. */
EXIT


