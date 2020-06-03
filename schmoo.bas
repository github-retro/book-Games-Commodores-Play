10 REM ********************
11 REM ***              ***
12 REM ***    SCHMOO    ***
13 REM ***              ***
14 REM ********************
15 REM
16 REM
20 GOSUB 1000
30 GOSUB 2000
40 GOSUB 3000
50 GOSUB 4000
60 END
1000 :
1010 REM *** INSTRUCTIONS ***
1020 :
1030 VT$="{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}"
1040 POKE 53280,6: POKE 53281,6
1050 GOSUB 1900
1060 PRINT "THIS IS THE GAME OF SCHMOO. IN IT YOU"
1070 PRINT "THROW MUD AROUND IN HOPES OF HITTING"
1080 PRINT "THE MUD-LOVING SCHMOO.": PRINT
1090 PRINT "YOU ARE SITUATED IN THE CNETER OF AN"
1100 PRINT "X,Y COORDINATE SYSTEM AT POSITION 0,0."
1110 PRINT "THE SCHMMO WILL BE LOCATED SOMEWEHERE ON"
1120 PRINT "THE SAME PLANE. HIS COORDINATES ARE"
1130 PRINT "GIVEN TO YOU BEFORE EACH TURN.": PRINT
1140 PRINT "YOU HAVE YOUR TRUSTY AUTOMATIC MUDBALL"
1150 PRINT "SLINGER WHICH YOU USE TO TOSS MUDBALLS"
1160 PRINT "AT THE SCHMMO. YOU ENTER THE ELEVATION"
1170 PRINT "AND THE ANGLE AT WHICH YOU WISH TO FIRE"
1180 PRINT "THE MUDBALL. AFTER EACH SHOT YOU WILL"
1190 PRINT "BE GIVEN THE COORDINATES WHERE THE MUD LANDED."
1200 GOSUB 1800: GOSUB 1900
1210 PRINT "FOR EXAMPLE, IF THE SCHMMO'S COORDINATES";
1220 PRINT "ARE (-500, 1000) THEN THE SCHMMO IS"
1230 PRINT "ABOUT FIVE HUNDRED FEET TO YOUR LEFT AND";
1240 PRINT "A THOUSAND FEET IN FRONT OF YOU.": PRINT
1250 PRINT "THE ELEVATION FOR THE SHOT WOULD BE"
1260 PRINT "ABOUT 89.3 DEGREES WHILE THE ANGLE WHERE";
1270 PRINT "THE SCHMOO CAN BE FOUND IS ABOUT 333.4"
1280 PRINT "DEGREES.": PRINT
1290 PRINT "THE MUDBALLS ARE LARGE ENOUGH TO MUDDY"
1300 PRINT "THE SCHMMO AS LONG AS THEY LAND WITHIN"
1310 PRINT "100 FEET OF HIM.": PRINT
1320 PRINT "HOW THAT YOU KNOW HOW TO MAKE THE SCHMOO";
1330 PRINT "HAPPY, GO GET HIM. GOOD LUCK!"
1800 PRINT  LEFT$(VT$,24);"PRESS {reverse on}RETURN{reverse off} WHEN READY TO CONTINUE:{reverse on} "
1810 GET AN$: IF AN$="" THEN GOTO 1810
1890 RETURN
1900 PRINT "{clear}{white}{down}{down}";TAB(12);"*** SCHMOO ***": PRINT: PRINT
1990 RETURN
2000 :
2010 REM *** SET UP
2020 :
2030 PRINT "{clear}"
2040 S1=INT(RND(1)*2)*2-1
2050 S1=INT(RND(1)*2)*2-1
2060 SX=(INT(RND(1)*26000)+5000)*S1
2070 SY=(INT(RND(1)*26000)+5000)*S2
2080 CN=3.141592635/180
2990 RETURN
3000 :
3010 REM *** PLAY ***
3020 :
3030 GOSUB 1900
3040 GOSUB 60300
3045 PRINT: PRINT "THE SCHMOO IS AT COORDINATES:":PRINT "(";SX;",";SY;")"
3050 PRINT: PRINT "WHAT ELEVATION FOR THE MUDBALL": INPUT "SLINGER (1-90)";EL
3060 IF EL<1 OR EP>90 THEN PRINT "ELEVATION RANGES FROM 1 TO 90.": GOTO 3050
3070 IF EL<90 THEN GOTO 3100
3080 PRINT "THAT WOULD SHOOT THE MUD STRAIGHT UP"
3090 PRINT "AND IT WOULD LAND ON TOP OF YOU.": GOTO 3050
3100 PRINT: PRINT "WHAT ANGLE OF DIRECTION FOR THE "
3110 INPUT "MUDBALL SLINGER (0-360)";AN
3120 IF AN<0 OR AN>360 THEN PRINT "THE ANGLE RANGES FROM 0 TO 360.": GOTO 3100
3130 DM=ABS(INT(93000*SIN(EL*CN)*COS(EL*CN)))
3140 XM=DM*SIN(AN*CN)
3150 YM=DM*COS(AN*CN)
3160 DS=SQR((SX-XM)^2+(SY-YM)^2)
3170 PRINT: PRINT "THE MUD SPLATTERED AT COORDINATES:"
3180 PRINT "(";INT(XM);",";INT(YM);")"
3190 TRY=TRY+1
3200 IF DS>100 THEN GOTO 3040
3210 GOSUB 60300: GOSUB 60300: GOSUB 60300
3220 PRINT: PRINT "THATS GOOD ENOUGH TO SPLATTER THE"
3230 PRINT "SCHMMOO!"
3990 RETURN
4000 :
4010 REM *** END ***
4020 :
4030 PRINT: PRINT "YOU SPLATTED THE SCHMMO IN";TRY;"TRIES.": PRINT
4040 PRINT "DO YOU WISH TO PLAY AGAIN? {reverse on} {reverse off}";
4050 GET AN$: IF AN$="" THEN GOTO 4050
4060 IF LEFT$(AN$,1)="Y" THEN RUN
4070 PRINT "{left}N": PRINT "{down}{down}THANKS FOR SPLATTERING THE SCHMMO!"
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