Class {
	#name : #MLSAnalysisMethod,
	#superclass : #Object,
	#instVars : [
		'methodSample',
		'literals',
		'code',
		'sourceCode'
	],
	#category : #'MagicLiteralsSelector-analysis'
}

{ #category : #'accessing - private' }
MLSAnalysisMethod >> compiledMethod [
	^sourceCode
]

{ #category : #accessing }
MLSAnalysisMethod >> literals [
	^ literals
]

{ #category : #accessing }
MLSAnalysisMethod >> literals: aCollection [
	literals := aCollection 
]

{ #category : #'accessing - private' }
MLSAnalysisMethod >> methodSample [
	^ methodSample
]

{ #category : #accessing }
MLSAnalysisMethod >> methodSample: anObject [
	methodSample := anObject
]

{ #category : #accessing }
MLSAnalysisMethod >> sampleName [
	^ self methodSample name
]

{ #category : #accessing }
MLSAnalysisMethod >> sourceCode [ 
	^sourceCode
]

{ #category : #accessing }
MLSAnalysisMethod >> sourceCode: aString [ 
	sourceCode := aString 
]
