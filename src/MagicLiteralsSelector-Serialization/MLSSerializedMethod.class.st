Class {
	#name : #MLSSerializedMethod,
	#superclass : #Object,
	#instVars : [
		'methodPackageName',
		'methodClassName',
		'methodSelector',
		'literalCandidates',
		'sourceCode'
	],
	#category : #'MagicLiteralsSelector-Serialization-Core'
}

{ #category : #converting }
MLSSerializedMethod >> asMLSMethod [
	^MLSMethod new
		compiledMethod: (((RPackage organizer packageNamed: methodPackageName) 
									definedClasses detect: [ :c | c name = methodClassName ])
									>> methodSelector ) ;
		literalCandidates: (literalCandidates collect: #asMLSLiteralCandidate)
		
]

{ #category : #accessing }
MLSSerializedMethod >> literalCandidates [
	^ literalCandidates
]

{ #category : #accessing }
MLSSerializedMethod >> literalCandidates: anObject [
	literalCandidates := anObject
]

{ #category : #accessing }
MLSSerializedMethod >> methodClassName [
	^ methodClassName
]

{ #category : #accessing }
MLSSerializedMethod >> methodClassName: anObject [
	methodClassName := anObject
]

{ #category : #accessing }
MLSSerializedMethod >> methodPackageName [
	^ methodPackageName
]

{ #category : #accessing }
MLSSerializedMethod >> methodPackageName: anObject [
	methodPackageName := anObject
]

{ #category : #accessing }
MLSSerializedMethod >> methodSelector [
	^ methodSelector
]

{ #category : #accessing }
MLSSerializedMethod >> methodSelector: anObject [
	methodSelector := anObject
]

{ #category : #accessing }
MLSSerializedMethod >> sourceCode [
	^ sourceCode
]

{ #category : #accessing }
MLSSerializedMethod >> sourceCode: anObject [
	sourceCode := anObject
]
