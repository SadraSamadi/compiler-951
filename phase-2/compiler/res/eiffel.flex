/**********************************************************************
* Compiler Project – Phase 2                                          *
* Language : Eiffel                                                   *
* Team :                                                              *
*   1. Sadra Samadi             - 9312268122                          *
*   2. Hamid Hosseini Nejad     - 9312268110                          *
***********************************************************************/

import java_cup.runtime.*;

%%

%public
%class Lexer
%unicode
%cup
%line
%column
%standalone

%{

    StringBuffer string = new StringBuffer();

    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }

    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }

%}

ALPHABET            = [A-Za-z]
DIGIT               = [0-9]
LINE_TERMINATOR     = \r | \n | \r\n
WHITE_SPACE         = {LINE_TERMINATOR} | [ \t\f]
INTEGER             = ({DIGIT}+ | ("0X" | "0x")[0-9A-Fa-f]+)
IDENTIFIER          = {ALPHABET}({ALPHABET} | {DIGIT} | _)*
INPUT_CHARACTER     = [^\r\n]
COMMENT             = "--" {INPUT_CHARACTER}* {LINE_TERMINATOR}?

%state STRING

%eofval{
    return symbol(Constants.EOF);
%eofval}

%%

<YYINITIAL> {

    "class"             { return symbol(Constants.CLASS); }
    "create"            { return symbol(Constants.CREATE); }
    "feature"           { return symbol(Constants.FEATURE); }
    "INTEGER"           { return symbol(Constants.INTEGER_TYPE); }
    "do"                { return symbol(Constants.DO); }
    "end"               { return symbol(Constants.END); }
    "if"                { return symbol(Constants.IF); }
    "then"              { return symbol(Constants.THEN); }
    "else"              { return symbol(Constants.ELSE); }
    "from"              { return symbol(Constants.FROM); }
    "until"             { return symbol(Constants.UNTIL); }
    "loop"              { return symbol(Constants.LOOP); }
    "print"             { return symbol(Constants.PRINT); }
    "true"              { return symbol(Constants.TRUE); }
    "false"             { return symbol(Constants.FALSE); }

    ":="                { return symbol(Constants.ASSIGN); }
    ":"                 { return symbol(Constants.COLON); }
    "="                 { return symbol(Constants.EQUAL); }
    ">"                 { return symbol(Constants.GREATER); }
    ">="                { return symbol(Constants.GREATER_EQUAL); }
    "<"                 { return symbol(Constants.SMALLER); }
    "<="                { return symbol(Constants.SMALLER_EQUAL); }
    "+"                 { return symbol(Constants.PLUS); }
    "-"                 { return symbol(Constants.MINUS); }
    "*"                 { return symbol(Constants.TIMES); }
    "/"                 { return symbol(Constants.DIVIDE); }
    "%"                 { return symbol(Constants.MOD); }
    "("                 { return symbol(Constants.LPAREN); }
    ")"                 { return symbol(Constants.RPAREN); }

    \"                  { string.setLength(0); yybegin(STRING); }

    {IDENTIFIER}        { return symbol(Constants.IDENTIFIER, yytext()); }
    {INTEGER}           { return symbol(Constants.INTEGER, new Integer(yytext())); }
    {COMMENT}           { /* Do nothing ... */ }
    {WHITE_SPACE}       { /* Do nothing ... */ }

}

<STRING> {

    \"                  { yybegin(YYINITIAL); return symbol(Constants.STRING_LITERAL, string.toString()); }
    [^\n\r\"\\]+        { string.append(yytext()); }
    \\t                 { string.append('\t'); }
    \\n                 { string.append('\n'); }
    \\r                 { string.append('\r'); }
    \\\"                { string.append('\"'); }
    \\                  { string.append('\\'); }

}

[^]                     { throw new Error("Illegal Character <" + yytext() + "> at line " + (yyline + 1) + ", column " + (yycolumn + 1)); }
