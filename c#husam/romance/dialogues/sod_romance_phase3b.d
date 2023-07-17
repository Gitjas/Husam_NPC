
APPEND c#husamj

/* dialogue started by Husam */

/* dialogue start if dialogue "pid_wohlbefinden_06"ff already played (e.g. if flirt count was high enough when HC asked about intimacies first time) */
/* Resttalk (wenn per Skript getriggert und nicht per PID gestartet) */
IF WEIGHT #-1
~Global("C#HU_RomanceCounter","GLOBAL",6)~ THEN konkrete_konditionen
SAY ~[Husam]Ihr seid also daran interessiert, unsere ... intimere Zusammenarbeit zu verfeinern, <CHARNAME>?~
++ ~Ihr denn nicht?~ + konkrete_konditionen_01
++ ~Ja, das habe ich ja schon klar gemacht, denke ich.~ + konkrete_konditionen_02
++ ~Boah, wie häufig denn noch? JA!~ + konkrete_konditionen_02
++ ~Ich finde es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",7)~ + pid_wohlbefinden_14
++ ~Ehrlich gesagt, nein. Ich bin nicht an Intimitäten mit Euch interessiert. Lasst uns das ganze Thema beenden und auf eine Zusammenarbeit als Kampfgefährten konzentrieren.~ + pid_konditionen_08
END

IF ~~ THEN konkrete_konditionen_01
SAY ~[Husam]Dann würde ich es Euch nicht anbieten, <CHARNAME>.~
++ ~Aber was bedeutet es Euch, Husam?~ + konkrete_konditionen_02
++ ~Ja, das habe ich ja schon klar gemacht, denke ich.~ + konkrete_konditionen_02
++ ~Boah, wie häufig denn noch? JA!~ + konkrete_konditionen_02
++ ~Ich finde es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",7)~ + pid_wohlbefinden_14
++ ~Ehrlich gesagt, nein. Ich bin nicht an Intimitäten mit Euch interessiert. Lasst uns das ganze Thema beenden und auf eine Zusammenarbeit als Kampfgefährten konzentrieren.~ + pid_konditionen_08
END

IF ~~ THEN konkrete_konditionen_02
SAY ~[Husam]Ich habe nicht andeuten wollen, dass ich Euch künftig nicht für weitere ... 'Vorbereitungen' zur Verfügung stünde. Ich weiß eine verheißungsvolle Gelegenheit zu erkennen, wenn sie sich mir bietet - insbesondere in Gestalt einer so bemerkenswerten Erscheinung wie Euch, <CHARNAME>.~
++ ~Seid Ihr wirklich interessiert? Wenn ich einfach nur belanglose Unterhaltung wollte, würde ich einen Kurtisanen dafür bezahlen.~ + konkrete_konditionen_03
++ ~Und worauf darf ich mich freuen? Mehr als ein flinkes Fingerspiel in einer dunklen Ecke, möchte ich doch hoffen?~ + konkrete_konditionen_04_b
++ ~Kommt zur Sache.~ + konkrete_konditionen_04
++ ~Ich finde es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",7)~ + pid_wohlbefinden_14
++ ~Ehrlich gesagt, nein. Ich bin nicht an Intimitäten mit Euch interessiert. Lasst uns das ganze Thema beenden und auf eine Zusammenarbeit als Kampfgefährten konzentrieren.~ + pid_konditionen_08
END

IF ~~ THEN konkrete_konditionen_03
SAY ~Ich müsste lügen, wenn ich behaupten wollte, dass Ihr ... mich kalt lasst. Aber ich möchte meinen, das war bereits durch mein bisheriges Verhalten offensichtlich.~
++ ~Und worauf darf ich mich freuen? Mehr als ein flinkes Fingerspiel in einer dunklen Ecke, möchte ich doch hoffen?~ + konkrete_konditionen_04_b
++ ~Kommt zur Sache.~ + konkrete_konditionen_04
++ ~Ich finde es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",7)~ + pid_wohlbefinden_14
++ ~Ehrlich gesagt, nein. Ich bin nicht an Intimitäten mit Euch interessiert. Lasst uns das ganze Thema beenden und auf eine Zusammenarbeit als Kampfgefährten konzentrieren.~ + pid_konditionen_08
END

IF ~~ THEN konkrete_konditionen_04_b
SAY ~[Husam]Definitiv mehr als das. Es gibt von meiner Seite keine Beschränkungen außer denen, die uns durch die Umstände auferlegt werden.~
IF ~~ THEN + konkrete_konditionen_04
END

IF ~~ THEN konkrete_konditionen_04
SAY ~[Husam]Ihr könnt mich jederzeit danach fragen, <CHARNAME>, aber ich werde nur darauf eingehen, wenn es die Situation erlaubt. Wir können uns eine Blöße - außer der, die wir uns gegenseitig zeigen werden, wenn Ihr diesen platten Witz erlaubt - nicht leisten. Wir marschieren gegen einen überzähligen Feind. Auch wenn Caelars Auftragsmörder sich als nicht so sehr geskillt herausgestellt haben, stellen ihre Anhänger doch eine nicht zu unterschätzende Gefahr dar. Ich werde nichts zulassen, dass Eure - und damit auch meine! - Mission gefährden könnte. Mit Euch im Gras zu rollen während das Lager angegriffen wird ist eine Situation, die es nicht geben wird - und um das sicherzustellen, werde ich Eure Anfragen für Zeiten vormerken, die diese Situationen wirklich erlauben.~
++ ~Ich frage hiermit an, Husam.~ DO ~SetGlobal("C#HU_SoDRomanceIQ","LOCALS",1)~ + konkrete_konditionen_05
++ ~Klingt bisher sinnvoll. Was weiter?~ + konkrete_konditionen_09
++ ~Ooch, kein spontaner Quickie hinter dem nächsten Gebüsch?~ + konkrete_konditionen_07
++ ~Ihr klingt wie ein Paladin. "Ich muss erstmal die Gegend absichern" ...~ + konkrete_konditionen_08
++ ~Was faselt Ihr da? Ich wollte mal die Nacht mit Euch verbringen, Husam, locker und unverbindlich, aber was Ihr hier abzieht klingt eher wie das Aufsetzen eines Ehevertrags.~ + konkrete_konditionen_06
++ ~Ich finde es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",7)~ + pid_wohlbefinden_14
++ ~Ehrlich gesagt, nein. Ich bin nicht an Intimitäten mit Euch interessiert. Lasst uns das ganze Thema beenden und auf eine Zusammenarbeit als Kampfgefährten konzentrieren.~ + pid_konditionen_08
END

IF ~~ THEN konkrete_konditionen_05
SAY ~[Husam](Er lächelt.) Eure Anfrage ist hiermit registriert, <CHARNAME>.~
++ ~Was faselt Ihr da? Ich wollte mal die Nacht mit Euch verbringen, Husam, locker und leicht, aber was Ihr hier abzieht klingt eher wie das Aufsetzen eines Ehevertrags.~ + konkrete_konditionen_06
++ ~Klingt bisher sinnvoll. Was weiter?~ + konkrete_konditionen_09
++ ~Ooch, kein spontaner Quickie hinter dem nächsten Gebüsch?~ + konkrete_konditionen_07
++ ~Ihr klingt wie ein Paladin. "Ich muss erstmal die Gegend absichern"...~ + konkrete_konditionen_08
++ ~Ich finde es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",7)~ + pid_wohlbefinden_14
++ ~Ehrlich gesagt, nein. Ich bin nicht an Intimitäten mit Euch interessiert. Lasst uns das ganze Thema beenden und auf eine Zusammenarbeit als Kampfgefährten konzentrieren.~ + pid_konditionen_08
END

IF ~~ THEN konkrete_konditionen_06
SAY ~[Husam]Nun - damit übertreibt Ihr natürlich, aber ja, es ist eine Art Vertrag, <CHARNAME>. Oder sollte ich sagen, Vertragserweiterung. Bisher reisen wir unter der Abmachung, dass ich Euch begleite und wir unser Wissen über den Kreuzzug teilen. Die Nächte - oder auch nur eine Nacht - intim zu verbringen war bisher nicht Teil des Deals.~
++ ~Bei Euch läuft wohl alles nur über Deals, was? Na gut. Was weiter?~ + konkrete_konditionen_09
+ ~Global("RE1_HusamSex","GLOBAL",0)
!Global("C#LC_HusamEncounter","GLOBAL",4)
!Global("C#LC_HusamEncounter","GLOBAL",25)~ + ~Einfach mal spontan sein ist nicht so Euer Ding, oder?~ + konkrete_konditionen_07
+ ~OR(3)
GlobalGT("RE1_HusamSex","GLOBAL",0)
Global("C#LC_HusamEncounter","GLOBAL",4)
Global("C#LC_HusamEncounter","GLOBAL",25)~ + ~Eure diesbezügliche Spontanität in Baldurs Tor hatte mir besser gefallen.~ + konkrete_konditionen_07
++ ~Ich finde es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",7)~ + pid_wohlbefinden_14
++ ~Ehrlich gesagt, nein. Ich bin nicht an Intimitäten mit Euch interessiert. Lasst uns das ganze Thema beenden und auf eine Zusammenarbeit als Kampfgefährten konzentrieren.~ + pid_konditionen_08
END

IF ~~ THEN konkrete_konditionen_07
SAY ~[Husam]Oh, ich kann spontan sein. Sehr sogar. Aber nicht, wenn es den Erfolg einer Mission beeinflussen könnte.~
++ ~Klingt bisher sinnvoll. Was weiter?~ + konkrete_konditionen_09
++ ~Ich finde es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",7)~ + pid_wohlbefinden_14
++ ~Ehrlich gesagt, nein. Ich bin nicht an Intimitäten mit Euch interessiert. Lasst uns das ganze Thema beenden und auf eine Zusammenarbeit als Kampfgefährten konzentrieren.~ + pid_konditionen_08
END

IF ~~ THEN konkrete_konditionen_08
SAY ~[Husam]Hahaha, der Vergleich schmerzt, aber er ist wohl angebracht.~
++ ~Klingt bisher sinnvoll. Was weiter?~ + konkrete_konditionen_09
+ ~Global("RE1_HusamSex","GLOBAL",0)
!Global("C#LC_HusamEncounter","GLOBAL",4)
!Global("C#LC_HusamEncounter","GLOBAL",25)~ + ~Einfach mal spontan sein ist nicht so Euer Ding, oder?~ + konkrete_konditionen_07
+ ~OR(3)
GlobalGT("RE1_HusamSex","GLOBAL",0)
Global("C#LC_HusamEncounter","GLOBAL",4)
Global("C#LC_HusamEncounter","GLOBAL",25)~ + ~Eure diesbezügliche Spontanität in Baldurs Tor hatte mir besser gefallen.~ + konkrete_konditionen_07
++ ~Ich finde es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",7)~ + pid_wohlbefinden_14
++ ~Ehrlich gesagt, nein. Ich bin nicht an Intimitäten mit Euch interessiert. Lasst uns das ganze Thema beenden und auf eine Zusammenarbeit als Kampfgefährten konzentrieren.~ + pid_konditionen_08
END

IF ~~ THEN konkrete_konditionen_09
SAY ~[Husam]Eines solltet Ihr jedoch wissen, mein/e heißblütige/r Held/in. Ihr seid unser Anführer und daher unter Beobachtung - und als Held von Baldurs Tor der Bewertung der Öffentlichkeit ausgesetzt. Ich würde daher äußerste Diskretion erwarten - und sie auch selbst einhalten. Um es kurz zu fassen: Es wird niemand erfahren, dass ich Euch zu Diensten bin. Nicht durch unsere Gespräche, nicht weil man uns dabei beobachtet.~
+ ~InParty("C#Husam1") NumInPartyGT(2) !InPartyAllowDead("C#Grey")~ + ~Wir reisen als Gruppe zusammen durch die Wildnis, wie soll das denn gehen?~ + konkrete_konditionen_11
+ ~!InParty("C#Husam1") NumInPartyGT(1) !InPartyAllowDead("C#Grey")~ + ~Wir reisen als Gruppe zusammen durch die Wildnis, wie soll das denn gehen?~ + konkrete_konditionen_11
++ ~Ja, das kommt mir ehrlich gesagt entgegen. Aber wie wollen wir das sicherstellen?~ + konkrete_konditionen_11
++ ~Und wie soll ich mit Euch etwas verabreden, was niemand hören darf? Ich möchte vielleicht nicht immer warten, bis ich Euch mal alleine antreffe.~ + konkrete_konditionen_11 
++ ~Uuh, Ihr wollt also nur im Geheimen mit mir schnackeln, ja? In dunklen Ecken, engen Schränken, hinter dicken Vohängen... Ja, das klingt gut.~ + konkrete_konditionen_10
++ ~Ich finde es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",7)~ + pid_wohlbefinden_14
++ ~Ehrlich gesagt, nein. Ich bin nicht an Intimitäten mit Euch interessiert. Lasst uns das ganze Thema beenden und auf eine Zusammenarbeit als Kampfgefährten konzentrieren.~ + pid_konditionen_08
END

IF ~~ THEN konkrete_konditionen_10
SAY ~[Husam]Verstecke dieser Art sind eventuell nicht unbedingt nötig, wenn wir es geschickt anstellen - nehme ich aber gerne als Detail entgegen, falls gewünscht.~
IF ~~ THEN + konkrete_konditionen_11
END

IF ~~ THEN konkrete_konditionen_11
SAY ~[Husam]In solchen Situationen hat sich ein Code sehr bewährt, <CHARNAME>. Ihr sprecht mit einem Meister des Versteckens und der Geheimhaltung. Wir legen jetzt fest, was unser Zeichen ist. Das signalisiert Ihr mir, und ich werde Eurem Wunsch bei der nächsten sich bietenden Gelegenheit nachkommen.~
++ ~Gut, dann ein Codewort. Vielleicht ... "Spezialwerkzeuge"? (grins)~ + konkrete_konditionen_15
++ ~Was soll das sein? Soll ich mir an die Nase fassen und dabei auf einem Bein hüpfen?~ + konkrete_konditionen_14
++ ~Und was, wenn es doch jemand mitbekommt?~ + konkrete_konditionen_13
++ ~Ich habe absolut kein Problem damit, wenn die anderen es mitkriegen, Husam. Habt Ihr dazu nicht die Eier in der Hose?~ + konkrete_konditionen_12
++ ~Was schlagt Ihr vor?~ + konkrete_konditionen_16
++ ~Ich finde es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",7)~ + pid_wohlbefinden_14
++ ~Ehrlich gesagt, nein. Ich bin nicht an Intimitäten mit Euch interessiert. Lasst uns das ganze Thema beenden und auf eine Zusammenarbeit als Kampfgefährten konzentrieren.~ + pid_konditionen_08
END

IF ~~ THEN konkrete_konditionen_12
SAY ~[Husam]Ich habe Euch meine Motivation dazu dargestellt. Ihr mögt vielleicht jetzt gerade den Sinn darin nicht sehen, aber Ihr werdet es irgendwann zu schätzen wissen, glaubt mir.~
IF ~~ THEN + konkrete_konditionen_16
END

IF ~~ THEN konkrete_konditionen_13
SAY ~[Husam]Das wäre bedauerlich, aber dann wäre es so. Es geht mir mitnichten um unseren Ruf, was auch immer das bedeuten mag. Ich meine es genau so - ich möchte zusätzliche Unruhe in der Gruppe vermeiden und möglichst im Vorfeld ausschließen.~
IF ~~ THEN + konkrete_konditionen_16
END

IF ~~ THEN konkrete_konditionen_14
SAY ~[Husam]... Das wäre eine Möglichkeit, allerdings würde ich einen etwas weniger profanen Code vorziehen.~
IF ~~ THEN + konkrete_konditionen_16
END

IF ~~ THEN konkrete_konditionen_15
SAY ~[Husam]Keine schlechte Idee, mein Vorschlag ginge auch in diese Richtung. Ich schlage allerdings eine Codephrase vor, die weniger auffällig ist.~ 
IF ~~ THEN + konkrete_konditionen_16
END

IF ~~ THEN konkrete_konditionen_16
SAY ~[Husam]Ich habe Euch offene Kommunkation bezüglich unseres Wissens über Caelars Kreuzzug versprochen. Euch, nicht unseren Begleitern. Das werden wir für unsere Tarnung nutzen. Fragt mich nach einer persönlichen Unterredung zum geheimen Wissen der Schattendiebe. Das soll unser Codeword sein.~
++ ~Was? Das ist doch viel zu offensichtlich! Da werden die anderen doch sofort misstrauisch.~ + konkrete_konditionen_18
++ ~Und was, wenn ich wirklich einfach mal nur mit Euch über Schattendiebes-Dinge sprechen möchte? Brauchen wir dafür ein anderes Codewort?~ + konkrete_konditionen_17
++ ~Ich finde es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",7)~ + pid_wohlbefinden_14
++ ~Ehrlich gesagt, nein. Ich bin nicht an Intimitäten mit Euch interessiert. Lasst uns das ganze Thema beenden und auf eine Zusammenarbeit als Kampfgefährten konzentrieren.~ + pid_konditionen_08
END

IF ~~ THEN konkrete_konditionen_17
SAY ~[Husam]Nein, denn dann fragt Ihr einfach danach, ohne eine "persönliche Unterredung zu den Geheimnissen der Schattendiebe" zu erwähnen.~ 
IF ~~ THEN + konkrete_konditionen_19
END

IF ~~ THEN konkrete_konditionen_18
SAY ~[Husam]Werden sie nicht, außer, Ihr stottert errötend wie ein Schulkind, <CHARNAME>.~
IF ~~ THEN + konkrete_konditionen_19
END

IF ~~ THEN konkrete_konditionen_19
SAY ~[Husam]Ihr seid unser Anführer, ich repräsentiere die Schattendiebe, die mächtigste Diebesgilde von hier bis Tethyr. Wenn wir etwas besprechen wollen, das nicht für die anderen bestimmt ist, dann werde sie es akzeptieren, wenn wir es entsprechend selbstverständlich einfordern.~
++ ~Verstehe. Wir nutzen unsere Autoritäten mit Verweis auf die Wichtigkeit im Kampf gegen Caelar. Das könnte klappen.~ + konkrete_konditionen_21
++ ~Wir müssen ein Codewort vereinbaren, um mit den Schäferstündchen zu beginnen? Sollten wir auch eins für das Beenden vereinbaren, mein bewandter Assassine?~ + konkrete_konditionen_20
++ ~Ich finde es sehr reizvoll, einfach nur mit Euch zu flirten, Husam. Mehr wird es aber nicht werden.~ DO ~SetGlobal("C#HU_RomanceCounter","GLOBAL",7)~ + pid_wohlbefinden_14
++ ~Ehrlich gesagt, nein. Ich bin nicht an Intimitäten mit Euch interessiert. Lasst uns das ganze Thema beenden und auf eine Zusammenarbeit als Kampfgefährten konzentrieren.~ + pid_konditionen_08
END

IF ~~ THEN konkrete_konditionen_20
SAY ~[Husam]Je nachdem, wie wild Ihr spielen wollt, wäre das vorher zu klären, <CHARNAME> - das werden wir dann tun, wenn es soweit ist.~
IF ~~ THEN + konkrete_konditionen_22
IF ~Global("C#HU_RomanceCounter","GLOBAL",6)~ THEN + konkrete_konditionen_23
END

IF ~~ THEN konkrete_konditionen_21
SAY ~[Husam]Es wird klappen, <CHARNAME>.~
IF ~~ THEN + konkrete_konditionen_22
IF ~Global("C#HU_RomanceCounter","GLOBAL",6)~ THEN + konkrete_konditionen_23
END

IF ~~ THEN konkrete_konditionen_22
SAY ~[Husam]Dieses Gespräch war lange genug, um das Misstrauen der anderen zu wecken, und noch ist es nicht Zeit für eine Rast. Wir werden uns situationsbedingt um weitere Details unserer Zusammenarbeit kümmern, <CHARNAME>. Haltet den Gedanken fest.~
IF ~~ THEN DO ~SetGlobal("C#HusamRomanceActive","GLOBAL",2)
SetGlobal("C#HU_SoDPID_romstage1","LOCALS",9)
SetGlobal("C#HU_RomanceCounter","GLOBAL",7)~ EXIT
END

IF ~~ THEN konkrete_konditionen_23
SAY ~[Husam]Nun denn ... Es gäbe noch viele Details, die wir klären könnten, aber darum werden wir uns situationsbedingt kümmern, wenn das Thema aufkommt. Es ist Zeit für die Bettruhe.~
IF ~~ THEN + konkrete_konditionen_24
IF ~Global("C#HU_SoDRomanceIQ","LOCALS",1)~ THEN + resttalk_02
END

IF ~~ THEN konkrete_konditionen_24
SAY ~Nun denn, teuerster Held, was ist Euer Begehr?~
++ ~Setzt Eure Worte endlich in Taten um - jetzt!~ DO ~SetGlobal("C#HusamRomanceActive","GLOBAL",2)
SetGlobal("C#HU_SoDPID_romstage1","LOCALS",9)
SetGlobal("C#HU_RomanceCounter","GLOBAL",7)~ + resttalk_02
++ ~Heute passt es mir nicht. Ich sage dann bescheid.~ + konkrete_konditionen_25
END

IF ~~ THEN konkrete_konditionen_25
SAY ~[Husam]So machen wir es. Dann wünsche ich gute Ruhe.~
IF ~~ THEN DO ~SetGlobal("C#HusamRomanceActive","GLOBAL",2)
SetGlobal("C#HU_SoDPID_romstage1","LOCALS",9)
SetGlobal("C#HU_RomanceCounter","GLOBAL",7)~ EXIT
END
END //APPEND





