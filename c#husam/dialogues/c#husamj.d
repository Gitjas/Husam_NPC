/* this file contains dialogue that could fire in both SoD or BGII. */

BEGIN C#HusamJ

/* reputation high */

IF ~Global("C#Husam_RepComment","GLOBAL",1) ReputationGT(Player1,16)~ THEN high_reputation
SAY @2 /* ~<CHARNAME>, I do not mind a high reputation. It opens doors that would stay shut otherwise. What I *do* mind is our way of achieving it. There is no reason to be so overly selfless all the time. Keep more gold to yourself instead, and there will be more than enough for a visit to a temple now and then, if you are worried about people's opinion about us.~ */
IF ~~ THEN DO ~SetGlobal("C#Husam_RepComment","GLOBAL",3)~ EXIT
END

/* reputation low */
IF ~Global("C#Husam_RepComment","GLOBAL",1) ReputationLT(Player1,5)~ THEN high_reputation
SAY @3 /* ~<CHARNAME>, I do not mind why people think of you so lowly. Also, a good measure of fear is a valid tool for manifesting one's influence. But I do see the complications it brings with it - city authorities becoming nervous and sending their soldiers, merchants not willing to give good prices or even trade at all, people keeping their mouth shut instead of spilling valuable information... There is a positive side to being liked, and it is *not* to be underestimated. I am sure we could spare a little gold for a visit in one of the temples and invest in raising people's perception. It does make life easier - and cheaper in the long run, as well.~ */
IF ~~ THEN DO ~SetGlobal("C#Husam_RepComment","GLOBAL",3)~ EXIT
END