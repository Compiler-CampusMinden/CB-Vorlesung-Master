grammar VarDef;

startrule: stmt ;


alt   : stmt | stmt2 ;
stmt  : 'int' ID ';' ;
stmt2 : 'int' ID '=' ID ';'  ;

ID  :   [a-zA-Z]+ ;
WS  :   [ \t\r\n]+ -> skip ;
