"
I model a method to be presented to the user for checking literals.
"
Class {
	#name : #MLSMethod,
	#superclass : #Object,
	#instVars : [
		'compiledMethod',
		'literalsCandidates',
		'anyLiteralCandidateStatusChangedBlock'
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

{ #category : #private }
MLSMethod >> gatherLiteralsCandidates [
	^ literalsCandidates := self compiledMethod parseTree allChildren
		select: [ :n | n class = RBLiteralValueNode ]
		thenCollect: [ :n | 
			(MLSLiteralCandidate astNode: n)
				whenStatusChangedDo: [ :literalCandidate | anyLiteralCandidateStatusChangedBlock cull: literalCandidate ];
				yourself ]
]

{ #category : #initialization }
MLSMethod >> initialize [
	super initialize.
	anyLiteralCandidateStatusChangedBlock := [ :literalCandidate | ]
]

{ #category : #testing }
MLSMethod >> isCompleted [
	^ self literalsCandidates noneSatisfy: [ :candidate |
		candidate status isUnknown ]
]

{ #category : #api }
MLSMethod >> literalsCandidates [
	^ literalsCandidates ifNil: [ literalsCandidates := self gatherLiteralsCandidates ]
]

{ #category : #accessing }
MLSMethod >> methodClass [
	^ self compiledMethod methodClass
]

{ #category : #accessing }
MLSMethod >> sourceCode [
	^ self compiledMethod sourceCode
]

{ #category : #api }
MLSMethod >> whenAnyLiteralCandidateStatusChangedDo: aBlock [
	anyLiteralCandidateStatusChangedBlock := aBlock
]
