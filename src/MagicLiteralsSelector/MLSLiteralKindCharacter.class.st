Class {
	#name : #MLSLiteralKindCharacter,
	#superclass : #MLSLiteralKind,
	#category : #'MagicLiteralsSelector-core'
}

{ #category : #'instance creation' }
MLSLiteralKindCharacter class >> tester [
	^#isCharacter
]

{ #category : #converting }
MLSLiteralKindCharacter >> asString [
	^'character'
]
