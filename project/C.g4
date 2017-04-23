grammar C;

program
	:
	includes statements
	;

includes
	:include includes
	|
	;

include
	: '#include <' CChar+ '>'
	| '#include "' CChar+ '"' 
	;

statements
	: statement statements
	| ifstatement statements
	| whilestatement statements
	| function statements
	|
	;

statement
	: TypeDecl Identifier ('['Constant']')? ';'											#VarDeclaration
	| TypeDecl Identifier ('['Constant']')? '(' parameterlist ')' ';'					#FunDeclaration
	| TypeDecl? Identifier ('['expression']')? AssignementOperator expression ';'		#Definition
	| expression ';'																	#Calculation
	| Return expression? ';'															#Return
	;

ifstatement
	: If '(' expression ')''{' statements '}' elsestatement?
	| If '(' expression ')' statement elsestatement?
	;

elsestatement
	: Else '{' statements '}'
	| Else statement
	;

whilestatement
	: While '(' expression ')' '{' statements '}'
	| While '(' expression ')' statement
	;

function
	: TypeDecl? Identifier '(' parameterlist ')' '{' statements '}'
	| TypeDecl? Identifier '(' parameterlist ')' statement
	;

expression
	: expression '||' andCondition
	| andCondition
	| 'new' TypeDecl
	;

andCondition
	: andCondition '&&' relationCondition
	| equalCondition
	;

equalCondition
	: equalCondition EqualOperator relationCondition
	| relationCondition
	;

relationCondition
	: relationCondition RelationOperator addCondition
	| addCondition
	;

addCondition
	: addCondition AddOperator multCondition
	| multCondition
	;

multCondition
	: multCondition MultOperator finalCondition
	| finalCondition
	; 


finalCondition
	: Identifier ('(' parameterlist ')' )? 
	| Identifier '[' expression ']'
	| Constant
	| '(' expression ')'
	| UnaryOperator finalCondition
	;

parameterlist
	: parameter
	|
	;

parameter
	: TypeDecl Identifier? ( '[ 'Constant ']' )?
	| TypeDecl Identifier? ( '[' Constant ']' )? ',' parameter
	;

UnaryOperator
	: '!'
	| '*'
	| '&'
	;


AssignementOperator
	: '='
	| '+='
	| '-='
	| '*='
	| '/='
	;

EqualOperator
	: '=='
	| '!='
	;

RelationOperator
	: '<'
	| '>'
	| '<='
	| '>='
	;

MultOperator
	: '*'
	| '/'
	;

AddOperator
	: '+'
	| '-'
	;

TypeDecl
	: global'? Types '*'*
	;

fragment
Types
	: 'char'
	| 'float'
	| 'int'
	| 'void'
	| 'bool'
	;



If
	:'if'
	;

Else
	:'else'
	;

Return
	: 'return'
	;

While
	: 'while'
	;

Constant
	: IntConstant
	| FloatConstant
	| CharacterConstant
	;

IntConstant
	: '-'? [1-9] Digit*
	| '0'
	;

FloatConstant
	: '-'?  Digit* '.' Digit+
	| '-'?  Digit+ '.'
	;

CharacterConstant
	: '\'' CChar+ '\''
	;

CChar 
	:  ~['\\\r\n]
    |   EscapeSequence
    ;

fragment
EscapeSequence
	: '\\' ['"?abfnrtv\\]
	| 
	;

Identifier
	: Nondigit (Nondigit | Digit)*
	;

fragment
Digit
	: [0-9]
	;

fragment
Nondigit
	:[a-zA-Z_]
	;

Whitespace
    :   [ \t]+
        -> skip
    ;

Newline
    :   (   '\r' '\n'?
        |   '\n'
        )
        -> skip
    ;

BlockComment
    :   '/*' .*? '*/'
        -> skip
    ;

LineComment
    :   '//' ~[\r\n]*
        -> skip
    ;
