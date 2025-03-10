      ******************************************************************
      *    TASK6C - Zaprimanje inputa preko SYSIN iz JCL-a te prijenos *
      *             istog u strukturu podataka.                        * 
      ****************************************************************** 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TASK6C.
       AUTHOR. Z26069.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INFL-A ASSIGN TO INFL
                  ORGANIZATION IS SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION. 
       FD INFL-A RECORDING MODE F.
       01 INFL-A-RECORD PIC X(80).
       WORKING-STORAGE SECTION.
       01 DOG-RECORD PIC X(80).
       01 DOG.
           05 D-RACE  PIC X(20) VALUE SPACES.
           05 D-NAME  PIC X(25) VALUE SPACES.
           05 D-AGE   PIC X(2)  VALUE ZEROES.
           05 D-OWNER PIC X(25) VALUE SPACES.
           05 FILLER  PIC X(8)  VALUE SPACES.

       PROCEDURE DIVISION.
       MAIN-PARAGRAPH.
           OPEN INPUT INFL-A.
           READ INFL-A INTO DOG-RECORD
              AT END   
                  CLOSE INFL-A 
                  STOP RUN
           END-READ.
           INITIALIZE DOG.
           MOVE DOG-RECORD TO DOG.

           PERFORM DISPLAY-DOG-PARA THROUGH DISPLAY-DOG-PARA-EXIT.

           CLOSE INFL-A.
           STOP RUN.

       DISPLAY-DOG-PARA.
            
           DISPLAY FUNCTION TRIM(D-RACE)  " LENGTH:" LENGTH OF D-RACE.
           DISPLAY FUNCTION TRIM(D-NAME)  " LENGTH:" LENGTH OF D-NAME.
           DISPLAY D-AGE                  " LENGTH:" LENGTH OF D-AGE.
           DISPLAY FUNCTION TRIM(D-OWNER) " LENGTH:" LENGTH OF D-OWNER.

       DISPLAY-DOG-PARA-EXIT.
           EXIT.