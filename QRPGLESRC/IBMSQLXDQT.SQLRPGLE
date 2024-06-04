     H DFTACTGRP(*NO)

     D SYSDUMMY1_T   E DS                  QUALIFIED TEMPLATE
     D                                     EXTNAME('SYSIBM/SYSDUMMY1')

     D myResultSet     DS                  QUALIFIED
     D   IBMrequired                       LIKE(SYSDUMMY1_T.IBMREQD)

       EXEC SQL   DECLARE C1 CURSOR FOR
                  SELECT IBMREQD
                    FROM SYSIBM/SYSDUMMY1;

       EXEC SQL   OPEN  C1;

       EXEC SQL   FETCH C1 INTO :myResultSet;

       EXEC SQL   CLOSE C1;

       *INLR = *ON;
