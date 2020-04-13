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

{ #category : #'accessing - private' }
MLSAnalysisMethod >> compiledMethod [
	^code
]

{ #category : #accessing }
MLSAnalysisMethod >> literals [
	^ literals
]

{ #category : #accessing }
MLSAnalysisMethod >> literals: aCollection [
	literals := aCollection 
]

{ #category : #accessing }
MLSAnalysisMethod >> methodSample [
	^ methodSample
]

{ #category : #accessing }
MLSAnalysisMethod >> methodSample: anObject [
	methodSample := anObject
]

{ #category : #accessing }
MLSAnalysisMethod >> sourceCode [ 
	^self compiledMethod sourceCode
]
