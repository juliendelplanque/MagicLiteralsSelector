"
Serialized version of an MLSMethod
Does not contain the AST tree of the method, but source code as text and information to recover the CompiledMethod (package name, class name, selector) in this image if it exists
"
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
	| compiledMethod parseTree |
	[compiledMethod := ((RPackage organizer packageNamed: methodPackageName) 
									definedClasses detect: [ :c | c name = methodClassName ])
									>> methodSelector]
		on: Error
		do: [^self asMLSMethodExternal].
	parseTree := compiledMethod parseTree.
	^MLSMethod new
		compiledMethod: compiledMethod ;
		literalCandidates: (literalCandidates collect: [:c | c asMLSLiteralCandidateInAST: parseTree]) ;
		yourself
		
]

{ #category : #converting }
MLSSerializedMethod >> asMLSMethodExternal [
	^MLSMethodExternal new
		serializedMethod: self ;
		literalCandidates: (literalCandidates collect:  [:c | c asMLSLiteralCandidateInSourceCode: self sourceCode]) ;
		yourself
		
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
