%{
    #include "yacc.tab.h"
    extern int line_num;
%}

digit	[0-9]+
bop	=|<|>|!=|<=|>=|==|&&|"||"|[+-/*]
uop	"++"|"--"
string  \"{var}*{digit}*{bop}*{uop}*\"
type    int
var     [A-Za-z][A-Za-z0-9]*

%%
"class"                     {return CLASS;}
"public static void main"   {return MAIN;}
"String[]"                  {return ARG_STRING;}
"System.out.println"        {return PRINTLN;}
"System.out.print"          {return PRINT;}
"for"	                    {return FOR;}
","                         {return COMMA; }
{type}                      {return TYPE;}
{bop}	                    {return BOP;}
{uop}	                    {return UOP;}
{digit}	                    {return NUMBER;}
{string}                    {return STRING;}
{var}                       {return VAR;}
[  \t]   	                   ;	
[\n]	                    {line_num++;}
.	                    {return *yytext;}
%%

/* This function is called at the end of the file. 
   if return value is 1, stop parsing */
int yywrap()
{
    return 1;
}
