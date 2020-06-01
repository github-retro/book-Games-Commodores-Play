10 REM ********************
11 REM ***              ***
12 REM ***    IRSMAN    ***
13 REM ***              ***
14 REM ********************
15 REM
16 REM
20 GOSUB 1000
30 GOSUB 2000
40 GOSUB 3000
50 GOSUB 4000
90 END
1000 :
1010 REM *** INSTRUCTIONS
1020 :
1030 VT$="{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}"
1040 POKE 53280,6: POKE 53281,6
1050 GOSUB 1900
1060 PRINT "THIS IS THE GAME OF IRSMAN. TO WIN, YOU"
1070 PRINT "TRY TO ACCUMULATE MORE MONEY THAN YOUR"
1080 PRINT "NEMESIS, THE IRSMAN.": PRINT
1090 PRINT "GIVE ME A NUMBER BETWEEN 1 AND 50."
1100 PRINT "I WILL DISPLAY A CONSECUTIVE NUMBER"
1110 PRINT "STRING STARTING AT 1, AND CONTINUING"
1120 PRINT "THROUGHT TO THE NUMBER YOU SELECTED."
1130 PRINT "YOU WILL THEN CHOOSE HOW MUCH MONEY"
1140 PRINT "(WHICH NUMBER) YOU WANT TO REMOVE FROM"
1150 PRINT "THE LIST.": PRINT
1160 GOSUB 1800: GOSUB 1900
1170 PRINT "BUT, AND HERE'S THE FUN PART, THE IRSMAN";
1180 PRINT "GETS ALL OF THE REMAINING NUMBERS ON THE";
1190 PRINT "LIST THAT ARE FACTORS OF THE NUMBER YOU"
1200 PRINT "CHOSE. THAT IS HOW THE IRSMAN GETS HIS"
1210 PRINT "MONEY. IF YOU CHOOSE 6, FOR EXAMPLE,"
1220 PRINT "THE IRSMAN GETS ALL OF THE REMAINING"
1230 PRINT "FACTORS OF 6, POTENTIALLY 1, 2, AND 3.": PRINT
1240 PRINT "YOU CANNOT CHOOSE A NUMBER THAT HAS NO"
1250 PRINT "REMAINING FACTORS IN THE LIST, BECAUSE"
1260 PRINT "YOU MUST ALWAYS PAY THE IRSMAN.": PRINT
1270 GOSUB 1800: GOSUB 1900
1280 PRINT "WHEN YOU CAN NO LONGER REMOVE ANY OF THE";
1290 PRINT "REMAINING NUMBERS FROM THE LIST, THE"
1300 PRINT "IRSMAN CLAIMS ALL OF THE UNUSED MONEY"
1310 PRINT "(NUMBERS) FOR HIMSELF."
1800 PRINT LEFT$(VT$,24);"PRESS {reverse on}RETURN{reverse off} WHEN READY TO CONTINUE: {reverse on} "
1810 GET AN$: IF AN$="" THEN GOTO 1810
1890 RETURN
1900 PRINT "{clear}{white}{down}{down}";TAB(13);"*** IRSMAN ***": PRINT: PRINT
1990 RETURN
2000 :
2010 REM *** SETUP ***
2020 :
2030 DIM LI(50)
2040 FOR I=1 TO 50: LI(I)=I: NEXT
2050 INPUT "{clear}{down}{down}HOW MANY NUBMERS (1-50) IN THE LIST";AN$
2060 AN=VAL(AN$): IF AN>=1 AND AN<=50 AND AN=INT(AN) THEN GOTO 2080
2070 ER$="<<< USE A NUMBER FROM 1 TO 50 >>>": GOSUB 3700: GOTO 2050
2080 NU=AN
2990 RETURN
3000 :
3010 REM *** PLAY ***
3020 :
3030 GOSUB 1900
3040 PRINT LEFT$(VT$,5)
3050 PRINT "HERE IS THE LIST:": PRINT
3060 FOR I=1 TO NU
3070 IF LI(I)=0 THEN PRINT "    ";
3080 IF LI(I)<10 THEN PRINT " ";
3090 IF LI(I) THEN PRINT I;
3100 NEXT I
3110 IF NU=1 THEN GOTO 3900
3120 FOR I=2 TO NU: IF LI(I)=0 THEN GOTO 3600
3130 FOR J=1 TO I: IF LI(J)=0 THEN GOTO 3500
3140 IF J=I THEN GOTO 3500
3150 IF LI(I)/J<>INT(LI(I)/J) THEN GOTO 3500
3160 PRINT LEFT$(VT$,13)
3170 PRINT "THE SCORE IS:    IRSMAN:";TA
3180 PRINT "                  *YOU*:";YO
3190 AN$="": PRINT LEFT$(VT$,16): INPUT "WHICH DO YOU WANT"; AN$: AN=VAL(AN$)
3200 IF AN<1 OR AN>NU THEN GOTO 3220
3210 IF LI(AN) AND AN=INT(AN) THEN GOTO 3230
3220 ER$="THAT IS NOT AVAILABLE!": GOSUB 3700: GOTO 3190
3230 SC=0: IF AN=1 THEN GOTO 3280
3240 FOR K=1 TO AN: IF LI(K)=0 THEN GOTO 3270
3250 IF K=AN THEN GOTO 3270
3260 IF AN/K=INT(AN/K) THEN SC=SC+K
3270 NEXT K
3280 IF SC<>0 THEN GOTO 3310
3290 ER$="THAT LEAVES NOTHING FOR THE IRSMAN."
3300 ER$="YOU CAN'T HAVE IT.     "+ER$: GOSUB 3700: GOTO 3190
3310 LI(AN)=0: YO=YO+AN: TA=TA+SC
3320 FOR K=1 TO AN: IF LI(K)=0 THEN GOTO 3340
3330 IF AN/K=INT(AN/K) THEN LI(K)=0
3340 NEXT K
3350 GOTO 3040
3500 NEXT J
3600 NEXT I: GOTO 3990
3700 GOSUB 60300
3710 PRINT LEFT$(VT$,20);ER$
3720 FOR K=1 TO 1600: NEXT
3730 PRINT LEFT$(VT$,20);: FOR K=1 TO LEN(ER$): PRINT " ";: NEXT
3790 RETURN
3900 PRINT "{down}{down}OOOPS, YOU CAN'T GET ANYTHING...": TA=1: LI(I)=0: GOSUB 1800
3990 RETURN
4000 :
4010 REM *** END ***
4020 :
4025 GOSUB 1900
4030 PRINT "*** THE GAME IS OVER ***"
4040 PRINT
4050 TA=0: FOR I=1 TO NU: TA=TA+I: NEXT: TA=TA-YO
4060 PRINT "THE IRSMAN:";TA
4070 PRINT "       YOU:";YO
4080 PRINT "================": PRINT
4090 IF TA>YO THEN PRINT "THE IRSMAN IS THE WINNER!!"
4100 IF TA<YO THEN PRINT "YOU HAVE BEATEN THE IRSMAN!"
4110 IF TA=YO THEN PRINT "ITS UNBELIEVABLE BUTS ITS A TIE!"
4120 GOSUB 60300: GOSUB 60300: GOSUB 60300
4990 RETURN
60300 :
60310 REM BELL SOUND ROUTINE
60320 :
60330 SD=54272: POKE SD+24,15
60340 POKE SD+5,7: POKE SD+6,0
60350 POKE SD+1,50: POKE SD+4,17
60360 FOR TS=1 TO 100: NEXT
60370 POKE SD+4,0: POKE SD+1,0
60390 RETURN
