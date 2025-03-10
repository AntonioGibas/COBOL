       IDENTIFICATION DIVISION.
       PROGRAM-ID. CMODEL.
       AUTHOR. Z26069.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OUTFL ASSIGN TO UT-OUTFL
              ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD OUTFL RECORDING MODE F.
       01 OUTFL-RECORD PIC X(1204).

       WORKING-STORAGE SECTION.
           COPY CARSTBL.

       01 WS-OUTFL-RECORD PIC X(1204) VALUE SPACES.

       PROCEDURE DIVISION.
       0000-MAIN-PARA.
           OPEN OUTPUT OUTFL.

           PERFORM 0001-POPULATE-PARA THROUGH 0001-POPULATE-PARA-EXIT.
           PERFORM 0002-POPULATE-PARA THROUGH 0002-POPULATE-PARA-EXIT.
           PERFORM 0003-POPULATE-PARA THROUGH 0003-POPULATE-PARA-EXIT.
           PERFORM 0004-POPULATE-PARA THROUGH 0004-POPULATE-PARA-EXIT.
           PERFORM 0005-POPULATE-PARA THROUGH 0005-POPULATE-PARA-EXIT.
           PERFORM 0006-POPULATE-PARA THROUGH 0006-POPULATE-PARA-EXIT.
           PERFORM 0007-POPULATE-PARA THROUGH 0007-POPULATE-PARA-EXIT.
           PERFORM 0008-POPULATE-PARA THROUGH 0008-POPULATE-PARA-EXIT.
           PERFORM 0009-POPULATE-PARA THROUGH 0009-POPULATE-PARA-EXIT.
           PERFORM 0010-POPULATE-PARA THROUGH 0010-POPULATE-PARA-EXIT.

           CLOSE OUTFL.
           STOP RUN.

       0001-POPULATE-PARA.
           INITIALIZE CARSTBL OUTFL-RECORD.

           MOVE "BMW"                TO CAR-BRAND.
           MOVE "X5"                 TO CAR-MODEL.
           MOVE "G05"                TO CAR-MODEL-GEN.
           MOVE "2018-2023"          TO CAR-PROD-YEARS.
           MOVE "xDrive40i"          TO CAR-VERSION.
           MOVE "B58B30M1"           TO CAR-ENGINE-VERSION.
           MOVE "250 km/h"           TO CAR-TOP-SPEED.
           MOVE "5.5 sec"            TO CAR-ACCELERATION.
           MOVE "340 hp"             TO CAR-HORSE-POWER.
           MOVE "450 Nm @ 1500 rpm"  TO CAR-ENG-PARMS-OTHER.

      *    Prvi unos u array CAR-MODEL-PARMS (index 1)
           MOVE 1745.50              TO MODEL-HEIGHT(1).
           MOVE 2004.00              TO MODEL-WIDTH(1).
           MOVE 4922.00              TO MODEL-LENGTH(1).
           MOVE 2135.00              TO MODEL-WEIGHT(1).
           MOVE "Black"              TO MODEL-COLOUR(1).

      *    Drugi unos u array CAR-MODEL-PARMS (index 2)
           MOVE 1745.50              TO MODEL-HEIGHT(2).
           MOVE 2004.00              TO MODEL-WIDTH(2).
           MOVE 4922.00              TO MODEL-LENGTH(2).
           MOVE 2050.00              TO MODEL-WEIGHT(2).
           MOVE "White"              TO MODEL-COLOUR(2).

           MOVE "Premium"            TO CAR-EQ-VERSION.

           MOVE SPACES               TO EQ-NAME(1).
           STRING "Comfort Package"
                  DELIMITED BY SIZE
                  INTO EQ-NAME(1).

           MOVE SPACES               TO EQ-DESC(1).
           STRING "Includes heated seats, "
                  "automatic climate control, and ambient lighting"
                  DELIMITED BY SIZE
                  INTO EQ-DESC(1).

           MOVE SPACES               TO EQ-NAME(2).
           STRING "Technology Package"
                  DELIMITED BY SIZE
                  INTO EQ-NAME(2).

           MOVE SPACES               TO EQ-DESC(2).
           STRING "Includes head-up display, gesture control, "
                  "wireless charging, and premium audio system"
                  DELIMITED BY SIZE
                  INTO EQ-DESC(2).

           MOVE SPACES               TO EQ-NAME(3).
           STRING "Driver Assistance"
                  DELIMITED BY SIZE
                  INTO EQ-NAME(3).

           MOVE SPACES               TO EQ-DESC(3).
           STRING "Includes active cruise control, lane keeping assist,"
                  "blind spot detection, and parking assistant"
                  DELIMITED BY SIZE
                  INTO EQ-DESC(3).

           MOVE SPACES               TO EQ-NAME(4).
           STRING "Off-Road Package"
                  DELIMITED BY SIZE
                  INTO EQ-NAME(4).

           MOVE SPACES               TO EQ-DESC(4).
           STRING "Includes additional undercarriage protection, "
                  "off-road driving modes, and hill descent control"
                  DELIMITED BY SIZE
                  INTO EQ-DESC(4).

           MOVE SPACES               TO CAR-LIST-EQ.
           STRING "Comfort,Technology,Driver Assistance,Off-Road"
                  DELIMITED BY SIZE
                  INTO CAR-LIST-EQ.

           MOVE CARSTBL TO OUTFL-RECORD.
           WRITE OUTFL-RECORD.

       0001-POPULATE-PARA-EXIT.
           EXIT.

       0002-POPULATE-PARA.
           INITIALIZE CARSTBL OUTFL-RECORD.

           MOVE "Mercedes-Benz"      TO CAR-BRAND.
           MOVE "GLE"                TO CAR-MODEL.
           MOVE "V167"               TO CAR-MODEL-GEN.
           MOVE "2019-2024"          TO CAR-PROD-YEARS.
           MOVE "GLE 450 4MATIC"     TO CAR-VERSION.
           MOVE "M256"               TO CAR-ENGINE-VERSION.
           MOVE "250 km/h"           TO CAR-TOP-SPEED.
           MOVE "5.7 sec"            TO CAR-ACCELERATION.
           MOVE "367 hp"             TO CAR-HORSE-POWER.
           MOVE "500 Nm @ 1600 rpm"  TO CAR-ENG-PARMS-OTHER.

           MOVE 1772.00              TO MODEL-HEIGHT(1).
           MOVE 2015.00              TO MODEL-WIDTH(1).
           MOVE 4924.00              TO MODEL-LENGTH(1).
           MOVE 2175.00              TO MODEL-WEIGHT(1).
           MOVE "Silver"             TO MODEL-COLOUR(1).

           MOVE 1772.00              TO MODEL-HEIGHT(2).
           MOVE 2015.00              TO MODEL-WIDTH(2).
           MOVE 4924.00              TO MODEL-LENGTH(2).
           MOVE 2100.00              TO MODEL-WEIGHT(2).
           MOVE "Blue"               TO MODEL-COLOUR(2).

           MOVE "Luxury"             TO CAR-EQ-VERSION.

           MOVE "Premium Pack"       TO EQ-NAME(1).
           MOVE "Leather seats, panoramic sunroof, premium audio"
                TO EQ-DESC(1).

           MOVE "Technology Pack"    TO EQ-NAME(2).
           MOVE "Digital cockpit, augmented reality navigation"
                TO EQ-DESC(2).

           MOVE "Safety Assist"      TO EQ-NAME(3).
           MOVE "Adaptive cruise, lane keeping, collision avoidance"
                TO EQ-DESC(3).

           MOVE "Sport Package"      TO EQ-NAME(4).
           MOVE "AMG body styling, sport suspension, performance tires"
                TO EQ-DESC(4).

           MOVE "Premium,Technology,Safety Assist,Sport" TO CAR-LIST-EQ.

           MOVE CARSTBL TO OUTFL-RECORD.
           WRITE OUTFL-RECORD.

       0002-POPULATE-PARA-EXIT.
           EXIT.

       0003-POPULATE-PARA.
           INITIALIZE CARSTBL OUTFL-RECORD.

           MOVE "Audi"                TO CAR-BRAND.
           MOVE "Q7"                 TO CAR-MODEL.
           MOVE "4M"                 TO CAR-MODEL-GEN.
           MOVE "2015-2024"          TO CAR-PROD-YEARS.
           MOVE "55 TFSI quattro"    TO CAR-VERSION.
           MOVE "EA839"              TO CAR-ENGINE-VERSION.
           MOVE "250 km/h"           TO CAR-TOP-SPEED.
           MOVE "5.9 sec"            TO CAR-ACCELERATION.
           MOVE "340 hp"             TO CAR-HORSE-POWER.
           MOVE "500 Nm @ 1370 rpm"  TO CAR-ENG-PARMS-OTHER.

           MOVE 1740.00              TO MODEL-HEIGHT(1).
           MOVE 1970.00              TO MODEL-WIDTH(1).
           MOVE 5063.00              TO MODEL-LENGTH(1).
           MOVE 2145.00              TO MODEL-WEIGHT(1).
           MOVE "Gray"               TO MODEL-COLOUR(1).

           MOVE 1740.00              TO MODEL-HEIGHT(2).
           MOVE 1970.00              TO MODEL-WIDTH(2).
           MOVE 5063.00              TO MODEL-LENGTH(2).
           MOVE 2075.00              TO MODEL-WEIGHT(2).
           MOVE "Red"                TO MODEL-COLOUR(2).

           MOVE "Advanced"           TO CAR-EQ-VERSION.

           MOVE "Luxury Pack"        TO EQ-NAME(1).
           MOVE "Leather interior, heated seats, premium audio"
                TO EQ-DESC(1).

           MOVE "Tech Pack"          TO EQ-NAME(2).
           MOVE "Virtual cockpit, matrix LED headlights" TO EQ-DESC(2).

           MOVE "Driver Assist"      TO EQ-NAME(3).
           MOVE "Adaptive cruise, lane assist, 360 camera"
               TO EQ-DESC(3).

           MOVE "Off-Road"           TO EQ-NAME(4).
           MOVE "All-wheel drive tuning, hill descent control"
               TO EQ-DESC(4).

           MOVE "Luxury,Tech,Driver Assist,Off-Road" TO CAR-LIST-EQ.

           MOVE CARSTBL TO OUTFL-RECORD.
           WRITE OUTFL-RECORD.

       0003-POPULATE-PARA-EXIT.
           EXIT.

       0004-POPULATE-PARA.
           INITIALIZE CARSTBL OUTFL-RECORD.

           MOVE "Volkswagen"         TO CAR-BRAND.
           MOVE "Touareg"            TO CAR-MODEL.
           MOVE "CR"                 TO CAR-MODEL-GEN.
           MOVE "2018-2024"          TO CAR-PROD-YEARS.
           MOVE "V6 TDI"             TO CAR-VERSION.
           MOVE "EA897evo"           TO CAR-ENGINE-VERSION.
           MOVE "240 km/h"           TO CAR-TOP-SPEED.
           MOVE "6.1 sec"            TO CAR-ACCELERATION.
           MOVE "286 hp"             TO CAR-HORSE-POWER.
           MOVE "600 Nm @ 1750 rpm"  TO CAR-ENG-PARMS-OTHER.

           MOVE "Executive"          TO CAR-EQ-VERSION.
           MOVE "Luxury,Tech,Driver Assist,Off-Road" TO CAR-LIST-EQ.

           MOVE CARSTBL TO OUTFL-RECORD.
           WRITE OUTFL-RECORD.

       0004-POPULATE-PARA-EXIT.
           EXIT.

       0005-POPULATE-PARA.
           INITIALIZE CARSTBL OUTFL-RECORD.

           MOVE "Porsche"            TO CAR-BRAND.
           MOVE "Cayenne"            TO CAR-MODEL.
           MOVE "9YA"                TO CAR-MODEL-GEN.
           MOVE "2019-2024"          TO CAR-PROD-YEARS.
           MOVE "Turbo GT"           TO CAR-VERSION.
           MOVE "V8 biturbo"         TO CAR-ENGINE-VERSION.
           MOVE "300 km/h"           TO CAR-TOP-SPEED.
           MOVE "3.3 sec"            TO CAR-ACCELERATION.
           MOVE "640 hp"             TO CAR-HORSE-POWER.
           MOVE "850 Nm @ 2300 rpm"  TO CAR-ENG-PARMS-OTHER.

           MOVE "Sport"              TO CAR-EQ-VERSION.
           MOVE "Performance,Technology,Driver Assist" TO CAR-LIST-EQ.

           MOVE CARSTBL TO OUTFL-RECORD.
           WRITE OUTFL-RECORD.

       0005-POPULATE-PARA-EXIT.
           EXIT.

       0006-POPULATE-PARA.
           INITIALIZE CARSTBL OUTFL-RECORD.

           MOVE "Lexus"              TO CAR-BRAND.
           MOVE "RX"                 TO CAR-MODEL.
           MOVE "AL20"               TO CAR-MODEL-GEN.
           MOVE "2022-2024"          TO CAR-PROD-YEARS.
           MOVE "RX 500h"            TO CAR-VERSION.
           MOVE "Hybrid"             TO CAR-ENGINE-VERSION.
           MOVE "210 km/h"           TO CAR-TOP-SPEED.
           MOVE "6.2 sec"            TO CAR-ACCELERATION.
           MOVE "366 hp"             TO CAR-HORSE-POWER.
           MOVE "550 Nm @ 2000 rpm"  TO CAR-ENG-PARMS-OTHER.

           MOVE "Premium"            TO CAR-EQ-VERSION.
           MOVE "Luxury,Tech,Driver Assist,Comfort" TO CAR-LIST-EQ.

           MOVE CARSTBL TO OUTFL-RECORD.
           WRITE OUTFL-RECORD.

       0006-POPULATE-PARA-EXIT.
           EXIT.

       0007-POPULATE-PARA.
           INITIALIZE CARSTBL OUTFL-RECORD.

           MOVE "BMW"                TO CAR-BRAND.
           MOVE "X5"                 TO CAR-MODEL.
           MOVE "G05"                TO CAR-MODEL-GEN.
           MOVE "2018-2024"          TO CAR-PROD-YEARS.
           MOVE "M50i"               TO CAR-VERSION.
           MOVE "V8 TwinTurbo"       TO CAR-ENGINE-VERSION.
           MOVE "250 km/h"           TO CAR-TOP-SPEED.
           MOVE "4.1 sec"            TO CAR-ACCELERATION.
           MOVE "530 hp"             TO CAR-HORSE-POWER.
           MOVE "750 Nm @ 1800 rpm"  TO CAR-ENG-PARMS-OTHER.

           MOVE "M Sport"            TO CAR-EQ-VERSION.
           MOVE "Performance,Tech,Driver Assist" TO CAR-LIST-EQ.

           MOVE CARSTBL TO OUTFL-RECORD.
           WRITE OUTFL-RECORD.

       0007-POPULATE-PARA-EXIT.
           EXIT.

       0008-POPULATE-PARA.
           INITIALIZE CARSTBL OUTFL-RECORD.

           MOVE "Mercedes-Benz"      TO CAR-BRAND.
           MOVE "GLE"                TO CAR-MODEL.
           MOVE "V167"               TO CAR-MODEL-GEN.
           MOVE "2019-2024"          TO CAR-PROD-YEARS.
           MOVE "AMG 63 S"           TO CAR-VERSION.
           MOVE "V8 biturbo"         TO CAR-ENGINE-VERSION.
           MOVE "280 km/h"           TO CAR-TOP-SPEED.
           MOVE "3.8 sec"            TO CAR-ACCELERATION.
           MOVE "612 hp"             TO CAR-HORSE-POWER.
           MOVE "850 Nm @ 2000 rpm"  TO CAR-ENG-PARMS-OTHER.

           MOVE "AMG"                TO CAR-EQ-VERSION.
           MOVE "Sport,Tech,Driver Assist,Luxury" TO CAR-LIST-EQ.

           MOVE CARSTBL TO OUTFL-RECORD.
           WRITE OUTFL-RECORD.

       0008-POPULATE-PARA-EXIT.
           EXIT.

       0009-POPULATE-PARA.
           INITIALIZE CARSTBL OUTFL-RECORD.

           MOVE "Audi"                TO CAR-BRAND.
           MOVE "Q7"                  TO CAR-MODEL.
           MOVE "4M"                  TO CAR-MODEL-GEN.
           MOVE "2015-2024"          TO CAR-PROD-YEARS.
           MOVE "50 TDI"             TO CAR-VERSION.
           MOVE "V6 TDI"             TO CAR-ENGINE-VERSION.
           MOVE "250 km/h"           TO CAR-TOP-SPEED.
           MOVE "6.3 sec"            TO CAR-ACCELERATION.
           MOVE "286 hp"             TO CAR-HORSE-POWER.
           MOVE "600 Nm @ 1750 rpm"  TO CAR-ENG-PARMS-OTHER.

           MOVE 1                    TO MODEL-HEIGHT (1).
           MOVE 2                    TO MODEL-WIDTH (1).
           MOVE 3                    TO MODEL-LENGTH (1).
           MOVE 4                    TO MODEL-WEIGHT (1).
           MOVE "Black"              TO MODEL-COLOUR (1).

           MOVE "S Line"             TO CAR-EQ-VERSION.
           MOVE "Sport,Tech,Driver Assist,Luxury" TO CAR-LIST-EQ.

           MOVE "Sunroof"            TO EQ-NAME (1).
           MOVE "Panoramic sunroof with tilt function" TO EQ-DESC (1).

           MOVE CARSTBL TO OUTFL-RECORD.
           WRITE OUTFL-RECORD.

       0009-POPULATE-PARA-EXIT.
           EXIT.

       0010-POPULATE-PARA.
           INITIALIZE CARSTBL OUTFL-RECORD.

           MOVE "Volvo"               TO CAR-BRAND.
           MOVE "XC90"                TO CAR-MODEL.
           MOVE "SPA"                 TO CAR-MODEL-GEN.
           MOVE "2015-2024"          TO CAR-PROD-YEARS.
           MOVE "T8 Recharge"        TO CAR-VERSION.
           MOVE "Hybrid"             TO CAR-ENGINE-VERSION.
           MOVE "230 km/h"           TO CAR-TOP-SPEED.
           MOVE "5.8 sec"            TO CAR-ACCELERATION.
           MOVE "455 hp"             TO CAR-HORSE-POWER.
           MOVE "709 Nm @ 1500 rpm"  TO CAR-ENG-PARMS-OTHER.

           MOVE 1                    TO MODEL-HEIGHT (1).
           MOVE 2                    TO MODEL-WIDTH (1).
           MOVE 3                    TO MODEL-LENGTH (1).
           MOVE 4                    TO MODEL-WEIGHT (1).
           MOVE "White"              TO MODEL-COLOUR (1).

           MOVE "Inscription"        TO CAR-EQ-VERSION.
           MOVE "Luxury,Tech,Driver Assist,Comfort" TO CAR-LIST-EQ.

           MOVE "Pilot Assist"       TO EQ-NAME (1).
           MOVE "Semi-autonomous driving system" TO EQ-DESC (1).

           MOVE CARSTBL TO OUTFL-RECORD.
           WRITE OUTFL-RECORD.

       0010-POPULATE-PARA-EXIT.
           EXIT.
