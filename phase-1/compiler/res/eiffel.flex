/**********************************************************************
* Compiler Project – Phase 1                                          *
* Language : Eiffel                                                   *
***********************************************************************/

%%

%public
%class Eiffel
%unicode
%line
%standalone
%function getNextToken
%type Token

ALPHABET = [A-Za-z]
DIGIT = [0-9]
INTEGER = ({DIGIT}+ | ("0X" | "0x")[0-9A-Fa-f]+)
DOUBLE = ({DIGIT}+"." | {DIGIT}+"."{DIGIT}+ | {DIGIT}+"."{DIGIT}+"E"("+" | "-"){DIGIT}+)
NEW_LINE = \r | \n | \r\n
WHITE_SPACE = ({NEW_LINE} | [ \t\f])+
COMMENT = "--".*
STRING_TEXT = "\""[^\"\n]*"\""
IDENTIFIER = {ALPHABET}({ALPHABET} | {DIGIT} | _)*

%%

{WHITE_SPACE}   { Token token = new Token(Constants.WHITESPACE, "", yyline + 1, yycolumn + 1); token.print("Whitespace !"); return token; }
{COMMENT}       { Token token = new Token(Constants.COMMENT, yytext(), yyline + 1, yycolumn + 1); token.print("Comment : "); return token; }

"note"          { Token token = new Token(Constants.NOTE, yytext(), yyline + 1, yycolumn + 1); token.print("Keyword : "); return token; }
"class"         { Token token = new Token(Constants.CLASS, yytext(), yyline + 1, yycolumn + 1); token.print("Keyword : "); return token; }
"inherit"       { Token token = new Token(Constants.INHERIT, yytext(), yyline + 1, yycolumn + 1); token.print("Keyword : "); return token; }
"create"        { Token token = new Token(Constants.CREATE, yytext(), yyline + 1, yycolumn + 1); token.print("Keyword : "); return token; }
"feature"       { Token token = new Token(Constants.FEATURE, yytext(), yyline + 1, yycolumn + 1); token.print("Keyword : "); return token; }
"when"          { Token token = new Token(Constants.WHEN, yytext(), yyline + 1, yycolumn + 1); token.print("Keyword : "); return token; }
"Void"          { Token token = new Token(Constants.VOID, yytext(), yyline + 1, yycolumn + 1); token.print("Keyword : "); return token; }
"then"          { Token token = new Token(Constants.THEN, yytext(), yyline + 1, yycolumn + 1); token.print("Keyword : "); return token; }
"all"           { Token token = new Token(Constants.ALL, yytext(), yyline + 1, yycolumn + 1); token.print("Keyword : "); return token; }
"if"            { Token token = new Token(Constants.IF, yytext(), yyline + 1, yycolumn + 1); token.print("Keyword : "); return token; }
"as"            { Token token = new Token(Constants.AS, yytext(), yyline + 1, yycolumn + 1); token.print("Keyword : "); return token; }
"require"       { Token token = new Token(Constants.REQUIRE, yytext(), yyline + 1, yycolumn + 1); token.print("Keyword : "); return token; }
"loop"          { Token token = new Token(Constants.LOOP, yytext(), yyline + 1, yycolumn + 1); token.print("Keyword : "); return token; }
"check"         { Token token = new Token(Constants.CHECK, yytext(), yyline + 1, yycolumn + 1); token.print("Keyword : "); return token; }
"undefine"      { Token token = new Token(Constants.UNDEFINE, yytext(), yyline + 1, yycolumn + 1); token.print("Keyword : "); return token; }
"debug"         { Token token = new Token(Constants.DEBUG, yytext(), yyline + 1, yycolumn + 1); token.print("Keyword : "); return token; }
"deferred"      { Token token = new Token(Constants.DEFFERD, yytext(), yyline + 1, yycolumn + 1); token.print("Keyword : "); return token; }
"else"          { Token token = new Token(Constants.ELSE, yytext(), yyline + 1, yycolumn + 1); token.print("Keyword : "); return token; }
"elseif"        { Token token = new Token(Constants.ELSEIF, yytext(), yyline + 1, yycolumn + 1); token.print("Keyword : "); return token; }
"end"           { Token token = new Token(Constants.END, yytext(), yyline + 1, yycolumn + 1); token.print("Keyword : "); return token; }
"ensure"        { Token token = new Token(Constants.ENSURE, yytext(), yyline + 1, yycolumn + 1); token.print("Keyword : "); return token; }
"do"            { Token token = new Token(Constants.DO, yytext(), yyline + 1, yycolumn + 1); token.print("Keyword : "); return token; }

"True"          { Token token = new Token(Constants.TRUE, yytext(), yyline + 1, yycolumn + 1); token.print("Boolean Value : "); return token; }
"False"         { Token token = new Token(Constants.FALSE, yytext(), yyline + 1, yycolumn + 1); token.print("Boolean Value : "); return token; }

"+"             { Token token = new Token(Constants.PLUS, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }
"-"             { Token token = new Token(Constants.MINUS, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }
"*"             { Token token = new Token(Constants.MULT, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }
"/"             { Token token = new Token(Constants.DIV, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }
"%"             { Token token = new Token(Constants.MOD, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }

"<"             { Token token = new Token(Constants.LT, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }
"<="            { Token token = new Token(Constants.LTEQ, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }
">"             { Token token = new Token(Constants.GT, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }
">="            { Token token = new Token(Constants.GTEQ, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }
"="             { Token token = new Token(Constants.EQ, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }
"=="            { Token token = new Token(Constants.EQEQ, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }
"!="            { Token token = new Token(Constants.NOTEQ, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }
"&&"            { Token token = new Token(Constants.AND, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }
"||"            { Token token = new Token(Constants.OR, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }
"!"             { Token token = new Token(Constants.NOT, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }
";"             { Token token = new Token(Constants.SEMICOLON, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }
","             { Token token = new Token(Constants.COMMA, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }
"."             { Token token = new Token(Constants.DOT, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }

"("             { Token token = new Token(Constants.LPAREN, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }
")"             { Token token = new Token(Constants.RPAREN, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }
"{"             { Token token = new Token(Constants.LBRACE, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }
"}"             { Token token = new Token(Constants.RBRACE, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }
"["             { Token token = new Token(Constants.LBRACK, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }
"]"             { Token token = new Token(Constants.RBRACK, yytext(), yyline + 1, yycolumn + 1); token.print("Operator : "); return token; }

{IDENTIFIER}    { Token token = new Token(Constants.ID, yytext(), yyline + 1, yycolumn + 1); token.print("Identifier : "); return token; }
{STRING_TEXT}   { Token token = new Token(Constants.STRINGVAL, yytext(), yyline + 1, yycolumn + 1); token.print("String Value : "); return token; }
{DOUBLE}        { Token token = new Token(Constants.DOUBLEVAL, yytext(), yyline + 1, yycolumn + 1); token.print("Double Value : "); return token; }
{INTEGER}       { Token token = new Token(Constants.INTEGERVAL, yytext(), yyline + 1, yycolumn + 1); token.print("Integer Value : "); return token; }
[^]             { Token token = new Token(Constants.ERROR, yytext(), yyline + 1, yycolumn + 1); token.print("Error, Invalid Character! : "); return token; }
<<EOF>>         { Token token = new Token(Constants.EOF, "", yyline + 1, yycolumn + 1); token.print("End Of File !"); return token; }
