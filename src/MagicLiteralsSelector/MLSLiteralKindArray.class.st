Class {
	#name : #MLSLiteralKindArray,
	#superclass : #MLSLiteralKind,
	#category : #'MagicLiteralsSelector-core'
}

{ #category : #'instance creation' }
MLSLiteralKindArray class >> tester [
	"dynamic array considered as one literal if it conatins only literals"
	^[:val | val isArray or: [val isDynamicArray]]
]

{ #category : #converting }
MLSLiteralKindArray >> asString [
	^'array'
]
