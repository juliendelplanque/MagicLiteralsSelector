Class {
	#name : #MLSLiteralKindInteger,
	#superclass : #MLSLiteralKind,
	#category : #'MagicLiteralsSelector-core'
}

{ #category : #'instance creation' }
MLSLiteralKindInteger class >> tester [
	^#isInteger 
]

{ #category : #converting }
MLSLiteralKindInteger >> asString [
	^'integer'
]
