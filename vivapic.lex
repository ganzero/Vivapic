%{
#include "vivapic.tab.h"
%}

%option noyywrap

%%
"end"                                   {return END;}
;                                       {return END_STATEMENT;}
\+?[0-9]+                               {yylval.i = atoi(yytext); return INT;}
\+?[0-9]+[.][0-9]+                      {yylval.i = atoi(yytext); return FLOAT;}
"vector"                                {return VECTOR;}
"point"                                 {return POINT;}
"circle"                                {return CIRCLE;}
"block"                                 {return BLOCK;}
"color_change"                          {return COLOR_CHANGE;}
[ \t\n]                                 ;
.                                       {printf("Invalid Input: %s", yytext);}

%%

