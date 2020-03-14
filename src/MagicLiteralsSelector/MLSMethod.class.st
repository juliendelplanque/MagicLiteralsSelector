"
I model a method to be presented to the user for checking literals.

I wrap a compiled method available in the system and provide additional state such as the list of literal candidates.

I allow one to be notified when the status of any of my literal candidate is updated via #whenAnyLiteralCandidateStatusChangedDo: method.
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
	^ literalsCandidates := self gatherRBLiteralsNodes
		collect: [ :n | 
			(MLSLiteralCandidate astNode: n)
				whenStatusChangedDo: [ :literalCandidate | anyLiteralCandidateStatusChangedBlock cull: self cull: literalCandidate ];
				yourself ]
]

{ #category : #private }
MLSMethod >> gatherRBLiteralsNodes [
	^ MLSTopDownNodeVisitor new visit: (compiledMethod parseTree) select: [ :node | node isLiteralNode ].
]

{ #category : #initialization }
MLSMethod >> initialize [
	super initialize.
	anyLiteralCandidateStatusChangedBlock := [ :method :literalCandidate | ]
]

{ #category : #testing }
MLSMethod >> isCompleted [
	^ self literalsCandidates noneSatisfy: [ :candidate |
		candidate status isUnknown ]
]

{ #category : #testing }
MLSMethod >> isTestMethod [
	^ self compiledMethod isTestMethod
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
