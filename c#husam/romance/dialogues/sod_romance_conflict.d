
/* dialogue started by Husam in case other romance interest is present (no committed other romance) */
CHAIN
IF WEIGHT #-1
~Global("C#HU_SoD_OtherRomance","GLOBAL",3)~ THEN c#husamj other_romance_reaction
~[Husam]<CHARNAME>, I couldn't help but notice that you seem to feel drawn to one of our companions.~
DO ~SetGlobal("C#HU_SoD_OtherRomance","GLOBAL",4)~
== c#husamJ IF ~GlobalGT("bd_CorwinRomance3","GLOBAL",0)~ THEN ~And Corwin to you, if I see it right. ~
== c#husamJ IF ~GlobalGT("bd_GlintRomance2","GLOBAL",1)~ THEN ~Glint also seem to have feelings for you.~
== c#husamJ IF ~GlobalGT("bd_NeeraRomance3","GLOBAL",1)~ THEN ~Neera also seem to enjoy your company quite a bit.~
== c#husamJ IF ~GlobalGT("bd_DornRomance2","GLOBAL",1)~ THEN ~Dorn is also eying you when he thinks noone is looking.~
== c#husamJ IF ~GlobalGT("bd_SafanaRomance1","GLOBAL",1)~ THEN ~Safana definitely enjoys your attention.~
== c#husamJ IF ~GlobalGT("bd_VoghilnRomance3","GLOBAL",0)~ THEN ~Voghiln seems to anticipate more than drinking an ale with you - not that it surprises me in his case.~
== c#husamJ IF ~GlobalGT("bd_RasaadRomance4","GLOBAL",0)~ THEN ~Rasaad blushes every time you are near.~
== c#husamJ IF ~GlobalGT("bd_ViconiaRomance4","GLOBAL",1)~ THEN ~No one knows what goes on in Viconia's head, but she seeks your proximity quite noticeable, even if she'd deny it.~
== c#husamJ ~If you have serious intentions in this regard - do you want us to tune down our little shared ... moments?~ 
END
++ ~Are you asking for my sake or for yours?~ + other_romance_reaction_01
++ ~You would stand down?~ + other_romance_reaction_02
++ ~We are doing anything we do in secret. I don't see a problem as long as it will stay this way.~ + other_romance_reaction_05
++ ~Nothing is serious or committed, so don't worry about it.~ + other_romance_reaction_05
++ ~I fear you are right. Our little... discussions could lead to misunderstandings, and I don't want to risk upsetting the person I am interested in emotionally. Let's stop this.~ + other_romance_reaction_04
++ ~Maybe we could stop on the actual ... execution of our little fantasies, Husam. But I won't stop flirting with you.~ + other_romance_reaction_06

APPEND c#husamj
IF ~~ THEN other_romance_reaction_01
SAY ~For both, I admit.~
IF ~~ THEN + other_romance_reaction_03
END

IF ~~ THEN other_romance_reaction_02
SAY ~Of course. What we share is for pleasure pastimes, not for stirring irritations.~
IF ~~ THEN + other_romance_reaction_03
END

IF ~~ THEN other_romance_reaction_03
SAY ~Don't misinterpret my intentions - morally, I have no problems whatsover to pursue what we are doing. Hence my question.~
++ ~We are doing anything we do in secret. I don't see a problem as long as it will stay this way.~ + other_romance_reaction_05
++ ~Nothing is serious or committed, so don't worry about it.~ + other_romance_reaction_05
++ ~I fear you are right. Our little... discussions could lead to misunderstandings, and I don't want to risk upsetting the person I am interested in emotionally. Let's stop this.~ + other_romance_reaction_04
++ ~Maybe we could stop on the actual ... execution of our little fantasies, Husam. But I won't stop flirting with you.~ + other_romance_reaction_06
END

IF ~~ THEN other_romance_reaction_04
SAY @3 /* ~I understand. Very well - let me say, it was my pleasure, indeed, <CHARNAME>, while it lasted.~ */
IF ~~ THEN DO ~SetGlobal("C#HusamRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ THEN other_romance_reaction_05
SAY ~Very well. I will continue to stand ready as agreed upon, then.~
IF ~~ THEN EXIT
END

IF ~~ THEN other_romance_reaction_06
SAY ~I understand. A game of words and shared fantasies it will be, then - lead the way, precious hero.~
IF ~~ THEN DO ~SetGlobal("C#HusamRomanceActive","GLOBAL",1)
SetGlobal("C#HU_RomanceCounter","GLOBAL",7)
SetGlobal("C#HU_SoDPID_romstage1","LOCALS",9)~ EXIT
END

IF ~~ THEN other_romance_reaction_07
SAY ~Very well. We will continue like we did, then.~
IF ~~ THEN EXIT
END
END //APPEND

CHAIN
IF WEIGHT #-1
~Global("C#HU_SoD_OtherRomance","GLOBAL",7)~ THEN c#husamj other_romance_reaction_08
~<CHARNAME>, Ihr habt Euch emotional an einen unserer Kameraden gebunden.~
DO ~SetGlobal("C#HU_SoD_OtherRomance","GLOBAL",8)~
== c#husamJ IF ~Global("bd_voghiln_romanceactive","global",2)
	!Global("bd_voghiln_romance_nocommitment","global",1)~ THEN ~Voghiln seems to have settled for you, as much as such a character can settle for one partner.~
== c#husamJ IF ~Global("C#HusamRomanceActive","GLOBAL",2)~ THEN ~[Husam]Ihr wisst inzwischen, dass ich moralisch keine Bedenken hätte, unsere heimlichen Momente fortzusetzen. Ich muss wissen, ob Ihr bereit für das Spiel eines heimlichen Liebhabers seid, denn wenn mich die Erfahrung eins gelehrt hat, dann die Tatsache, dass es schwierig zu erhalten ist.~
== c#husamJ IF ~Global("C#HusamRomanceActive","GLOBAL",1)~ THEN ~[Husam]Unsere ... verbalen Spielchen sind nicht so gut vor den anderen geheim zu halten. Sollen wir sie für den Frieden in der Gruppe in Zukunft sein lassen?~
END
+ ~Global("C#HusamRomanceActive","GLOBAL",2)~ + ~Wir haben das die ganze Zeit schon gemacht, und es hat niemanden gestört - ich sehe nicht ein, warum wir jetzt damit aufhören sollten.~ + other_romance_reaction_09
+ ~Global("C#HusamRomanceActive","GLOBAL",1)~ + ~Wir haben das die ganze Zeit schon gemacht, und es hat niemanden gestört - ich sehe nicht ein, warum wir jetzt damit aufhören sollten.~ + other_romance_reaction_07
+ ~Global("C#HusamRomanceActive","GLOBAL",2)~ + ~I'm alright with having a secret affair with you, Husam. Noone shall know.~ + other_romance_reaction_10
+ ~Global("C#HusamRomanceActive","GLOBAL",1)~ + ~I won't stop flirting with you, Husam, just because someone else is now close to me.~ + other_romance_reaction_07
+ ~Global("C#HusamRomanceActive","GLOBAL",2)~ + ~Maybe we could stop on the actual ... execution of our little fantasies, Husam. But I won't stop flirting with you.~ + other_romance_reaction_06
++ ~Ihr habt recht - wir müssen es beenden.~ + other_romance_reaction_04


APPEND c#husamj
IF ~~ THEN other_romance_reaction_09
SAY ~[Husam]Ich werde die Reaktion Eurer Liebschaft nicht herausfordern. Unterschätzt das Konfliktpotential nicht. Es ginge nicht nur darum, zu verhindern, dass man uns nicht in flagranti erwischt. Ihr werdet auch die Person anlügen, mit der Ihr einen Großteil Eures Lebens verbringen wolltet, der Ihr eventuell bereits ewige Liebe und Monogamie geschworen habt. Nicht jeder ist dafür geschaffen, diese Ambivalenz auszuhalten.~
++ ~Ich schon. Ich lasse mir doch so einen attraktiven Schurken wie Euch nicht entgehen, Husam. Falls es für Euch tatsächlich in Frage kommt.~ + other_romance_reaction_10
++ ~Monogamie? Ewige Liebe? Pfff, Ihr schätzt mich falsch ein, Husam. Ich möchte Spaß, und davon möglichst viel - und das schließt Euch mit ein, also macht jetzt keinen Rückzieher.~ + other_romance_reaction_10
++ ~Maybe we could stop on the actual ... execution of our little fantasies, Husam. But I won't stop flirting with you.~ + other_romance_reaction_06
++ ~Ihr habt recht - wir müssen es beenden.~ + other_romance_reaction_04
END

IF ~~ THEN other_romance_reaction_10
SAY ~[Husam]In dem Fall verlasse ich mich darauf, dass Ihr nichts, absolut nichts darüber erzählt, was zwischen uns geschieht, <CHARNAME>. Damit ist das Thema für mich geklärt. Ich nehme Euch beim Wort - vergesst das nicht.~
IF ~~ THEN + other_romance_reaction_07
END


/* continuation from PID */
/* committed other active romance; with bg1re */
IF ~~ THEN other_romance_00
SAY @0 /* ~[Husam]Hmmm, da gibt es nur ein offensichtliches Problem.~ */
IF ~~ THEN + generic_answer_other_romance
END

/* committed other active romance; no bg1re */
IF ~~ THEN other_romance_01
SAY @1 /* ~[Husam]Hmm, reger Austausch ohne Konversation, meint Ihr? Es gibt in der Tat viele Möglichkeiten sich besser - um nicht zu sagen, INTIM - kennen zu lernen.~ */
IF ~~ THEN + generic_answer_other_romance
END

IF ~~ THEN generic_answer_other_romance
SAY ~[Husam]Ich fürchte, dass Euer erster Ansprechpartner für dieses Bedürfnis jemand anderes aus dieser Gruppe sein sollte, <CHARNAME>.~
IF ~~ THEN + other_romance_02
END

IF ~~ THEN other_romance_02
SAY @2 /* ~[Husam]Zumindest, wenn ich Eure Beziehung nicht komplett falsch einschätze.~ */
++ ~Was hat das damit zu tun? Ich frage Euch!~ + other_romance_04
++ ~Husam, der gewitzte Schattendieb-Schurke hat moralische Bedenken, eine Affäre einzugehen?~ + other_romance_05
++ ~Ihr scheut wohl die damit möglicherweise verbundenen Konflikte?~ + other_romance_03
++ ~Ich frage ja bloß. Heißt nicht, dass wir es auch TUN müssen.~ + other_romance_06
++ ~Ehrlich gesagt finde ich es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ + pid_wohlbefinden_14
++ ~Ich bin nicht an Intimitäten mit Euch interessiert. Lasst uns das ganze Thema beenden und auf eine Zusammenarbeit als Kampfgefährten konzentrieren.~ + pid_konditionen_08
%Generelle_PID_Optionen%
END

IF ~~ THEN other_romance_03
SAY ~[Husam]Oh ja, <CHARNAME>. Und das sehr zu recht.~
++ ~Husam, der gewitzte Schattendieb-Schurke hat moralische Bedenken, eine Affäre einzugehen?~ + other_romance_05
++ ~Heißt das, Ihr weist mich ab?~ + other_romance_07
++ ~Ich frage ja bloß. Heißt nicht, dass wir es auch TUN müssen.~ + other_romance_06
++ ~Ehrlich gesagt finde ich es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ + pid_wohlbefinden_14
++ ~Ich bin nicht an Intimitäten mit Euch interessiert. Lasst uns das ganze Thema beenden und auf eine Zusammenarbeit als Kampfgefährten konzentrieren.~ + pid_konditionen_08
%Generelle_PID_Optionen%
END

IF ~~ THEN other_romance_04
SAY ~[Husam]Es hat alles damit zu tun, <CHARNAME>.~
++ ~Husam, der gewitzte Schattendieb-Schurke hat moralische Bedenken, eine Affäre einzugehen?~ + other_romance_05
++ ~Ihr scheut wohl die damit möglicherweise verbundenen Konflikte?~ + other_romance_03
++ ~Heißt das, Ihr weist mich ab?~ + other_romance_07
++ ~Ich frage ja bloß. Heißt nicht, dass wir es auch TUN müssen.~ + other_romance_06
++ ~Ehrlich gesagt finde ich es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ + pid_wohlbefinden_14
++ ~Ich bin nicht an Intimitäten mit Euch interessiert. Lasst uns das ganze Thema beenden und auf eine Zusammenarbeit als Kampfgefährten konzentrieren.~ + pid_konditionen_08
%Generelle_PID_Optionen%
END

IF ~~ THEN other_romance_05
SAY ~[Husam]Nicht im mindesten.~
IF ~~ THEN + other_romance_08
END

IF ~~ THEN other_romance_06
SAY ~[Husam]Ich verstehe. Ihr lotet Möglichkeiten aus - das ist Euer gutes Recht. Ich werde also entsprechend verbindlich antworten.~
IF ~~ THEN + other_romance_08
END

IF ~~ THEN other_romance_07
SAY ~[Husam]So, wie die Dinge stehen - ja.~
IF ~~ THEN + other_romance_08
END

IF ~~ THEN other_romance_08
SAY ~[Husam]Ich bin durchaus mit dem Spiel des unverbindlichen Austauschs körperlicher Intimitäten vertraut und absolut nicht zögerlich, es einzugehen. *Ich* hätte überhaupt kein Problem mit einem Seitensprung, unabhängig vom Beziehungsstatus des anderen. Aber hier geht es nicht nur um mich. Es ginge noch nicht einmal nur um uns beide, was das betrifft. In diesem Fall wäre noch eine dritte Person involviert, und ich kann keine Turbulenzen in der Gruppe riskieren, <CHARNAME>. Die emotionale, romantische Art ist die gefährlichste. Ich kann es mir nicht leisten, den Erfolg dieser Mission zu riskieren - meinen Erfolg in dieser Mission.~
IF ~~ THEN DO ~SetGlobal("C#HU_SoDPID_romstage1","LOCALS",2)~ + other_romance_09
IF ~GlobalLT("bd_plot","global",100)~ THEN DO ~SetGlobal("C#HU_SoDPID_romstage1","LOCALS",1)~ + other_romance_09
END
END //APPEND

CHAIN
IF ~~ THEN c#husamj other_romance_09
~[Husam]Um es kurz zu sagen - ich bin nicht überzeugt, dass die Umstände unserer momentanen Zusammenarbeit solch ... Zeitvertreib zu unserer beiden Zufriedenheit erlauben würde, <CHARNAME>.~
== c#husamj IF ~!%HC_FLIRTCOUNTER_HIGHENOUGH%~ THEN ~Und ehrlicherweise sollte ich anfügen, dass Eure bestehende Beziehung nur ein Aspekt ist, der mich momentan zögern lässt - wenn auch der wichtigste.~
END
%Generelle_PID_Optionen%

/* started via PID */
APPEND c#husamj
IF ~~ THEN other_romance_10
SAY ~[Husam]Nun ... neben dem offensichtlichen metaphorischen Elefant im Raum, meint Ihr?~
++ ~Erwartet Ihr, dass ich meine bestehende Beziehung beende?~ + other_romance_11
++ ~Kommt schon. Wenn Ihr interessiert seid, dann werden wir eine Möglichkeit finden, das so zu gestalten, dass niemand es mitkriegt - schon gar nicht der "Elefant" an meiner Seite.~ + other_romance_12
++ ~Ist das Euer letztes Wort?~ + other_romance_13
++ ~Da steckt viel Wahres drin in Euren Worten ... belassen wir es bei Flirts und heißen Träumen. Ich möchte meine Beziehung nicht riskieren.~ DO ~SetGlobal("C#HU_SoD_OtherRomance","GLOBAL",10)~ + pid_wohlbefinden_14
++ ~Ehrlich gesagt, nein. Ich bin nicht an Intimitäten mit Euch interessiert. Lasst uns das ganze Thema beenden und auf eine Zusammenarbeit als Kampfgefährten konzentrieren.~ DO ~SetGlobal("C#HU_SoD_OtherRomance","GLOBAL",10)~ + pid_konditionen_08
END

IF ~~ THEN other_romance_11
SAY ~[Husam]Nicht im gringsten! Ich erwarte nichts dergleichen und würde sogar streng davon abraten. Es sei denn, Eure Beziehung zu beenden ist Euer Wunsch, natürlich. Aber auch Trennungen führen zu emotionalem Chaos und hochexplosiven Gemischen. Es wäre keine Lösung für Euer Ansinnen, <CHARNAME>, da ich nichts tun werde, um meine Mission hier zu riskieren. Ich werde niemals der Grund sein, falls Ihr Euch von Eurem Partner trennen wollt.~
++ ~Kommt schon. Wenn Ihr interessiert seid, dann werden wir eine Möglichkeit finden, das so zu gestalten, dass niemand es mitkriegt - schon gar nicht der "Elefant" an meiner Seite.~ + other_romance_12
++ ~Ist das Euer letztes Wort?~ + other_romance_13
++ ~Da steckt viel Wahres drin in Euren Worten ... belassen wir es bei Flirts und heißen Träumen. Ich möchte meine Beziehung nicht riskieren.~ DO ~SetGlobal("C#HU_SoD_OtherRomance","GLOBAL",10)~ + pid_wohlbefinden_14
++ ~Ehrlich gesagt, nein. Ich bin nicht an Intimitäten mit Euch interessiert. Lasst uns das ganze Thema beenden und auf eine Zusammenarbeit als Kampfgefährten konzentrieren.~ DO ~SetGlobal("C#HU_SoD_OtherRomance","GLOBAL",10)~ + pid_konditionen_08
END

IF ~~ THEN other_romance_12
SAY ~[Husam]Selbstverständlich würden wir das. Ihr packt mich damit auch gleich noch bei meiner Schurkenehre - Schande über Euch, <CHARNAME>.~
IF ~~ THEN + other_romance_13
END

IF ~~ THEN other_romance_13
SAY ~[Husam]Ich sagte bereits, dass ich die Reaktion Eurer Liebschaft nicht herausfordern würde. Unterschätzt das Konfliktpotential nicht. Es ginge nicht nur darum, zu verhindern, dass Eure Liebschaft uns nicht in flagranti erwischt. Ihr werdet auch die Person anlügen, mit der Ihr einen Großteil Eures Lebens verbringen wolltet, der Ihr eventuell bereits ewige Liebe und Monogamie geschworen habt. Nicht jeder ist dafür geschaffen, diese Ambivalenz auszuhalten.~
++ ~Ich schon. Ich lasse mir doch so einen attraktiven Schurken wie Euch nicht entgehen, Husam. Falls Ihr interessiert seid.~ + other_romance_14
++ ~Monogamie? Ewige Liebe? Pfff, Ihr schätzt mich falsch ein, Husam. Ich möchte Spaß, und davon möglichst viel - und das schließt Euch mit ein, also macht jetzt keinen Rückzieher.~ + other_romance_14
++ ~Da steckt viel Wahres drin in Euren Worten ... belassen wir es bei Flirts und heißen Träumen. Ich möchte meine Beziehung nicht riskieren.~ DO ~SetGlobal("C#HU_SoD_OtherRomance","GLOBAL",10)~ + pid_wohlbefinden_14
++ ~Ehrlich gesagt, nein. Ich bin nicht an Intimitäten mit Euch interessiert. Lasst uns das ganze Thema beenden und auf eine Zusammenarbeit als Kampfgefährten konzentrieren.~ DO ~SetGlobal("C#HU_SoD_OtherRomance","GLOBAL",10)~ + pid_konditionen_08
END

IF ~~ THEN other_romance_14
SAY ~[Husam]In dem Fall verlasse ich mich darauf, dass Ihr nichts, absolut nichts darüber erzählt, was zwischen uns geschehen mag, <CHARNAME>. Damit ist das Thema für mich geklärt. Ich nehme Euch beim Wort - vergesst das nicht.~
IF ~~ THEN DO ~SetGlobal("C#HU_SoD_OtherRomance","GLOBAL",10)~ + pid_wohlbefinden_06
IF ~!%HC_FLIRTCOUNTER_HIGHENOUGH%~ THEN DO ~SetGlobal("C#HU_SoD_OtherRomance","GLOBAL",10)~ + other_romance_15
END

IF ~~ THEN other_romance_15
SAY ~[Husam]Zurück zu Eurer eigentlichen Frage.~
IF ~!%HC_FLIRTCOUNTER_HIGHENOUGH%~ THEN + pid_konditionen_03
END
END //APPEND
