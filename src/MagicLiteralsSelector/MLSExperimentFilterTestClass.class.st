"
Accept methods from test class
"
Class {
	#name : #MLSExperimentFilterTestClass,
	#superclass : #MLSExperimentFilter,
	#category : #'MagicLiteralsSelector-experiment'
}

{ #category : #visiting }
MLSExperimentFilterTestClass >> accept: aMethod [
	^aMethod isTestMethod
]
