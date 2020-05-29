10 REM ********************
11 REM ***              ***
12 REM *** C-64 LEARNER ***
13 REM ***              ***
14 REM ********************
15 REM
16 REM
20 GOSUB 1000
30 GOSUB 2000
40 GOSUB 3000
50 END
1000 :
1010 REM *** INSTRUCTIONS
1020 :
1030 VT$="{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}"
1040 POKE 53280,6: POKE 53281,6
1050 GOSUB 1900
1060 PRINT "THIS IS A GAME THAT HAS THE ABILITY TO"
1070 PRINT "LEARN. THE COMPUTER WILL TRY TO GUESS"
1080 PRINT "AN OBJECT THAT YOU SELECT AT RANDOM.": PRINT
1090 PRINT "WHENEVER YOU STUMP THE COMPUTER, YOU";
1100 PRINT "ASKED ABOUT THE OBJECT YOU SELECTED. BY";
1110 PRINT "COMPILING THIS INFORMATION, THE COMPUTER";
1120 PRINT "'LEARNS'.": PRINT
1130 PRINT "ENTER THE WORD 'STOP' WHEN YOU ARE DONE."
1800 PRINT LEFT$(VT$,24);"PRESS {reverse on}RETURN{reverse off} WHEN READY TO CONTINUE:{reverse on} {reverse off}"
1810 GET AN$: IF AN$="" THEN GOTO 1810
1890 RETURN
1900 PRINT "{clear}{white}{down}{down}"; TAB(10);"*** C-64 LEARNER ***": PRINT: PRINT
1990 RETURN
2000 :
2010 REM *** SETUP
2020 :
2030 DIM QU$(50),RI(50),WR(50),RA$(50),WA$(50)
2040 QU$(1)="DOES IT MOVE ALONG THE GROUND"
2050 RI(1)=O: WR(1)=0
2060 RA$(1)="CAR":WA$(1)="HOUSE"
2070 FR=2
2990 RETURN
3000 :
3010 REM *** PLAY ***
3020 : 
3030 GOSUB 1900
3040 LI=1
3050 PRINT "I KNOW OF";FR;"OBJECTS...": PRINT
3060 PRINT: PRINT QU$(LI);:INPUT AN$=LEFT$(AN$,1)
3070 IF AN$="Y" THEN GOTO 3100
3080 IF AN$="N" THEN GOTO 3200
3090 IF AN$="S" THEN GOTO 3990
3095 PRINT "PLEASE ANSWER 'YES' OR 'NO'...": PRINT: GOTO 3060
3100 IF RI(LI) THEN LI=RI(LI): GOTO 3060
3105 GU$=RA$(LI): GOTO 3300
3200 IF WR(LI) THEN LI=WR(LI): GOTO 3060
3205 GU$=WA$(LI)
3300 PRINT: PRINT" IS IT A ";GU$;
3310 INPUT TA$:TA$=LEFT$(TA$,1)
3320 IF TA$="S" THEN GOTO 3990
3330 IF TA$="Y" THEN PRINT: PRINT "I GOT IT!":FOR PA=1 TO 1000: NEXT: GOTO 3000
3340 PRINT: PRINT: INPUT "WHAT WAS THE OBJECT";NA$
3350 IF FR<51 THEN GOTO 3380
3360 PRINT "I CAN'T REMEMBER THAT ONE. MY MEMORY SEEMS TO BE FULL."
3370 FOR PA=1 TO 1000: NEXT: GOTO 3000
3380 PRINT: PRINT "WHAT IS A QUESTION THAT I CHOULD"
3390 PRINT "USE TO TELL THE DIFFERENCE BETWEEN"
3400 PRINT GU$;" AND ";NA$;: INPUT QU$
3410 PRINT: PRINT "FOR ";NA$;" THE ANSWER IS WHAT";: INPUT YN$: YN$=LEFT$(YN$,1)
3420 IF YN$<>"Y" AND YN$<>"N" THEN GOTO 3410
3430 IF AN$="Y" THEN RI(LI)=FR: LI=FR: FR=FR+1
3440 IF AN$="N" THEN WR(LI)=FR: LI=FR: FR=FR+1
3450 QU$(LI)=QU$
3460 IF YN$="Y" THEN RA$(LI)=NA$: WA$(LI)=GU$
3470 IF YN$="N" THEN RA$(LI)=GU$: WA$(LI)=NA$
3480 GOTO 3000
3990 RETURN
