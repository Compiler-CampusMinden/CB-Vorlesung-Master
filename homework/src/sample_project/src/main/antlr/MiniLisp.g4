grammar MiniLisp;


// Parser
program : expr+ EOF;


expr
    : literal
    | symbol
    | list
    | defExpr
    | fnExpr
    | functionCall
    | letExpr
    ;

literal
    : NUMBER
    | STRING
    | TRUE
    | FALSE
    ;

symbol
    : ID
    ;

list
    : '(' 'list' expr* ')'
    ;


defExpr
    : '(' 'def' symbol expr ')'
    ;


fnExpr
    : '(' 'defn' '(' paramList ')' expr* ')'
    ;

paramList
    : symbol (',' symbol)* // Eine oder mehrere Symbole, durch Kommas getrennt
    ;

functionCall
    : '(' symbol expr* ')'
    ;


letExpr
    : '(' 'let' '(' binding* ')' expr ')'
    ;

binding
    : '(' symbol expr ')'
    ;


// Lexer
NUMBER  : [0-9]+ ;
STRING  : '"' (~[\n\r"])* '"';
TRUE    : 'true' ;
FALSE   : 'false' ;
ID      : [a-z][a-zA-Z]* ;
COMMENT : ';;' ~[\n\r]* -> skip ;
WS      : [ ,\t\n\r]+ -> skip ;
