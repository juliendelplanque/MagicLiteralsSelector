Class {
	#name : #MLSLiteralKindBoolean,
	#superclass : #MLSLiteralKind,
	#category : #'MagicLiteralsSelector-core'
}

{ #category : #'instance creation' }
MLSLiteralKindBoolean class >> tester [
	^[:val | (val = true) or: [ val = false ] ]
]

{ #category : #converting }
MLSLiteralKindBoolean >> asString [
	^'boolean'
]
