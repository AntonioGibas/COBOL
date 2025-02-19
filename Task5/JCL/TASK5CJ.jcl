//TASK5CJ JOB 1,NOTIFY=Z26069,MSGCLASS=X,MSGLEVEL=(1,1)
//**********************************************************************
//COBRUN     EXEC IGYWCL
//COBOL.SYSIN  DD DSN=Z26069.CBL(TASK5C),DISP=SHR
//LKED.SYSLMOD DD DSN=Z26069.LOAD(TASK5C),DISP=SHR
//**********************************************************************
//RUN  EXEC PGM=TASK5C,
//          PARM='Muha bez uha? M.'
//STEPLIB DD DSN=Z26069.LOAD,DISP=SHR
//SYSOUT  DD SYSOUT=*
//CEEDUMP DD DUMMY
//SYSDUMP DD DUMMY