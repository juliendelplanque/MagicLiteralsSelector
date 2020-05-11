Class {
	#name : #MLSAnalysisLiteral,
	#superclass : #Object,
	#instVars : [
		'value',
		'status',
		'kind',
		'method',
		'project',
		'expert',
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
MLSAnalysisLiteral >> experimentId [
	^ experimentId
]

{ #category : #accessing }
MLSAnalysisLiteral >> experimentId: anObject [
	experimentId := anObject
]

{ #category : #accessing }
MLSAnalysisLiteral >> expert [
	^ expert
]

{ #category : #accessing }
MLSAnalysisLiteral >> expert: anObject [
	expert := anObject
]

{ #category : #accessing }
MLSAnalysisLiteral >> fromSerialized: serializedLiteral inMethod: serializedMethod [
	value := serializedMethod sourceCode
		copyFrom: serializedLiteral startPosition to: serializedLiteral endPosition.
	status := serializedLiteral status.
	kind := MLSLiteralKind fromValue: value.
	method := serializedMethod
		compiledMethodIfFound: #yourself
		ifAbsent: [ MLSMethodExternal fromSerialized: serializedMethod]
]

{ #category : #accessing }
MLSAnalysisLiteral >> method [
	^ method
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
