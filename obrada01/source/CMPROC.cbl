       IDENTIFICATION DIVISION.
       PROGRAM-ID. CMPROC.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CHAMPION-FILE ASSIGN TO INFL1
                  ORGANIZATION IS SEQUENTIAL.

           SELECT CHAMPION-VSAM ASSIGN TO OUTFL1
                  ORGANIZATION IS INDEXED
                  ACCESS MODE IS DYNAMIC
                  RECORD KEY IS CHAMP-NAME
                  FILE STATUS IS VSAM-STATUS.

           SELECT REPORT1 ASSIGN TO OUTFL2
                  ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD CHAMPION-FILE.
           COPY CHAMPS.
      *
       FD CHAMPION-VSAM.
           COPY DETALJ01.

       FD REPORT1.
       01 CHAMPION-REPORT PIC X(100).

       WORKING-STORAGE SECTION.

      * STRUKTURA ZA ERROR-HANDLING VSAM POVRATNIH PODATAKA.
       01 VSAM-STATUS     PIC XX.
           88 VSAM-OK      VALUE "00".
           88 VSAM-DUPKEY  VALUE "22".

       01 EOF-FLAG PIC X VALUE 'N'.
           88 END-OF-FILE VALUE 'Y'.

       01 TOTAL-CHAMPS PIC 9(5) VALUE ZEROS.
       01 DUPLICATE-CHAMPS PIC 9(5) VALUE ZEROS.

       01 TEMP-REPORT-LINE PIC X(100).

       PROCEDURE DIVISION.
       MAIN-PARAGRAPH.
           OPEN INPUT CHAMPION-FILE.
           OPEN OUTPUT CHAMPION-VSAM.
           OPEN OUTPUT REPORT1.

           READ CHAMPION-FILE
               AT END SET END-OF-FILE TO TRUE
           END-READ.

           PERFORM UNTIL END-OF-FILE
               PERFORM WRITE-VSAM THROUGH WRITE-VSAM-EXIT
               READ CHAMPION-FILE
                   AT END SET END-OF-FILE TO TRUE
               END-READ
           END-PERFORM.

           PERFORM WRITE-REPORT THROUGH WRITE-REPORT-EXIT.

           CLOSE CHAMPION-FILE.
           CLOSE CHAMPION-VSAM.
           CLOSE REPORT1.
           STOP RUN.

       WRITE-VSAM.
           INITIALIZE CHAMPION-DETAIL REPLACING NUMERIC DATA BY ZEROS
            ALPHANUMERIC DATA BY SPACES.
           MOVE CHAMPION-NAME TO CHAMP-NAME.
           WRITE CHAMPION-DETAIL
           INVALID KEY
                ADD 1 TO DUPLICATE-CHAMPS
                DISPLAY "DUPLICATE KEY: " CHAMP-NAME
            NOT INVALID KEY
                ADD 1 TO TOTAL-CHAMPS
                DISPLAY "CHAMPION ADDED ..." CHAMP-NAME
           END-WRITE.

           IF NOT VSAM-OK
               DISPLAY "VSAM ERROR: " VSAM-STATUS
           END-IF.

       WRITE-VSAM-EXIT.
            EXIT.

       WRITE-REPORT.
           MOVE "VSAM OPERATIONS REPORT" TO CHAMPION-REPORT.
           WRITE CHAMPION-REPORT.

           STRING "TOTAL CHAMPIONS ADDED: " TOTAL-CHAMPS
               DELIMITED BY SIZE INTO TEMP-REPORT-LINE.
           MOVE TEMP-REPORT-LINE TO CHAMPION-REPORT.
           WRITE CHAMPION-REPORT.

           STRING "DUPLICATE CHAMPIONS: " DUPLICATE-CHAMPS
               DELIMITED BY SIZE INTO TEMP-REPORT-LINE.
           MOVE TEMP-REPORT-LINE TO CHAMPION-REPORT.
           WRITE CHAMPION-REPORT.

       WRITE-REPORT-EXIT.
           EXIT.
