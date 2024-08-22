grammar calc;

s     : expr ;

expr  : e1=expr '*' e2=expr     # MULT
      | e1=expr '+' e2=expr     # ADD
      | DIGIT                   # ZAHL
      ;

DIGIT : [0-9]+ ;
WS    : [ \r\t\n]+ -> skip ;
