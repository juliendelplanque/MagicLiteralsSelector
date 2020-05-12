"
Abnstract class for all kinbds of literal: int, float, character, ...
"
Class {
	#name : #MLSLiteralKind,
	#superclass : #Object,
	#category : #'MagicLiteralsSelector-analysis'
}

{ #category : #'instance creation' }
MLSLiteralKind class >> fromValue: aValue [
	^MLSLiteralKindString new
]
