       IDENTIFICATION DIVISION.
       PROGRAM-ID. CBLTBL.
       AUTHOR Z26069.
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL.   
           SELECT INFL-REC ASSIGN TO INFL
              ORGANIZATION IS SEQUENTIAL.
       DATA DIVISION. 
       FILE SECTION. 
       FD INFL-REC RECORDING MODE F.
       01 INFL-RECORD          PIC X(100).
       WORKING-STORAGE SECTION. 
       01  WORD-TAB.
           05  WORD-ENTRY      OCCURS 10 TIMES DEPENDING ON NUM-RECORDS
                               PIC X(10).
       01  NUM-RECORDS         PIC 9(2) VALUE 0.
       01  I                   PIC 9(2) VALUE 1.
       01  J                   PIC 9(2) VALUE 1.
       01  WORD-START          PIC 9(2) VALUE 1.
       01  WORD-END            PIC 9(2) VALUE 1.
       01  WORD-LENGTH         PIC 9(2) VALUE 0.
       01  INPUT-STRING        PIC X(100).

       PROCEDURE DIVISION.

       0000-MAIN-PARA.
           OPEN INPUT INFL-REC.
           PERFORM 1000-READ-RECORD.
           CLOSE INFL-REC.
           PERFORM 2000-SPLIT-WORDS.
           PERFORM 3000-DISPLAY-WORDS.
           STOP RUN.

       1000-READ-RECORD.
           READ INFL-REC INTO INPUT-STRING
               AT END MOVE 'END OF FILE' TO INPUT-STRING
           END-READ.
           IF INPUT-STRING = 'END OF FILE'
               DISPLAY "Datoteka je prazna ili nije pronađena."
               STOP RUN
           END-IF.
           DISPLAY "Procitani podaci: " INPUT-STRING.

       2000-SPLIT-WORDS.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH 
              OF INPUT-STRING
               IF INPUT-STRING(I:1) = ' ' OR I = LENGTH OF INPUT-STRING
                   COMPUTE WORD-LENGTH = I - WORD-START
                   IF WORD-LENGTH > 0
                       ADD 1 TO NUM-RECORDS
                     IF NUM-RECORDS > 10
                      DISPLAY "Prekoracenje niza! Maksimalno 10 rijeci."
                      EXIT PERFORM
                     END-IF
                       MOVE INPUT-STRING(WORD-START:WORD-LENGTH) 
                         TO WORD-ENTRY(NUM-RECORDS)
                       COMPUTE WORD-START = I + 1
                   END-IF
               END-IF
           END-PERFORM.

       3000-DISPLAY-WORDS.
           DISPLAY "Broj rijeci: " NUM-RECORDS.
           DISPLAY "Rijeci u nizu:".
           PERFORM VARYING J FROM 1 BY 1 UNTIL J > NUM-RECORDS
               DISPLAY WORD-ENTRY(J)
           END-PERFORM.