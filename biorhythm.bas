10 REM ********************
11 REM ***              ***
12 REM ***   BIORHYTHM  ***
13 REM ***              ***
14 REM ********************
15 REM
16 REM
20 GOSUB 1000
30 GOSUB 2000
40 GOSUB 3000
50 END
1000 :
1010 REM *** INSTRUCTIONS ***
1020 :
1030 VT$="{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}"
1040 POKE 53280,6: POKE 53281,6
1050 GOSUB 1900
1060 PRINT "A BIORHYTHMIC CALENDAR IS COMPOSED OF"
1070 PRINT "THE LETTERS I, E AND P. EACH OF THESE"
1080 PRINT "REPRESENTS ONE OF YOUR MEASURABLE"
1090 PRINT "BIORHYTHMIC CYCLES.": PRINT
1100 PRINT: PRINT TAB(6);"I=INTELLECTUAL STATE"
1110 PRINT: PRINT TAB(6);"E=EMOTIONAL STATE"
1120 PRINT: PRINT TAB(6);"P=PHYSICAL STATE"
1130 GOSUB 1800: GOSUB 1900
1140 PRINT "THIS PROGRAM WILL GRAPH OUT YOUR UNIQUE"
1150 PRINT "BIORHYTHMIC CYCLES, EITHER ON THE SCREEN";
1160 PRINT "OR TO A PRINTER.": PRINT
1170 PRINT "PRESS THE SPACEBAR TO PAUSE THE PRINTOUT";
1180 PRINT "ON THE SCREEN AND AGAIN TO RESUME.": PRINT
1190 PRINT "SHOULD I OUTPUT TO:": PRINT
1200 PRINT TAB(8);"S)CREEN"
1210 PRINT TAB(10);"-OR-"
1220 PRINT TAB(8);"P)RINTER"
1230 PRINT LEFT$(VT$,24);"WHICH DO YOU WANT (S/P)? {reverse on} {reverse off}";
1240 GET P$: IF P$="" THEN GOTO 1240
1250 IF P$="P" THEN PRINT "{CSL}P":GOTO 1790
1260 PRINT "{CSL}S"
1790 RETURN
1800 PRINT LEFT$(VT$,24);"PRESS {reverse on}RETURN{reverse off} WHEN READY TO CONTINUE:{reverse on}{reverse off}"
1810 GET AN$: IF AN$="" THEN GOTO 1810
1890 RETURN
1900 PRINT "{clear}{white}{down}{down}";TAB(11);"*** BIORHYTHM ***": PRINT: PRINT
1990 RETURN
2000 :
2010 REM *** SETUP ***
2020 :
2030 SW=29: PI2=6.28318531
2040 DIM A$(SW), PL(23), EL(28), IL(33)
2050 C$="JANFEBMARAPRMAYJUNJULAUGSEPOCTNOVDEC"
2060 W$="SUNMONTUEWEDTHUFRISAT"
2070 FOR I=1 TO SW: A$(I)=" ": NEXT
2080 B=INT(SW/2): A=B+1.5
2090 FOR I=1 TO 33
2100 IL(I)=INT(A+B*SIN(PI2*(I-1)/33))
2110 IF I>28 THEN 2150
2120 EL(I)=INT(A+B*SIN(PI2*(I-1)/28))
2130 IF I>23 THEN 2150
2140 PL(I)=INT(A+B*SIN(PI2*(I-1)/23)
2150 NEXT
2160 ML$=" -............O............+"
2990 RETURN
3000 :
3010 REM *** PLAY ***
3020 : 
3030 GOSUB 1900
3040 INPUT "WHAT IS YOUR NAME";N$
3050 ER=0
3060 PRINT: PRINT "WHAT IS YOUR BIRTHDATE?": INPUT "(MM,DD,YY)":M$,D$,Y$
3070 M=VAL(M$)
3075 IF M<1 OR M>12 OR M<>INT(M) THEN PRINT "INCORRECT MOUTH": ER=1
3080 D=VAL(D$)
3085 IF D<1 OR D>31 OR D<>INT(D) THEN PRINT "INCORRECT DAY": ER=1
3090 Y=VAL(Y$)
3095 IF Y<0 OR Y<>INT(Y) THEN PRINT "INCORRECT YEAR":ER=1
3100 IF ER THEN ER=0: GOTO 3060
3110 IF Y<100 THEN Y=Y+1900
3120 GOSUB 3800: S=J
3130 PRINT: PRINT" WHAT IS THE START DATE?": INPUT "(MM,DD,YY)";M$,D$,Y$
3140 M1=VAL(M$)
3145 IF M1<1 OR M1>12 OR M1<>INT(M1) THEN PRINT "INCORRECT MONTH": ER=1
3150 D1=VAL(D$)
3155 IF D1<1 OR D1>31 OR D1<>INT(D1) THEN PRINT "INCORRECT DAY": ER=1
3160 Y1=VAL(Y$)
3165 IF Y1<0 OR Y1<>INT(Y1) THEN PRINT "INCORRECT YEAR": ER=1
3170 IF ER THEN ER=0: GOTO 3130
3180 IF Y1<100 THEN Y1=Y1+1900
3190 IF Y1>Y THEN GOTO 3230
3200 IF Y1=Y AND M1>M THEN GOTO 3230
3210 IF Y1=Y AND M1=M AND D1>=D THEN GOTO 3230
3220 PRINT "START DATE BEFORE BIRTHDATE": GOTO 3130
3230 PRINT: INPUT "HOW MANY DAYS";Z$;Z=VAL(Z$)
3235 IF Z<1 OR Z<>INT(Z) THEN GOTO 3230
3240 PRINT "{clear}";
3250 IF P$="P" THEN OPEN 4,4,2: CMD 4
3260 PRINT TAB(10);"BIORHYTHMIC CALENDAR"
3270 PRINT TAB(14);"--- FOR ---"
3280 PRINT TAB(INT((40-LEN(N$))/2));N$
3290 PRINT TAB(8);"BORN ON ";MID$(W$,3*N-2,3);D;MID$(C$,3*M-2,3);Y: PRINT
3300 PRINT TAB(5);"P=PHYSICAL      (23 DAY CYCLE)"
3310 PRINT TAB(5);"E=EMOTIONAL     (28 DAY CYCLE)"
3320 PRINT TAB(5);"I=INTELLECUTAL  (33 DAY CYCLE)"
3330 PRINT: PRINT: PRINT
3340 M=M1: D=D1: Y=Y1: GOSUB 3800: GOSUB 3900: J2=J1
3350 M=M+1: D=1: GOSUB 3900: LE=J1-J2
3360 IF LE>Z THEN LE=Z
3370 Z=Z-LE
3380 D1=D1-1
3390 F=J-S: E=F+LE-1
3400 FOR K=F TO E
3410 D1=D1+1
3420 PK=K-INT(K/23)*23+1
3430 EK=K-INT(K/28)*28+1
3440 IK=K-INT(K/33)*33+1
3450 A$(PL(PK))="P"
3460 IF A$(EL(EK))=" " THEN A$(EL(EK))="E": GOTO 3480
3470 A$(EL(EK))="*"
3480 IF A$(IL(IK))=" " THEN A$(IL(IK))="I": GOTO 3500
3490 A$(IL(IK))="*"
3500 IF A$(B+1)=" " THEN A$(B+1)="."
3510 IF D1=1 OR K=F THEN PRINT MID$(C$,3*M1-2,3);Y;ML$
3520 PRINT MID$(W$,3*N-2,3);RIGHT$("   "+STR$(D1),3);
3530 FOR I=1 TO SW: PRINT A$(I);: A$(I)="": NEXT: PRINT
3540 IF P$="P" THEN GOTO 3570
3550 GET AN$: IF AN$="" THEN GOTO 3570
3560 GET AN$: IF AN$="" THEN GOTO 3560
3570 N=N+1: IF N>7 THEN N=1
3580 NEXT
3590 D1=1: M1=M1+1: IF M1>12 THEN M1=1: Y1=Y1+1
3600 IF Z THEN GOTO 3340
3610 PRINT TAB(9);ML$
3620 IF P$="P" THEN PRINT#4: CLOSE 4
3630 PRINT "DO YOU WANT TO MAKE ANOTHER CHART? {reverse on} {reverse off}";: GET AN$
3640 IF AN$="Y" THEN GOTO 3000
3660 PRINT "{clear}N"
3790 RETURN
3800 REM FIND DAY OF WEEK
3810 IF M<3 THEN MO=M+10: YO=Y-1: GOTO 3830
3820 MO=M-2: YO=Y
3830 J=INT(YO/100): K=YO-(J*100)
3840 N=INT((13*MO-1)/5)+D+K+INT(K/4)+INT(J/4)-2*J+77: N=N-INT(N/7)*7+1
3850 MO=MO-1: J=INT((146097*J)/4)+D+INT((1461*K)/4)+INT((153*MO+2)/5)
3890 RETURN
3900 REM FIND JULIAN DATE
3910 L=2: IF M<3 THEN L=0: GOTO 3960
3920 IF Y<>INT(Y/4)*4 THEN GOTO 3960
3930 IF Y<>INT(Y/100)*100 THEN GOTO 3950
3940 IF Y<>INT(Y/400)*400 THEN GOTO 3960
3950 L=1
3960 J1=INT((3055*(M+2))/100)-91+D-L
3990 RETURN
