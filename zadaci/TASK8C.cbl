       IDENTIFICATION DIVISION.
       PROGRAM-ID. CBLMSG.
       AUTHOR. Z26069.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       DATA DIVISION. 
       FILE SECTION.
       WORKING-STORAGE SECTION. 
       01 MESSAGE-STRUCT.
           05 FILLER            PIC X(10)      VALUE SPACES.
           05 ALPH-PART         PIC X(10)      VALUE SPACES.
           05 FILLER            PIC X          VALUE SPACE.
           05 NUMR-PART         PIC 9(10)      VALUE ZEROES.
           05 FILLER            PIC X          VALUE SPACE.
           05 NUMR-EDITED-PART  PIC ZZZZ.99    VALUE ZEROES.
           05 FILLER            PIC X          VALUE SPACE.
           05 NUMR-COMP-PART    PIC 9(4) COMP.

       PROCEDURE DIVISION.
           
           PERFORM DISPLAY-MESSAGE-PARA 
                   THROUGH DISPLAY-MESSAGE-PARA-EXIT.

           STOP RUN.

       DISPLAY-MESSAGE-PARA.
           MOVE "ABCDEFGHIJ" TO ALPH-PART.
           MOVE 9876543210 TO NUMR-PART.
           MOVE 6543.21 TO NUMR-EDITED-PART.
           MOVE 1234 TO NUMR-COMP-PART.
       
           DISPLAY "Initial MESSAGE-STRUCT:".
           DISPLAY MESSAGE-STRUCT.
           DISPLAY "NUMR-COMP-PART:" NUMR-COMP-PART.
       
           MOVE "LONG STRING TEST" TO MESSAGE-STRUCT.
       
           DISPLAY "After Moving Long String:".
           DISPLAY MESSAGE-STRUCT.
       
           DISPLAY "NUMERIC FIELDS:".
           DISPLAY "NUMR-PART:" NUMR-PART.
           DISPLAY "NUMR-EDITED-PART:" NUMR-EDITED-PART.

       DISPLAY-MESSAGE-PARA-EXIT.
           EXIT.