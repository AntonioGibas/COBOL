//CBLCMP JOB 1,NOTIFY=Z26069,MSGCLASS=X,MSGLEVEL=(1,1)
//**********************************************************************
//COBRUN     EXEC IGYWCL
//COBOL.SYSIN  DD DSN=Z26069.CBL(TASK3C),DISP=SHR
//LKED.SYSLMOD DD DSN=Z26069.LOAD(TASK3C),DISP=SHR
//**********************************************************************
//DELETE   EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=X
//SYSIN    DD *
  DELETE Z26069.COBOL.OUTPUT NVSAM
  IF LASTCC=08 THEN 
     SET MAXCC=00
  END
/*
//* Zakomentiran dio s kreiranjem dataseta i dodavanjem podataka
//*CREATE1 EXEC PGM=IEFBR14
//*INFL      DD DSN=Z26069.COBOL.INPUT,
//*             DISP=(NEW,CATLG,DELETE),
//*             SPACE=(TRK,(1,2)),
//*             LRECL=80,
//*             RECFM=FB,
//*             DCB=DSORG=PS
//**
//*LOADIN EXEC PGM=IEBGENER
//*SYSIN    DD DUMMY
//*SYSUT1   DD *
//*OPTION-2
//*
//*SYSUT2   DD DSN=Z26069.COBOL.INPUT,DISP=SHR
//*SYSPRINT DD SYSOUT=X
//**************************************************************
//RUN  EXEC PGM=TASK3C
//INFL   DD DSN=Z26069.COBOL.INPUT,DISP=SHR
//OUTFL  DD DSN=Z26069.COBOL.OUTPUT,
//          DISP=(NEW,CATLG,DELETE),
//          SPACE=(TRK,(1,2)),
//          LRECL=80,
//          RECFM=FB,
//          DCB=DSORG=PS
//STEPLIB DD DSN=Z26069.LOAD,DISP=SHR
//SYSOUT  DD SYSOUT=*
//CEEDUMP DD DUMMY
//SYSDUMP DD DUMMY