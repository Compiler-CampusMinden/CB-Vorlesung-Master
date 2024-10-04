grammar MiniC;


// Parser
program : type_specifier ID '(' param_decl_list ')' compound_stmt EOF;


type_specifier : 'int' | 'char';

param_decl_list : parameter_decl (',' parameter_decl)*;
parameter_decl  : type_specifier ID;

compound_stmt : '{' (var_decl* stmt*)? '}';

var_decl : type_specifier var_decl_list ';';
var_decl_list : variable_id (',' variable_id)*;
variable_id : ID ('=' expr)?;

stmt : compound_stmt
     | cond_stmt
     | while_stmt
     | 'break' ';'
     | 'continue' ';'
     | 'return' expr ';'
     | 'readint' '(' ID ')' ';'
     | 'writeint' '(' expr ')' ';';

cond_stmt : 'if' '(' expr ')' stmt ('else' stmt)?;
while_stmt : 'while' '(' expr ')' stmt;

expr : ID '=' expr | condition;

condition : disjunction | disjunction '?' expr ':' condition;

disjunction : conjunction | disjunction '||' conjunction;
conjunction : comparison | conjunction '&&' comparison;
comparison : relation | relation '==' relation;
relation : sum | sum ('<' | '>') sum;
sum : sum '+' term | sum '-' term | term;
term : term '*' factor | term '/' factor | term '%' factor | factor;
factor : '!' factor | '-' factor | primary;

primary : NUMBER | STRING | ID | '(' expr ')';


// Lexer
NUMBER  : [0-9]+ ;
STRING  : '"' (~[\n\r"])* '"';
ID      : [a-z][a-zA-Z]* ;
COMMENT : '#' ~[\n\r]* -> skip ;
WS      : [ \t\n\r]+ -> skip ;
