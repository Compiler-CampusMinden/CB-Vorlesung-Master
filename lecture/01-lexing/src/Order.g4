grammar Order;

start   : (BAR | FOO) ;

FOO     : 'f' .*? 'r' ;
BAR     : 'foo' .*? 'bar' ;

WHITESPACE  : [ \t\n]+ -> skip ;
