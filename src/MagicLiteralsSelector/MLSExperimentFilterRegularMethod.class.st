Class {
	#name : #MLSExperimentFilterRegularMethod,
	#superclass : #MLSExperimentFilter,
	#category : #'MagicLiteralsSelector-experiment'
}

{ #category : #visiting }
MLSExperimentFilterRegularMethod >> accept: aMethod [
	^aMethod isTestMethod not
]
