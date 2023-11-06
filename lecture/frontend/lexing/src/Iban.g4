grammar Iban;

/*
    DEkk bbbb bbbb cccc cccc xx
    DEkkbbbbbbbbccccccccxx

    DE12 3456 7890 1234 5678 42
    DE12345678901234567842
*/

iban: COUNTRY QUARTET QUARTET QUARTET QUARTET CHECK ;

COUNTRY: 'DE' CHECK ;
CHECK: DIGIT DIGIT ;
QUARTET: DIGIT DIGIT DIGIT DIGIT ;

fragment
DIGIT: [0-9] ;


ID: [a-zA-Z] ;
WS: [\t\r\n ]+ -> skip ;
