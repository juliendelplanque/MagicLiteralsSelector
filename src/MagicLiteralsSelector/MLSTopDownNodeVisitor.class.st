Class {
	#name : #MLSTopDownNodeVisitor,
	#superclass : #RBAbstractBlockVisitor,
	#instVars : [
		'results'
	],
	#category : #MagicLiteralsSelector
}

{ #category : #accessing }
MLSTopDownNodeVisitor >> visit: aNode select: aBooleanBlock [
	results := OrderedCollection new.
	self visitBlock: aBooleanBlock.
	self visitNode: aNode.
	^ results
]

{ #category : #accessing }
MLSTopDownNodeVisitor >> visitNode: aNode [
	(self visitBlock value: aNode)
	ifTrue: [ results add: aNode]
	ifFalse: [ super visitNode: aNode ]
]
