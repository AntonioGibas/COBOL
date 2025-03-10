       IDENTIFICATION DIVISION.
       PROGRAM-ID. CBLTYPE.
       AUTHOR Z26069.
      * 
       DATA DIVISION. 
       FILE SECTION. 
       WORKING-STORAGE SECTION. 
      *     Bank account simple structure.
       01 BANK-BALANCE.
           05 ACCOUNT-ID               PIC 9(12).
           05 FILLER                   PIC X      VALUE SPACE.
           05 ACCOUNT-TYPE             PIC 999.
           05 FILLER                   PIC X      VALUE SPACE.
           05 ACCOUNT-USER             PIC X(100).
           05 FILLER                   PIC X      VALUE SPACE.
           05 ACCOUNT-NUMBER           PIC X(34).
           05 FILLER                   PIC X      VALUE SPACE.
           05 ACCOUNT-BALANCE          PIC S9(12)V9(3).
           05 FILLER                   PIC X      VALUE SPACE.
           05 ACCOUNT-CURENCY.         
              10 CURRENCY-EUR          PIC X(3)   VALUE 'EUR'.
              10 CURRENCY-USD          PIC X(3)   VALUE 'USD'.
              10 CURRENCY-CNY          PIC X(3)   VALUE 'CNY'.
           05 FILLER                   PIC X      VALUE SPACE.
           05 ACCOUNT-CURRENCY-ID      PIC 999.
           05 FILLER                   PIC X      VALUE SPACE.
           05 ACCOUNT-REGION           PIC X(50).
           05 FILLER                   PIC X      VALUE SPACE.
           05 ACCOUNT-START-DATE       PIC X(8).
           05 FILLER                   PIC X      VALUE SPACE.
           05 ACCOUNT-END-DATE         PIC X(8)   VALUE SPACES.
           05 FILLER                   PIC X      VALUE SPACE.

      *     Date and time structure.
       01 DATE-TIME-STRUCT.
           05 ST-DAY                   PIC 9(2).
           05 FILLER                   PIC X      VALUE '-'.
           05 ST-MONTH                 PIC 9(2).
           05 FILLER                   PIC X      VALUE '-'.
           05 ST-YEAR                  PIC 9(4).
           05 FILLER                   PIC X      VALUE SPACE.
           05 ST-HOURS                 PIC 99. 
           05 FILLER                   PIC X      VALUE ':'.
           05 ST-MINUTES               PIC 99.
           05 FILLER                   PIC X      VALUE ':'.
           05 ST-SECCONDS              PIC 99.
           05 FILLER                   PIC X      VALUE ':'.
           05 ST-MILISECCONDS          PIC 99.

      *     User data
       01 USER-DATA-STRUCT.
           05 USER-ID                  PIC 9(12).
           05 FILLER                   PIC X      VALUE SPACE.
           05 USER-NAME                PIC X(50).
           05 FILLER                   PIC X      VALUE SPACE.
           05 USER-SURNAME             PIC X(50).
           05 FILLER                   PIC X      VALUE SPACE.
           05 USER-AGE                 PIC 999.
           05 FILLER                   PIC X      VALUE SPACE.
           05 USER-RESIDENCE           PIC X(50).
           05 FILLER                   PIC X      VALUE SPACE.
           05 USER-INHIBITANCY         PIC X(50).
           05 FILLER                   PIC X      VALUE SPACE.
           05 USER-NATIONALITY         PIC X(25).
           05 FILLER                   PIC X      VALUE SPACE.
           
      *     Computational data
       01 COMP-DATA-STRUCTURE.
           05 COMP-VAR-1               PIC 9(12) USAGE IS COMP.
           05 COMP-VAR-2                         USAGE IS COMP-1.
           05 COMP-VAR-3                         USAGE IS COMP-2.
           05 COMP-VAR-4               PIC 9(12) USAGE IS COMP-3.
           05 COMP-VAR-5               PIC 9(12) USAGE IS COMP-4.
           05 COMP-VAR-6               PIC 9(12) USAGE IS COMP-5. 
      
      *     Coordinates data
       01 COORDINATE-RECORD.
           05 LATITUDE-DMS.
              10 LAT-DEGREE            PIC 99.
              10 FILLER                PIC X        VALUE '°'.
              10 LAT-MINUTE            PIC 99.
              10 FILLER                PIC X        VALUE "'".
              10 LAT-SECOND            PIC 99.
              10 FILLER                PIC X        VALUE '"'.
              10 LAT-HEMISPHERE        PIC X.
              10 FILLER                PIC X        VALUE "N".
           05 FILLER                   PIC X(3)     VALUE ' | '.
           05 LONGITUDE-DMS.
              10 LON-DEGREE            PIC 99.
              10 FILLER                PIC X        VALUE '°'.
              10 LON-MINUTE            PIC 99.
              10 FILLER                PIC X        VALUE "'".
              10 LON-SECOND            PIC 99.
              10 FILLER                PIC X        VALUE '"'.
              10 LON-HEMISPHERE        PIC X.
              10 FILLER                PIC X        VALUE 'E'.
           05 FILLER                   PIC X(3)     VALUE ' # '.
           05 LATITUDE-DD.
              10 LAT-DECIMAL           PIC 99V9999.
              10 FILLER                PIC X        VALUE '°'.
              10 LAT-HEMISPHERE-DD     PIC X.
              10 FILLER                PIC X        VALUE '°'.
           05 FILLER                   PIC X(3)     VALUE ' * '.
           05 LONGITUDE-DD.
              10 LON-DECIMAL           PIC 99V9999.
              10 FILLER                PIC X        VALUE '°'.
              10 LON-HEMISPHERE-DD     PIC X.
              10 FILLER                PIC X        VALUE '°'.
           05 FILLER                   PIC X(3)     VALUE ' | '.
           05 LATITUDE-DMM.
              10 LAT-DEGREE-M          PIC 99.
              10 FILLER                PIC X        VALUE '°'.
              10 LAT-DEC-MIN           PIC 99V999.
              10 FILLER                PIC X        VALUE "'".
              10 LAT-HEMISPHERE-M      PIC X.       
              10 FILLER                PIC X        VALUE "N".
           05 FILLER                   PIC X(3)     VALUE ' # '.
           05 LONGITUDE-DMM.
              10 LON-DEGREE-M          PIC 99.
              10 FILLER                PIC X        VALUE '°'.
              10 LON-DEC-MIN           PIC 99V999.
              10 FILLER                PIC X        VALUE "'".
              10 LON-HEMISPHERE-M      PIC X.  
              10 FILLER                PIC X        VALUE "E".
           05 FILLER                   PIC X(3)     VALUE ' * '.
           05 UTM-ZONE                 PIC X(3).  
           05 FILLER                   PIC X        VALUE 'T'.
           05 FILLER                   PIC X(3)     VALUE ' | '.
           05 UTM-EASTING              PIC 9(6).    
           05 FILLER                   PIC X(3)     VALUE ' # '.
           05 UTM-NORTHING             PIC 9(7).    
           05 FILLER                   PIC X(3)     VALUE ' * '.
           05 MGRS-COORD               PIC X(15).
   
       PROCEDURE DIVISION.
       0000-MAIN-PARA.
           STOP RUN.
