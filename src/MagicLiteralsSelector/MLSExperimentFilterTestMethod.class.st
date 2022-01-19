"
Accepts test methods
"
Class {
	#name : #MLSExperimentFilterTestMethod,
	#superclass : #MLSExperimentFilter,
	#category : #'MagicLiteralsSelector-experiment'
}

{ #category : #visiting }
MLSExperimentFilterTestMethod >> accept: aMethod [
	^aMethod isTestMethod
]
