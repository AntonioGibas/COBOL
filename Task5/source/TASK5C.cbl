      ****************************************************************** 
      * TASK5C - Program zaprima parametar iz PARAM izraza u JCL-u.    *
      *        - Ukoliko je unesen parametar, program ga ispise.       *
      *        - Ukoliko parametar nije unesen, program ispise gresku  *
      *          te zavrsi.                                            *
      ****************************************************************** 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TASK5C.
      *
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       LINKAGE SECTION.  
      * Struktura za zaprimanje parametara iz PARM statementa JCL-a
       01 PARMDATA.                               
           05 PARML           PIC 9(4) USAGE COMP.
           05 PARMD           PIC X(255).  
      *
       PROCEDURE DIVISION USING PARMDATA.
           
           IF PARML > 0                           
              DISPLAY "Success"                   
              DISPLAY "Parm lenght: " PARML       
              DISPLAY "Parm = " PARMD             
           ELSE
                DISPLAY "WRONG PARM!"
           END-IF 
           DISPLAY "...".
           STOP RUN.