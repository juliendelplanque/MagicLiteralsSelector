Class {
	#name : #MLSAnalysisMethod,
	#superclass : #Object,
	#instVars : [
		'methodSample',
		'literals',
		'code'
	],
	#category : #'MagicLiteralsSelector-analysis'
}

{ #category : #accessing }
MLSAnalysisMethod >> code [
	^ code
]

{ #category : #accessing }
MLSAnalysisMethod >> code: anObject [
	code := anObject
]

{ #category : #accessing }
MLSAnalysisMethod >> literals [
	^ literals
]

{ #category : #accessing }
MLSAnalysisMethod >> literals: anObject [
	literals := anObject
]

{ #category : #accessing }
MLSAnalysisMethod >> methodSample [
	^ methodSample
]

{ #category : #accessing }
MLSAnalysisMethod >> methodSample: anObject [
	methodSample := anObject
]
