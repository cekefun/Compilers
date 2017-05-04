grammar C;

program
	:
	includes statements EOF
	;

includes
	:include includes
	|
	;

include
	: '#include <' Filename '>'
	| '#include "' Filename '"' 
	;

statements
	: statement statements
	| ifstatement statements
	| whilestatement statements
	| function statements
	|
	;

statement
	: typeDecl Identifier array? ';'												#VarDeclaration
	| typeDecl Identifier array? '(' parameterlist ')' ';'							#FunDeclaration
	| typeDecl? Identifier array?? AssignementOperator expression ';'				#Definition
	| expression ';'																#Calculation
	| Return expression? ';'														#Return
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
	: typeDecl? Identifier '(' parameterlist ')' '{' statements '}'
	| typeDecl? Identifier '(' parameterlist ')' statement
	;

expression
	: expression '||' andCondition
	| andCondition
	| 'new' typeDecl
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
	| Identifier array
	| constant
	| '(' expression ')'
	| UnaryOperator finalCondition
	;

parameterlist
	: parameter
	|
	;

parameter
	: typeDecl Identifier? array?
	| typeDecl Identifier? array? ',' parameter
	;

typeDecl
	:Modifier? Type Pointer*
	;

array
	: '['expression']'
	;

Pointer
	:Star
	;

UnaryOperator
	: '!'
	| Star
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
	: Star
	| '/'
	;

AddOperator
	: '+'
	| '-'
	;

Type
	: 'char'
	| 'float'
	| 'int'
	| 'void'
	| 'bool'
	;

Modifier
	:'global'
	;

Void
	:'void'
	;

Char
	:'char'
	;

Int
	: 'int'
	;

Float
	: 'float'
	;

Bool
	: 'bool'
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

Star
	: '*'
	;

constant
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

Filename
	: CChar+ '.h'  //(Digit|Nondigit)+
	;

fragment
CChar 
	:  ~['\\\r\n]
    |   EscapeSequence
    ;

fragment
EscapeSequence
	: '\\' ['"?abfnrtv\\]
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
