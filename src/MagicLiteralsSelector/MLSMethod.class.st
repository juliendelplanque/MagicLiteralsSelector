"
I model a method to be presented to the user for checking literals.
"
Class {
	#name : #MLSMethod,
	#superclass : #Object,
	#instVars : [
		'compiledMethod'
	],
	#category : #MagicLiteralsSelector
}

{ #category : #'instance creation' }
MLSMethod class >> compiledMethod: aCompiledMethod [
	^ self new
		compiledMethod: aCompiledMethod;
		yourself
]

{ #category : #accessing }
MLSMethod >> compiledMethod [
	^ compiledMethod
]

{ #category : #accessing }
MLSMethod >> compiledMethod: anObject [
	compiledMethod := anObject
]

{ #category : #testing }
MLSMethod >> isCompleted [
	^ self literalsCandidates noneSatisfy: [ :candidate |
		candidate status isUnknown ]
]

{ #category : #api }
MLSMethod >> literalsCandidates [
	^ self compiledMethod parseTree allChildren
		select: [ :n | n class = RBLiteralValueNode ]
		thenCollect: [ :n | MLSLiteralCandidate astNode: n ]
]

{ #category : #accessing }
MLSMethod >> methodClass [
	^ self compiledMethod methodClass
]

{ #category : #accessing }
MLSMethod >> sourceCode [
	^ self compiledMethod sourceCode
]
