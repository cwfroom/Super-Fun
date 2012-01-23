CLS
s = 0
OPEN "data.cwf" FOR INPUT AS #1
 INPUT #1, hiname$
 INPUT #1, hiscore
CLOSE #1

'title
CLS
PRINT "       ========Super Fun v1.2========"
PRINT "                     Copyright Cwf123.com"
PRINT ""
PRINT "               Highscore:"; hiscore; " by "; hiname$
PRINT ""
PRINT "Press any key to start..."
DO: LOOP WHILE INKEY$ = ""

load:
PRINT "What's your name please?"
INPUT name$
 IF name$ = "" THEN
  name$ = "Noname"
 END IF
PRINT "OK, "; name$; ",the rule is very easy."
PRINT ""
PRINT "You will see some ADD problems. If it equals to 9,19,29..., choose the right answer. Or you should choose the WRONG answer.Enter the number and then ENTER to choose."
PRINT ""
PRINT "Ready?(Press anykey.)"
DO: LOOP WHILE INKEY$ = ""
BEEP
PRINT ""
PRINT "GO!"
PRINT ""

gamestart:
'intial values
 RANDOMIZE TIMER
 x = INT(100 * RND)
 y = INT(100 * RND)
 act = x + y
 position = INT(100 * RND)
 right = INT(100 * RND)

'question
 PRINT x; "+"; y; "=?"
  IF position MOD 2 = 0 THEN
   PRINT "1="; right; " 2="; act
  ELSE
   PRINT "1="; act; " 2="; right
  END IF

'the wanted answer
 IF act - ((act \ 100) * 100) - ((act \ 10) * 10) = 9 THEN
  want = act
 ELSE
  want = right
 END IF
'choose
 INPUT in
  IF in <> 1 AND in <> 2 THEN
   PRINT "Have you mother told you to follow the rule?"
   GOTO gamestart

   ELSE
    IF position MOD 2 = 0 THEN
       IF in = 1 THEN
         chioce = right
       ELSE
         chioce = act
       END IF
     ELSE
      IF in = 1 THEN
         chioce = act
      ELSE
        chioce = right
      END IF
    END IF
   END IF
'judge
 IF chioce = want THEN
  PRINT "Yeah!"
  s = s + 1
  GOTO gamestart
 ELSE
  PRINT "You Lose!"
  GOTO endgame
 END IF
endgame:
BEEP
PRINT "Your score is"; s
PRINT ""
IF s > hiscore THEN
OPEN "data.cwf" FOR OUTPUT AS #2
CLOSE #2
OPEN "data.cwf" FOR APPEND AS #3
 PRINT #3, name$
 PRINT #3, s
CLOSE #3
END IF

'retry
PRINT "Retry?(Y to retry, other keys to exit.)"
INPUT sl$
 IF sl$ = "Y" OR sl$ = "y" THEN
  s = 0
  GOTO gamestart
 END IF
END

