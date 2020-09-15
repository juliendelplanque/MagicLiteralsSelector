"
Abnstract class for all kinbds of literal: int, float, character, ...
"
Class {
	#name : #MLSLiteralKind,
	#superclass : #Object,
	#category : #'MagicLiteralsSelector-core'
}

{ #category : #'instance creation' }
MLSLiteralKind class >> fromMLSLiteral: aLiteral [
	^self fromValue: aLiteral value
]

{ #category : #'instance creation' }
MLSLiteralKind class >> fromValue: aValue [
	^(self subclasses
		detect: [ :c | c tester value: aValue ]
		ifNone: [ self ])
		new
]

{ #category : #'instance creation' }
MLSLiteralKind class >> tester [
	self subclassResponsibility 
]

{ #category : #converting }
MLSLiteralKind >> asString [
	^'unknownKind'
]
