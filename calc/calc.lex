/* Mini Calculator */
/* calc.lex */

%{
#include "heading.h"
#include "tok.h"
int yyerror(char *s);
%}

digit		[0-9]
int_const	{digit}+

%%

{int_const}	{ yylval.int_val = atoi(yytext); return INTEGER_LITERAL; }
"+"		{ yylval.op_val = *yytext; return PLUS; }
"*"		{ yylval.op_val = *yytext; return MULT; }

[ \t]*		{}
[\n]		{ yylineno++;	}

.		{ printf("SCANNER "); yyerror(""); exit(1);	}

