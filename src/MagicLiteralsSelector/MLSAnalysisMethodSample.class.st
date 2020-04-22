Class {
	#name : #MLSAnalysisMethodSample,
	#superclass : #Object,
	#instVars : [
		'methods',
		'name'
	],
	#category : #'MagicLiteralsSelector-analysis'
}

{ #category : #'instance creation' }
MLSAnalysisMethodSample class >> fromFileReference: aFileRef [
	^ aFileRef readStreamDo: [ :s |
		(MLSSerializedMethodsSample fromSerializedStream: s)
			name: (aFileRef basename copyUpTo: $.) ;
			asSampleAnalysis
	]
]

{ #category : #accessing }
MLSAnalysisMethodSample >> methods [
	^ methods
]

{ #category : #accessing }
MLSAnalysisMethodSample >> methods: anObject [
	methods := anObject
]

{ #category : #accessing }
MLSAnalysisMethodSample >> name [
	^ name
]

{ #category : #accessing }
MLSAnalysisMethodSample >> name: anObject [
	name := anObject
]
