"
Accepts test methods
"
Class {
	#name : #MLSExperimentFilterIsTest,
	#superclass : #MLSExperimentFilter,
	#category : #'MagicLiteralsSelector-experiment'
}

{ #category : #visiting }
MLSExperimentFilterIsTest >> accept: aMethod [
	^aMethod isTestMethod
]
