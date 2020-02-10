Feature: Loading through multiple tables and cycles from source to vault
# =============================================================================
# CHANGE HISTORY
# ==============
#
# Date     Who Version Details
# -------- --- ------- --------------------------------------------------------
# 16.09.19 AH  1.0     First release.
# =============================================================================

  Scenario: Test several load cycles
    Given there is an empty TEST_STG_CUSTOMER table
    And there is an empty TEST_STG_BOOKING table
    And the vault is empty

    # ================ DAY 1 ===================
    When the TEST_STG_CUSTOMER table has data inserted into it for day 1
      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_DOB | EFFECTIVE_FROM | LOADDATE   |
      | 1001        | Albert        | 1990-02-03   | 2019-05-04     | 2019-05-04 |
      | 1002        | Beth          | 1995-08-07   | 2019-05-04     | 2019-05-04 |
      | 1003        | Charley       | 1990-02-03   | 2019-05-04     | 2019-05-04 |
      | 1010        | Ronna         | 1991-03-21   | 2019-05-04     | 2019-05-04 |
    And the TEST_STG_BOOKING table has data inserted into it for day 1
      | BOOKING_REF | CUSTOMER_ID | BOOKING_DATE | PRICE | DEPARTURE_DATE | DESTINATION | PHONE           | NATIONALITY | LOADDATE   |
      | 10034       | 1001        | 2019-05-03   | 100.0 | 2019-09-17     | GBR         | 17-214-233-1214 | BRITISH     | 2019-05-04 |
      | 10035       | 1002        | 2019-05-03   | 80.0  | 2019-09-16     | NLD         | 17-214-200-1214 | DUTCH       | 2019-05-04 |
      | 10070       | 1040        | 2019-05-03   | 90.0  | 2019-09-15     | ZIM         | 17-214-200-4040 | CHINESE     | 2019-05-04 |
    And the vault is loaded for day 1

    # ================ DAY 2 ===================
    When the TEST_STG_CUSTOMER table has data inserted into it for day 2
      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_DOB | EFFECTIVE_FROM | LOADDATE   |
      | 1002        | Jack          | 1995-08-07   | 2019-05-05     | 2019-05-05 |
      | 1003        | Michael       | 1990-02-03   | 2019-05-05     | 2019-05-05 |
      | 1004        | David         | 1992-01-30   | 2019-05-05     | 2019-05-05 |
    And the TEST_STG_BOOKING table has data inserted into it for day 2
      | BOOKING_REF | CUSTOMER_ID | BOOKING_DATE | PRICE | DEPARTURE_DATE | DESTINATION | PHONE           | NATIONALITY | LOADDATE   |
      | 10036       | 1003        | 2019-05-04   | 70.0  | 2019-09-13     | AUS         | 17-214-555-1214 | AUSTRALIAN  | 2019-05-05 |
      | 10037       | 1004        | 2019-05-04   | 810.0 | 2019-09-18     | DEU         | 17-214-123-1214 | GERMAN      | 2019-05-05 |
    And the vault is loaded for day 2

    # ================ DAY 3 ===================
    When the TEST_STG_CUSTOMER table has data inserted into it for day 3
      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_DOB | EFFECTIVE_FROM | LOADDATE   |
      | 1002        | Beth          | 1995-08-07   | 2019-05-06     | 2019-05-06 |
      | 1003        | Harold        | 1990-02-03   | 2019-05-06     | 2019-05-06 |
      | 1005        | Kevin         | 2001-07-23   | 2019-05-06     | 2019-05-06 |
      | 1006        | Chris         | 1960-01-01   | 2019-05-06     | 2019-05-06 |
    And the TEST_STG_BOOKING table has data inserted into it for day 3
      | BOOKING_REF | CUSTOMER_ID | BOOKING_DATE | PRICE | DEPARTURE_DATE | DESTINATION | PHONE           | NATIONALITY | LOADDATE   |
      | 10038       | 1005        | 2019-05-05   | 216.5 | 2019-09-19     | ITA         | 17-214-456-1214 | BRITISH     | 2019-05-06 |
      | 10039       | 1006        | 2019-05-05   | 111.1 | 2019-09-20     | NOR         | 17-214-789-1214 | RUSSIAN     | 2019-05-06 |
    And the vault is loaded for day 3

    # ================ DAY 4 ===================
    When the TEST_STG_CUSTOMER table has data inserted into it for day 4
      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_DOB | EFFECTIVE_FROM | LOADDATE   |
      | 1002        | Bethany       | 1995-08-07   | 2019-05-07     | 2019-05-07 |
      | 1003        | Charley       | 1990-02-03   | 2019-05-07     | 2019-05-07 |
      | 1007        | Albert        | 1990-02-03   | 2019-05-07     | 2019-05-07 |
      | 1008        | Wilhemina     | 1998-11-07   | 2019-05-07     | 2019-05-07 |
      | 1009        | Perry         | 2006-09-13   | 2019-05-07     | 2019-05-07 |
      | 1010        | Ronna         | 1991-03-21   | 2019-05-07     | 2019-05-07 |
      | 1011        | Annamae       | 1978-06-16   | 2019-05-07     | 2019-05-07 |
      | 1012        | Gregorio      | 2004-08-11   | 2019-05-07     | 2019-05-07 |
      | 1013        | Rochel        | 2003-02-27   | 2019-05-07     | 2019-05-07 |
      | 1014        | Shayne        | 1999-01-31   | 2019-05-07     | 2019-05-07 |
      | 1015        | Fabiola       | 1985-04-02   | 2019-05-07     | 2019-05-07 |
    And the TEST_STG_BOOKING table has data inserted into it for day 4
      | BOOKING_REF | CUSTOMER_ID | BOOKING_DATE | PRICE  | DEPARTURE_DATE | DESTINATION | PHONE           | NATIONALITY | LOADDATE   |
      | 10039       | 1006        | 2019-05-05   | 111.1  | 2019-09-20     | AUS         | 17-214-789-1214 | RUSSIAN     | 2019-05-07 |
      | 10040       | 1007        | 2019-05-06   | 832.84 | 2019-09-28     | CHN         | 17-214-577-1215 | TURKISH     | 2019-05-07 |
      | 10041       | 1008        | 2019-05-06   | 947.79 | 2019-10-08     | LUX         | 17-214-577-1216 | UAE         | 2019-05-07 |
      | 10042       | 1009        | 2019-05-06   | 58.24  | 2019-10-21     | IDN         | 17-214-577-1217 | BOLIVIAN    | 2019-05-07 |
      | 10043       | 1010        | 2019-05-06   | 393.18 | 2019-10-25     | CYM         | 17-214-577-1218 | POLISH      | 2019-05-07 |
      | 10044       | 1011        | 2019-05-06   | 139.3  | 2019-11-03     | SPM         | 17-214-577-1219 | HUNGARIAN   | 2019-05-07 |
      | 10045       | 1012        | 2019-05-06   | 724.63 | 2019-11-07     | LBR         | 17-214-577-1220 | ECUADORIAN  | 2019-05-07 |
      | 10046       | 1013        | 2019-05-06   | 295.81 | 2019-11-14     | SEN         | 17-214-577-1221 | INDONESIAN  | 2019-05-07 |
      | 10047       | 1014        | 2019-05-06   | 259.99 | 2019-12-22     | HMD         | 17-214-577-1222 | ANGOLAN     | 2019-05-07 |
      | 10048       | 1015        | 2019-05-06   | 219.99 | 2019-10-16     | JAM         | 17-214-577-1223 | TAIWANESE   | 2019-05-07 |
    And the vault is loaded for day 4

    # =============== CHECKS ===================
    Then we expect the TEST_HUB_CUSTOMER table to contain
      | CUSTOMER_PK | CUSTOMER_ID | LOADDATE   | SOURCE |
      | md5('1001') | 1001        | 2019-05-04 | *      |
      | md5('1002') | 1002        | 2019-05-04 | *      |
      | md5('1003') | 1003        | 2019-05-04 | *      |
      | md5('1004') | 1004        | 2019-05-05 | *      |
      | md5('1005') | 1005        | 2019-05-06 | *      |
      | md5('1006') | 1006        | 2019-05-06 | *      |
      | md5('1007') | 1007        | 2019-05-07 | *      |
      | md5('1008') | 1008        | 2019-05-07 | *      |
      | md5('1009') | 1009        | 2019-05-07 | *      |
      | md5('1010') | 1010        | 2019-05-04 | *      |
      | md5('1011') | 1011        | 2019-05-07 | *      |
      | md5('1012') | 1012        | 2019-05-07 | *      |
      | md5('1013') | 1013        | 2019-05-07 | *      |
      | md5('1014') | 1014        | 2019-05-07 | *      |
      | md5('1015') | 1015        | 2019-05-07 | *      |
      | md5('1040') | 1040        | 2019-05-04 | *      |
    Then we expect the TEST_HUB_BOOKING table to contain
      | BOOKING_PK   | BOOKING_REF | LOADDATE   | SOURCE |
      | md5('10034') | 10034       | 2019-05-04 | *      |
      | md5('10035') | 10035       | 2019-05-04 | *      |
      | md5('10036') | 10036       | 2019-05-05 | *      |
      | md5('10037') | 10037       | 2019-05-05 | *      |
      | md5('10038') | 10038       | 2019-05-06 | *      |
      | md5('10039') | 10039       | 2019-05-06 | *      |
      | md5('10040') | 10040       | 2019-05-07 | *      |
      | md5('10041') | 10041       | 2019-05-07 | *      |
      | md5('10042') | 10042       | 2019-05-07 | *      |
      | md5('10043') | 10043       | 2019-05-07 | *      |
      | md5('10044') | 10044       | 2019-05-07 | *      |
      | md5('10045') | 10045       | 2019-05-07 | *      |
      | md5('10046') | 10046       | 2019-05-07 | *      |
      | md5('10047') | 10047       | 2019-05-07 | *      |
      | md5('10048') | 10048       | 2019-05-07 | *      |
      | md5('10070') | 10070       | 2019-05-04 | *      |
    Then we expect the TEST_LINK_CUSTOMER_BOOKING table to contain
      | CUSTOMER_BOOKING_PK  | CUSTOMER_PK | BOOKING_PK   | LOADDATE   | SOURCE |
      | md5('1001\|\|10034') | md5('1001') | md5('10034') | 2019-05-04 | *      |
      | md5('1002\|\|10035') | md5('1002') | md5('10035') | 2019-05-04 | *      |
      | md5('1003\|\|10036') | md5('1003') | md5('10036') | 2019-05-05 | *      |
      | md5('1004\|\|10037') | md5('1004') | md5('10037') | 2019-05-05 | *      |
      | md5('1005\|\|10038') | md5('1005') | md5('10038') | 2019-05-06 | *      |
      | md5('1006\|\|10039') | md5('1006') | md5('10039') | 2019-05-06 | *      |
      | md5('1007\|\|10040') | md5('1007') | md5('10040') | 2019-05-07 | *      |
      | md5('1008\|\|10041') | md5('1008') | md5('10041') | 2019-05-07 | *      |
      | md5('1009\|\|10042') | md5('1009') | md5('10042') | 2019-05-07 | *      |
      | md5('1010\|\|10043') | md5('1010') | md5('10043') | 2019-05-07 | *      |
      | md5('1011\|\|10044') | md5('1011') | md5('10044') | 2019-05-07 | *      |
      | md5('1012\|\|10045') | md5('1012') | md5('10045') | 2019-05-07 | *      |
      | md5('1013\|\|10046') | md5('1013') | md5('10046') | 2019-05-07 | *      |
      | md5('1014\|\|10047') | md5('1014') | md5('10047') | 2019-05-07 | *      |
      | md5('1015\|\|10048') | md5('1015') | md5('10048') | 2019-05-07 | *      |
      | md5('1040\|\|10070') | md5('1040') | md5('10070') | 2019-05-04 | *      |
    Then we expect the TEST_SAT_CUST_CUSTOMER_DETAILS table to contain
      | CUSTOMER_PK | CUSTOMER_HASHDIFF                       | CUSTOMER_NAME | CUSTOMER_DOB | EFFECTIVE_FROM | LOADDATE   | SOURCE |
      | md5('1001') | md5('1990-02-03\|\|1001\|\|ALBERT')    | Albert        | 1990-02-03   | 2019-05-04     | 2019-05-04 | *      |
      | md5('1002') | md5('1995-08-07\|\|1002\|\|BETH')      | Beth          | 1995-08-07   | 2019-05-04     | 2019-05-04 | *      |
      | md5('1002') | md5('1995-08-07\|\|1002\|\|JACK')      | Jack          | 1995-08-07   | 2019-05-05     | 2019-05-05 | *      |
      | md5('1002') | md5('1995-08-07\|\|1002\|\|BETH')      | Beth          | 1995-08-07   | 2019-05-06     | 2019-05-06 | *      |
      | md5('1002') | md5('1995-08-07\|\|1002\|\|BETHANY')   | Bethany       | 1995-08-07   | 2019-05-07     | 2019-05-07 | *      |
      | md5('1003') | md5('1990-02-03\|\|1003\|\|CHARLEY')   | Charley       | 1990-02-03   | 2019-05-04     | 2019-05-04 | *      |
      | md5('1003') | md5('1990-02-03\|\|1003\|\|MICHAEL')   | Michael       | 1990-02-03   | 2019-05-05     | 2019-05-05 | *      |
      | md5('1003') | md5('1990-02-03\|\|1003\|\|HAROLD')    | Harold        | 1990-02-03   | 2019-05-06     | 2019-05-06 | *      |
      | md5('1003') | md5('1990-02-03\|\|1003\|\|CHARLEY')   | Charley       | 1990-02-03   | 2019-05-07     | 2019-05-07 | *      |
      | md5('1004') | md5('1992-01-30\|\|1004\|\|DAVID')     | David         | 1992-01-30   | 2019-05-05     | 2019-05-05 | *      |
      | md5('1005') | md5('2001-07-23\|\|1005\|\|KEVIN')     | Kevin         | 2001-07-23   | 2019-05-06     | 2019-05-06 | *      |
      | md5('1006') | md5('1960-01-01\|\|1006\|\|CHRIS')     | Chris         | 1960-01-01   | 2019-05-06     | 2019-05-06 | *      |
      | md5('1007') | md5('1990-02-03\|\|1007\|\|ALBERT')    | Albert        | 1990-02-03   | 2019-05-07     | 2019-05-07 | *      |
      | md5('1008') | md5('1998-11-07\|\|1008\|\|WILHEMINA') | Wilhemina     | 1998-11-07   | 2019-05-07     | 2019-05-07 | *      |
      | md5('1009') | md5('2006-09-13\|\|1009\|\|PERRY')     | Perry         | 2006-09-13   | 2019-05-07     | 2019-05-07 | *      |
      | md5('1010') | md5('1991-03-21\|\|1010\|\|RONNA')     | Ronna         | 1991-03-21   | 2019-05-04     | 2019-05-04 | *      |
      | md5('1011') | md5('1978-06-16\|\|1011\|\|ANNAMAE')   | Annamae       | 1978-06-16   | 2019-05-07     | 2019-05-07 | *      |
      | md5('1012') | md5('2004-08-11\|\|1012\|\|GREGORIO')  | Gregorio      | 2004-08-11   | 2019-05-07     | 2019-05-07 | *      |
      | md5('1013') | md5('2003-02-27\|\|1013\|\|ROCHEL')    | Rochel        | 2003-02-27   | 2019-05-07     | 2019-05-07 | *      |
      | md5('1014') | md5('1999-01-31\|\|1014\|\|SHAYNE')    | Shayne        | 1999-01-31   | 2019-05-07     | 2019-05-07 | *      |
      | md5('1015') | md5('1985-04-02\|\|1015\|\|FABIOLA')   | Fabiola       | 1985-04-02   | 2019-05-07     | 2019-05-07 | *      |
    Then we expect the TEST_SAT_BOOK_CUSTOMER_DETAILS table to contain
      | CUSTOMER_PK | BOOK_CUSTOMER_HASHDIFF                       | PHONE           | NATIONALITY | EFFECTIVE_FROM | LOADDATE   | SOURCE |
      | md5('1001') | md5('1001\|\|BRITISH\|\|17-214-233-1214')    | 17-214-233-1214 | BRITISH     | 2019-05-03     | 2019-05-04 | *      |
      | md5('1002') | md5('1002\|\|DUTCH\|\|17-214-200-1214')      | 17-214-200-1214 | DUTCH       | 2019-05-03     | 2019-05-04 | *      |
      | md5('1003') | md5('1003\|\|AUSTRALIAN\|\|17-214-555-1214') | 17-214-555-1214 | AUSTRALIAN  | 2019-05-04     | 2019-05-05 | *      |
      | md5('1004') | md5('1004\|\|GERMAN\|\|17-214-123-1214')     | 17-214-123-1214 | GERMAN      | 2019-05-04     | 2019-05-05 | *      |
      | md5('1005') | md5('1005\|\|BRITISH\|\|17-214-456-1214')    | 17-214-456-1214 | BRITISH     | 2019-05-05     | 2019-05-06 | *      |
      | md5('1006') | md5('1006\|\|RUSSIAN\|\|17-214-789-1214')    | 17-214-789-1214 | RUSSIAN     | 2019-05-05     | 2019-05-06 | *      |
      | md5('1007') | md5('1007\|\|TURKISH\|\|17-214-577-1215')    | 17-214-577-1215 | TURKISH     | 2019-05-06     | 2019-05-07 | *      |
      | md5('1008') | md5('1008\|\|UAE\|\|17-214-577-1216')        | 17-214-577-1216 | UAE         | 2019-05-06     | 2019-05-07 | *      |
      | md5('1009') | md5('1009\|\|BOLIVIAN\|\|17-214-577-1217')   | 17-214-577-1217 | BOLIVIAN    | 2019-05-06     | 2019-05-07 | *      |
      | md5('1010') | md5('1010\|\|POLISH\|\|17-214-577-1218')     | 17-214-577-1218 | POLISH      | 2019-05-06     | 2019-05-07 | *      |
      | md5('1011') | md5('1011\|\|HUNGARIAN\|\|17-214-577-1219')  | 17-214-577-1219 | HUNGARIAN   | 2019-05-06     | 2019-05-07 | *      |
      | md5('1012') | md5('1012\|\|ECUADORIAN\|\|17-214-577-1220') | 17-214-577-1220 | ECUADORIAN  | 2019-05-06     | 2019-05-07 | *      |
      | md5('1013') | md5('1013\|\|INDONESIAN\|\|17-214-577-1221') | 17-214-577-1221 | INDONESIAN  | 2019-05-06     | 2019-05-07 | *      |
      | md5('1014') | md5('1014\|\|ANGOLAN\|\|17-214-577-1222')    | 17-214-577-1222 | ANGOLAN     | 2019-05-06     | 2019-05-07 | *      |
      | md5('1015') | md5('1015\|\|TAIWANESE\|\|17-214-577-1223')  | 17-214-577-1223 | TAIWANESE   | 2019-05-06     | 2019-05-07 | *      |
      | md5('1040') | md5('1040\|\|CHINESE\|\|17-214-200-4040')    | 17-214-200-4040 | CHINESE     | 2019-05-03     | 2019-05-04 | *      |
    Then we expect the TEST_SAT_BOOK_BOOKING_DETAILS table to contain
      | BOOKING_PK   | BOOK_BOOKING_HASHDIFF                                     | PRICE  | BOOKING_DATE | DEPARTURE_DATE | DESTINATION | EFFECTIVE_FROM | LOADDATE   | SOURCE |
      | md5('10034') | md5('2019-05-03\|\|10034\|\|2019-09-17\|\|GBR\|\|100')    | 100.0  | 2019-05-03   | 2019-09-17     | GBR         | 2019-05-03     | 2019-05-04 | *      |
      | md5('10035') | md5('2019-05-03\|\|10035\|\|2019-09-16\|\|NLD\|\|80')     | 80.0   | 2019-05-03   | 2019-09-16     | NLD         | 2019-05-03     | 2019-05-04 | *      |
      | md5('10036') | md5('2019-05-04\|\|10036\|\|2019-09-13\|\|AUS\|\|70')     | 70.0   | 2019-05-04   | 2019-09-13     | AUS         | 2019-05-04     | 2019-05-05 | *      |
      | md5('10037') | md5('2019-05-04\|\|10037\|\|2019-09-18\|\|DEU\|\|810')    | 810.0  | 2019-05-04   | 2019-09-18     | DEU         | 2019-05-04     | 2019-05-05 | *      |
      | md5('10038') | md5('2019-05-05\|\|10038\|\|2019-09-19\|\|ITA\|\|216.5')  | 216.5  | 2019-05-05   | 2019-09-19     | ITA         | 2019-05-05     | 2019-05-06 | *      |
      | md5('10039') | md5('2019-05-05\|\|10039\|\|2019-09-20\|\|NOR\|\|111.1')  | 111.1  | 2019-05-05   | 2019-09-20     | NOR         | 2019-05-05     | 2019-05-06 | *      |
      | md5('10039') | md5('2019-05-05\|\|10039\|\|2019-09-20\|\|AUS\|\|111.1')  | 111.1  | 2019-05-05   | 2019-09-20     | AUS         | 2019-05-05     | 2019-05-07 | *      |
      | md5('10040') | md5('2019-05-06\|\|10040\|\|2019-09-28\|\|CHN\|\|832.84') | 832.84 | 2019-05-06   | 2019-09-28     | CHN         | 2019-05-06     | 2019-05-07 | *      |
      | md5('10041') | md5('2019-05-06\|\|10041\|\|2019-10-08\|\|LUX\|\|947.79') | 947.79 | 2019-05-06   | 2019-10-08     | LUX         | 2019-05-06     | 2019-05-07 | *      |
      | md5('10042') | md5('2019-05-06\|\|10042\|\|2019-10-21\|\|IDN\|\|58.24')  | 58.24  | 2019-05-06   | 2019-10-21     | IDN         | 2019-05-06     | 2019-05-07 | *      |
      | md5('10043') | md5('2019-05-06\|\|10043\|\|2019-10-25\|\|CYM\|\|393.18') | 393.18 | 2019-05-06   | 2019-10-25     | CYM         | 2019-05-06     | 2019-05-07 | *      |
      | md5('10044') | md5('2019-05-06\|\|10044\|\|2019-11-03\|\|SPM\|\|139.3')  | 139.3  | 2019-05-06   | 2019-11-03     | SPM         | 2019-05-06     | 2019-05-07 | *      |
      | md5('10045') | md5('2019-05-06\|\|10045\|\|2019-11-07\|\|LBR\|\|724.63') | 724.63 | 2019-05-06   | 2019-11-07     | LBR         | 2019-05-06     | 2019-05-07 | *      |
      | md5('10046') | md5('2019-05-06\|\|10046\|\|2019-11-14\|\|SEN\|\|295.81') | 295.81 | 2019-05-06   | 2019-11-14     | SEN         | 2019-05-06     | 2019-05-07 | *      |
      | md5('10047') | md5('2019-05-06\|\|10047\|\|2019-12-22\|\|HMD\|\|259.99') | 259.99 | 2019-05-06   | 2019-12-22     | HMD         | 2019-05-06     | 2019-05-07 | *      |
      | md5('10048') | md5('2019-05-06\|\|10048\|\|2019-10-16\|\|JAM\|\|219.99') | 219.99 | 2019-05-06   | 2019-10-16     | JAM         | 2019-05-06     | 2019-05-07 | *      |
      | md5('10070') | md5('2019-05-03\|\|10070\|\|2019-09-15\|\|ZIM\|\|90')     | 90.0   | 2019-05-03   | 2019-09-15     | ZIM         | 2019-05-03     | 2019-05-04 | *      |
