     H DFTACTGRP(*NO)

     FSYSDUMMY1TIF   E             DISK    QUALIFIED TEMPLATE
     F                                     EXTDESC('SYSIBM/SYSDUMMY1')
     F                                     RENAME(SYSDUMMY1:SYSDUMMY1F)

     D myResultSet     DS                  QUALIFIED
     D   IBMrequired                       LIKE(SYSDUMMY1T.IBMREQD)

       EXEC SQL   DECLARE C1 CURSOR FOR
                  SELECT IBMREQD
                    FROM SYSIBM/SYSDUMMY1;

       EXEC SQL   OPEN  C1;

       EXEC SQL   FETCH C1 INTO :myResultSet;

       EXEC SQL   CLOSE C1;

       *INLR = *ON;
