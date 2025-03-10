       IDENTIFICATION DIVISION.
       PROGRAM-ID. CBLEMPS.
       AUTHOR. Z26069.
       
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 COMPUTER-TABLE.
          05 COMPUTER-ENTRY OCCURS 1000 TIMES INDEXED BY COMP-INDEX.
             10 COMPUTER-ID        PIC X(5).
             10 OWNER-NAME         PIC X(30).
             10 OWNER-EMAIL        PIC X(50).
             10 PURCHASE-DATE      PIC X(10).  
             10 TRANSFER-DATE      PIC X(10).  
       
       01 WS-SUB                   PIC 9(4) COMP VALUE 0.
       01 NUM-ENTRIES              PIC 9(4) COMP VALUE 3. 
       01 DISPLAY-COUNT            PIC 9(4) COMP.
       01 I                        PIC 9(4) VALUE ZEROS.
       
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            PERFORM POPULATE-TABLE
      *     PERFORM DISPLAY-WITH-SUBSCRIPT
           PERFORM DISPLAY-WITH-COUNTER
           STOP RUN.
       
       POPULATE-TABLE.
           *> First computer entry
           MOVE "C001" TO COMPUTER-ID(1)
           MOVE "John Doe" TO OWNER-NAME(1)
           MOVE "john@company.com" TO OWNER-EMAIL(1)
           MOVE "2020-01-15" TO PURCHASE-DATE(1)
           MOVE "2021-03-01" TO TRANSFER-DATE(1)
       
           *> Second computer entry
           MOVE "C002" TO COMPUTER-ID(2)
           MOVE "Jane Smith" TO OWNER-NAME(2)
           MOVE "jane@company.com" TO OWNER-EMAIL(2)
           MOVE "2019-05-20" TO PURCHASE-DATE(2)
           MOVE "2022-06-15" TO TRANSFER-DATE(2)
       
           *> Third computer entry
           MOVE "C003" TO COMPUTER-ID(3)
           MOVE "Bob Johnson" TO OWNER-NAME(3)
           MOVE "bob@company.com" TO OWNER-EMAIL(3)
           MOVE "2023-02-10" TO PURCHASE-DATE(3)
           MOVE "2023-03-01" TO TRANSFER-DATE(3).
       
      *DISPLAY-WITH-SUBSCRIPT.
      *    DISPLAY "Displaying using SUBSCRIPT:"
      *    PERFORM VARYING WS-SUB FROM 1 BY 1
      *        UNTIL WS-SUB > NUM-ENTRIES
      *        DISPLAY "Entry: " WS-SUB
      *        DISPLAY "Computer ID: " COMPUTER-ID(WS-SUB)
      *        DISPLAY "Owner: " OWNER-NAME(WS-SUB)
      *        DISPLAY "Email: " OWNER-EMAIL(WS-SUB)
      *        DISPLAY "Purchased: " PURCHASE-DATE(WS-SUB)
      *        DISPLAY "Transferred: " TRANSFER-DATE(WS-SUB)
      *        DISPLAY " "
      *    END-PERFORM.
       
       DISPLAY-WITH-COUNTER.
           DISPLAY "Displaying using COMPUTER-ID: "
           PERFORM VARYING I FROM 1 BY 1
              UNTIL I > NUM-ENTRIES
              IF COMPUTER-ID = "C003" OR "C002" THEN
                 DISPLAY "Entry: " I
                 DISPLAY "Computer ID: " COMPUTER-ID(I)
                 DISPLAY "Owner: " OWNER-NAME(I)
                 DISPLAY "Email: " OWNER-EMAIL(I)
                 DISPLAY "Purchased: " PURCHASE-DATE(I)
                 DISPLAY "Transferred: " TRANSFER-DATE(I)
                 DISPLAY " "
              END-IF
           END-PERFORM. 