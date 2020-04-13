Class {
	#name : #MLSExperimentAnalysis,
	#superclass : #Object,
	#instVars : [
		'samples'
	],
	#category : #'MagicLiteralsSelector-analysis'
}

{ #category : #'instance creation' }
MLSExperimentAnalysis >> from: aSampleCollection [
	samples := aSampleCollection collect: #asSampleAnalysis
]
