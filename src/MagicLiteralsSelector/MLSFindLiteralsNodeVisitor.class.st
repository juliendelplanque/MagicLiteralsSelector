Class {
	#name : #MLSFindLiteralsNodeVisitor,
	#superclass : #RBGenericNodeVisitor,
	#instVars : [
		'results'
	],
	#category : #MagicLiteralsSelector
}

{ #category : #visiting }
MLSFindLiteralsNodeVisitor class >> visit: aNode [
	^self visit: aNode select: [ :node | node isLiteralNode ].
]

{ #category : #visiting }
MLSFindLiteralsNodeVisitor >> visitLiteralArrayNode: aRBLiteralArrayNode [
	"this is a literal and we don ́t need to visit its children"
]
