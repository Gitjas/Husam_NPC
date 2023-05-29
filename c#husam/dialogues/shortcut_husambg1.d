APPEND HUSAM2

IF WEIGHT #-1
~Global("C#HU_HusamMove","GLOBAL",1)~ THEN BEGIN quickstart
  SAY #%eet_2%%eet_0%%eet_0%1583 /* ~Me name's Husam. I've heards quite a bit about youres exploits. *hic* You've really caused the Iron Throne shom trouble, haven'ts you? I'd like to talks with the bunch of youse, what says you?~ */
  IF ~~ THEN REPLY #%eet_2%%eet_0%%eet_0%1598 /* ~Sorry, we don't have the time to talk with a small time thief.~ */ DO ~SetGlobal("C#HU_HusamMove","GLOBAL",2)
SetGlobal("HusamMove","GLOBAL",1)
EscapeArea()
~ EXIT
  IF ~~ THEN REPLY #%eet_2%%eet_0%%eet_0%1599 /* ~Okay, what do you have to say?~ */ DO ~SetGlobal("C#HU_HusamMove","GLOBAL",2)~ GOTO quickstart_01
END

IF ~~ THEN BEGIN quickstart_01
  SAY @0 /* ~Heh heh, ya I've beens hearing all sortsa things. I heards you guys are wanted for murders. Hah, so yers murderers, eh? Well, I still like ya. Hey, I have somore info for yas. Do ya want ta hear it?~ */
COPY_TRANS HUSAM2 0
END

END //APPEND