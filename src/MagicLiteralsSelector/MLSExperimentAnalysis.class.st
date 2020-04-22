Class {
	#name : #MLSExperimentAnalysis,
	#superclass : #Object,
	#instVars : [
		'samples'
	],
	#category : #'MagicLiteralsSelector-analysis'
}

{ #category : #'instance creation' }
MLSExperimentAnalysis class >> fromDirectory: aName [
	^self new fromDirectory: aName
]

{ #category : #'instance creation' }
MLSExperimentAnalysis >> fromDirectory: aName [
	| directory |
	directory := aName asFileReference.
	directory exists ifFalse: [ ^ nil ].
	directory isDirectory  ifFalse: [ ^ nil ].
	samples := (directory entries
		select: [ :e | e basename endsWith: '.ston' ]
		thenCollect: [ :e | MLSAnalysisMethodSample fromFileReference: e ])
	
	
	
]

{ #category : #'instance creation' }
MLSExperimentAnalysis >> fromSamples: aSampleCollection [
	samples := aSampleCollection collect: #asSampleAnalysis
]
