%{
#include "y.tab.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
int line_num = 1;  /* Track line numbers */
%}
%option noyywrap
KACHOW       kachow
KACHIN       kachin
KACHOUT      kachout
RETURN       return
IF           if
ELIF         elif
ELSE         else
FOR          for
WHILE        while
TRUNK        trunk
INT          int
DOUBLE       double
ASSIGN       =
EXPONENT     \*\*
EQUAL        ==
NOT_EQUAL    \!\=
LESS_THAN    <
GREATER_THAN >
LESS_EQUAL   <=
GREATER_EQUAL >=
AND          &&
OR           \|\|
NOT          !
PLUS         \+
MINUS        \-
MULTIPLY     \*
DIVIDE       \/
MOD          %
LP           \(
RP           \)
LBRACE       \{
RBRACE       \}
LBRACKET     \[
RBRACKET     \]
SEMICOLON    ;
COMMA        ,
DIGIT        [0-9]
LETTER       [A-Za-z]
ID           {LETTER}({LETTER}|{DIGIT}|_)*
INT_LITERAL  {DIGIT}+
FLOAT        {DIGIT}*"."[0-9]+
WS           [ \t]+
%%
{KACHOW}       { return KACHOW; }
{KACHIN}       { return KACHIN; }
{KACHOUT}      { return KACHOUT; }
{RETURN}       { return RETURN; }
{IF}           { return IF; }
{ELIF}         { return ELIF; }
{ELSE}         { return ELSE; }
{FOR}          { return FOR; }
{WHILE}        { return WHILE; }
{TRUNK}        { return TRUNK; }
{INT}          { return INT; }
{DOUBLE}       { return DOUBLE; }
{EXPONENT}     { return EXPONENT; }
{EQUAL}        { return EQUAL; }
{NOT_EQUAL}    { return NOT_EQUAL; }
{LESS_EQUAL}   { return LESS_EQUAL; }
{GREATER_EQUAL} { return GREATER_EQUAL; }
{AND}          { return AND; }
{OR}           { return OR; }
{NOT}          { return NOT; }
{PLUS}         { return PLUS; }
{MINUS}        { return MINUS; }
{MULTIPLY}     { return MULTIPLY; }
{DIVIDE}       { return DIVIDE; }
{MOD}          { return MOD; }
{LESS_THAN}    { return LESS_THAN; }
{GREATER_THAN} { return GREATER_THAN; }
{ASSIGN}       { return ASSIGN; }
{LP}           { return LP; }
{RP}           { return RP; }
{LBRACE}       { return LBRACE; }
{RBRACE}       { return RBRACE; }
{LBRACKET}     { return LBRACKET; }
{RBRACKET}     { return RBRACKET; }
{SEMICOLON}    { return SEMICOLON; }
{COMMA}        { return COMMA; }
{ID}           { return ID; }
\"[^\"]*\"     { return STRING_LITERAL; }
{INT_LITERAL}  { return INT_LITERAL; }
{FLOAT}        { return FLOAT_LITERAL; }
\#.*           { /* Ignore single-line comment */ }
"##"([^#]|#[^#])*"##"  { /* Improved multi-line comment handling */ 
                         /* Count newlines in comments */
                         for(int i = 0; i < yyleng; i++) 
                           if(yytext[i] == '\n') line_num++; 
                       }
\n             { line_num++; /* Count newlines */ }
{WS}           { /* Ignore whitespace */ }
.              { }
%%
void reset_line_number() {
    line_num = 1;
}
