10 REM *********************
11 REM ***               ***
12 REM ***   BLOCK 'EM   ***
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
1010 PRINT "{clear}{white}": POKE 53281,14: POKE 53280,0
1020 PRINT TAB(10)"*** brain teaser ***"
1030 PRINT
1031 PRINT "in this game you are given a 3 by 3 game";
1032 PRINT "board with one occupied space (the"
1033 PRINT "center). the board will look like this"
1040 PRINT: PRINT "{blue}   {reverse on} {reverse off} {reverse on} {reverse off} {reverse on} {reverse off}"
1041 PRINT
1042 PRINT: PRINT "   {reverse on} {reverse off} {reverse on}Z{reverse off} {reverse on} {reverse off}"
1043 PRINT
1044 PRINT: PRINT "   {reverse on} {reverse off} {reverse on} {reverse off} {reverse on} {reverse off}"
1045 PRINT
1050 PRINT "{white}the trick is to move the peices so that"
1051 PRINT "the game board winds up looking like"
1052 PRINT "this:": PRINT
1060 PRINT "{blue}   {reverse on}Z{reverse off} {reverse on}Z{reverse off} {reverse on}Z{reverse off}"
1061 PRINT
1062 PRINT "{blue}   {reverse on}Z{reverse off} {reverse on}Z{reverse off} {reverse on}Z{reverse off}"
1063 PRINT
1064 PRINT "{blue}   {reverse on}Z{reverse off} {reverse on}Z{reverse off} {reverse on}Z{reverse off}"
1070 PRINT: PRINT: PRINT "{white}press return when ready to continue."
1075 GET ANS$: IF ANS$<>CHR$(13) THEN GOTO 1075
1080 PRINT "{clear}{white}"
1081 PRINT TAB(10)"*** brain teaser ***"
1091 PRINT
1092 PRINT "you may only move to an occupied space"
1093 PRINT "(a space with a Z on it). when you move";
1094 PRINT ",certain squares will reverse their"
1095 PRINT "state (change from a Z to a blank, or "
1096 PRINT "vice-versa)."
1099 PRINT
1100 PRINT "if you move to a corner, all of the adjacent squares reverse."
1102 PRINT "if you move to the middle of a side, all";
1103 PRINT "of the squares on that side will fill up";
1104 PRINT ", and if you choose the center square,"
1105 PRINT "that box and the four middle boxes will all be reversed."
1110 PRINT: PRINT: PRINT "{white}press return when ready to continue.";
1120 GET ANS$: IF ANS$<>CHR$(13) THEN GOTO 1120
1125 PRINT "{clear}{white}"
1130 PRINT TAB(10)"*** brain teaser ***"
1131 PRINT
1132 PRINT "here is a quick review of the various"
1133 PRINT "moves, and the resulting reversals...": PRINT
1140 PRINT "{blue}   {reverse on}Q{reverse off} {reverse on}Z{reverse off} {reverse on} {reverse off}     {reverse on}Z{reverse off} {reverse on}Q{reverse off} {reverse on}Z{reverse off}      {reverse on} {reverse off} {reverse on}Z{reverse off} {reverse on} {reverse off}"
1141 PRINT
1142 PRINT "{blue}   {reverse on}Q{reverse off} {reverse on}Z{reverse off} {reverse on} {reverse off}     {reverse on}Z{reverse off} {reverse on}Q{reverse off} {reverse on}Z{reverse off}      {reverse on} {reverse off} {reverse on}Z{reverse off} {reverse on} {reverse off}"
1143 PRINT
1144 PRINT "{blue}   {reverse on}Q{reverse off} {reverse on}Z{reverse off} {reverse on} {reverse off}     {reverse on}Z{reverse off} {reverse on}Q{reverse off} {reverse on}Z{reverse off}      {reverse on} {reverse off} {reverse on}Z{reverse off} {reverse on} {reverse off}"
1148 PRINT "{white}"
1150 PRINT "the o denotes the move position and the"
1151 PRINT "'*'S denote the pieces that will be"
1152 PRINT "flipped. the piece at 'o' will also be"
1153 PRINT "flipped. the board is designed like this:": PRINT
1160 PRINT "{blue}   {reverse on}1{reverse off} {reverse on}2{reverse off} {reverse on}3{reverse off}"
1161 PRINT
1162 PRINT "{blue}   {reverse on}4{reverse off} {reverse on}5{reverse off} {reverse on}6{reverse off}"
1163 PRINT
1164 PRINT "{blue}   {reverse on}1{reverse off} {reverse on}7{reverse off} {reverse on}9{reverse off}"
1170 PRINT: PRINT "{white}press return when ready to continue.";
1175 GET ANS$: IF ANS$<>CHR$(13) THEN GOTO 1175
1990 RETURN
2000 :
2001 REM *** SETUP
2002 :
2010 DIM BO(3,3): FOR I=1 TO 3: FOR J=1 TO 3: BO(I,J)=-1: NEXT: NEXT: BO(2,2)=1
2020 PLT=49152: FOR I=0 TO 24: READ C: POKE PLT+I,C: NEXT I
2021 DATA 32,16,192,132
2022 DATA 253,32,16,192
2023 DATA 152,170,164,253
2024 DATA 24,76,240,255
2025 DATA 32,253,174,32
2026 DATA 158,173,76,170,177
2990 RETURN
3000 :
3001 REM *** PLAY
3002 :
3010 PRINT "{clear}": FOR I=1 TO 3: FOR J=1 TO 3: GOSUB 3505: NEXT: NEXT
3020 FOR I=1 TO 3: FOR J=1 TO 3: IF BO(I,J)=1 OR (I=2 AND J=2) THEN NEXT: NEXT: WL=1: RETURN
3025 FOR I=1 TO 3: FOR J=1 TO 3: IF BO(I,J)=-1 THEN NEXT: NEXT: WL=0: RETURN
3030 SYS PLT,0,19: FOR I=1 TO 4: PRINT "{reverse off}                                        "
3031 NEXT
3035 SYS PLT,0,19: PRINT "{black} enter a position (1-9) or"
3040 PRINT "  return to quit ===> {reverse on} {reverse off}{left}";
3045 GET KEY$: IF KEY$="" THEN GOTO 3045
3050 PRINT KEY$
3060 IF KEY$=CHR$(13) THEN RETURN
3075 KEY=VAL(KEY$): I=1+INT((KEY-1)/3): J=KEY-3*(I-1)
3076 IF BO(I,J)=1 THEN GOTO 3080
3077 PRINT "  move only to an occupied square"
3078 FOR PA=1 TO 1500: NEXT: GOTO 3030
3080 ON KEY GOTO 3110,3120,3130,3140,3150,3160,3170,3180,3190
3110 I=1: J=1: GOSUB 3500
3111 I=1: J=2: GOSUB 3500
3112 I=2: J=1: GOSUB 3500
3113 I=2: J=2: GOSUB 3500: GOTO 3020
3120 I=1: J=1: GOSUB 3500
3121 I=1: J=2: GOSUB 3500
3122 I=1: J=3: GOSUB 3500: GOTO 3020
3130 I=1: J=2: GOSUB 3500
3131 I=1: J=3: GOSUB 3500
3132 I=2: J=2: GOSUB 3500
3133 I=2: J=3: GOSUB 3500: GOTO 3020
3140 I=1: J=1: GOSUB 3500
3141 I=2: J=1: GOSUB 3500
3142 I=3: J=1: GOSUB 3500: GOTO 3020
3150 I=1: J=2: GOSUB 3500
3151 I=2: J=1: GOSUB 3500
3152 I=2: J=2: GOSUB 3500
3153 I=2: J=3: GOSUB 3500
3154 I=3: J=2: GOSUB 3500: GOTO 3020
3160 I=1: J=3: GOSUB 3500
3161 I=2: J=3: GOSUB 3500
3162 I=3: J=3: GOSUB 3500: GOTO 3020
3170 I=2: J=1: GOSUB 3500
3171 I=2: J=2: GOSUB 3500
3172 I=3: J=1: GOSUB 3500
3173 I=3: J=2: GOSUB 3500: GOTO 3020
3180 I=3: J=1: GOSUB 3500
3181 I=3: J=2: GOSUB 3500
3182 I=3: J=3: GOSUB 3500: GOTO 3020
3190 I=2: J=2: GOSUB 3500
3191 I=2: J=3: GOSUB 3500
3192 I=3: J=2: GOSUB 3500
3193 I=3: J=3: GOSUB 3500: GOTO 3020
3500 BO(I,J)=-BO(I,J)
3505 PRINT MID$("{yellow} {blue}",BO(I,J)+2,1);
3510 IX=4*I: JX=8*J: FOR I2=IX TO IX+3: SYS PLT,JX,I2: PRINT "{reverse on}        ";: NEXT I2
3520 IF BO(I,J)=-1 THEN SYS PLT,JX+3,IX+1: PRINT "{black}{reverse on}-{down}{left}{left}-";: RETURN
3525 SYS PLT,JX+2,IX: PRINT "{blue}{reverse on}Z  Z{down}{left}{left}{left}ZZ{down}{left}{left}ZZ{down}{left}{left}{left}Z  Z";
3540 RETURN
3990 RETURN
4000 :
4001 REM *** END
4002 :
4005 SYS PLT,0,21
4010 PRINT "{white}{reverse off} the game is over!"
4020 IF WL=0 THEN PRINT "  and you lose.. sorry"
4030 IF WL=1 THEN PRINT "  and you won.. great!"
4040 PRINT "{home}";
4990 RETURN