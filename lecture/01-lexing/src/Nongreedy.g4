grammar Nongreedy;

start   : FOO BAR ;

FOO     : 'foo' .*? 'bar' ;
BAR     : 'bar' ;

WUPPIE  : .*? ('4' | '42') ;

WHITESPACE  : [ \t\n]+ -> skip ;
