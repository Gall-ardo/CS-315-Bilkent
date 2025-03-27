%option main
KACHOW           kachow
KACHIN           kachin
KACHOUT          kachout
RETURN           return
IF               if
ELIF             elif
ELSE             else
FOR              for
WHILE            while
TRUNK            trunk
INT              int
DOUBLE           double
ASSIGN           \=
EXPONENT         \*\*
EQUAL            \=\=
NOT_EQUAL        \!\=
LESS_THAN        \<
GREATER_THAN     \>
LESS_EQUAL       \<\=
GREATER_EQUAL    \>\=
AND              \&\&
OR               \|\|
NOT              \!
PLUS             \+
MINUS            \-
MULTIPLY         \*
DIVIDE           \/
MOD              \%
LP               \(
RP               \)
LBRACE           \{
RBRACE           \}
LBRACKET         \[
RBRACKET         \]
SEMICOLON        \;
COMMA            \,
DIGIT            [0-9]
LETTER           [A-Za-z]
ID               {LETTER}({LETTER}|{DIGIT}|_)*
INT_LITERAL      {DIGIT}+
FLOAT            {DIGIT}*\.{DIGIT}+
CONST            FLOAT | INT
WS               [ \t]+
%%
{KACHOW}         { printf("KACHOW "); }
{RETURN}         { printf("RETURN "); }
{IF}             { printf("IF "); }
{ELIF}           { printf("ELIF "); }
{ELSE}           { printf("ELSE "); }
{FOR}            { printf("FOR "); }
{WHILE}          { printf("WHILE "); }
{KACHIN}         { printf("KACHIN "); }
{KACHOUT}        { printf("KACHOUT "); }
{TRUNK}          { printf("TRUNK "); }
{INT}            { printf("INT "); }
{DOUBLE}         { printf("DOUBLE "); }
{EXPONENT}       { printf("EXPONENT "); }
{EQUAL}          { printf("EQUAL "); }
{NOT_EQUAL}      { printf("NOT_EQUAL "); }
{LESS_EQUAL}     { printf("LESS_EQUAL "); }
{GREATER_EQUAL}  { printf("GREATER_EQUAL "); }
{AND}            { printf("AND "); }
{OR}             { printf("OR "); }
{NOT}            { printf("NOT "); }
{PLUS}           { printf("PLUS "); }
{MINUS}          { printf("MINUS "); }
{MULTIPLY}       { printf("MULTIPLY "); }
{DIVIDE}         { printf("DIVIDE "); }
{MOD}            { printf("MOD "); }
{LESS_THAN}      { printf("LESS_THAN "); }
{GREATER_THAN}   { printf("GREATER_THAN "); }
{ASSIGN}         { printf("ASSIGN "); }
{LP}             { printf("LP "); }
{RP}             { printf("RP "); }
{LBRACE}         { printf("LBRACE "); }
{RBRACE}         { printf("RBRACE "); }
{LBRACKET}       { printf("LBRACKET "); }
{RBRACKET}       { printf("RBRACKET "); }
{SEMICOLON}      { printf("SEMICOLON "); }
{COMMA}          { printf("COMMA "); }
{ID}             { printf("ID "); }
".*"             { printf("STRING_LITERAL "); }
{INT_LITERAL}    { printf("INT_LITERAL "); }
{FLOAT}          { printf("FLOAT_LITERAL "); }
\#.*             { printf("SLCOMMENT "); }
\#\#([^#\n]*(\n[^#\n]*)*)\#\#  { printf("MLCOMMENT "); }
\n               { printf("\n"); }
{WS}             { /* skip whitespace */ }
\.               { printf("\n\nUNKNOWN\n\n"); }
