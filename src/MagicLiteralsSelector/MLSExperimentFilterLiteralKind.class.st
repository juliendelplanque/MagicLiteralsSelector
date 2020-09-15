"
Given a list of literal kinds (isSymbolLiteral , isCharacterLiteral , ...),
refuses methods that have only this kind of literals
(accepts methods that have at least one literal of an other kind)
"
Class {
	#name : #MLSExperimentFilterLiteralKind,
	#superclass : #MLSExperimentFilter,
	#instVars : [
		'literalKinds'
	],
	#category : #'MagicLiteralsSelector-experiment'
}

{ #category : #visiting }
MLSExperimentFilterLiteralKind >> accept: aMethod [
	^aMethod literalCandidates anySatisfy: [ :candidate |
		literalKinds noneSatisfy: [ :kind | candidate perform: kind]
	]


]

{ #category : #'as yet unclassified' }
MLSExperimentFilterLiteralKind >> initialize [
	super initialize .
	literalKinds := #()
]

{ #category : #accessing }
MLSExperimentFilterLiteralKind >> literalKinds: aCollection [
	literalKinds := aCollection 
]
