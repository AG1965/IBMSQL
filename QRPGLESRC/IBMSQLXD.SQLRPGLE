     H DFTACTGRP(*NO)

     D SYSDUMMY1     E DS                  QUALIFIED
     D                                     EXTNAME('SYSIBM/SYSDUMMY1')

     D myResultSet     DS                  QUALIFIED
     D   IBMrequired                       LIKE(SYSDUMMY1.IBMREQD)

       EXEC SQL   DECLARE C1 CURSOR FOR
                  SELECT IBMREQD
                    FROM SYSIBM/SYSDUMMY1;

       EXEC SQL   OPEN  C1;

       EXEC SQL   FETCH C1 INTO :myResultSet;

       EXEC SQL   CLOSE C1;

       *INLR = *ON;
