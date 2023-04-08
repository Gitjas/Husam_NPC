/* SoD */
/* stone statues in BD1000 */


/* ~BDHEROD~
IF ~~ THEN BEGIN 1 // from: 0.0
  SAY #56795 /* ~It looks like a newcomer to the camp, an elf named Teleria, lured folk into the woods and petrified them. To what end, I couldn't say. When she saw the refugees return, she fled into the forest. We've not seen her since.~ */
  IF ~~ THEN GOTO 10
END
*/

I_C_T ~BDHEROD~ 1 C#Husam_BDHEROD_1_CM
== C#HusamJ IF ~GlobalGT("C#Brandock_SoDStonePeople","GLOBAL",0)
OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)
OR(2) InParty("C#Brandock") Global("C#BrandockJoined","GLOBAL",2) InMyArea("C#Brandock") !StateCheck("C#Brandock",CD_STATE_NOTVALID)~ THEN @50 /* ~[Husam]There you have your Basilisks, Brandock.~ */
== C#BrandJ IF ~GlobalGT("C#Brandock_SoDStonePeople","GLOBAL",0)
OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)
OR(2) InParty("C#Brandock") Global("C#BrandockJoined","GLOBAL",2) InMyArea("C#Brandock") !StateCheck("C#Brandock",CD_STATE_NOTVALID)~ THEN @51 /* ~[Brandock]Yes, Husam, thank you, I noticed.~ */
END

I_C_T ~BDTELERI~ 10 C#Husam_BDHEROD_1_CM //same variable as above
== C#HusamJ IF ~GlobalGT("C#Brandock_SoDStonePeople","GLOBAL",0)
OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)
OR(2) InParty("C#Brandock") Global("C#BrandockJoined","GLOBAL",2) InMyArea("C#Brandock") !StateCheck("C#Brandock",CD_STATE_NOTVALID)~ THEN @50 /* ~[Husam]There you have your Basilisks, Brandock.~ */
== C#BrandJ IF ~GlobalGT("C#Brandock_SoDStonePeople","GLOBAL",0)
OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)
OR(2) InParty("C#Brandock") Global("C#BrandockJoined","GLOBAL",2) InMyArea("C#Brandock") !StateCheck("C#Brandock",CD_STATE_NOTVALID)~ THEN @51 /* ~[Brandock]Yes, Husam, thank you, I noticed.~ */
END

I_C_T ~BDTELERI~ 19 C#Husam_BDHEROD_1_CM //same variable as above
== C#HusamJ IF ~GlobalGT("C#Brandock_SoDStonePeople","GLOBAL",0)
OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)
OR(2) InParty("C#Brandock") Global("C#BrandockJoined","GLOBAL",2) InMyArea("C#Brandock") !StateCheck("C#Brandock",CD_STATE_NOTVALID)~ THEN @50 /* ~[Husam]There you have your Basilisks, Brandock.~ */
== C#BrandJ IF ~GlobalGT("C#Brandock_SoDStonePeople","GLOBAL",0)
OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2) InMyArea("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)
OR(2) InParty("C#Brandock") Global("C#BrandockJoined","GLOBAL",2) InMyArea("C#Brandock") !StateCheck("C#Brandock",CD_STATE_NOTVALID)~ THEN @51 /* ~[Brandock]Yes, Husam, thank you, I noticed.~ */
END

/* Interjection into Brandock's quest */
/* brandock_sod.tra
@5069 ~[Rayphus]Hmm, the leather seems to be softer than usual, but I can't prove whether it's lamb skin.~ */
I_C_T bdrayphu %quest_interject_bran% C#HuSoD_bdrayphu_brquestint
== C#husamJ IF ~OR(2) InParty("C#Husam1") Global("C#HusamJoined","GLOBAL",2)
Detect("C#Husam1") !StateCheck("C#Husam1",CD_STATE_NOTVALID)~ THEN @39 /* [Husam]I can identify the leather type - it seems to be lamb leather, indeed. Interesting. This is a very valuable book, and not necessarily due to what is written inside. */
END
