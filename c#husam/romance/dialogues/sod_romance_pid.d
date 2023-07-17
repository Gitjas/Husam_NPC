
/* PID */
/* additions to normal pid state "pid" */
EXTEND_TOP c#husamj %pid% #10
+ ~%IT_IS_SOD%
Global("C#HU_SoDPID_no_drunk2","LOCALS",0)~ + ~Es kam unerwartet, als Ihr Euch in Baldurs Tor zu erkennen gegeben habt.~ DO ~SetGlobal("C#HU_SoDPID_no_drunk2","LOCALS",1)~ + no_drunk_01
+ ~%IT_IS_SOD%
Global("C#HU_SoDPID_persoenlich","LOCALS",0)~ + ~Erzählt mir etwas von Euch, Husam.~ DO ~SetGlobal("C#HU_SoDPID_persoenlich","LOCALS",1)~ + persoenlich_00
+ ~%IT_IS_SOD%
Global("C#HU_SoDPID_persoenlich","LOCALS",1)~ + ~Erzählt mir etwas von Euch, Husam.~ + persoenlich
END

EXTEND_BOTTOM c#husamj %pid% #1
+ ~%IT_IS_SOD%
Global("C#HU_SoDPID_zusarb","LOCALS",1)
!Global("C#HusamRomanceActive","GLOBAL",3)~ + ~(Ihr möchtet mit Husam flirten.)~ + pid_flirts
+ ~%IT_IS_SOD%
Global("C#HU_SoDPID_zusarb","LOCALS",1)
!Global("C#HusamRomanceActive","GLOBAL",3)~ + ~(Ihr versucht, Husam näher zu kommen.)~ + pid_flirts_01
+ ~%IT_IS_SOD%
OR(2)
Global("C#HusamRomanceActive","GLOBAL",1)
Global("C#HusamRomanceActive","GLOBAL",2)~ + ~Zu unserer ... speziellen Vereinbarung ...~ + status_pid
+ ~Global("C#Husam_CheatDialog","GLOBAL",1)~ + ~(Öffnet den Cheatdialog:) Ich möchte die Voraussetzungen für die Romanze setzen.~ + test_cheats
END

/* Additions to "st_allianc" ("About our alliance...") to shut down any romance content before it starts */

EXTEND_BOTTOM c#husamj %st_alliance% #2
+ ~Global("C#%NPCname%Joined","GLOBAL",2)~ + @200020 /* ~I want to give you instructions how to follow me.~ */ + %script_chose%
+ ~Global("C#HU_SoDPID_romstage1","LOCALS",0)
Global("C#HusamRomanceActive","GLOBAL",0)~ + ~Unsere Zusammenarbeit wird nicht mehr als die von Kampfgefährten werden. Ich habe kein Interesse daran, Euch persönlich näher zu kommen.~ + pid_konditionen_08 
+ ~GlobalGT("C#HU_SoDPID_romstage1","LOCALS",0)
Global("C#HusamRomanceActive","GLOBAL",0)~ + ~Trotz unserer vergangenen Unterhaltungen wird unsere Zusammenarbeit nicht mehr als die von Kampfgefährten werden. Ich habe kein Interesse mehr daran, Euch persönlich näher zu kommen.~ + pid_konditionen_08
+ ~%IT_IS_SOD%
OR(2)
Global("C#HusamRomanceActive","GLOBAL",1)
Global("C#HusamRomanceActive","GLOBAL",2)~ + ~Zu unserer ... speziellen Vereinbarung ...~ + status_pid
END


APPEND c#husamj

//##
IF ~~ THEN test_cheats
SAY ~Wähle die Voraussetzungen:~
+ ~Global("C#HusamRomanceActive","GLOBAL",0)
Global("C#HU_SoDPID_romstage1","LOCALS",0)
Global("C#HU_SoDPID_bg1recheat","LOCALS",0)~ + ~bg1re Option 1: Husam und PC hatten in Baldurs Tor durch bg1re Intimitäten.~ DO ~SetGlobal("C#HU_SoDPID_bg1recheat","LOCALS",1) SetGlobal("RE1_HusamSex","GLOBAL",1)
SetGlobal("C#LC_HusamEncounter","GLOBAL",10)~ + test_cheats_01
+ ~Global("C#HusamRomanceActive","GLOBAL",0)
Global("C#HU_SoDPID_romstage1","LOCALS",0)
Global("C#HU_SoDPID_bg1recheat","LOCALS",0)~ + ~bg1re Option 2: Husam hat in BG über bg1re Intimitäten angeboten aber HC hat abgelehnt / abgebrochen.~ DO ~SetGlobal("C#HU_SoDPID_bg1recheat","LOCALS",2) SetGlobal("C#LC_HusamEncounter","GLOBAL",4)
SetGlobal("RE1_HusamSex","GLOBAL",0)~ + test_cheats_01
+ ~Global("C#HusamRomanceActive","GLOBAL",0)
Global("C#HU_SoDPID_romstage1","LOCALS",0)
Global("C#HU_SoDPID_bg1recheat","LOCALS",0)~ + ~bg1re Option 3: Es gab nichts in Baldurs Tor (z.B. bg1re war nicht installiert oder keine der Optionen wurde gewählt).~ DO ~SetGlobal("C#HU_SoDPID_bg1recheat","LOCALS",3) SetGlobal("RE1_HusamSex","GLOBAL",0)
SetGlobal("C#LC_HusamEncounter","GLOBAL",0)~ + test_cheats_01
+ ~GlobalGT("C#HU_SoDPID_bg1recheat","LOCALS",0)~ + ~bg1re Optionen: Ich möchte neu wählen.~ DO ~SetGlobal("C#HU_SoDPID_bg1recheat","LOCALS",0)
SetGlobal("RE1_HusamSex","GLOBAL",0)
SetGlobal("C#LC_HusamEncounter","GLOBAL",0)~ + test_cheats_01
++ ~Es existiert eine andere feste Beziehung (überschreibt Detektion von anderen Werbern.)~ DO ~SetGlobal("C#HU_SoD_OtherRomance","GLOBAL",5)~ + test_cheats_01
+ ~GlobalLT("C#HU_SoD_OtherRomance","GLOBAL",5)~ + ~Es gibt andere Werber.~ DO ~SetGlobal("C#HU_SoD_OtherRomance","GLOBAL",1)~ + test_cheats_01
++ ~Ermögliche die SoD-eigenen Cheats, z.B. für das Vorspulen des Spiels (Drücken der Taste "b" öffnet dann den Cheatdialog.)~ DO ~SetGlobal("BD_QAMODE","GLOBAL",1)~ + test_cheats_01
++ ~Fertig mit Wählen.~ EXIT
END

IF ~~ THEN test_cheats_01
SAY ~(Variable ist gesetzt.)~
IF ~~ THEN + test_cheats
END

IF ~~ THEN persoenlich_00
SAY ~[Husam]Ich sehe nicht recht, wie ein Austausch persönlicher Informationen unsere Pläne voranbringt, <CHARNAME>.~
IF ~~ THEN + persoenlich
END

IF ~~ THEN persoenlich
SAY ~[Husam]Über das Geschäftliche bin ich gerne bereit zu sprechen. Was möchtet Ihr wissen?~ 
+ ~Global("C#HU_SoDPID_sd_stellung","LOCALS",0)~ + ~Was genau ist Eure Stellung bei den Schattendieben?~ DO ~SetGlobal("C#HU_SoDPID_sd_stellung","LOCALS",1)~ + sd_stellung
+ ~Global("C#HU_SoDPID_sd_beginn","LOCALS",0)~ + ~Wie seid Ihr zu den Schattendieben gekommen?~ DO ~SetGlobal("C#HU_SoDPID_sd_beginn","LOCALS",1)~ + sd_beginn
+ ~Global("C#HU_SoDPID_anschluss_01","LOCALS",0)~ + ~Ihr habt gesagt, dass Ihr Euch mir aus freien Stücken angeschlossen habt. Arbeiten die Schattendiebe denn nicht für gewöhnlich verdeckter?~ DO ~SetGlobal("C#HU_SoDPID_anschluss_01","LOCALS",1)~ + anschluss_01

+ ~Global("C#HU_SoD_OtherRomance","GLOBAL",0) 
Global("C#HU_SoDPID_zusarb","LOCALS",0)
!Global("C#HusamRomanceActive","GLOBAL",3)
%HC_FLIRTCOUNTER_HIGHENOUGH%~ + ~Ich würde Euch aber gerne genauer kennen lernen, Husam.~ DO ~SetGlobal("C#HU_SoDPID_zusarb","LOCALS",1) SetGlobal("C#HU_SoDPID_romstage1","LOCALS",10)~ + pid_wohlbefinden_01
+ ~Global("C#HU_SoDPID_zusarb","LOCALS",0)
OR(2)
	Global("C#HusamRomanceActive","GLOBAL",3)
	!%HC_FLIRTCOUNTER_HIGHENOUGH%~ + ~Ich würde Euch aber gerne genauer kennen lernen, Husam.~ DO ~SetGlobal("C#HU_SoDPID_zusarb","LOCALS",1)~ + pid_zusammenarbeit_01

+ ~Global("C#HU_SoD_OtherRomance","GLOBAL",0)
Global("C#HU_SoDPID_zusarb","LOCALS",0)
!Global("C#HusamRomanceActive","GLOBAL",3)
%HC_FLIRTCOUNTER_HIGHENOUGH%~ + ~Nun, ich fühle mich einfach wohler, wenn ich die Leute kenne, mit denen ich zusammenarbeite, Husam.~ DO ~SetGlobal("C#HU_SoDPID_zusarb","LOCALS",1) SetGlobal("C#HU_SoDPID_romstage1","LOCALS",10)~ + pid_wohlbefinden_01
+ ~Global("C#HU_SoDPID_zusarb","LOCALS",0)
OR(2)
	Global("C#HusamRomanceActive","GLOBAL",3)
	!%HC_FLIRTCOUNTER_HIGHENOUGH%~ + ~Nun, ich fühle mich einfach wohler, wenn ich die Leute kenne, mit denen ich zusammenarbeite, Husam.~ DO ~SetGlobal("C#HU_SoDPID_zusarb","LOCALS",1)~ + pid_zusammenarbeit_01

+ ~Global("C#HU_SoDPID_pid_flirts","LOCALS",0)
!Global("C#HusamRomanceActive","GLOBAL",3)~ + ~Wer sagt denn was von Informationen? Wir können ja auch einfach miteinander ... reden. (Augenaufschlag)~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1) SetGlobal("C#HU_SoDPID_pid_flirts","LOCALS",1)~ + pid_flirts
+ ~Global("C#HU_SoDPID_pid_more_02","LOCALS",0)~ + ~Ihr seid nicht der Typ, der sich emotional bindet, oder? ~ DO ~SetGlobal("C#HU_SoDPID_pid_more_02","LOCALS",1)~ + more_02
++ ~Lasst mich noch etwas anderes fragen.~ + %pid%
+ ~%IT_IS_SOD%
Global("C#HU_SoDPID_zusarb","LOCALS",1)
!Global("C#HusamRomanceActive","GLOBAL",3)~ + ~(Ihr möchtet mit Husam flirten.)~ + pid_flirts
+ ~%IT_IS_SOD%
Global("C#HU_SoDPID_zusarb","LOCALS",1)
!Global("C#HusamRomanceActive","GLOBAL",3)~ + ~(Ihr versucht, Husam näher zu kommen.)~ + pid_flirts_01
+ ~%IT_IS_SOD%~ + @13 /* About our alliance... */ + %st_alliance%
++ ~Ich habe keine weiteren Fragen.~ EXIT
END

IF ~~ THEN pid_flirts
SAY ~[Husam]Erkenne ich da Schalk in Euren Augen, <CHARNAME>?~
+ ~Global("C#LC_HusamEncounter","GLOBAL",0)
Global("C#HU_SoDPID_no_drunk","LOCALS",0)~ + ~So gefallt Ihr mir viel besser als der lallende Säufer, für den Ihr Euch zu Beginn in Baldurs Tor ausgegeben habt, Husam.~ DO ~SetGlobal("C#HU_SoDPID_no_drunk","LOCALS",1) IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + no_drunk
++ ~Was machen Schattendiebe eigentlich so in ihrer Freizeit, Husam? (Placeholder, increases flirtcount by one)~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + placeholder //pid_flirts //(etcpp) 
++ ~You mentioned you are capable of handling tools of all kinds, Husam? What tools were you talking about, exactly? (purr)(Placeholder, increases flirtcount by one)~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + placeholder //pid_flirts //(etcpp) placeholder
++ ~Als Dieb braucht Ihr sicher sehr geschickte Hände und ... Finger, Husam. Habt Ihr da spezielle Fingerübungen, um sie alle geschmeidig zu halten?(Placeholder, increases flirtcount by one)~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + placeholder //pid_flirts //(etcpp) placeholder
+ ~Global("C#HU_SoDPID_pid_more_01","LOCALS",0)~ + ~Ihr seid ein sehr attraktiver Mann, Husam.~ DO ~SetGlobal("C#HU_SoDPID_pid_more_01","LOCALS",1) IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + more_01

//++ ~(Ihr zwinkert Husam zu.)~ + (etcpp)

++ ~Lasst mich noch etwas anderes fragen.~ + %pid%
+ ~%IT_IS_SOD%
Global("C#HU_SoDPID_persoenlich","LOCALS",0)~ + ~Erzählt mir etwas von Euch, Husam.~ DO ~SetGlobal("C#HU_SoDPID_persoenlich","LOCALS",1)~ + persoenlich_00
+ ~%IT_IS_SOD%
Global("C#HU_SoDPID_persoenlich","LOCALS",1)~ + ~Erzählt mir etwas von Euch, Husam.~ + persoenlich
+ ~%IT_IS_SOD%
Global("C#HU_SoDPID_zusarb","LOCALS",1)
!Global("C#HusamRomanceActive","GLOBAL",3)~ + ~(Ihr versucht, Husam näher zu kommen.)~ + pid_flirts_01
+ ~%IT_IS_SOD%~ + @13 /* About our alliance... */ + %st_alliance%
++ ~Ich habe keine weiteren Fragen.~ EXIT
END

IF ~~ THEN placeholder
SAY ~(Flirtcount increased by 1 - Husam mag das!)~
IF ~~ THEN + pid_flirts
END

IF ~~ THEN pid_flirts_01
SAY ~[Husam]Ja, teuerster Held?~ ~Ja, teuerste Heldin?~

+ ~Global("C#HU_SoDPID_friends","LOCALS",0)~ + ~Husam, könnt Ihr Euch vorstellen, dass wir Freunde werden?~ DO ~SetGlobal("C#HU_SoDPID_friends","LOCALS",1)~ + friends_01

/* after Husam said he doesn't want to share private details. */
/* HC did not reach flirtcount when asking the question */
/* no bg1re - no other committed romance */
+ ~Global("C#HU_SoDPID_zusarb","LOCALS",1)
Global("C#HU_SoDPID_romstage1","LOCALS",0)
!GlobalGT("C#HU_SoD_OtherRomance","GLOBAL",3)
Global("RE1_HusamSex","GLOBAL",0)
!Global("C#LC_HusamEncounter","GLOBAL",4)
!Global("C#LC_HusamEncounter","GLOBAL",25)~ + ~Austausch von Details aus unserer Vergangenheit ist nicht so das Eure, aber wie ist es denn mit Austausch von eher intimen ... körperlichen Details?~ + pid_konditionen_01
/* follow-up PID - first question was asked too early */
+ ~Global("C#HU_SoDPID_romstage1","LOCALS",1)
!GlobalGT("C#HU_SoD_OtherRomance","GLOBAL",3)
GlobalGT("bd_plot","global",99)
Global("RE1_HusamSex","GLOBAL",0)
!Global("C#LC_HusamEncounter","GLOBAL",4)
!Global("C#LC_HusamEncounter","GLOBAL",25)~ + ~Nun reisen wir ja schon einen Moment zusammen. Habt Ihr mittlerweile einen Überblick über die Umstände zum Austausch von nonverbalen ... intimen Details zwischen uns beiden, Husam?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1) SetGlobal("C#HU_SoDPID_romstage1","LOCALS",3)~ + pid_konditionen_03_a
/* follow-up PID - first question was asked late enough */
+ ~Global("C#HU_SoDPID_romstage1","LOCALS",2)
!GlobalGT("C#HU_SoD_OtherRomance","GLOBAL",3)
Global("RE1_HusamSex","GLOBAL",0)
!Global("C#LC_HusamEncounter","GLOBAL",4)
!Global("C#LC_HusamEncounter","GLOBAL",25)~ + ~Wie wären denn die nötigen Umstände zum Austausch von nonverbalen ... intimen Details mit Euch auf unserer momentanen gemeinsamen Reise, Husam?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1) SetGlobal("C#HU_SoDPID_romstage1","LOCALS",3)~ + pid_konditionen_03

/* no bg1re - other committed romance is active */
+ ~Global("C#HU_SoDPID_zusarb","LOCALS",1)
Global("C#HU_SoDPID_romstage1","LOCALS",0)
GlobalGT("C#HU_SoD_OtherRomance","GLOBAL",3)
Global("RE1_HusamSex","GLOBAL",0)
!Global("C#LC_HusamEncounter","GLOBAL",4)
!Global("C#LC_HusamEncounter","GLOBAL",25)~ + ~Austausch von Details aus unserer Vergangenheit ist nicht so das Eure, aber wie ist es denn mit Austausch von eher intimen ... körperlichen Details?~ + other_romance_01

/* this question is repetitive - no change of variables */
+ ~Global("C#HU_SoDPID_romstage1","LOCALS",1)
GlobalLT("bd_plot","global",100)
GlobalGT("C#HU_SoD_OtherRomance","GLOBAL",3)
Global("RE1_HusamSex","GLOBAL",0)
!Global("C#LC_HusamEncounter","GLOBAL",4)
!Global("C#LC_HusamEncounter","GLOBAL",25)~ + ~Wie wären denn die nötigen Umstände zum Austausch von nonverbalen ... intimen Details mit Euch auf unserer momentanen gemeinsamen Reise, Husam?~ + pid_konditionen_02_b

/* game is advanced enough - next stage */
+ ~Global("C#HU_SoDPID_romstage1","LOCALS",1)
GlobalGT("bd_plot","global",99)
GlobalGT("C#HU_SoD_OtherRomance","GLOBAL",3)
Global("RE1_HusamSex","GLOBAL",0)
!Global("C#LC_HusamEncounter","GLOBAL",4)
!Global("C#LC_HusamEncounter","GLOBAL",25)~ + ~Nun reisen wir ja schon einen Moment zusammen. Habt Ihr mittlerweile einen Überblick über die Umstände zum Austausch von nonverbalen ... intimen Details zwischen uns beiden, Husam?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1) SetGlobal("C#HU_SoDPID_romstage1","LOCALS",3)~ + other_romance_10
+ ~Global("C#HU_SoDPID_romstage1","LOCALS",2)
GlobalGT("C#HU_SoD_OtherRomance","GLOBAL",3)
Global("RE1_HusamSex","GLOBAL",0)
!Global("C#LC_HusamEncounter","GLOBAL",4)
!Global("C#LC_HusamEncounter","GLOBAL",25)~ + ~Wie wären denn die nötigen Umstände zum Austausch von nonverbalen ... intimen Details mit Euch auf unserer momentanen gemeinsamen Reise, Husam?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1) SetGlobal("C#HU_SoDPID_romstage1","LOCALS",3)~ + other_romance_10

/* bg1re happened - general pid */
+ ~Global("C#HU_SoDPID_romstage1","LOCALS",0)
OR(3)
GlobalGT("RE1_HusamSex","GLOBAL",0)
Global("C#LC_HusamEncounter","GLOBAL",4)
Global("C#LC_HusamEncounter","GLOBAL",25)~ + ~Ihr hattet mir in Baldurs Tor angeboten, meine ... Nerven zu beruhigen, Husam.~ + bg1re_memento

/* after Husam said he doesn't want to share private details. */
/* HC did not reach flirtcount when asking the question */
/* with bg1re */
/* for any status of other romances */
+ ~Global("C#HU_SoDPID_zusarb","LOCALS",1)
Global("C#HU_SoDPID_romstage1","LOCALS",0)
OR(3)
GlobalGT("RE1_HusamSex","GLOBAL",0)
Global("C#LC_HusamEncounter","GLOBAL",4)
Global("C#LC_HusamEncounter","GLOBAL",25)~ + ~Austausch von Details aus unserer Vergangenheit ist nicht so das Eure, aber wie ist es denn mit Austausch von eher körperlichen ... intimen Details? Ich erinnere mich da an Euer Angebot in Baldurs Tor.~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + bg1re_memento

/* follow up - no other romance is committed */
/* follow-up PID - first question was asked too early */
+ ~Global("C#HU_SoDPID_romstage1","LOCALS",1)
GlobalGT("bd_plot","global",99)
!GlobalGT("C#HU_SoD_OtherRomance","GLOBAL",3)
!%HC_FLIRTCOUNTER_HIGHENOUGH%
OR(3)
GlobalGT("RE1_HusamSex","GLOBAL",0)
Global("C#LC_HusamEncounter","GLOBAL",4)
Global("C#LC_HusamEncounter","GLOBAL",25)~ + ~Nun reisen wir ja schon einen Moment zusammen. Habt Ihr mittlerweile einen Überblick über die Umstände, unter denen Ihr eine Wiederholung Eures Angebots aus Baldurs Tor in Erwägung ziehen würdet, Husam?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1) SetGlobal("C#HU_SoDPID_romstage1","LOCALS",3)~ + pid_konditionen_03_a
/* follow-up PID - first question was asked late enough */
+ ~Global("C#HU_SoDPID_romstage1","LOCALS",2)
!GlobalGT("C#HU_SoD_OtherRomance","GLOBAL",3)
!%HC_FLIRTCOUNTER_HIGHENOUGH%
OR(3)
GlobalGT("RE1_HusamSex","GLOBAL",0)
Global("C#LC_HusamEncounter","GLOBAL",4)
Global("C#LC_HusamEncounter","GLOBAL",25)~ + ~Unter welchen Umständen würdet Ihr denn eine Wiederholung Eures Angebots aus Baldurs Tor in Erwägung ziehen, Husam?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1) SetGlobal("C#HU_SoDPID_romstage1","LOCALS",3)~ + pid_konditionen_03

/* follow up - other romance is committed */
/* follow-up PID - first question was asked too early */
/* this question is repetitive - no change of variables */
+ ~Global("C#HU_SoDPID_romstage1","LOCALS",1)
GlobalLT("bd_plot","global",100)
GlobalGT("C#HU_SoD_OtherRomance","GLOBAL",3)
OR(3)
GlobalGT("RE1_HusamSex","GLOBAL",0)
Global("C#LC_HusamEncounter","GLOBAL",4)
Global("C#LC_HusamEncounter","GLOBAL",25)~ + ~Nun reisen wir ja schon einen Moment zusammen. Habt Ihr mittlerweile einen Überblick über die Umstände, unter denen Ihr eine Wiederholung Eures Angebots aus Baldurs Tor in Erwägung ziehen würdet, Husam?~ + pid_konditionen_02_b
/* follow-up PID - first question was asked too early */
/* next stage - game advanced */
+ ~Global("C#HU_SoDPID_romstage1","LOCALS",1)
GlobalGT("bd_plot","global",99)
GlobalGT("C#HU_SoD_OtherRomance","GLOBAL",3)
OR(3)
GlobalGT("RE1_HusamSex","GLOBAL",0)
Global("C#LC_HusamEncounter","GLOBAL",4)
Global("C#LC_HusamEncounter","GLOBAL",25)~ + ~Nun reisen wir ja schon einen Moment zusammen. Habt Ihr mittlerweile einen Überblick über die Umstände, unter denen Ihr eine Wiederholung Eures Angebots aus Baldurs Tor in Erwägung ziehen würdet, Husam?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1) SetGlobal("C#HU_SoDPID_romstage1","LOCALS",3)~ + other_romance_10
/* follow-up PID - first question was asked late enough */
+ ~Global("C#HU_SoDPID_romstage1","LOCALS",2)
GlobalGT("C#HU_SoD_OtherRomance","GLOBAL",3)
OR(3)
GlobalGT("RE1_HusamSex","GLOBAL",0)
Global("C#LC_HusamEncounter","GLOBAL",4)
Global("C#LC_HusamEncounter","GLOBAL",25)~ + ~Unter welchen Umständen würdet Ihr denn eine Wiederholung Eures Angebots aus Baldurs Tor in Erwägung ziehen, Husam?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1) SetGlobal("C#HU_SoDPID_romstage1","LOCALS",3)~ + other_romance_10

+ ~GlobalGT("RE1_HusamSex","GLOBAL",0) 
Global("C#HU_SoDPID_anschluss_02","LOCALS",0)
!%HC_FLIRTCOUNTER_HIGHENOUGH%~ + ~Sagt, waren unsere ... intensiven Vorbereitungen in Baldurs Tor eigentlich der Grund dafür, dass Ihr Euch mir angeschlossen habt?~ DO ~SetGlobal("C#HU_SoDPID_anschluss_02","LOCALS",1)~ + anschluss_02_a
+ ~GlobalGT("RE1_HusamSex","GLOBAL",0) 
Global("C#HU_SoDPID_anschluss_02","LOCALS",0)
%HC_FLIRTCOUNTER_HIGHENOUGH%~ + ~Sagt, waren unsere ... intensiven Vorbereitungen in Baldurs Tor eigentlich der Grund dafür, dass Ihr Euch mir angeschlossen habt?~ DO ~SetGlobal("C#HU_SoDPID_anschluss_02","LOCALS",1)~ + anschluss_02_b

/* after Husam said he doesn't want to share private details. */
/* HC already reached flirtcount */
/* no other romance committed */
+ ~!GlobalGT("C#HU_SoD_OtherRomance","GLOBAL",3)
OR(2)
Global("C#HU_SoDPID_romstage1","LOCALS",1)
Global("C#HU_SoDPID_romstage1","LOCALS",2)
%HC_FLIRTCOUNTER_HIGHENOUGH%~ + ~Unter welchen Umständen würdet Ihr denn eine Wiederholung Eures Angebots aus Baldurs Tor in Erwägung ziehen, Husam?~ DO ~SetGlobal("C#HU_SoDPID_romstage1","LOCALS",10)~ + pid_wohlbefinden_06

/* general flirty follow up question. HC reached flirt count */
+ ~Global("C#HU_SoDPID_romstage1","LOCALS",3)
%HC_FLIRTCOUNTER_HIGHENOUGH%~ + ~Nun? Wie also sollen wir vertrauter werden, wenn Ihr mich nicht an Euch ranlasst, hmm?~ DO ~SetGlobal("C#HU_SoDPID_romstage1","LOCALS",10)~ + pid_konditionen_10

++ ~Lasst mich noch etwas anderes fragen.~ + %pid%
+ ~%IT_IS_SOD%
Global("C#HU_SoDPID_persoenlich","LOCALS",0)~ + ~Erzählt mir etwas von Euch, Husam.~ DO ~SetGlobal("C#HU_SoDPID_persoenlich","LOCALS",1)~ + persoenlich_00
+ ~%IT_IS_SOD%
Global("C#HU_SoDPID_persoenlich","LOCALS",1)~ + ~Erzählt mir etwas von Euch, Husam.~ + persoenlich
+ ~%IT_IS_SOD%
Global("C#HU_SoDPID_zusarb","LOCALS",1)
!Global("C#HusamRomanceActive","GLOBAL",3)~ + ~(Ihr möchtet mit Husam flirten.)~ + pid_flirts
+ ~%IT_IS_SOD%~ + @13 /* About our alliance... */ + %st_alliance%
++ ~Ich habe keine weiteren Fragen.~ EXIT
END

/* ~Nun, ich fühle mich einfach wohler, wenn ich die Leute kenne, mit denen ich zusammenarbeite, Husam.~ */
IF ~~ THEN pid_zusammenarbeit_01
SAY ~[Husam]Our time together will give us plenty opportunity to learn more of each other, <CHARNAME>. Bitte habt Verständnis, dass der Austausch vergangener Details aus unserem Privatleben nicht zu dem zählt, womit ich unsere Zusammenarbeit ausschmücken möchte.~ 
%Generelle_PID_Optionen%
END

IF ~~ THEN pid_konditionen_01
SAY ~[Husam]Hmm, reger Austausch ohne Konversation, meint Ihr? Es gibt in der Tat viele Möglichkeiten sich besser - um nicht zu sagen, INTIM - kennen zu lernen. Aber eine Affäre mit einem Reisegefährten ... Das birgt in der Regel großes Konfliktpotential.~ 
+ ~GlobalLT("bd_plot","global",100)~ + ~Käme es für Euch denn überhaupt in Frage?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1) SetGlobal("C#HU_SoDPID_romstage1","LOCALS",1)~ + pid_konditionen_02
+ ~GlobalGT("bd_plot","global",99)~ + ~Käme es für Euch denn überhaupt in Frage?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1) SetGlobal("C#HU_SoDPID_romstage1","LOCALS",2)~ + pid_konditionen_02
%Generelle_PID_Optionen%
END

IF ~~ THEN pid_konditionen_02
SAY ~[Husam]Ich bin durchaus mit dem Spiel des unverbindlichen Austauschs körperlicher Intimitäten vertraut. Ich bin jedoch nicht überzeugt, dass die Umstände unserer momentanen Zusammenarbeit solch ... Zeitvertreib zu unserer beiden Zufriedenheit erlauben würde, <CHARNAME>.~
%Generelle_PID_Optionen_bd_plot99%  
IF ~GlobalLT("bd_plot","global",100)~ THEN + pid_konditionen_02_b
END

IF ~~ THEN pid_konditionen_02_b
SAY~[Husam]Ich muss mich noch bezüglich der Situation meines ungewöhnlichen Kooperationspartners Flammende Faust orientieren, bevor ich dazu mehr sagen kann. Lasst uns erst einmal zusammen losziehen und mich die Lage sondieren.~
%Generelle_PID_Optionen%
END

IF ~~ THEN pid_konditionen_03_a
SAY ~[Husam]Ich konnte mir in der Tat einen guten Überblick verschaffen, was hier mit Euch zu reisen für mich bedeutet.~ 
IF ~~ THEN + pid_konditionen_03
END

IF ~~ THEN pid_konditionen_03
SAY ~[Husam]Nun, bevor wir dies in Erwägung ziehen und eine ... befriedigende Übereinkunft diesbezüglich treffen könnten, gäbe es zwei Voraussetzugen, die erfüllt sein müssten - neben dem offensichtlichen, dass ich für eine solche Affäre bereit wäre. Erstens: es darf mich im Ausführen meiner Mission nicht gefährden, und das wird am einfachsten sein, wenn niemand sonst davon erfährt, und zweitens: ich muss von Eurer absoluten Bereitschaft ausgehen können, schon alleine, um Eure Vorlieben noch besser einschätzen können.~
++ ~Meine Bereitschaft? Soll ich mir die Kleider vom Leib reißen und Euch anspringen, damit Ihr überzeugt seid?~ + pid_konditionen_04
+ ~GlobalGT("RE1_HusamSex","GLOBAL",0)~ + ~Nach dem, was in Baldurs Tor geschehen ist, sollte meine Bereitschaft nicht zur Diskussion stehen.~ + pid_konditionen_05
+ ~OR(2)
%HC_FLIRTCOUNTER_HIGHENOUGH%
GlobalGT("RE1_HusamSex","GLOBAL",0)~ + ~Hmmm, besteht da wirklich Zweifel an meiner Bereitschaft, Husam?~ + pid_konditionen_05
+ ~!%HC_FLIRTCOUNTER_HIGHENOUGH%
%HC_FLIRTCOUNTER_NOTICEABLE%
!GlobalGT("RE1_HusamSex","GLOBAL",0)~ + ~Meine Bereitschaft, soso. Und wie genau soll ich die Euch zeigen, wenn Ihr mich nicht ranlasst, hmmm?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + pid_konditionen_06
+ ~!%HC_FLIRTCOUNTER_HIGHENOUGH%
!%HC_FLIRTCOUNTER_NOTICEABLE%
!GlobalGT("RE1_HusamSex","GLOBAL",0)~ + ~Ihr müsstet mich besser kennen, damit der Austausch von gewissen ... privaten Details für Euch in Frage kommt? Aber wie sollen wir denn vertrauter werden, wenn Ihr mich nicht ranlasst, hmmm?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + pid_konditionen_09
++ ~Also erstmal keine ... Handgreiflichkeiten. Nun gut. Euch betrachten und mir dabei was vorstellen darf ich aber ohne Einschränkung?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + pid_konditionen_07
++ ~Boah, dass Ihr alles so verkomplizieren müsst. Vergesst das ganze Thema einfach.~ + pid_konditionen_08
END

IF ~~ THEN pid_konditionen_04
SAY ~[Husam](Er  lächelt.) So attraktiv ich den Gedanken auch finde und das sicherlich Eure Bereitschaft sehr klar darstellen würde, müssten wir doch davon ausgehen, dass ein solcher Moment eine gewisse Unruhe in der Gruppe erzeugen könnte, die Regel Nummer eins gefährden würde.~

+ ~GlobalGT("RE1_HusamSex","GLOBAL",0)~ + ~Nach dem, was in Baldurs Tor geschehen ist, sollte meine Bereitschaft nicht zur Diskussion stehen.~ + pid_konditionen_05
+ ~OR(2)
%HC_FLIRTCOUNTER_HIGHENOUGH%
GlobalGT("RE1_HusamSex","GLOBAL",0)~ + ~Hmmm, besteht da wirklich Zweifel an meiner Bereitschaft, Husam?~ + pid_konditionen_05
+ ~!%HC_FLIRTCOUNTER_HIGHENOUGH%
%HC_FLIRTCOUNTER_NOTICEABLE%
!GlobalGT("RE1_HusamSex","GLOBAL",0)~ + ~Meine Bereitschaft, soso. Und wie genau soll ich die Euch zeigen, wenn Ihr mich nicht ranlasst, hmmm?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + pid_konditionen_06
+ ~!%HC_FLIRTCOUNTER_HIGHENOUGH%
!%HC_FLIRTCOUNTER_NOTICEABLE%
!GlobalGT("RE1_HusamSex","GLOBAL",0)~ + ~Ihr müsstet mich besser kennen, damit der Austausch von gewissen ... privaten Details für Euch in Frage kommt? Aber wie sollen wir denn vertrauter werden, wenn Ihr mich nicht ranlasst, hmmm?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + pid_konditionen_09
++ ~Also erstmal keine ... Handgreiflichkeiten. Nun gut. Euch betrachten und mir dabei was vorstellen darf ich aber ohne Einschränkung?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + pid_konditionen_07
++ ~Boah, dass Ihr alles so verkomplizieren müsst. Vergesst das ganze Thema einfach.~ + pid_konditionen_08
END

IF ~~ THEN pid_konditionen_05
SAY ~[Husam]Das ist in der Tat nicht der Fall. Wie ich bereits sagte bin ich diesem Spiel mitnichten abgeneigt, solange die Umstände passend sind.~
IF ~~ THEN + pid_wohlbefinden_06
END

IF ~~ THEN pid_konditionen_06
SAY ~[Husam]Ich erkenne Ansätze eines recht attraktiven Spiels der doppeldeutigen Worte zwischen uns. Dieses Spiel hat das Potential, uns noch näher zu bringen. Sehr viel näher.~
IF ~~ THEN + pid_konditionen_09
END

IF ~~ THEN pid_konditionen_07
SAY ~[Husam]Selbstverständlich, und ich finde den Gedanken sogar ausgesprochen attraktiv. Wenn ich die Wahl habe, dann würde ich sogar gerne an Euren Fantasien teilhaben, <CHARNAME>. Ich habe die Erfahrung gemacht, dass sie den Appetit auf das "Richtige" enorm steigern können.~
IF ~~ THEN + pid_konditionen_09
END

IF ~~ THEN pid_konditionen_08
SAY ~[Husam]Das ist sicherlich das einfachste. Konzentrieren wir uns auf unsere Mission gegen Caelar und ihren Kreuzzug.~
IF ~~ THEN DO ~SetGlobal("C#HusamRomanceActive","GLOBAL",3)~ EXIT
END

END //APPEND

CHAIN
IF ~~ THEN c#husamj pid_konditionen_09
~[Husam]Ihr seid ... definitiv auf dem richtigen Weg, <CHARNAME>. Macht genau so weiter.~
== c#husamj IF ~Global("C#HU_RomanceCounter","GLOBAL",0)~ THEN ~[Husam]Ich werde mir ebenfalls erlauben, Euren Wunsch noch eingehender zu ... sondieren. Stellt Euch also darauf ein, dass ich hierzu noch tiefer in die Thematik eindringen werde. (Er lächelt.)~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",2)~
END
%Generelle_PID_Optionen%


APPEND c#husamj

IF ~~ THEN pid_konditionen_10
SAY ~[Husam]Eine äußert intelligante Frage, <CHARNAME>, und eine, die ich mir selbst gestellt habe.~
IF ~~ THEN DO ~SetGlobal("C#HU_SoDPID_romstage1","LOCALS",10)~ + pid_wohlbefinden_06
END


/* ~Was genau ist Eure Stellung bei den Schattendieben?~ */
IF ~~ THEN sd_stellung
SAY ~[Husam]Ich bin Abgesandter und Missionär, <CHARNAME>. Der Titel ist eventuell etwas irreführend. Meine Aufgabe ist es nicht, neue Schurken zu finden - obwohl ich das ebenfalls tue, wenn ich vielversprechenden potentiellen Nachwuchs treffe. Ich führe Missionen aus, meist direkt vom Schattenmeister selbst befohlen, die diplomatischen Einfluss haben, häufig im Namen der Schattendiebe selbst. So traft Ihr mich in Baldurs Tor, als ich dafür gearbeitet habe, den Namen der Schattendiebe bezüglich Scars Mord reinzuwaschen - und einen nutzlosen Krieg zwischen der Schwertküste und Amn zu verhindern.~
+ ~Global("C#HU_SoDPID_sd_stellung_01","LOCALS",0)~ + ~Der Schattenmeister selbst? Dann habt Ihr eine sehr hohe Stellung?~ DO ~SetGlobal("C#HU_SoDPID_sd_stellung_01","LOCALS",1)~ + sd_stellung_01
+ ~Global("C#HU_SoDPID_sd_stellung_02","LOCALS",0)~ + ~Leitet Ihr auch eine Gilde?~ DO ~SetGlobal("C#HU_SoDPID_sd_stellung_02","LOCALS",1)~ + sd_stellung_02
+ ~Global("C#HU_SoDPID_sd_stellung_03","LOCALS",0)~ + ~Wer waren all die anderen Schattendiebe, die Euch in Baldurs Tor begleiteten? Sind sie Euch unterstellt?~ DO ~SetGlobal("C#HU_SoDPID_sd_stellung_03","LOCALS",1)~ + sd_stellung_03
%Generelle_PID_Optionen%
END

IF ~~ THEN sd_stellung_01
SAY ~[Husam]Das kann man so sagen, aber das heißt nicht, dass es nicht weitere Angesandte gibt, die mir gleichbürtig sind, und die Hirarchie gegenüber sesshaften Gildenmeistern ist ebenfalls nicht so simpel.~ 
+ ~Global("C#HU_SoDPID_sd_stellung_02","LOCALS",0)~ + ~Leitet Ihr auch eine Gilde?~ DO ~SetGlobal("C#HU_SoDPID_sd_stellung_02","LOCALS",1)~ + sd_stellung_02
+ ~Global("C#HU_SoDPID_sd_stellung_03","LOCALS",0)~ + ~Wer waren all die anderen Schattendiebe, die Euch in Baldurs Tor begleiteten? Sind sie Euch unterstellt?~ DO ~SetGlobal("C#HU_SoDPID_sd_stellung_03","LOCALS",1)~ + sd_stellung_03
%Generelle_PID_Optionen%
END

IF ~~ THEN sd_stellung_02
SAY ~[Husam]Nein. Ich bin kein Gildenmeister und wollte es auch nie sein. Das Potential für ... diplomatisches Arbeiten ist sehr beschränkt, wenn man sesshaft in einer Gilde geworden ist. Die Probleme werden schnell unglaublich profan - stimmt der wöchentliche Goldzufluss, welcher Schurke muss welchem Kunden zuarbeiten, welche Ressourcen müssen an die Hauptgilde abgetreten werden, welcher Schurke hat mit wem Streit angefangen ... Es würde mich entsetzlich langweilen, <CHARNAME>, und ich würde nicht lange in dieser Position bleiben.~
+ ~Global("C#HU_SoDPID_sd_stellung_01","LOCALS",0)~ + ~Der Schattenmeister selbst? Dann habt Ihr eine sehr hohe Stellung?~ DO ~SetGlobal("C#HU_SoDPID_sd_stellung_01","LOCALS",1)~ + sd_stellung_01
+ ~Global("C#HU_SoDPID_sd_stellung_03","LOCALS",0)~ + ~Wer waren all die anderen Schattendiebe, die Euch in Baldurs Tor begleiteten? Sind sie Euch unterstellt?~ DO ~SetGlobal("C#HU_SoDPID_sd_stellung_03","LOCALS",1)~ + sd_stellung_03
%Generelle_PID_Optionen%
END

IF ~~ THEN sd_stellung_03
SAY ~[Husam]Für diese Mission, ja. Aber nicht alle sind es sonst auch. Wir wollten stark genug auftreten, also hatte ich um Verstärkung bei näher gelegenen Gildenmeistern gebeten.~
++ ~"Gebeten"? Hatten die Gildenmeister denn eine Wahl?~ + sd_stellung_04
++ ~Ihr könnt also einfach Ressourcen von Gildenmeistern einfordern?~ + sd_stellung_04
+ ~Global("C#HU_SoDPID_sd_stellung_01","LOCALS",0)~ + ~Der Schattenmeister selbst? Dann habt Ihr eine sehr hohe Stellung?~ DO ~SetGlobal("C#HU_SoDPID_sd_stellung_01","LOCALS",1)~ + sd_stellung_01
+ ~Global("C#HU_SoDPID_sd_stellung_02","LOCALS",0)~ + ~Leitet Ihr auch eine Gilde?~ DO ~SetGlobal("C#HU_SoDPID_sd_stellung_02","LOCALS",1)~ + sd_stellung_02
%Generelle_PID_Optionen%
END

IF ~~ THEN sd_stellung_04
SAY ~[Husam]Ich bin mitnichten mächtiger als ein Gildenmeister, und kann sie nicht einfach kommandieren. Aber wenn ich und meine Kameraden Ressourcen benötigen, um unsere Nachforschungen und Aufträge auszuführen, und ein Gildenmeister enthält diese uns vor und gefährdet dadurch eine Mission, die uns der Schattenmeister selbst aufgetragen hat - nunja, Ihr könnt Euch denken, dass das für diesen Gildenmeister gewisse ... politische Komplikationen nach sich ziehen würde.~
++ ~Ist das auch die Basis Eurer Zusammenarbeit mit der Diebesgilde in Baldurs Tor?~ + sd_stellung_05
+ ~Global("C#HU_SoDPID_sd_stellung_01","LOCALS",0)~ + ~Der Schattenmeister selbst? Dann habt Ihr eine sehr hohe Stellung?~ DO ~SetGlobal("C#HU_SoDPID_sd_stellung_01","LOCALS",1)~ + sd_stellung_01
+ ~Global("C#HU_SoDPID_sd_stellung_02","LOCALS",0)~ + ~Leitet Ihr auch eine Gilde?~ DO ~SetGlobal("C#HU_SoDPID_sd_stellung_02","LOCALS",1)~ + sd_stellung_02
%Generelle_PID_Optionen%
END

IF ~~ THEN sd_stellung_05
SAY ~[Husam]In gewisser Weise, allerdings ist diese noch mehr auf Gegenseitigkeit gebaut. Wir profitieren von der lokalen Unterstützung in Baldurs Tor, und die Gilde dort profitiert von der Rückendeckung und Vernetzungen der Schattendiebe.~
+ ~Global("C#HU_SoDPID_sd_stellung_01","LOCALS",0)~ + ~Der Schattenmeister selbst? Dann habt Ihr eine sehr hohe Stellung?~ DO ~SetGlobal("C#HU_SoDPID_sd_stellung_01","LOCALS",1)~ + sd_stellung_01
+ ~Global("C#HU_SoDPID_sd_stellung_02","LOCALS",0)~ + ~Leitet Ihr auch eine Gilde?~ DO ~SetGlobal("C#HU_SoDPID_sd_stellung_02","LOCALS",1)~ + sd_stellung_02
%Generelle_PID_Optionen%
END

/* ~Wie seid Ihr zu den Schattendieben gekommen?~ */
IF ~~ THEN sd_beginn
SAY ~[Husam]Ich hatte schon immer ein gewisses Talent dafür, Probleme auf ... diplomatischem Wege zu lösen, mit ein wenig Nachhelfen durch Bestechung hier und Einschüchterung da. Verbunden mit der uneingeschränkten Bereitschaft, Verräter wenn nötig leise verschwinden zu lassen war es nur eine Frage der Zeit, bis ich meinen Weg in eine Schattendiebesgilde fand. Die klare Struktur und Regeln sagten mir sehr zu, bei den politischen Missionen konnte ich mich beweisen, und so erlangte ich die Position, die ich nun habe.~
%Generelle_PID_Optionen%
END


/* ~Ihr habt gesagt, dass Ihr Euch mir aus freien Stücken angeschlossen habt. Arbeiten die Schattendiebe denn nicht für gewöhnlich verdeckter?~ */
IF ~~ THEN anschluss_01
SAY ~[Husam]Wenn es nötig ist. Manchmal ist eine direkte Zusammenarbeit jedoch ... aufschlussreicher. Und ich bin mir sicher, dass sie für uns beide auch ergiebiger sein kann.~
+ ~Global("C#HU_SoDPID_anschluss_02","LOCALS",1) 
Global("C#HU_SoDPID_anschluss_03","LOCALS",1)~ + ~Ich war nur neugierig. Kein Grund, gleich defensiv zu werden.~ DO ~SetGlobal("C#HU_SoDPID_anschluss_03","LOCALS",1)~ + anschluss_03
+ ~Global("C#HU_SoDPID_anschluss_02","LOCALS",1)~ + ~Das klingt alles ziemlich ominös. Könnt Ihr nicht ein wenig konkreter werden?~ + anschluss_03
+ ~Global("C#HU_SoDPID_anschluss_02","LOCALS",1)~ + ~Sprecht Ihr von Caelar und Eurem Auftrag?~ + anschluss_04
+ ~Global("C#HU_SoDPID_anschluss_02","LOCALS",1)
!%HC_FLIRTCOUNTER_HIGHENOUGH%~ + ~Wie dem auch sei. Ich wollte sicherstellen, dass genau das nicht der Grund für Euren Anschluss war.~ + anschluss_06
IF ~!Global("C#HU_SoDPID_anschluss_02","LOCALS",1)~ THEN + %pid%
END

/* ~Sagt, waren unsere ... intensiven Vorbereitungen in Baldurs Tor eigentlich der Grund dafür, dass Ihr Euch mir angeschlossen habt?~ */
/* for !%HC_FLIRTCOUNTER_HIGHENOUGH% == not high enough */
IF ~~ THEN anschluss_02_a
SAY ~[Husam]War das eine Fangfrage, <CHARNAME>?~
+ ~Global("C#HU_SoDPID_anschluss_03","LOCALS",1)~ + ~Ich war nur neugierig. Kein Grund, gleich defensiv zu werden.~ DO ~SetGlobal("C#HU_SoDPID_anschluss_03","LOCALS",1)~ + anschluss_03
+ ~Global("C#HU_SoDPID_anschluss_01","LOCALS",0)~ + ~Nun, Ihr HABT gesagt, dass Ihr Euch aus freien Stücken angeschlossen habt. Arbeiten die Schattendiebe denn nicht für gewöhnlich verdeckter?~ DO ~SetGlobal("C#HU_SoDPID_anschluss_01","LOCALS",1)~ + anschluss_01
+ ~Global("C#HusamRomanceActive","GLOBAL",0)~ + ~Und wenn ja, was antwortet Ihr dann, hmmm?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + anschluss_08
+ ~Global("C#HusamRomanceActive","GLOBAL",1)~ + ~Und wenn ja, was antwortet Ihr dann, hmmm?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + anschluss_09
+ ~Global("C#HusamRomanceActive","GLOBAL",2)~ + ~Und wenn ja, was antwortet Ihr dann, hmmm?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + anschluss_10
++ ~War es denn so?~ + anschluss_04
++ ~Ach, egal. So wichtig ist mir das wirklich nicht.~ + anschluss_05
++ ~Nein. Im Gegenteil. Ich wollte sicherstellen, dass genau das nicht der Grund war.~ + anschluss_06
END

/* ~Sagt, waren unsere ... intensiven Vorbereitungen in Baldurs Tor eigentlich der Grund dafür, dass Ihr Euch mir angeschlossen habt?~ */
/* for %HC_FLIRTCOUNTER_HIGHENOUGH% == high enough */
IF ~~ THEN anschluss_02_b
SAY ~[Husam]War das eine Fangfrage, <CHARNAME>? Dann müsst Ihr noch ein wenig üben.~
+ ~Global("C#HU_SoDPID_anschluss_03","LOCALS",1)~ + ~Ich war nur neugierig. Kein Grund, gleich defensiv zu werden.~ DO ~SetGlobal("C#HU_SoDPID_anschluss_03","LOCALS",1)~ + anschluss_03
+ ~Global("C#HU_SoDPID_anschluss_01","LOCALS",0)~ + ~Nun, Ihr HABT gesagt, dass Ihr Euch aus freien Stücken angeschlossen habt. Arbeiten die Schattendiebe denn nicht für gewöhnlich verdeckter?~ DO ~SetGlobal("C#HU_SoDPID_anschluss_01","LOCALS",1)~ + anschluss_01
+ ~Global("C#HusamRomanceActive","GLOBAL",0)~ + ~Und wenn ja, was antwortet Ihr dann, hmmm?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + anschluss_08
+ ~Global("C#HusamRomanceActive","GLOBAL",1)~ + ~Und wenn ja, was antwortet Ihr dann, hmmm?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + anschluss_09
+ ~Global("C#HusamRomanceActive","GLOBAL",2)~ + ~Und wenn ja, was antwortet Ihr dann, hmmm?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + anschluss_10
++ ~War es denn so?~ + anschluss_04
++ ~Ach, egal. So wichtig ist mir das wirklich nicht.~ + anschluss_05
++ ~Nein. Im Gegenteil. Ich wollte sicherstellen, dass genau das nicht der Grund war.~ + anschluss_06
END

IF ~~ THEN anschluss_03
SAY ~[Husam]Möchtet Ihr denn meine Zustimmung hören?~
+ ~Global("C#HU_SoDPID_anschluss_01","LOCALS",0)~ + ~Nun, Ihr HABT gesagt, dass Ihr Euch aus freien Stücken angeschlossen habt. Arbeiten die Schattendiebe denn nicht für gewöhnlich verdeckter?~ DO ~SetGlobal("C#HU_SoDPID_anschluss_01","LOCALS",1)~ + anschluss_01
+ ~Global("C#HusamRomanceActive","GLOBAL",0)~ + ~Und wenn ja, was antwortet Ihr dann, hmmm?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + anschluss_08
+ ~Global("C#HusamRomanceActive","GLOBAL",1)~ + ~Und wenn ja, was antwortet Ihr dann, hmmm?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + anschluss_09
+ ~Global("C#HusamRomanceActive","GLOBAL",2)~ + ~Und wenn ja, was antwortet Ihr dann, hmmm?~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + anschluss_10
++ ~War es denn so?~ + anschluss_04
++ ~Ach, egal. So wichtig ist mir das wirklich nicht.~ + anschluss_05
++ ~Nein. Im Gegenteil. Ich wollte sicherstellen, dass genau das nicht der Grund war.~ + anschluss_06
END

IF ~~ THEN anschluss_04
SAY ~[Husam]Wer weiß. (er lächelt)~
IF ~~ THEN DO ~SetGlobal("C#HU_SoDPID_anschluss_02","LOCALS",2)~ + anschluss_05
END

IF ~~ THEN anschluss_05
SAY ~[Husam]Ich fürchte, das ist alles, was ich Euch dazu sagen werde. Zumindest jetzt.~
%Generelle_PID_Optionen%
END

IF ~~ THEN anschluss_06
SAY ~[Husam]Ah - eine ... Fortführung unserer Intimitäten kommt für Euch also nicht in Frage?~
++ ~Das habe ich so nicht gesagt. Ich wollte nur sichergehen, dass es nicht Euer Grund war, Euch mir anzuschließen.~ DO ~SetGlobal("C#HU_SoDPID_anschluss_02","LOCALS",2)~ + anschluss_06_b
++ ~Ich gehe erstmal davon aus, dass es keine Fortführung geben wird, aber ich sage damit mitnichten, dass ich Euch nicht mehr attraktiv fände.~ DO ~SetGlobal("C#HU_SoDPID_anschluss_02","LOCALS",2)~ + anschluss_06_b
++ ~Genau das. Diese Art der Zusammenkunft wird es zwischen uns nicht mehr geben, die Zeiten sind jetzt andere. Lassen wir das Vergangene ruhen.~ DO ~SetGlobal("C#HU_SoDPID_anschluss_02","LOCALS",2) 
SetGlobal("C#HusamRomanceActive","GLOBAL",3)~ + anschluss_06_b
END

IF ~~ THEN anschluss_06_b
SAY ~[Husam]Dann kann ich Euch beruhigen. Ich denke, ich habe Euch schon erklärt, warum ich mich Euch angeschlossen habe: (bla bla bla)~
%Generelle_PID_Optionen%
END

IF ~~ THEN anschluss_07
SAY ~[Husam]Und das Mysterium entzaubern? Nein. (Er lächelt.)~
IF ~~ THEN DO ~SetGlobal("C#HU_SoDPID_anschluss_02","LOCALS",2)~ + anschluss_05
END

IF ~~ THEN anschluss_08
SAY ~[Husam]Dann antworte ich, dass diese Eure Antwort neue Erkenntnisse für mich über Eure Motivation birgt, die ich sehr interessant finde.~
IF ~~ THEN DO ~SetGlobal("C#HU_SoDPID_anschluss_02","LOCALS",2)~ + anschluss_05
END

IF ~~ THEN anschluss_09
SAY ~[Husam]Dann antworte ich, dass diese Eure Antwort neue Erkenntnisse für mich über Eure Motivation birgt, die ich ausgesprochen ... attraktiv finde.~
IF ~~ THEN DO ~SetGlobal("C#HU_SoDPID_anschluss_02","LOCALS",2)~ + anschluss_05
END

IF ~~ THEN anschluss_10
SAY ~[Husam]Dann antworte ich, dass mir diese Eure Antwort äußerst gut gefällt.~
%Generelle_PID_Optionen%
END

/* ~Ihr hattet mir in Baldurs Tor geholfen, meine ... Nerven zu beruhigen, Husam.~ */
IF ~~ THEN bg1re_memento
SAY ~[Husam]Oh, ja. Ich erinnere mich ebenfalls.~
/* intimacies happened */
+ ~GlobalGT("RE1_HusamSex","GLOBAL",0)~ + ~Warum so reserviert? War es so schlimm?~ + bg1re_memento_01
+ ~GlobalGT("RE1_HusamSex","GLOBAL",0)~ + ~Meint Ihr, dass sich so eine Gelegenheit wieder bietet?~ + bg1re_memento_03
+ ~GlobalGT("RE1_HusamSex","GLOBAL",0)~ + ~Jetzt reisen wir sogar zusammen durch die Gegend...~ + bg1re_memento_03
+ ~GlobalGT("RE1_HusamSex","GLOBAL",0)~ + ~Die Begegnung war vor allem sehr körperlich.~ + bg1re_memento_02

/* Husam offered but no i. happened */
+ ~Global("RE1_HusamSex","GLOBAL",0)~ + ~Ihr reagiert sehr reserviert.~ + bg1re_memento_09
+ ~Global("RE1_HusamSex","GLOBAL",0)~ + ~Darf ich denn darauf hoffen, dass Ihr mir so eine Gelegenheit wieder bietet?~ + bg1re_memento_08
+ ~Global("RE1_HusamSex","GLOBAL",0)~ + ~Was Ihr mir anbotet war vor allem sehr körperlich.~ + bg1re_memento_09
++ ~Etwas in der Art wird bei unserer jetzigen Zusammenarbeit nicht geschehen. Ich erwarte, dass Ihr Euch entsprechend zurückhaltet.~ DO ~SetGlobal("C#HusamRomanceActive","GLOBAL",3)~ + bg1re_memento_05
END

IF ~~ THEN bg1re_memento_01
SAY ~[Husam]Nein, ganz und gar nicht, <CHARNAME> - so wollte ich das nicht verstanden wissen. Und ich hoffe, dass Ihr unsere gemeinsame Zeit zu Eurer ... vollsten Zufriedenheit genossen habt.~
++ ~Meint Ihr, dass sich so eine Gelegenheit wieder bietet?~ + bg1re_memento_03
++ ~Jetzt reisen wir sogar zusammen durch die Gegend...~ + bg1re_memento_03
++ ~Unsere letzte Begegnung war vor allem sehr körperlich.~ + bg1re_memento_02
++ ~Etwas in der Art wird bei unserer jetzigen Zusammenarbeit nicht geschehen. Ich erwarte, dass Ihr Euch entsprechend zurückhaltet.~ DO ~SetGlobal("C#HusamRomanceActive","GLOBAL",3)~ + bg1re_memento_05
END

IF ~~ THEN bg1re_memento_02
SAY ~(er lächelt) Das war sie.~
++ ~Meint Ihr, dass sich so eine Gelegenheit wieder bietet?~ + bg1re_memento_03
++ ~Jetzt reisen wir sogar zusammen durch die Gegend...~ + bg1re_memento_03
++ ~Ehrlich gesagt finde ich es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ + pid_wohlbefinden_14
++ ~Etwas in der Art wird bei unserer jetzigen Zusammenarbeit nicht geschehen. Ich erwarte, dass Ihr Euch entsprechend zurückhaltet.~ DO ~SetGlobal("C#HusamRomanceActive","GLOBAL",3) SetGlobal("C#HU_SoDPID_romstage1","LOCALS",9)~ + bg1re_memento_05
END

IF ~~ THEN bg1re_memento_03
SAY ~[Husam]Hättet Ihr das gerne? Dass wir auch bei unserem momentanen Zusammenschluss *internsivere* Zusammenarbeit ansinnen?~
+ ~GlobalGT("C#HU_SoD_OtherRomance","GLOBAL",3)~ + ~Ich würde Euch nicht von der Bettkante stoßen, Husam, davon könnt Ihr ausgehen.~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + other_romance_00
+ ~GlobalLT("bd_plot","global",100)
!GlobalGT("C#HU_SoD_OtherRomance","GLOBAL",3)
Global("RE1_HusamSex","GLOBAL",0)
!%HC_FLIRTCOUNTER_HIGHENOUGH%~ + ~Ich würde Euch nicht von der Bettkante stoßen, Husam, davon könnt Ihr ausgehen.~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1) SetGlobal("C#HU_SoDPID_romstage1","LOCALS",1)~ + bg1re_memento_04
+ ~GlobalGT("bd_plot","global",99)
!GlobalGT("C#HU_SoD_OtherRomance","GLOBAL",3)
Global("RE1_HusamSex","GLOBAL",0)
!%HC_FLIRTCOUNTER_HIGHENOUGH%~ + ~Ich würde Euch nicht von der Bettkante stoßen, Husam, davon könnt Ihr ausgehen.~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1) SetGlobal("C#HU_SoDPID_romstage1","LOCALS",2)~ + bg1re_memento_04

+ ~!GlobalGT("C#HU_SoD_OtherRomance","GLOBAL",3)
OR(2)
GlobalGT("RE1_HusamSex","GLOBAL",0)
%HC_FLIRTCOUNTER_HIGHENOUGH%~ + ~Ich würde Euch nicht von der Bettkante stoßen, Husam, davon könnt Ihr ausgehen.~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + bg1re_memento_07
++ ~Käme das für Euch denn in Frage?~ + bg1re_memento_06
++ ~Ehrlich gesagt finde ich es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ + pid_wohlbefinden_14
++ ~Etwas in der Art wird bei unserer jetzigen Zusammenarbeit nicht geschehen. Ich erwarte, dass Ihr Euch entsprechend zurückhaltet.~ DO ~SetGlobal("C#HusamRomanceActive","GLOBAL",3) SetGlobal("C#HU_SoDPID_romstage1","LOCALS",9)~ + bg1re_memento_05
END

IF ~~ THEN bg1re_memento_04
SAY ~[Husam]Hmmm, eine Affäre mit einem Reisegefährten ... Das birgt in der Regel großes Konfliktpotential. Auch dazu wäre ich bereit, aber nur unter den entsprechenden Bedingungen. Ich bin jedoch noch nicht sicher, ob unsere momentane Zusammenarbeit sich mit solchem ... Zeitvertreib vertragen würde, <CHARNAME>.~
%Generelle_PID_Optionen_bd_plot99%
IF ~GlobalLT("bd_plot","global",100)~ THEN + pid_konditionen_02_b
END

IF ~~ THEN bg1re_memento_05
SAY ~[Husam]Selbstverständlich. Ich werde nichts dergleichen tun, wenn Ihr es nicht wünscht.~
%Generelle_PID_Optionen%
END

IF ~~ THEN bg1re_memento_06
SAY ~[Husam]Ich würde sonst nicht fragen.~
+ ~GlobalGT("C#HU_SoD_OtherRomance","GLOBAL",3)~ + ~Ich würde Euch nicht von der Bettkante stoßen, Husam, davon könnt Ihr ausgehen.~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + other_romance_00
+ ~GlobalLT("bd_plot","global",100)
!GlobalGT("C#HU_SoD_OtherRomance","GLOBAL",3)
Global("RE1_HusamSex","GLOBAL",0)
!%HC_FLIRTCOUNTER_HIGHENOUGH%~ + ~Ich würde Euch nicht von der Bettkante stoßen, Husam, davon könnt Ihr ausgehen.~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1) SetGlobal("C#HU_SoDPID_romstage1","LOCALS",1)~ + bg1re_memento_04
+ ~GlobalGT("bd_plot","global",99)
!GlobalGT("C#HU_SoD_OtherRomance","GLOBAL",3)
Global("RE1_HusamSex","GLOBAL",0)
!%HC_FLIRTCOUNTER_HIGHENOUGH%~ + ~Ich würde Euch nicht von der Bettkante stoßen, Husam, davon könnt Ihr ausgehen.~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1) SetGlobal("C#HU_SoDPID_romstage1","LOCALS",2)~ + bg1re_memento_04
+ ~!GlobalGT("C#HU_SoD_OtherRomance","GLOBAL",3)
OR(2)
GlobalGT("RE1_HusamSex","GLOBAL",0)
%HC_FLIRTCOUNTER_HIGHENOUGH%~ + ~Ich würde Euch nicht von der Bettkante stoßen, Husam, davon könnt Ihr ausgehen.~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + bg1re_memento_07
++ ~Ehrlich gesagt finde ich es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ + pid_wohlbefinden_14
++ ~Etwas in der Art wird bei unserer jetzigen Zusammenarbeit nicht geschehen. Ich erwarte, dass Ihr Euch entsprechend zurückhaltet.~ DO ~SetGlobal("C#HusamRomanceActive","GLOBAL",3) SetGlobal("C#HU_SoDPID_romstage1","LOCALS",9)~ + bg1re_memento_05
END

IF ~~ THEN bg1re_memento_07
SAY ~[Husam]Ich weise Euch nicht ab. Aber in Baldurs Tor waren wir unseren eigenen Aufgaben verpflichtet - unsere Begegnung war eine flüchtige Zerstreuung, um die Monotonie und Strapazen dieser Verpflichtung zu durchbrechen.~
IF ~~ THEN DO ~SetGlobal("C#HU_SoDPID_romstage1","LOCALS",10)~ + pid_wohlbefinden_08
END


IF ~~ THEN bg1re_memento_08
SAY ~[Husam]Käme das für Euch denn in Frage? Mein Angebot in Baldurs Tor entsprach ja nicht so sehr Euren Interessen.~
IF ~~ THEN + bg1re_memento_09
END

IF ~~ THEN bg1re_memento_09
SAY ~[Husam]Ich überschritt eine Grenze. Es wird nicht noch einmal vorkommen, dass ich mich Euch so aufdränge, <CHARNAME>.~
++ ~Es hat in dem Moment nicht so gepasst. Das heißt aber nicht, dass sich nicht jetzt etwas entwickeln könnte?~ + bg1re_memento_03
++ ~Oh, und was, wenn ich mein Abweisen in der Zwischenzeit bereue und das äußerst schade fände?~ + bg1re_memento_03
++ ~Ehrlich gesagt finde ich es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ + pid_wohlbefinden_14
++ ~Gut. Ich verlasse mich darauf, dass sich das nicht wiederholt und Ihr Euch entsprechend zurückhaltet.~ DO ~SetGlobal("C#HusamRomanceActive","GLOBAL",3) SetGlobal("C#HU_SoDPID_romstage1","LOCALS",9)~ + bg1re_memento_05
END

IF ~~ THEN no_drunk
SAY ~[Husam](er lächelt) Ein wenig unausstehlich zu wirken, ist Teil meiner Tarnung.~
+ ~Global("C#HU_SoDPID_no_drunk2","LOCALS",0)~ + ~Ihr habt mich ganz schön überrascht, als Ihr Euch in Baldurs Tor zu erkennen gegeben habt.~ DO ~SetGlobal("C#HU_SoDPID_no_drunk2","LOCALS",1)~ + no_drunk_01
%Generelle_PID_Optionen%
END

IF ~~ THEN no_drunk_01
SAY ~[Husam]Das ist der Grund, warum ich gerne diese Tarnung als Trunkenbold verwende. Niemand verdächtigt einen Angetrunkenen, Herr seiner Sinne zu sein. Umso ernüchterter ist mein Gegenüber in der Regel, wenn er realisiert, dass er es mit einem Abgesandten der mächtigsten Diebesorganisation in diesen Teilen der Lande zu tun hat.~ 
%Generelle_PID_Optionen%
END

IF ~~ THEN friends_01
SAY ~[Husam]Ich möchte Euch gleich hier unterbrechen, <CHARNAME>. Wir werden durch die intensive Zusammenarbeit einiges übereinander lernen - das bringt engere Zusammenarbeit so mit sich. Aber Freudschaft ist ein starkes Wort. Vergesst nie, dass ich meiner Gilde verpflichtet bin - dort liegt meine Loyalität. Ich bin zuallererst ein Schattendieb, dann Euer Kampfgefährte, und daraus habe ich auch nie einen Hehl gemacht. Es ist keine Warnung, geschweige denn eine Drohung wenn ich Euch sage: überlegt es Euch, wie vertraut Ihr mit mir werdet.~
++ ~Uff, das war deutlich.~ + friends_02
++ ~Und nach dieser Darlegung soll ich Euch als Kamerad vertrauen?~ + friends_04
++ ~Ihr wollt also gar nicht tiefer vertraut mit mir werden?~ + friends_02
++ ~Ihr lügt mich nicht an um mein Vertrauen zu gewinnen - das respektiere ich.~ + friends_02
++ ~Wohl denn, mein nichtvertrauter Schattendieb-Nichtfreund, lasst uns weiterziehen.~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + friends_03
%Generelle_PID_Optionen%
END

IF ~~ THEN friends_02
SAY ~[Husam]Ich habe nicht gesagt, dass wir uns behandeln sollen wie Fremde. Aber ich werde Euch nichts vorspielen, was nicht ist.~
++ ~... Was ja eigentlich genau der erste wichtige Schritt für eine Freundschaft ist, Husam.~ + friends_05
++ ~Nun gut, mein nichtvertrauter Schattendieb-Nichtfreund, dann lasst uns mal weiterziehen.~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + friends_03
%Generelle_PID_Optionen%
END

IF ~~ THEN friends_03
SAY ~[Husam](Er lächelt.) Wie ich bereits sagte - wir werden vertrauter werden, das liegt in der Natur unserer Zusammenarbeit. Aber von da wäre es zu einer Freundschaft ein langer, langer Weg, den wir aber nicht zusammen gehen werden.~
%Generelle_PID_Optionen%
END

IF ~~ THEN friends_04
SAY ~[Husam]Warum zweifelt Ihr das an?~
IF ~~ THEN + friends_05
END

IF ~~ THEN friends_05
SAY ~[Husam]Vertrauensvolle Zusammenarbeit ist nicht unbedingt verknüpft mit Gefühlen der Freundschaft. Im Gegenteil, es gibt sehr enge, vertrauensvolle Zusammenarbeit zwischen Geschäftspartnern, die nicht das geringste damit zu tun hat. Wir haben eine Abmachung, die ich ehren werde. Darauf habt Ihr mein Wort.~
++ ~Nun gut, mein nichtvertrauter Schattendieb-Nichtfreund, dann lasst uns mal weiterziehen.~ DO ~IncrementGlobal("C#HU_SoD_FlirtCount","LOCALS",1)~ + friends_03
%Generelle_PID_Optionen%
END

IF ~~ THEN more_01
SAY ~[Husam]Hmm, Komplimente? Erzählt mir mehr, <CHARNAME>.~
%Generelle_PID_Optionen%
END

IF ~~ THEN more_02
SAY ~[Husam]Oh, das würde ich so nicht sagen. Ich habe eine starke emotionale Bindung zu meiner Gilde, und auch zu meinem Schattenmeister, dem ich loyal bin ... aber das ist nicht das, was Ihr meint, nehme ich an. Ihr meintet im romantischen Sinne? Nein, das ist in der Tat nicht meins.~
%Generelle_PID_Optionen%
END

IF ~~ THEN status_pid
SAY @0 /* ~[special PID line - translators leave this comment in]Ja?~ */
+ ~OR(2)
Global("C#HusamRomanceActive","GLOBAL",1)
Global("C#HusamRomanceActive","GLOBAL",2)~ + ~Wir müssen unser intimes Spiel beenden, Husam. Lasst uns wieder zu einem Verhältnis zwischen Reisekameraden zurückkehren.~ + other_romance_reaction_04
+ ~Global("C#HusamRomanceActive","GLOBAL",2)~ + ~Ehrlich gesagt finde ich es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht mehr sein.~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",7)~ + pid_wohlbefinden_14
+ ~Global("C#HusamRomanceActive","GLOBAL",1)
GlobalLT("C#HU_RomanceCounter","GLOBAL",7)~ + ~Ich würde gerne unser verbales Spiel auf einen mehr ... physischen Level heben, Husam. Käme das für Euch in Frage?~ + pid_wohlbefinden_06
%Generelle_PID_Optionen%
END

END //APPEND