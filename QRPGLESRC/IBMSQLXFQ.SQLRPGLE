     H DFTACTGRP(*NO)

     FSYSDUMMY1 IF   E             DISK    QUALIFIED USROPN
     F                                     EXTDESC('SYSIBM/SYSDUMMY1')
     F                                     RENAME(SYSDUMMY1:SYSDUMMY1F)

     D myResultSet     DS                  QUALIFIED
     D   IBMrequired                       LIKE(SYSDUMMY1.IBMREQD)

       IF 'never' = 'do that';
          OPEN SYSDUMMY1;
       ENDIF;

       EXEC SQL   DECLARE C1 CURSOR FOR
                  SELECT IBMREQD
                    FROM SYSIBM/SYSDUMMY1;

       EXEC SQL   OPEN  C1;

       EXEC SQL   FETCH C1 INTO :myResultSet;

       EXEC SQL   CLOSE C1;

       *INLR = *ON;
