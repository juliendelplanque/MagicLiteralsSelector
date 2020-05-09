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
MLSAnalysisLiteral class >> fromSerialized: serializedLiteral project: projectName expert: expertName id: anInt [
	^self new
		fromSerialized: serializedLiteral ;
		project: projectName ;
		expert: expertName ;
		experimentId: anInt ;
		yourself
]

{ #category : #'instance creation' }
MLSAnalysisLiteral class >> fromSerialized: serializedLiteral project: projectName id: anInt [
	^self new
		fromSerialized: serializedLiteral ;
		project: projectName ;
		experimentId: anInt ;
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
MLSAnalysisLiteral >> fromSerialized: serializedLiteral [
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
