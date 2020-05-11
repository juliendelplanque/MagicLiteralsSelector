Class {
	#name : #MLSLiteralKind,
	#superclass : #Object,
	#category : #'MagicLiteralsSelector-analysis'
}

{ #category : #'instance creation' }
MLSLiteralKind class >> fromValue: aValue [
	^MLSLiteralKindString new
]
