%{
//Project 2 Language Creation
//Created by Owen Ganzer
#include <stdlib.h>
#include <stdio.h>
#include "vivapic.h"
void yyerror(const char* msg);
int yylex();
%}


%define parse.error verbose
%start create
%union {int i; char* str; float f;}

%token END
%token END_STATEMENT
%token POINT
%token VECTOR
%token CIRCLE
%token BLOCK
%token COLOR_CHANGE
%token INT
%token FLOAT

%type<i> INT
%type<f> FLOAT
%type<str> END
%type<str> VECTOR
%type<str> CIRCLE
%type<str> BLOCK
%type<str> COLOR_CHANGE
%type<str> END_STATEMENT

%%
create : exit         
       | v create
       | p create
       | c create
       | b create
       | cc create
       ;

v : VECTOR INT INT INT INT END_STATEMENT
       {vector($2, $3, $4, $5);}
       ;

p : POINT INT INT END_STATEMENT
      {point($2, $3);}
      ;

c : CIRCLE INT INT INT END_STATEMENT
       {circle($2, $3, $4);}
       ;

b : BLOCK INT INT INT INT END_STATEMENT
      {block($2, $3, $4, $5);}
      ;

cc : COLOR_CHANGE INT INT INT END_STATEMENT
             {color_change($2, $3, $4);}
             ;

exit : END 
     {exit(EXIT_SUCCESS);}
     ;

%%
int main(int argc, char** argv){
        setup();
        yyparse(); 
        return 0;
}

void yyerror(const char* msg){
        fprintf(stderr, "ERROR! %s\n", msg);
        }
