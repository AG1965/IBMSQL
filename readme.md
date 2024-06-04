# Problem with QUALIFIED and/or TEMPLATE in **free SQLRPGLE

Directory QRPGLESRC contains RPGLE source files that try to fetch the field IBMREQD from file SYSIBM/SYSDUMMY1
into a data structure that has subfields defined LIKE the IBMREQD field in SYSIBM/SYSDUMMY1.

The funny thing is that most of the fixed form SQLRPGLE compiles OK, while the **FREE files containing QUALIFIED and/or TEMPLATE do not. The error is SQL0312 reason code 44.

| result | name | form | comment |
|--------|------|------|---------|
| OK   | IBMSQLFD   | fully free |  LIKE subfield of not QUALIFIED external described data structure             |
| fail | IBMSQLFDQ  | fully free |  LIKE subfield of     QUALIFIED external described data structure             |
| fail | IBMSQLFDQT | fully free |  LIKE subfield of     QUALIFIED external described data structure TEMPLATE    |
| fail | IBMSQLFDT  | fully free |  LIKE subfield of not QUALIFIED external described data structure TEMPLATE    |
| OK   | IBMSQLFF   | fully free |  LIKE subfield of not QUALIFIED external described file                       |
| fail | IBMSQLFFQ  | fully free |  LIKE subfield of     QUALIFIED external described file                       |
| fail | IBMSQLFFQT | fully free |  LIKE subfield of     QUALIFIED external described file TEMPLATE              |
| fail | IBMSQLFFT  | fully free |  LIKE subfield of not QUALIFIED external described file TEMPLATE              |
| OK   | IBMSQLXD   | fixed      |  LIKE subfield of not QUALIFIED external described data structure             |
| OK   | IBMSQLXDQ  | fixed      |  LIKE subfield of     QUALIFIED external described data structure             |
| OK   | IBMSQLXDQT | fixed      |  LIKE subfield of     QUALIFIED external described data structure TEMPLATE    |
| OK   | IBMSQLXDT  | fixed      |  LIKE subfield of not QUALIFIED external described data structure TEMPLATE    |
| OK   | IBMSQLXF   | fixed      |  LIKE subfield of not QUALIFIED external described file                       |
| fail | IBMSQLXFQ  | fixed      |  LIKE subfield of     QUALIFIED external described file                       |
| fail | IBMSQLXFQT | fixed      |  LIKE subfield of     QUALIFIED external described file TEMPLATE              |
| fail | IBMSQLXFT  | fixed      |  LIKE subfield of not QUALIFIED external described file TEMPLATE              |
