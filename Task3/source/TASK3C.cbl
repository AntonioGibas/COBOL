      ******************************************************************
      * TASK3C - Otvaranje input datoteke INFL                         *
      *        - Provjera ulaznog stringa u EVALUATE izrazu            *
      *        - Poziv procedure ovisno o unesenom:                    *
      *          - OPTION-1 - Izvodi paragraf OPT1-PARA - Upis poruke  *
      *                       u izlazni dataset                        *
      *          - OPTION-2 - Izvodi paragraf OPT2-PARA - Upis poruke  *
      *                       u izlazni dataset                        *
      *          - Sve druge opcije upisuju tekst "INVALID INPUT" u    *
      *            izalzni dataset                                     *
      ****************************************************************** 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TASK3C.
      *
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INFL ASSIGN TO UT-INFL
               ORGANIZATION IS SEQUENTIAL.

           SELECT OUTFL ASSIGN TO UT-OUTFL
               ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  INFL.
       01  INFL-RECORD          PIC X(80).

       FD  OUTFL.
       01  OUTFL-RECORD         PIC X(80).

       WORKING-STORAGE SECTION.
       01  WS-INPUT-INFL        PIC X(80).
       01  WS-INPUT-TRIM        PIC X(8).
       01  WS-OPTIONS.
           02 WS-OPT1           PIC X(8) VALUE "OPTION-1".
           02 WS-OPT2           PIC X(8) VALUE "OPTION-2".

       PROCEDURE DIVISION.
       PROCESS-OPTIONS.
           PERFORM CHK-OPT-PARA THRU CHK-OPT-PARA-EXIT.
           STOP RUN.

       CHK-OPT-PARA.
           OPEN INPUT INFL.
           OPEN OUTPUT OUTFL.

           READ INFL INTO WS-INPUT-INFL
               AT END DISPLAY "NO INPUT FOUND"
               STOP RUN
           END-READ.

           MOVE FUNCTION TRIM(WS-INPUT-INFL) TO WS-INPUT-TRIM.

           EVALUATE WS-INPUT-TRIM
               WHEN WS-OPT1 
                   PERFORM OPT1-PARA
               WHEN WS-OPT2 
                   PERFORM OPT2-PARA
               WHEN OTHER 
                   PERFORM OPT-ERROR-PARA
           END-EVALUATE.

           CLOSE INFL.
           CLOSE OUTFL.

       CHK-OPT-PARA-EXIT.
           EXIT.

       OPT1-PARA.
           MOVE "OPTION-1 ENTERED: " TO OUTFL-RECORD.
           WRITE OUTFL-RECORD.
           EXIT.

       OPT2-PARA.
           MOVE "OPTION-2 ENTERED: " TO OUTFL-RECORD.
           WRITE OUTFL-RECORD.
           EXIT.

       OPT-ERROR-PARA.
           MOVE "INPUT ERROR" TO OUTFL-RECORD.
           WRITE OUTFL-RECORD.
           EXIT.
