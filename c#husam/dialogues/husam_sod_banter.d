/* Corwin #1 */
CHAIN
IF 
~%IT_IS_SOD%
CombatCounter(0) !See([ENEMY]) 
InParty("C#Husam1")
InParty("Corwin")
!StateCheck("Corwin",CD_STATE_NOTVALID)
!StateCheck("C#Husam1",CD_STATE_NOTVALID)
See("Corwin") See(Player1)
Global("C#HuSoD_CorwinBanter","GLOBAL",0)~ THEN C#HusamB husam_corwin_sod_01
@0 /* [Husam]I am glad the Flaming Fist recovered in time to be able to march against the crusade, Corwin. */
DO ~SetGlobal("C#HuSoD_CorwinBanter","GLOBAL",1)~
== BDCORWIJ @1 /* [Corwin]You what now? As if you'd be "glad" that the city's forces regained their power, Shadow Thief. */
== C#HusamB @2 /* [Husam]What makes everyone believe that the Shadow Thieves would welcome a situation of destabilized distribution of power along the lands? Yes, we might profit from a little commotion that usually offers possibilities to profit from people's insecurity, but why should we be interested in disrupting our well-established business foundation? */
== BDCORWIJ @3 /* [Corwin]I still don't believe you that you wouldn't welcome a less strong Flaming Fist. */
== C#HusamB @4 /* [Husam]Oh, I am not in the least committed to the current Flaming Fist authorities. I would have spoken just as well to a captain loyal to Angelo. I am glad they regained their power, either way. The situation to face Caelar's crusade would be much trickier without Baldur's Gate helping in it. */
== BDCORWIJ @5 /* [Corwin]I *knew* it! You do not care about the people's well-being as long as you get your share in gold. You disgust me! Do not speak to me again, and certainly not false compliments! */
EXIT

/* Viconia #1 */
CHAIN
IF 
~%IT_IS_SOD%
CombatCounter(0) !See([ENEMY]) 
InParty("C#Husam1")
InParty("Viconia")
!StateCheck("Viconia",CD_STATE_NOTVALID)
!StateCheck("C#Husam1",CD_STATE_NOTVALID)
See("Viconia") See(Player1)
Global("C#HuSoD_ViconiaBanter","GLOBAL",0)~ THEN C#HusamB husam_viconia_sod_01
@6 /* [Husam]Viconia, I am surprised you volunteered to fight on the coalition's side - considering your origin. */
DO ~SetGlobal("C#HuSoD_ViconiaBanter","GLOBAL",1)~
== BDVICONB IF ~InPartyAllowDead("Baeloth")~ THEN @7 /* [Viconia]Did you say the same to Baeloth? */
== C#HusamB IF ~InPartyAllowDead("Baeloth")~ THEN @8 /* [Husam]No, because Baeloth was recruited by <CHARNAME> out of circumstances. You, on the other hand, moved with the Flaming Fist forces by your own volition. */
== C#HusamB @9 /* [Husam]I Understand the notion, though - to chose to be in plain sight instead of hiding in the shadows, because in public at least there is no danger of being exposed. I would know - I chose the same strategy. */
== C#HusamB @10 /* [Husam]A word of warning, though. In case you think that it will bring you people's lasting gratefulness and trust - it usually doesn't. The moment Caelar falls, you will be back to being a hunted drow just like before. */
== BDVICONB @11 /* [Viconia]As if I wouldn't *know* that, iblith. Spare me your useless prattle. */
EXIT

/* Glint #1 */
CHAIN
IF 
~%IT_IS_SOD%
CombatCounter(0) !See([ENEMY]) 
InParty("C#Husam1")
InParty("Glint")
!StateCheck("Glint",CD_STATE_NOTVALID)
!StateCheck("C#Husam1",CD_STATE_NOTVALID)
See("Glint") See(Player1)
GlobalGT("BD_SDD215_PRITCHARD","GLOBAL",3)
Global("C#HuSoD_GlintBanter","GLOBAL",0)~ THEN C#HusamB husam_glint_sod_01
@12 /* [Husam]Glint, you have an interesting way of persuasion. */
DO ~SetGlobal("C#HuSoD_GlintBanter","GLOBAL",1)~
== BDGLINTB @13 /* [Glint]You mean my cousin and the beating I asked <CHARNAME> for? Well, I know him well enough to know that he won't listen to reason. */
== C#HusamB @14 /* [Husam]So you chose that he needs to feel to understand. I agree with you whole-heartedly. It is very much alike we Shadow Thieves handle these kind of delicate situations. */
== BDGLINTB @15 /* [Glint]Husam, the reason why I am going with this is because I *care* for my cousin. I doubt that would be your motivation for such a step, if you would order a pounding within the scope of your guild. */
== C#HusamB @16 /* [Husam]You are right, but that is not what I was referring to. You are chosing the lesser evil to achieve your goal, for whatever reason, Glint. It is very much alike the way we Shadow Thieves do it. */
== BDGLINTB @17 /* [Glint]I really, really doubt this can be compared. - Or maybe I should say I object to this being compared. You're not trying to recruit me or something, are you? */
== C#HusamB @18 /* [Husam]Don't worry, you are absolutely unsuited to become a Shadow Thief - for several reasons. */
== BDGLINTB @19 /* [Glint]I'm seriously relieved to hear that. */
== C#HusamB @20 /* [Husam]But I do like your way of thinking. */
== BDGLINTB @21 /* [Glint]Uhm - thank you? I guess. */
EXIT

