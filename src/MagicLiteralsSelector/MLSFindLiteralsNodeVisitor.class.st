"
I am a visitor to extract literals from a parse tree

call: 
  MLSFindLiteralsNodeVisitor visit: a-parse-tree

will return the list of all literal nodes found
"
Class {
	#name : #MLSFindLiteralsNodeVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'results'
	],
	#category : #'MagicLiteralsSelector-core'
}

{ #category : #visiting }
MLSFindLiteralsNodeVisitor class >> visit: aNode [
	^self new
		visitNode: aNode ;
		results
]

{ #category : #initialization }
MLSFindLiteralsNodeVisitor >> initialize [ 
	super initialize.
	results := OrderedCollection new
]

{ #category : #accessing }
MLSFindLiteralsNodeVisitor >> results [
	^results
]

{ #category : #visiting }
MLSFindLiteralsNodeVisitor >> visitArrayNode: anArrayNode [
	"if array contains one non literal, it is not a literal itself and therefore continue normal visit
	 else, it is considered as only one literal (i.e. ignore its children)"
	| notLiteral |
	notLiteral := RBGenericNodeVisitor
						visit: anArrayNode
						detect: [ :each | each isLiteralNode not ]
						ifNone: [ nil ].
	(notLiteral == anArrayNode)
	ifTrue: [results add: anArrayNode] 
	ifFalse: [ super visitArrayNode: anArrayNode ]
	
]

{ #category : #visiting }
MLSFindLiteralsNodeVisitor >> visitLiteralArrayNode: aRBLiteralArrayNode [
	"this is a literal and we don't need to visit its children"

]

{ #category : #visiting }
MLSFindLiteralsNodeVisitor >> visitNode: aNode [
	aNode acceptVisitor: self.
	aNode isLiteralNode
	ifTrue: [ results add: aNode ]
]
