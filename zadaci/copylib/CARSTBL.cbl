       01 CARSTBL.
           05 CAR-BRAND             PIC X(50)   VALUE SPACES.
           05 FILLER                PIC A       VALUE SPACE.
           05 CAR-MODEL             PIC X(50)   VALUE SPACES.
           05 FILLER                PIC A       VALUE SPACE.
           05 CAR-MODEL-GEN         PIC X(50)   VALUE SPACES.
           05 FILLER                PIC A       VALUE SPACE.
           05 CAR-PROD-YEARS        PIC X(10)   VALUE SPACES.
           05 FILLER                PIC A       VALUE SPACE.
           05 CAR-VERSION           PIC X(30)   VALUE SPACES.
           05 FILLER                PIC A       VALUE SPACE.
           05 CAR-ENGINE-VERSION    PIC X(30)   VALUE SPACES.
           05 FILLER                PIC A       VALUE SPACE.
           05 CAR-TOP-SPEED         PIC X(10)   VALUE SPACES.
           05 FILLER                PIC A       VALUE SPACE.
           05 CAR-ACCELERATION      PIC X(10)   VALUE SPACES.
           05 FILLER                PIC A       VALUE SPACE.
           05 CAR-HORSE-POWER       PIC X(10)   VALUE SPACES.
           05 FILLER                PIC A       VALUE SPACE.
           05 CAR-ENG-PARMS-OTHER   PIC X(20)   VALUE SPACES.
           05 FILLER                PIC A       VALUE SPACE.
           05 CAR-MODEL-PARMS       OCCURS 10 TIMES.
              10 MODEL-HEIGHT       PIC 9(5)V99 VALUE ZEROES.
              10 MODEL-WIDTH        PIC 9(5)V99 VALUE ZEROES.
              10 MODEL-LENGTH       PIC 9(5)V99 VALUE ZEROES.
              10 MODEL-WEIGHT       PIC 9(5)V99 VALUE ZEROES.
              10 MODEL-COLOUR       PIC X(10)   VALUE SPACES.
           05 FILLER                PIC A       VALUE SPACE.
           05 CAR-EQ-VERSION        PIC X(10)   VALUE SPACES.
           05 FILLER                PIC A       VALUE SPACE.
           05 CAR-EQ-TABLE          OCCURS 4 TIMES.
              10 EQ-NAME            PIC X(20)   VALUE SPACES.
              10 EQ-DESC            PIC X(100)  VALUE SPACES.
           05 FILLER                PIC A       VALUE SPACE.
           05 CAR-LIST-EQ           PIC X(50)   VALUE SPACES.
           05 FILLER                PIC A       VALUE SPACE.
