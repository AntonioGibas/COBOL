       IDENTIFICATION DIVISION.
       PROGRAM-ID. CBLSORT.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01 DATA-STRUCTURE.
           05 UNSORTED-ARRAY PIC 9 OCCURS 9 TIMES.

       01 I PIC 99 VALUE 0.
       01 J PIC 99 VALUE 0.
       01 TEMP PIC 9.

       PROCEDURE DIVISION.
           DISPLAY "PROGRAM POCINJE."
           
           PERFORM 0001-MAIN-ROUTINE.
           
           DISPLAY "PROGRAM ZAVRSAVA."
           STOP RUN.
           
       0001-MAIN-ROUTINE.
           PERFORM 0002-POPULATE-ARRAY.
           PERFORM 0003-REVERSE-MEMBERS.
           PERFORM 0004-DISPLAY-ARRAY.
           
       0002-POPULATE-ARRAY.
           DISPLAY "POPUNJAVANJE POLJA VRIJEDNOSTIMA:".
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 9
               MOVE I TO UNSORTED-ARRAY(I)
               DISPLAY "ELEMENT ", I, ": ", UNSORTED-ARRAY(I)
           END-PERFORM.
           
       0003-REVERSE-MEMBERS.
           DISPLAY "OBRTANJE POLJA...".
           MOVE 1 TO I.
           MOVE 9 TO J.
           
           PERFORM UNTIL I >= J
               MOVE UNSORTED-ARRAY(I) TO TEMP
               MOVE UNSORTED-ARRAY(J) TO UNSORTED-ARRAY(I)
               MOVE TEMP TO UNSORTED-ARRAY(J)
               ADD 1 TO I
               SUBTRACT 1 FROM J
           END-PERFORM.
           
       0004-DISPLAY-ARRAY.
           DISPLAY "OBRNUTI REDOSLIJED POLJA:".
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 9
               DISPLAY "ELEMENT ", I, ": ", UNSORTED-ARRAY(I)
           END-PERFORM.