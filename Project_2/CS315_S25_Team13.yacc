%{
#include <stdio.h>
#include <stdlib.h>

/* External variable from the lexer */
extern int line_num;
extern char* yytext;

/* Function declarations */
void yyerror(const char *s);
int yylex(void);  /* Add this line to fix the implicit declaration warning */
%}

/* Declare tokens corresponding to your lex file */
%token KACHOW KACHIN KACHOUT RETURN IF ELIF ELSE FOR WHILE TRUNK INT DOUBLE
%token EXPONENT EQUAL NOT_EQUAL LESS_EQUAL GREATER_EQUAL AND OR NOT
%token PLUS MINUS MULTIPLY DIVIDE MOD LESS_THAN GREATER_THAN ASSIGN
%token LP RP LBRACE RBRACE LBRACKET RBRACKET SEMICOLON COMMA
%token ID STRING_LITERAL INT_LITERAL FLOAT_LITERAL

/* Define precedences to resolve ambiguities */
%left OR
%left AND
%nonassoc ID
%nonassoc LP RP
%nonassoc EQUAL NOT_EQUAL
%nonassoc LESS_THAN GREATER_THAN LESS_EQUAL GREATER_EQUAL
%left PLUS MINUS
%left MULTIPLY DIVIDE MOD
%right EXPONENT
%right NOT

%%
/* start symbol */
program:
        functions KACHOW LP RP statement_block
        ;

/* functions: zero or more function definitions */
functions:
        /* empty */
        | functions function
        ;

/* function definition: type, identifier, parameter list, and a statement block */
function:
        type ID LP function_parameters RP LBRACE statements RBRACE
        ;

/* function parameters: either empty or a list of parameters */
function_parameters:
        /* empty */
        | parameter_list
        ;

parameter_list:
          core_declaration
        | core_initialization
        | trunk_parameter
        | parameter_list COMMA core_declaration
        | parameter_list COMMA core_initialization
        | parameter_list COMMA trunk_parameter
        ;

/* New rule for trunk parameters */
trunk_parameter:
        TRUNK LESS_THAN type GREATER_THAN ID
        ;



/* A statement block is enclosed in braces */
statement_block:
        LBRACE statements RBRACE
        ;

/* zero or more statements; each statement (except compound ones) ends with a semicolon */
statements:
        /* empty */
        | statements statement
        ;

/* A statement can be one of many kinds */
statement:
          declaration_statement SEMICOLON
        | if_statement
        | loop_statement
        | return_statement SEMICOLON
        | io_statement SEMICOLON
        | assignment_statement SEMICOLON
        | increment_statement SEMICOLON
        ;

/* Declaration statement: either a base declaration or a trunk declaration */
declaration_statement:
          base_declaration
        | trunk_declaration
        ;

/* if statements with optional else/elif parts */
if_statement:
          IF LP bool_expression RP statement_block
        | IF LP bool_expression RP statement_block ELSE statement_block
        | IF LP bool_expression RP statement_block elif_statements
        | IF LP bool_expression RP statement_block elif_statements ELSE statement_block
        ;

/* one or more elif clauses */
elif_statements:
          elif_statement
        | elif_statements elif_statement
        ;

/* an elif clause */
elif_statement:
        ELIF LP bool_expression RP statement_block
        ;

/* Loop statements */
loop_statement:
          for_statement
        | while_statement
        ;

/* for loop: initialization, boolean expression, and update statement */
for_statement:
        FOR LP init_dec_statement SEMICOLON bool_expression SEMICOLON increment_statement RP statement_block
        | FOR LP init_dec_statement SEMICOLON bool_expression SEMICOLON assignment_statement RP statement_block
        ;

/* while loop */
while_statement:
        WHILE LP bool_expression RP statement_block
        ;

/* Return statement: either returning an identifier or a full expression */
return_statement:
        RETURN expression
        ;

/* IO statements */
io_statement:
          input_statement
        | output_statement
        ;

/* input: kachin followed by one or more input IDs */
input_statement:
        KACHIN input_id
        ;

input_id:
        ID
        | id_index_chain
        | ID COMMA input_id
        | id_index_chain COMMA input_id
        ;

/* output: kachout followed by one or more out contents */
output_statement:
        KACHOUT out_contents
        ;

out_contents:
          out_content
        | out_content COMMA out_contents
        ;

/* out content can be empty, a string literal, an expression, or an identifier */
out_content:
          STRING_LITERAL
        | expression
        ;

/* Assignment: either simple assignment or with an index chain */
assignment_statement:
          ID ASSIGN expression
        | id_index_chain ASSIGN expression
        ;

id_index_chain:
        ID index_chain
        ;

index_chain:
          LBRACKET expression RBRACKET
        | LBRACKET expression RBRACKET index_chain
        ;

/* Increment and decrement statements */
increment_statement:
          ID PLUS PLUS
        | ID MINUS MINUS
        ;

/* Base declaration: a core declaration, initialization, or comma‐separated list */
base_declaration:
          core_declaration
        | core_initialization
        | base_declaration COMMA additional_declaration
        ;

/* Core declaration as per your rules */
core_declaration:
          base_type ID ASSIGN expression
        ;

/* Core initialization: a type and an identifier */
core_initialization:
        base_type ID
        ;

/* Additional declaration: either a typed declaration or just an identifier */
additional_declaration:
          ID ASSIGN expression
        | ID
        ;

/* Base type is either int or double */
base_type:
          INT
        | DOUBLE
        ;

/* Trunk declaration uses the TRUNK keyword and angle brackets */
trunk_declaration:
          TRUNK LESS_THAN type GREATER_THAN ID ASSIGN trunk_initializer
        | TRUNK LESS_THAN type GREATER_THAN ID ASSIGN function_call
        ;

/* Trunk initializer: either an element list, a "trunk"–style function, or a trunk constructor */
trunk_initializer:
          LBRACE element_list RBRACE
        | STRING_LITERAL LESS_THAN type GREATER_THAN LP expression RP
        | TRUNK LESS_THAN type GREATER_THAN LP expression RP
        | trunk_constructor
        ;

/* New rule for nested trunk constructors */
trunk_constructor:
        TRUNK LESS_THAN nested_trunk_constructor GREATER_THAN LP expression RP
        ;

/* Handle nested trunk constructors */
nested_trunk_constructor:
          TRUNK LESS_THAN type GREATER_THAN LP expression RP
        | nested_trunk_constructor GREATER_THAN LP expression RP
        ;
/* Element list: a possibly empty, comma‐separated list of expressions */
element_list:
          /* empty */
        | expression
        | expression COMMA element_list
        ;

/* Expression can be an arithmetic, boolean, or a function call */
expression:
          arithmetic_expression
        | bool_expression
        ;

/* Function call: identifier with parameters in parentheses */
function_call:
        ID LP function_call_parameters RP
        ;


/* Function call parameters: a comma‐separated list of bases */
function_call_parameters:
          /* empty */
        | expression
        | function_call_parameters COMMA expression
        ;

/* Arithmetic expressions */
arithmetic_expression:
        sum_expression
        ;

sum_expression:
          multiply_expression
        | sum_expression PLUS multiply_expression
        | sum_expression MINUS multiply_expression
        | PLUS multiply_expression
        | MINUS multiply_expression
        ;

multiply_expression:
          exponent_expression
        | multiply_expression MULTIPLY exponent_expression
        | multiply_expression DIVIDE exponent_expression
        | multiply_expression MOD exponent_expression
        ;

exponent_expression:
          base
        | base EXPONENT exponent_expression
        ;

/* Boolean expressions */
bool_expression:
	or_expression
	;

or_expression:
          and_expression
        | or_expression OR and_expression
        ;

and_expression:
          not_expression
        | and_expression AND not_expression
        ;

not_expression:
          NOT not_expression
        | relational_expression
        ;

/* Relational expressions compare two expressions */
relational_expression:
          arithmetic_expression relational_operator arithmetic_expression
        ;

relational_operator:
          EQUAL
        | NOT_EQUAL
        | LESS_THAN
        | GREATER_THAN
        | LESS_EQUAL
        | GREATER_EQUAL
        ;

/* Base: a literal, an identifier, or a parenthesized expression */

base:
          INT_LITERAL
        | FLOAT_LITERAL
        | ID
        | indexed_id
        | LP expression RP
        | function_call
        ;

/* New rule for index access */
indexed_id:
        ID index_chain
        ;

/* Types: either a base type or a trunk type (using angle brackets) */
type:
          base_type
        | TRUNK LESS_THAN type GREATER_THAN
        ;

/* Initialization declaration for for-loops */
init_dec_statement:
        declaration_statement
        ;

%%

int main(int argc, char **argv) {
    if (yyparse() == 0) {
        printf("Input program is valid\n");
    }
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error at line %d: %s\n", line_num, s);
    
    /* Print additional context if possible */
    if (yytext && *yytext) {
        fprintf(stderr, "Near token: '%s'\n", yytext);
    }
}

