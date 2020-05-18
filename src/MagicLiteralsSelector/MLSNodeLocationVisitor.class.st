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
	^aSymbol asString allSatisfy: [:c | '+-*/&=>|<~@' includes: c]
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
