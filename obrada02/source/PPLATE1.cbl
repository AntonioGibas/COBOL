       IDENTIFICATION DIVISION.
       PROGRAM-ID. PPLATE1.
       AUTHOR. Z26069.
       DATE-WRITTEN.  27-02-2025.
       DATE-COMPILED. 27-02-2025.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT TARGET-DATASET ASSIGN TO OUTFL
              ORGANIZATION IS SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD TARGET-DATASET RECORDING MODE IS F.
       01  BOOK-RECORD.
           05 BOOK-ID     PIC 9(5).
           05 FILLER      PIC X VALUE SPACE.
           05 BOOK-TITLE  PIC X(50).
           05 FILLER      PIC X VALUE SPACE.
           05 BOOK-AUTHOR PIC X(30).
           05 FILLER      PIC X VALUE SPACE.
           05 BOOK-GENRE  PIC X(20).
           05 FILLER      PIC X VALUE SPACE.
           05 BOOK-YEAR   PIC 9(4).
           05 FILLER      PIC X VALUE SPACE.
           05 BOOK-STATUS PIC X(1).

       WORKING-STORAGE SECTION.

       01 EOF-FLAG PIC X VALUE 'N'.
           88 END-OF-FILE VALUE 'Y'.

       01 WS-CURRENT-DATE.
           05 WS-YEAR           PIC 9(4).
           05 WS-MONTH          PIC 9(2).
           05 WS-DAY            PIC 9(2).
           05 WS-HOUR           PIC 9(2).
           05 WS-MINUTE         PIC 9(2).
           05 WS-SECOND         PIC 9(2).
           05 WS-MILLISECONDS   PIC 9(2).

       01 WS-RANDOM-SEED        PIC 9(7).
       01 WS-UNIQUE-ID          PIC 9(10).
       01 WS-COUNTER            PIC 9(5)  VALUE ZEROS.

       01 WS-RANDOM-NUMBER      PIC 9(7)  VALUE ZEROS.
       01 WS-SEED               PIC 9(7)  VALUE ZEROS.

      * Array s naslovima knjiga
       01  BROJ-KNJIGA                   PIC 9(3) VALUE 100.

       01  TABLICA-KNJIGA.
           05  NASLOV-KNJIGE OCCURS 100 TIMES.
               10  TEKST-NASLOVA         PIC X(50).

      * Array s imenima autora
       01  BROJ-AUTORA                   PIC 9(3) VALUE 20.
       01  TABLICA-AUTORA.
           05  AUTOR OCCURS 20 TIMES.
               10  IME-AUTORA            PIC X(30).

      * Array s zanrovima
       01  BROJ-ZANROVA                  PIC 9(2) VALUE 10.
       01  TABLICA-ZANROVA.
           05  ZANR OCCURS 10 TIMES.
               10  NAZIV-ZANRA           PIC X(20).

       PROCEDURE DIVISION.
       MAIN-PARAGRAPH.
           OPEN OUTPUT TARGET-DATASET.

           PERFORM INICIJALIZIRAJ-TABLICE THROUGH INICIJALIZIRAJ-EXIT.

           MOVE 1 TO WS-COUNTER.
           PERFORM UNTIL WS-COUNTER > 100
              PERFORM POPULIRAJ-DATASET THROUGH POPULIRAJ-EXIT
              ADD 1 TO WS-COUNTER
           END-PERFORM.

           CLOSE TARGET-DATASET.
           STOP RUN.

       INICIJALIZIRAJ-TABLICE.
      * Inicijalizacija naslova knjiga
           MOVE "Suton Proroanstva" TO TEKST-NASLOVA(1)
           MOVE "amor Crnog Jezera" TO TEKST-NASLOVA(2)
           MOVE "Labirint Izgubljenih Dua" TO TEKST-NASLOVA(3)
           MOVE "Tajna Kristalnog Vrta" TO TEKST-NASLOVA(4)
           MOVE "Posljednji Let Srebrnog Orla" TO TEKST-NASLOVA(5)
           MOVE "Sjene Zaboravljenog Kraljevstva" TO TEKST-NASLOVA(6)
           MOVE "Kraa Mjeseeve Svjetlosti" TO TEKST-NASLOVA(7)
           MOVE "uvari Ledene ume" TO TEKST-NASLOVA(8)
           MOVE "Naputeni Svjetionik" TO TEKST-NASLOVA(9)
           MOVE "Kova Sudbine" TO TEKST-NASLOVA(10)
           MOVE "Plesai Drevne Magle" TO TEKST-NASLOVA(11)
           MOVE "Vrijeme Zaboravljenih Rijei" TO TEKST-NASLOVA(12)
           MOVE "apat Srebrnih Zvijezda" TO TEKST-NASLOVA(13)
           MOVE "Kljuevi Tajnih Vrata" TO TEKST-NASLOVA(14)
           MOVE "ovjek Koji Je Sanjao Muziku" TO TEKST-NASLOVA(15)
           MOVE "Dvanaesti Mjesec" TO TEKST-NASLOVA(16)
           MOVE "Ljekovita Pjesma" TO TEKST-NASLOVA(17)
           MOVE "Grad Ispod Magle" TO TEKST-NASLOVA(18)
           MOVE "Noni Skitnica" TO TEKST-NASLOVA(19)
           MOVE "Posljednja Biblioteka" TO TEKST-NASLOVA(20)
           MOVE "Zapisiva Snova" TO TEKST-NASLOVA(21)
           MOVE "Zvjezdani Traga" TO TEKST-NASLOVA(22)
           MOVE "Brodolom Na Kraju Vremena" TO TEKST-NASLOVA(23)
           MOVE "Poziv Iz Dubine" TO TEKST-NASLOVA(24)
           MOVE "Lutanje Kroz Beskraj" TO TEKST-NASLOVA(25)
           MOVE "Prolaz U Drugo Nebo" TO TEKST-NASLOVA(26)
           MOVE "Ples Zaboravljenih Sjena" TO TEKST-NASLOVA(27)
           MOVE "Svijet Iza Ogledala" TO TEKST-NASLOVA(28)
           MOVE "Putnik Izmeu Svjetova" TO TEKST-NASLOVA(29)
           MOVE "Zarobljeno Svjetlo" TO TEKST-NASLOVA(30)
           MOVE "Gospodar Kamenih Zmajeva" TO TEKST-NASLOVA(31)
           MOVE "Neispriane Prie" TO TEKST-NASLOVA(32)
           MOVE "Peta Dimenzija" TO TEKST-NASLOVA(33)
           MOVE "Izgubljeni Fragment" TO TEKST-NASLOVA(34)
           MOVE "Pustinjski Sat" TO TEKST-NASLOVA(35)
           MOVE "Vjetrovi Sa Sjevera" TO TEKST-NASLOVA(36)
           MOVE "Dvorana Zaboravljenih Koraka" TO TEKST-NASLOVA(37)
           MOVE "Blago Morskih Dubina" TO TEKST-NASLOVA(38)
           MOVE "apta Mraku" TO TEKST-NASLOVA(39)
           MOVE "Kolekcionar Izgubljenih Sjeanja" TO TEKST-NASLOVA(40)
           MOVE "Enigma Sanjara" TO TEKST-NASLOVA(41)
           MOVE "Posljednji Maioniar" TO TEKST-NASLOVA(42)
           MOVE "Zvjezdana Kia" TO TEKST-NASLOVA(43)
           MOVE "ume Bez Povratka" TO TEKST-NASLOVA(44)
           MOVE "Skrivene Istine" TO TEKST-NASLOVA(45)
           MOVE "Mapa Nepoznatih Mora" TO TEKST-NASLOVA(46)
           MOVE "Peta Stranica" TO TEKST-NASLOVA(47)
           MOVE "Tajne Srebrnog Grada" TO TEKST-NASLOVA(48)
           MOVE "Traga Za Dalekim Obalama" TO TEKST-NASLOVA(49)
           MOVE "Kamen Mudraca" TO TEKST-NASLOVA(50)
           MOVE "Kraa Vjenosti" TO TEKST-NASLOVA(51)
           MOVE "Spava U Ledu" TO TEKST-NASLOVA(52)
           MOVE "Zaboravljeno Kraljevstvo" TO TEKST-NASLOVA(53)
           MOVE "Plesaica Sa Sedam Velova" TO TEKST-NASLOVA(54)
           MOVE "uvar Staklene ume" TO TEKST-NASLOVA(55)
           MOVE "Miris Zaboravljenog Vremena" TO TEKST-NASLOVA(56)
           MOVE "arene Niti Sudbine" TO TEKST-NASLOVA(57)
           MOVE "Graditelj Mostova" TO TEKST-NASLOVA(58)
           MOVE "Otisci U Snijegu" TO TEKST-NASLOVA(59)
           MOVE "Vrhovni Arhivar" TO TEKST-NASLOVA(60)
           MOVE "Glazba Za Mrtve" TO TEKST-NASLOVA(61)
           MOVE "Karte Izgubljenih Kraljevstava" TO TEKST-NASLOVA(62)
           MOVE "Zelena Svjetlost Na Obzoru" TO TEKST-NASLOVA(63)
           MOVE "Lovac Na Zaboravljene Prie" TO TEKST-NASLOVA(64)
           MOVE "Prastari Zavjet" TO TEKST-NASLOVA(65)
           MOVE "Putovanja Slijepog Kartografa" TO TEKST-NASLOVA(66)
           MOVE "Skriveni Putevi" TO TEKST-NASLOVA(67)
           MOVE "Proroanstvo Sedam Peata" TO TEKST-NASLOVA(68)
           MOVE "Trei Dan Poslije Oluje" TO TEKST-NASLOVA(69)
           MOVE "Beskonani Labirint" TO TEKST-NASLOVA(70)
           MOVE "aptai Iz Dubine" TO TEKST-NASLOVA(71)
           MOVE "Tragovi U Pijesku" TO TEKST-NASLOVA(72)
           MOVE "Naslijee Posljednjeg Cara" TO TEKST-NASLOVA(73)
           MOVE "uvar Sjevernog Vjetra" TO TEKST-NASLOVA(74)
           MOVE "Dijete Srebrne ume" TO TEKST-NASLOVA(75)
           MOVE "Kraljica Ledenog Trona" TO TEKST-NASLOVA(76)
           MOVE "Knjiga Zapeaenih Tajni" TO TEKST-NASLOVA(77)
           MOVE "Pjesma Starog Mora" TO TEKST-NASLOVA(78).
           MOVE "Ples S Vjeticama" TO TEKST-NASLOVA(79).
           MOVE "Sunce Iza Planina" TO TEKST-NASLOVA(80).
           MOVE "Noni Pjesnik" TO TEKST-NASLOVA(81).
           MOVE "Hram Zaboravljenog Boga" TO TEKST-NASLOVA(82).
           MOVE "Mrani Toranj" TO TEKST-NASLOVA(83).
           MOVE "Sedmi Sin" TO TEKST-NASLOVA(84).
           MOVE "Pria O Plavom Mjesecu" TO TEKST-NASLOVA(85).
           MOVE "Zvjezdani Pijesak" TO TEKST-NASLOVA(86).
           MOVE "Prolaznik Kroz Maglu" TO TEKST-NASLOVA(87).
           MOVE "Skriveni Kodeks" TO TEKST-NASLOVA(88).
           MOVE "Utoite Za Izgubljene Due" TO TEKST-NASLOVA(89).
           MOVE "Gospodar Oluje" TO TEKST-NASLOVA(90).
           MOVE "Nestali Dvorac" TO TEKST-NASLOVA(91).
           MOVE "Tajne Vjetrova" TO TEKST-NASLOVA(92).
           MOVE "Nebeski Kova" TO TEKST-NASLOVA(93).
           MOVE "Svira U Sjeni" TO TEKST-NASLOVA(94).
           MOVE "Posljednja Stranica" TO TEKST-NASLOVA(95).
           MOVE "Traga Kroz Vrijeme" TO TEKST-NASLOVA(96).
           MOVE "Duh Zaboravljene ume" TO TEKST-NASLOVA(97).
           MOVE "ovjek Koji Je Govorio Sa Zvijezdama" TO
                TEKST-NASLOVA(98).
           MOVE "Izgubljeno Kraljevstvo Snova" TO TEKST-NASLOVA(99).
           MOVE "Tajna Starog Sata" TO TEKST-NASLOVA(100).

      * Inicijalizacija autora
           MOVE "Miroslav Krlea" TO IME-AUTORA(1).
           MOVE "Marija Juri Zagorka" TO IME-AUTORA(2).
           MOVE "Miljenko Jergovi" TO IME-AUTORA(3).
           MOVE "Dubravka Ugrei" TO IME-AUTORA(4).
           MOVE "Slavenka Drakuli" TO IME-AUTORA(5).
           MOVE "Vedrana Rudan" TO IME-AUTORA(6).
           MOVE "Ante Tomi" TO IME-AUTORA(7).
           MOVE "Zoran Feri" TO IME-AUTORA(8).
           MOVE "Kristian Novak" TO IME-AUTORA(9).
           MOVE "Ivica Prtenjaa" TO IME-AUTORA(10).
           MOVE "Damir Karaka" TO IME-AUTORA(11).
           MOVE "Olja Savievi Ivanevi" TO IME-AUTORA(12).
           MOVE "Robert Perii" TO IME-AUTORA(13).
           MOVE "Miro Gavran" TO IME-AUTORA(14).
           MOVE "Julijana Matanovi" TO IME-AUTORA(15).
           MOVE "Igor tiks" TO IME-AUTORA(16).
           MOVE "Josip Mlaki" TO IME-AUTORA(17).
           MOVE "Edo Popovi" TO IME-AUTORA(18).
           MOVE "Korana Serdarevi" TO IME-AUTORA(19).
           MOVE "Ivana Bodroi" TO IME-AUTORA(20).

      * Inicijalizacija anrova
           MOVE "Fantastika" TO NAZIV-ZANRA(1).
           MOVE "Znanstvena fantastika" TO NAZIV-ZANRA(2).
           MOVE "Triler" TO NAZIV-ZANRA(3).
           MOVE "Romantika" TO NAZIV-ZANRA(4).
           MOVE "Povijesni roman" TO NAZIV-ZANRA(5).
           MOVE "Kriminalistiki roman" TO NAZIV-ZANRA(6).
           MOVE "Drama" TO NAZIV-ZANRA(7).
           MOVE "Horor" TO NAZIV-ZANRA(8).
           MOVE "Avanturistiki roman" TO NAZIV-ZANRA(9).
           MOVE "Djeja knjievnost" TO NAZIV-ZANRA(10).

       INICIJALIZIRAJ-EXIT.
           EXIT.

       POPULIRAJ-DATASET.
      * Generiranje ID-a knjige
           PERFORM GENERATE-RANDOM-NUMBER THROUGH GENERATE-RANDOM-EXIT.
           MOVE WS-COUNTER TO BOOK-ID.

      * Postavljanje naslova knjige iz tablice
           MOVE TEKST-NASLOVA(WS-COUNTER) TO BOOK-TITLE.

      * Generiranje random indeksa za autora
           PERFORM GENERATE-RANDOM-NUMBER THROUGH GENERATE-RANDOM-EXIT.
           COMPUTE WS-RANDOM-NUMBER =
                   FUNCTION MOD(WS-RANDOM-NUMBER, 20) + 1.
           MOVE IME-AUTORA(WS-RANDOM-NUMBER) TO BOOK-AUTHOR.

      * Generiranje random indeksa za anr
           PERFORM GENERATE-RANDOM-NUMBER THROUGH GENERATE-RANDOM-EXIT.
           COMPUTE WS-RANDOM-NUMBER =
                   FUNCTION MOD(WS-RANDOM-NUMBER, 10) + 1.
           MOVE NAZIV-ZANRA(WS-RANDOM-NUMBER) TO BOOK-GENRE.

      * Generiranje godine izdanja (izmeu 1950 i 2025)
           PERFORM GENERATE-RANDOM-NUMBER THROUGH GENERATE-RANDOM-EXIT.
           COMPUTE WS-RANDOM-NUMBER = 1950 +
                   FUNCTION MOD(WS-RANDOM-NUMBER, 76).
           MOVE WS-RANDOM-NUMBER TO BOOK-YEAR.

      * Postavljanje statusa knjige (A - dostupno, P - posueno)
           PERFORM GENERATE-RANDOM-NUMBER THROUGH GENERATE-RANDOM-EXIT.
           IF FUNCTION MOD(WS-RANDOM-NUMBER, 2) = 0
              MOVE "A" TO BOOK-STATUS
           ELSE
              MOVE "P" TO BOOK-STATUS
           END-IF.

      * Pisanje zapisa u dataset
           WRITE BOOK-RECORD.

       POPULIRAJ-EXIT.
           EXIT.

       GENERATE-RANDOM-NUMBER.
      *    Obtain current date
           MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-DATE.
      *    Obtain SEED value by adding secconds and milisecconds
           COMPUTE WS-SEED = (WS-SECOND * 10000) +
                  (WS-MILLISECONDS * 100).
      *    Obtain random number by invoking pseudorandom function
           COMPUTE WS-RANDOM-NUMBER =
                   FUNCTION RANDOM(WS-SEED) * 1000000.

       GENERATE-RANDOM-EXIT.
           EXIT.
