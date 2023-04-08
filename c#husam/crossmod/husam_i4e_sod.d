CHAIN
IF WEIGHT #-1
~Global("C#HuSoD_ImoenBanter","GLOBAL",2)~ THEN C#HusamJ husam_imoen_sod_01
@0 /* [Husam]Taking from the rich and giving to the poor - what do you expect to achieve with that, Imoen? */
DO ~SetGlobal("C#HuSoD_ImoenBanter","GLOBAL",3)~
== BDIMOENB @1 /* Happiness! */
== C#HusamJ @2 /* I doubt the rich will be happy if they discover their missing wealth. */
== BDIMOENB @3 /* Not the rich. The poor! */
== C#HusamJ @4 /* Yes, I understood that well. Imoen, if you think you could achive lasting happiness with people by just giving them things for free, here is some advice from a more experienced fellow rogue. People who receive without effort usually do not appreciate what they get and are never grateful nor happy in the long run. On the contrary - they become greedy. */
== BDIMOENB @5 /* Ah, the usual saying about giving an inch and they will take a mile. I can't be true for everyone! */
== C#HusamJ @6 /* Not everyone, but the most. It will not take long and they will expect you to give them things. Next step is they want to decide which things they get from you. They will never be satisfied, and any feelings of gratitude they might had at the beginning will turn into expectation and evetually discontent. */
= @7 /* There is ways to give so that people appreciate it, but it is a bit more complicated. And it is always risky to just take things from people who believe they belong to them. My knowledge of politics is not as advanced as I wish it was, but I assure you that I understood one thing: if you want to pursue your business in peace, do not anger the rich - and do not stir expectations in the common masses. Both will make your life very complicated. */
== BDIMOENB @8 /* Aw, don't be such a spoilsport, Husam. I'll do it all in secret! Noone will know where it came from, so noone can expect more, and noone will put their anger about lost trinkets on me, either. */
== C#HusamJ @9 /* So it is a game and a game only, and has no use for you whatsoever. Your actions are thoughtless at best, and dangerous at worst. I'll keep an eye on you so you won't stir any unwanted trouble. */
== BDIMOENB @10 /* Aw, now that sounds like you're going to babysit me... I'm almost the same age as <CHARNAME>! Don't treat me like a child. Hmmm, wait - if you think I could stir real trouble, then you *do* know that I'm not a child any more, but a capable rogue! Yes! */
EXIT

/* ~[Imoen]Making other people happy is *difficult*, <CHARNAME>. Who would have thought that they would accept gifts so... so badly?~ */
I_C_T bdimoen %quest_interject% C#HuSoD_bdimoen_quest_interject
== bdimoen IF ~GlobalGT("C#HuSoD_ImoenBanter","GLOBAL",2)
OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @11 /* [Imoen]*Yes*, Husam, you could just as well grin instead of that faint smile on your lips, I see it well enough. You were right - see, now I said it! */
== C#HusamJ IF ~GlobalGT("C#HuSoD_ImoenBanter","GLOBAL",2)
OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @12 /* [Husam]On the contrary, Imoen. The advice I gave you did not cover the suspicious and mistrusting people who are always in the mix as well, because I didn't expect their number to be so high. Either I misjudged the mood of the refugees in this war camp, or you put trinkets into many, *many* more pockets than I am aware of. Either way, my input was somehow lacking. */
== bdimoen IF ~GlobalGT("C#HuSoD_ImoenBanter","GLOBAL",2)
OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @13 /* [Imoen]Nah, you are way more experienced with all this than I am... You mean for every grumbler we meet there are far more who are happy? Hmm, I didn't think of that. And yet, all *I* see is the ones complaining, and that's no fun. */
END

/* #2 */
CHAIN
IF WEIGHT #-1
~%IT_IS_SOD%
CombatCounter(0) !See([ENEMY]) 
InParty("C#Husam1")
InParty("%IMOEN_DV%")
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
!StateCheck("C#Husam1",CD_STATE_NOTVALID)
See("%IMOEN_DV%") See(Player1)
Global("C#HuSoD_ImoenBanter","GLOBAL",3)~ THEN C#HusamB husam_imoen_sod_02
@14 /* [Husam]Imoen, while we are travelling together I will be associated with you in <CHARNAME>'s group. I feel responsible for your pickpocketing skills being sufficient for our tasks - unrelated to your attempts of playing a gift fairy to unaware bystanders. */
DO ~SetGlobal("C#HuSoD_ImoenBanter","GLOBAL",4)~
== BDIMOENB IF ~GlobalGT("C#IM_SoDQuest","GLOBAL",2)~ THEN @15 /* Well, *those* days are over, I assure you. */
== BDIMOENB @16 /* [Imoen]Wait - did you just say that you will teach me because you think I will fail miserably if you don't, dragging you down with me? */
== C#HusamB @17 /* I would rather call it tutoring of sorts. My offer is related to the fact that I understood very well that once you set your mind to something, there is no stopping you. So, to honor my alliance with <CHARNAME>, I will improve your skills as best I can. */
== BDIMOENB @18 /* [Imoen]Heheh! - But it was a "yes" to my question. */
== C#HusamB @19 /* [Husam](smiles) There is never a good reason to refuse an opportunity to improve one's skills. */
== BDIMOENB @20 /* [Imoen]That's right! Fine, so, what was it you wanted to show me? */
== C#HusamB @21 /* [Husam]Watch and learn, Imoen. */
== BDIMOENB @22 /* [Imoen]Wait - that is *mine*! How did you take this - oooh, you are *sneaky*! You won't be successful with that ever again! */ 
== C#HusamB @23 /* [Husam]Then I achieved what I wanted. You are a quick learner, Imoen. */
== BDIMOENB @24 /* [Imoen]You bet! And - thanks. But I'm, uhm, I'm not an apprentice of the Shadow Thieves now or something, no? */
== C#HusamB @25 /* [Husam]Not in the slightest. This was a one time thing. */
== BDIMOENB @26 /* [Imoen]That's a relief! Er, no offence, but I'm not sure I like how your guild is handling things, you know. */
== C#HusamB @27 /* [Husam]None taken. */
END
IF ~~ THEN DO ~ActionOverride("%IMOEN_DV%",ReallyForceSpellRES("c#husimo",Myself))~ EXIT