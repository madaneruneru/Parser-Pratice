%{
    #include <stdio.h>
    void yyerror(char * s);
    int yylex();
%}
  
%token CLASS MAIN ARG_STRING PRINT PRINTLN STRING VAR TYPE COMMA FOR BOP UOP NUMBER

%%

expr : CLASS VAR '{' main '}'
;

main : MAIN '(' ARG_STRING VAR ')' '{' stmt '}' 
;

stmt : define
     | stmt define
     | print
     | stmt print
     | for
     | stmt for
;

vars : VAR
     | vars COMMA VAR
;

define : TYPE vars ';'
;

for : FOR '(' fexp ';' fexp ';' fexp ')' '{' stmt '}'
;

fexp : fexp ',' exp
     | exp
     | '(' fexp ')'
;

exp : VAR BOP exp
    | VAR UOP
    | UOP VAR
    | VAR
    | NUMBER 
;

print : PRINT '(' exp ')' ';'
      | PRINT '(' STRING ')' ';'
      | PRINTLN '(' exp ')' ';'
      | PRINTLN '(' STRING ')' ';'
;

%%

int line_num;

void yyerror(char* msg)
{
    printf("Error: %s encountered at line number:%d\n", msg, line_num + 1);
}


int main (void) 
{
    if(yyparse() == 0) 
    {
        printf("Total line number : %d\n", line_num);
    }	
    return 0;
}
