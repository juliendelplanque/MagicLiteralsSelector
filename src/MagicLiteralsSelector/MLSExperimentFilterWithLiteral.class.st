"
Accepts methods that have literals (rejects others)
"
Class {
	#name : #MLSExperimentFilterWithLiteral,
	#superclass : #MLSExperimentFilter,
	#category : #'MagicLiteralsSelector-experiment'
}

{ #category : #visiting }
MLSExperimentFilterWithLiteral >> accept: aMethod [
	^aMethod hasLiterals
]
