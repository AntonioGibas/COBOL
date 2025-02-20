//CHAMPS01 JOB 1,NOTIFY=Z26069,MSGCLASS=X,MSGLEVEL=(1,1)
//**********************************************************************
//REINIT  EXEC PGM=IDCAMS
//SYSPRINT  DD SYSOUT=X
//SYSIN     DD *
  DELETE Z26069.TOPLANE NVSAM
  DELETE Z26069.MIDLANE NVSAM
  DELETE Z26069.BOTLANE NVSAM
  DELETE Z26069.JUNGLE  NVSAM
  IF LASTCC=08 THEN
     SET MAXCC=00
  END
/*
//**********************************************************************
//*                SEPARATE CHAMPIONS BY ROLE                          *
//**********************************************************************
//STEP01  EXEC PGM=CMPINIT
//STEPLIB   DD DSN=Z26069.LOAD,DISP=SHR
//INFL      DD DSN=Z26069.CHAMPION.DATA,DISP=SHR
//OUTFL1    DD DSN=Z26069.TOPLANE,
//             DISP=(NEW,CATLG,DELETE),
//             SPACE=(CYL,(1,1),RLSE),
//             RECFM=FB,
//             LRECL=100,
//             DCB=DSORG=PS
//OUTFL2    DD DSN=Z26069.MIDLANE,
//             DISP=(NEW,CATLG,DELETE),
//             SPACE=(CYL,(1,1),RLSE),
//             RECFM=FB,
//             LRECL=100,
//             DCB=DSORG=PS
//OUTFL3    DD DSN=Z26069.BOTLANE,
//             DISP=(NEW,CATLG,DELETE),
//             SPACE=(CYL,(1,1),RLSE),
//             RECFM=FB,
//             LRECL=100,
//             DCB=DSORG=PS
//OUTFL4    DD DSN=Z26069.JUNGLE,
//             DISP=(NEW,CATLG,DELETE),
//             SPACE=(CYL,(1,1),RLSE),
//             RECFM=FB,
//             LRECL=100,
//             DCB=DSORG=PS
//PRTLINE   DD SYSOUT=X
//SYSOUT    DD SYSOUT=X
//CEEDUMP   DD DUMMY
//SYSDUMP   DD DUMMY
