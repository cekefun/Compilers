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
	: TypeDecl Identifier ('['constant'])?';'							#VarDeclaration
	| TypeDecl Identifier ('['constant'])? '(' parameterlist ')' ';'	#FunDeclaration
	| TypeDecl? Identifier AssignementOperator expression ';'			#Definition
	| expression ';'													#Calculation
	| Return expression? ';'											#Return
	;

ifstatement
	: If '(' expression ')''{' statements '}' elsestatement?
	| If '(' expression ')' statement elsestatement?
	;

elsestatement
	: Else'{' statements '}'
	| Else statement
	;

whilestatement
	: While '(' expression ')' '{' statements '}'
	| While '(' expression ')' statement 

function
	: TypeDecl? Identifier '(' parameterlist ')' '{' statements '}'
	| TypeDecl? Identifier '(' parameterlist ')' statement
	;

expression
	: expression '||' andCondition
	| andCondition
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
	: addCondtion AddOperator multCondtion
	| multCondition
	;

multCondtion
	: multCondtion MultOperator finalCondition
	| finalCondtion
	; 


finalCondition
	: Identifier
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
	: TypeDecl Identifier? ('['constant'])?
	| TypeDecl Identifier? ('['constant'])? ',' parameter

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

MulOperator
	: '*'
	| '/'
	;

AddOperator
	: '+'
	| '-'
	;

TypeDecl
	: 'char'
	| 'float'
	| 'int'
	| TypeDecl '*'
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
	: -? [1-9] Digit*
	| 0
	;

FloatConstant
	: -?  Digit*'.'Digit+
	| -?  Digit+'.'

CharacterConstant
	: '\'' CChar+ '\''
	;

CChar 
	:  ~['\\\r\n]
    |   EscapeSequence
    ;

EscapeSequence
	: '\\' ['"?abfnrtv\\]
	| 

Identifier
	: Nondigit (NonDigit | Digit)*
	;

Digit
	: [0-9]
	;

Nondigit
	:[a-zA-Z_]

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