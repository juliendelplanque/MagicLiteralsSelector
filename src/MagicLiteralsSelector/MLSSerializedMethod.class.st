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
	#category : #'MagicLiteralsSelector-serialization'
}

{ #category : #converting }
MLSSerializedMethod >> asAnalysisMethod [
	| method |
	method := MLSAnalysisMethod new.
	method
		sourceCode: self sourceCode ;
		literals: (literalCandidates collect: [ :l | l asAnalysisLiteralInMethod: method]).
	^method
]

{ #category : #converting }
MLSSerializedMethod >> asExternalMethod [
	^MLSMethodExternal new
		serializedMethod: self ;
		literalCandidates:
			(literalCandidates collect:  [:c |
				c asLiteralCandidateInSourceCode: self sourceCode]) ;
		yourself
		
]

{ #category : #converting }
MLSSerializedMethod >> asMLSMethod [
	^self
		compiledMethodIfFound: [ :compiledMethod |
			MLSMethod new
				compiledMethod: compiledMethod ;
				literalCandidates:
					(literalCandidates collect: [:c |
						c asLiteralCandidateInAST: compiledMethod parseTree]) ;
				yourself
		]
		ifAbsent: [
			MLSMethodExternal new
				serializedMethod: self ;
				literalCandidates:
					(literalCandidates collect:  [:c |
						c asLiteralCandidateInSourceCode: self sourceCode]) ;
				yourself
		].
		
]

{ #category : #converting }
MLSSerializedMethod >> compiledMethodIfFound: foundBlock ifAbsent: absentBlock [
	| pckg clazz |
	pckg := RPackage organizer packageNamed: methodPackageName ifAbsent: [ ^ absentBlock value].
	clazz := pckg definedClasses detect: [ :c | c name = methodClassName ] ifNone: absentBlock.
	^clazz
		compiledMethodAt: methodSelector
		ifPresent: [ :m | foundBlock value: m]
		ifAbsent: absentBlock

]

{ #category : #converting }
MLSSerializedMethod >> fixStonErrors [
	"correct ston issues in CanNotDecide statuses"
	literalCandidates do: #fixStonErrors
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
