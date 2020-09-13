10 REM *********************
11 REM ***               ***
12 REM **    BRICK WALL   **
13 REM ***               ***
14 REM *********************
15 REM
16 REM
20 GOSUB 1000: REM INSTRUCTIONS
30 GOSUB 2000: REM SETUP
40 GOSUB 3000: REM PLAY
50 GOSUB 4000: REM END
60 END
1000 :
1001 REM *** INSTRUCTIONS
1002 :
1005 POKE 53280,14: POKE 53281,6
1010 PRINT "{clear}{cyan}"TAB(12)"*** brick wall ***"
1020 PRINT: PRINT
1030 PRINT "in this game, you will be presented"
1031 PRINT "with a wall of bricks at the top of the"
1032 PRINT "screen, and a paddle at the bottom."
1033 PRINT "the game paddle (port 2) is used to hit"
1034 PRINT "a rock into the wall of bricks.": PRINT
1040 PRINT "when the rock hits a brick, it will"
1041 PRINT "destory it and points will be added to"
1042 PRINT "your score.": PRINT
1050 PRINT "your mission, should you accept, is to"
1051 PRINT "destory as much of the brick wall as"
1052 PRINT "possible.": PRINT: PRINT
1053 PRINT "you are allowed only five misses."
1054 PRINT: PRINT "press return to begin play."
1060 GET ANS$: IF ANS$<>CHR$(13) THEN GOTO 1060
1990 RETURN
2000 :
2001 REM *** SETUP
2002 :
2010 SID=54272: FOR I=SID TO SID+24: POKE I,0: NEXT: POKE SID+5,9
2020 PLT=49664: FOR I=0 TO 24: READ C: POKE PLT+I,C: NEXT I
2021 DATA 32,16,194,132
2022 DATA 253,32,16,194
2023 DATA 152,170,164,253
2024 DATA 24,76,240,255
2025 DATA 32,253,174,32
2026 DATA 158,173,76,170,177
2030 GOSUB 2100
2040 DIM DIR(6): FOR I=1 TO 6: READ DIR(I): NEXT: DATA -1.5,-1,-.5,.5,1,1.5
2050 PDL=49152: FOR I=0 TO 63: READ C: POKE PDL+I,C: NEXT I
2051 DATA 162,1,120,173,2,220,141,0,193,169,192,141,2,220,169
2052 DATA 128,141,0,220,160,128,234,136,16,252,173,25,212,157
2053 DATA 1,193,173,26,212,157,3,193,173,0,220,9,128,141,5,193
2054 DATA 169,64,202,16,222,173,0,193,141,2,220,173,1,220,141
2055 DATA 6,193,88,96
2090 RETURN
2100 REM *** DO BACKGROUND
2105 PRINT "{clear}"
2110 FOR I=3 TO 11 STEP 2: K=(I-1)/2: K=K-2*INT(K/2)
2115 PRINT MID$("{cyan}{red}",K+1,1);: FOR J=0 TO 36 STEP 4: SYS PLT,J,I: PRINT "{reverse on}  ";: NEXT J
2120 PRINT MID$("{cyan}{red}",2-K,1);: FOR J=2 TO 38 STEP 4: SYS PLT,J,I: PRINT "{reverse on}  ";: NEXT J
2125 NEXT I
2130 FOR I=56256 TO 56295: POKE I,1: NEXT
2190 RETURN
2200 REM *** DRAW PADDLE
2201 SYS PDL: P=(236-PEEK(PDL+258))/6: BU=PEEK(PDL+261) 
2202 IF P<0 THEN P=0
2203 IF P>34 THEN P=34
2210 IF P=PP THEN RETURN
2215 SYS PLT,PP,23: PRINT "{reverse off}     ";
2220 SYS PLT,P,23: PRINT "{reverse off}{white}-----";
2225 PP=P: RETURN
2300 REM *** MOVE BALL
2305 X2=BX+DI(BA): Y2=BY+BD
2310 IF X2=>0 AND X2<=39 THEN GOTO 2315
2311 X2=BX-DI(BA): BA=7-BA
2312 POKE SID+1,220: POKE SID+4,23: POKE SID+24,15: FOR PA=1 TO 30: NEXT
2313 POKE SID+1,0: POKE SID+4,32
2315 IF Y2=>0 THEN GOTO 2320
2316 Y2=BY-BD: BD=-BD: BF=1
2317 POKE SID+1,200: POKE SID+4,33: POKE SID+24,15: FOR PA=1 TO 30: NEXT
2318 POKE SID+1,0: POKE SID+4,32
2320 IF Y2>23 THEN SYS PLT,BX,BY: PRINT "{reverse off} ";: goto 3060
2325 CH=PEEK(1024+X2+40*Y2): IF CH<>121 THEN GOTO 2330
2326 POKE SID+1,240: POKE SID+4,33: POKE SID+24,15: FOR PA=1 TO 30: NEXT
2327 POKE SI+1,0: POKE SID+4,32
2328 BD=-BD: BF=0: BA=INT(X2)-INT(PP)+1: PB=PB+1: IF PB=7 THEN BD=-2
2329 SYS PLT,BX,BY: PRINT "{reverse off} ";: SYS PLT,X2,Y2: PRINT "{white}Z";: BX=X2: BY=Y2: GOTO 3040
2330 IF CH=32 THEN GOTO 2340
2331 X3=2*INT(X2/2): SYS PLT,X3,Y2: PRINT "{reverse off}  ";: SC=SC+INT(5-(Y2-3)/2)
2332 POKE SID+1,10: POKE SID+4,33: POKE SID+24,15: FOR PA=1 TO 30: NEXT
2333 POKE SID+1,0: POKE SID+4,32
2334 IF SC=>300 THEN GOTO 3065
2335 IF BD<0 OR BF=1 THEN BD=-BD
2336 SYS PLT,11,24: PRINT "{reverse on}{cyan}"SC;
2340 IF PEEK(1024+BX+40*BY)<>81 THEN GOTO 2345
2341 SYS PLT,BX,BY: PRINT "{reverse off} ";
2345 SYS PLT,X2,Y2: PRINT "{reverse off}{white}Z";: BX=X2: BY=Y2: GOTO 3040
2990 RETURN
3000 :
3001 REM *** PLAY
3002 :
3005 SYS PLT,0,24: PRINT "{reverse on}{cyan} score: 0       balls left:        ";
3006 POKE 56295,3: POKE 2023,160: REM POKING COLOR MEMORY THEN SCREEN MEMORY FOR SOME REASON
3010 FOR B=1 TO 5: SYS PLT,31,24: PRINT "{reverse on}{cyan}"5-B;
3015 FOR J=1 TO 100: GOSUB 2200: IF BU=255 THEN NEXT J
3020 BX=10+INT(20*RND(0)): BY=14: BD=1: BF=0: BA=2+INT(4*RND(0)): PB=0
3030 GOTO 2300: REM BALL
3040 GOSUB 2200: REM PADDLE
3050 GOTO 3030
3060 POKE SID+1,250: POKE SID+4,33: POKE SID+24,15: FOR PA=1 TO 30: NEXT PA
3061 POKE SID+1,0: POKE SID+4,32
3065 NEXT B: RETURN
3990 RETURN
4000 :
4001 REM *** END
4002 :
4005 PRINT "{home}{reverse off}{cyan}the game is over!"
4020 PRINT "your score is:"SC"(";
4030 IF SC<50 THEN PRINT "lousy)": RETURN
4031 IF SC<100 THEN PRINT "poor)": RETURN
4032 IF SC<150 THEN PRINT "so-so)": RETURN
4033 IF SC<200 THEN PRINT "blah)": RETURN
4034 IF SC<225 THEN PRINT "good)": RETURN
4035 IF SC<250 THEN PRINT "great)": RETURN
4036 IF SC<275 THEN PRINT "excellent)": RETURN
4037 IF SC<300 THEN PRINT "fantastic)": RETURN
4038 PRINT "perfect)": RETURN
4990 RETURN
 
 