grammar Demo;


start   :   stat+ ;


varDecl : type ID ('=' expr)? ';' ;
var     : ID ;
type    : 'float' | 'int' ;

block   : '{' stat* '}' ;
stat    : block
        | varDecl
        | funcDecl
        | expr ';'
        | 'return' expr ';'
        ;



funcDecl : type ID '(' params? ')' block ;
params   : param (',' param)* ;
param    : type ID ;
call     : ID '(' exprList? ')' ;
exprList : expr (',' expr)* ;




expr : expr ('+'|'-') expr
     | var '=' expr
     | call
     | var
     | INT
     ;

ID   :   [a-zA-Z]+ ;
INT  :   [0-9]+ ;
WS   :   [ \t\r\n]+ -> skip ;
