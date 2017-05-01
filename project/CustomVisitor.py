from CVisitor import CVisitor
from Tree import *

from antlr4 import *
if __name__ is not None and "." in __name__:
    from .CParser import CParser
else:
    from CParser import CParser

class CustomVisitor(CVisitor):
    tree = None
    currentNode = None

    def __init__(self):
        self.tree = Tree()

    # Visit a parse tree produced by CParser#program.
    def visitProgram(self, ctx:CParser.ProgramContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "program"
        newNode.parent = nodeHere
        if(self.currentNode == None):
            self.tree.root = newNode
        else:
            nodeHere.addChild(newNode)
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree


    # Visit a parse tree produced by CParser#includes.
    def visitIncludes(self, ctx:CParser.IncludesContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "includes"
        newNode.parent = nodeHere
        nodeHere.addChild(newNode)
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree


    # Visit a parse tree produced by CParser#include.
    def visitInclude(self, ctx:CParser.IncludeContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "include"
        newNode.parent = nodeHere
        nodeHere.addChild(newNode)
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree


    # Visit a parse tree produced by CParser#statements.
    def visitStatements(self, ctx:CParser.StatementsContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "statements"
        newNode.parent = nodeHere
        nodeHere.addChild(newNode)
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree


    # Visit a parse tree produced by CParser#VarDeclaration.
    def visitVarDeclaration(self, ctx:CParser.VarDeclarationContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "VarDecl"
        newNode.parent = nodeHere
        nodeHere.addChild(newNode)
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree


    # Visit a parse tree produced by CParser#FunDeclaration.
    def visitFunDeclaration(self, ctx:CParser.FunDeclarationContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "FunDecl"
        newNode.parent = nodeHere
        nodeHere.addChild(newNode)

        
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree


    # Visit a parse tree produced by CParser#Definition.
    def visitDefinition(self, ctx:CParser.DefinitionContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "Definition"
        newNode.parent = nodeHere
        nodeHere.addChild(newNode)

        
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree


    # Visit a parse tree produced by CParser#Calculation.
    def visitCalculation(self, ctx:CParser.CalculationContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "Calculation"
        newNode.parent = nodeHere
        nodeHere.addChild(newNode)

        
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree



    # Visit a parse tree produced by CParser#Return.
    def visitReturn(self, ctx:CParser.ReturnContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "return"
        newNode.parent = nodeHere
        nodeHere.addChild(newNode)

        
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree



    # Visit a parse tree produced by CParser#ifstatement.
    def visitIfstatement(self, ctx:CParser.IfstatementContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "If"
        newNode.parent = nodeHere
        nodeHere.addChild(newNode)

        
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree



    # Visit a parse tree produced by CParser#elsestatement.
    def visitElsestatement(self, ctx:CParser.ElsestatementContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "Else"
        newNode.parent = nodeHere
        nodeHere.addChild(newNode)

        
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree



    # Visit a parse tree produced by CParser#whilestatement.
    def visitWhilestatement(self, ctx:CParser.WhilestatementContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "While"
        newNode.parent = nodeHere
        nodeHere.addChild(newNode)

        
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree



    # Visit a parse tree produced by CParser#function.
    def visitFunction(self, ctx:CParser.FunctionContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "function"
        newNode.parent = nodeHere
        nodeHere.addChild(newNode)

        
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree



    # Visit a parse tree produced by CParser#expression.
    def visitExpression(self, ctx:CParser.ExpressionContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "Expression"
        newNode.parent = nodeHere
        nodeHere.addChild(newNode)

        
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree



    # Visit a parse tree produced by CParser#andCondition.
    def visitAndCondition(self, ctx:CParser.AndConditionContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "And"
        newNode.parent = nodeHere
        nodeHere.addChild(newNode)

        
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree



    # Visit a parse tree produced by CParser#equalCondition.
    def visitEqualCondition(self, ctx:CParser.EqualConditionContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "Equality"
        newNode.parent = nodeHere
        nodeHere.addChild(newNode)

        
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree



    # Visit a parse tree produced by CParser#relationCondition.
    def visitRelationCondition(self, ctx:CParser.RelationConditionContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "Compare"
        newNode.parent = nodeHere
        nodeHere.addChild(newNode)

        
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree



    # Visit a parse tree produced by CParser#addCondition.
    def visitAddCondition(self, ctx:CParser.AddConditionContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "Addition"
        newNode.parent = nodeHere
        nodeHere.addChild(newNode)

        
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree



    # Visit a parse tree produced by CParser#multCondition.
    def visitMultCondition(self, ctx:CParser.MultConditionContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "multiplication"
        newNode.parent = nodeHere
        nodeHere.addChild(newNode)

        
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree



    # Visit a parse tree produced by CParser#finalCondition.
    def visitFinalCondition(self, ctx:CParser.FinalConditionContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "lowest"
        newNode.parent = nodeHere
        nodeHere.addChild(newNode)

        
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree



    # Visit a parse tree produced by CParser#parameterlist.
    def visitParameterlist(self, ctx:CParser.ParameterlistContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "Parameterlist"
        newNode.parent = nodeHere
        nodeHere.addChild(newNode)

        
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree



    # Visit a parse tree produced by CParser#parameter.
    def visitParameter(self, ctx:CParser.ParameterContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "Parameter"
        newNode.parent = nodeHere
        nodeHere.addChild(newNode)

        
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree

    # Visit a parse tree produced by CParser#typeDecl.
    def visitTypeDecl(self, ctx:CParser.TypeDeclContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "typeDecl"
        newNode.parent = nodeHere
        nodeHere.addChild(newNode)

        
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree

    # Visit a parse tree produced by CParser#array.
    def visitArray(self, ctx:CParser.ArrayContext):
        nodeHere = self.currentNode

        newNode = Node()
        newNode.data = "array"
        newNode.parent = nodeHere
        nodeHere.addChild(newNode)

        
        self.currentNode = newNode
        self.visitChildren(ctx)
        self.currentNode = nodeHere
        return self.tree


del CVisitor