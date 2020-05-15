"
A literal analysed in one experiment contains the literal, its owning method, its status (magic or not), the project and experimentId where it was analysed
"
Class {
	#name : #MLSAnalysisLiteral,
	#superclass : #Object,
	#instVars : [
		'value',
		'status',
		'kind',
		'commentLength',
		'method',
		'project',
		'experimentId'
	],
	#category : #'MagicLiteralsSelector-analysis'
}

{ #category : #'instance creation' }
MLSAnalysisLiteral class >> fromSerialized: serializedLiteral inMethod: serializedMethod [
	^self new
		fromSerialized: serializedLiteral inMethod: serializedMethod
		yourself
]

{ #category : #accessing }
MLSAnalysisLiteral >> commentLength [
	^ commentLength
]

{ #category : #accessing }
MLSAnalysisLiteral >> experimentId [
	^ experimentId
]

{ #category : #accessing }
MLSAnalysisLiteral >> experimentId: anObject [
	experimentId := anObject
]

{ #category : #accessing }
MLSAnalysisLiteral >> fromSerialized: serializedLiteral inMethod: serializedMethod [
	value := serializedMethod sourceCode
		copyFrom: serializedLiteral startPosition to: serializedLiteral endPosition.
	kind := serializedLiteral kind.
	status := serializedLiteral status.
	commentLength := serializedMethod commentLength.
	method := serializedMethod
		compiledMethodIfFound: #yourself
		ifAbsent: [ MLSMethodExternal fromSerialized: serializedMethod]
]

{ #category : #accessing }
MLSAnalysisLiteral >> kind [ 
	^kind
]

{ #category : #accessing }
MLSAnalysisLiteral >> method [
	^ method
]

{ #category : #printing }
MLSAnalysisLiteral >> printOn: aStream [
		aStream << method name << ' ' << value
]

{ #category : #accessing }
MLSAnalysisLiteral >> project [
	^ project
]

{ #category : #accessing }
MLSAnalysisLiteral >> project: anObject [
	project := anObject
]

{ #category : #accessing }
MLSAnalysisLiteral >> status [
	^ status
]

{ #category : #accessing }
MLSAnalysisLiteral >> value [
	^ value
]
