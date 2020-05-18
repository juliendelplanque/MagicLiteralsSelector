"
a RBNodeVisitor that finds the  'location' of a node(literal) in the AST of its containing method 

possible locations are (see MLSAbstractNodeLocation hierarchy):
- ExpressionValue -- rhs of an assignement ('x := 42'), or member of an array (ex: '{$a . x}')
- BinaryArgument  -- ex: 'x + 1'
- KeywordArgument -- ex: 'set new: 5'
- PragmaArgument  -- ex: '<primitive: 0>'
- MessageReceiver -- ex: '1 * 2' or '1 to: aCollection size do:'
- ReturnValue     -- ex: '^nil'

"
Class {
	#name : #MLSNodeLocationVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'targetNode'
	],
	#category : #'MagicLiteralsSelector-analysis'
}

{ #category : #'instance creation' }
MLSNodeLocationVisitor class >> on: aRBNode [
	^self new
		on: aRBNode
]

{ #category : #'as yet unclassified' }
MLSNodeLocationVisitor >> binarySelector: aSymbol [
	^aSymbol asString allSatisfy: [:c | '+-*\/&=>|<~@,' includes: c]
]

{ #category : #'as yet unclassified' }
MLSNodeLocationVisitor >> keywordSelector: aSymbol [
	^aSymbol asString includes: $:
]

{ #category : #'instance creation' }
MLSNodeLocationVisitor >> on: aRBNode [
	targetNode := aRBNode.
	^aRBNode parent acceptVisitor: self
]

{ #category : #visiting }
MLSNodeLocationVisitor >> visitArrayNode: aRBNode [
	^MLSNodeLocationExpressionValue new
]

{ #category : #visiting }
MLSNodeLocationVisitor >> visitAssignmentNode: aRBNode [
	^MLSNodeLocationExpressionValue new
]

{ #category : #visiting }
MLSNodeLocationVisitor >> visitMessageNode: aRBNode [

	(aRBNode receiver = targetNode)
	ifTrue: [ ^MLSNodeLocationMessageReceiver new ].

	(self keywordSelector: aRBNode selector)
		ifTrue: [ ^MLSNodeLocationKeywordArgument new].

	(self binarySelector: aRBNode selector)
		ifTrue: [ ^MLSNodeLocationBinaryArgument new].
1halt.
	Error signal: 'Unknown case in MessageNode visit'
]

{ #category : #visiting }
MLSNodeLocationVisitor >> visitNode: aRBNode [
	Error signal: 'Unknown node location'
]

{ #category : #visiting }
MLSNodeLocationVisitor >> visitPragmaNode: aRBNode [
	^MLSNodeLocationPagmaArgument new
]

{ #category : #visiting }
MLSNodeLocationVisitor >> visitReturnNode: aRBNode [
	^MLSNodeLocationReturnValue new
]

{ #category : #visiting }
MLSNodeLocationVisitor >> visitSequenceNode: aRBNode [
	^MLSNodeLocationExpressionValue new
]
