grammar Longest;

start   : (CHARS DIGITS | FOO) ;

CHARS   : [a-z]+ ;
DIGITS  : [0-9]+ ;
FOO     : [a-z]+ [0-9]+ ;

WHITESPACE  : [ \t\n]+ -> skip ;
