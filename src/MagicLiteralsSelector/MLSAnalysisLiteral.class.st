Class {
	#name : #MLSAnalysisLiteral,
	#superclass : #Object,
	#instVars : [
		'value',
		'status',
		'method'
	],
	#category : #'MagicLiteralsSelector-analysis'
}

{ #category : #accessing }
MLSAnalysisLiteral >> method [
	^ method
]

{ #category : #accessing }
MLSAnalysisLiteral >> method: anObject [
	method := anObject
]

{ #category : #accessing }
MLSAnalysisLiteral >> status [
	^ status
]

{ #category : #accessing }
MLSAnalysisLiteral >> status: anObject [
	status := anObject
]

{ #category : #accessing }
MLSAnalysisLiteral >> value [
	^ value
]

{ #category : #accessing }
MLSAnalysisLiteral >> value: anObject [
	value := anObject
]
