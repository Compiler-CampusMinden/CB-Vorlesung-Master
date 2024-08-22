grammar GerTel;

/*
    Heinz 030 5346 983
    Kalle +49 30 1234 567
    Lina +49.571.8385-255
    Rosi (0571) 8385-268
*/

phone_ger: NAME COUNTRYCODE? DIGIT+ EOF;

NAME: [a-zA-Z]+ ;
COUNTRYCODE: ('+49' | '0049') ;
DIGIT: [0-9] ;

SEP: ('-' | '.' | '(' | ')' | ' ') -> skip ;
WS: [\t\r\n ]+ -> skip ;
