"
A batch of methods with literals that answer to some constraints
"
Class {
	#name : #MLSExperimentBatch,
	#superclass : #Object,
	#instVars : [
		'methods',
		'targetSize',
		'literalsToIgnore',
		'longStringSize',
		'percentRedundancy',
		'percentTest',
		'thresholdSpecialLiterals'
	],
	#category : #'MagicLiteralsSelector-experiment'
}

{ #category : #running }
MLSExperimentBatch >> asQuantity: percentage [
	^ percentage / 100 * targetSize

]

{ #category : #accessing }
MLSExperimentBatch >> batchSize: anObject [
	targetSize := anObject
]

{ #category : #'default-settings' }
MLSExperimentBatch >> defaultBatchSize [
	^200
]

{ #category : #'default-settings' }
MLSExperimentBatch >> defaultIgnoredLiterals [
	^ #(-1 0 1 2)
]

{ #category : #'default-settings' }
MLSExperimentBatch >> defaultPercentageRedundantMethods [
	"percentage of methods already part of some other batch"
	^10
]

{ #category : #'default-settings' }
MLSExperimentBatch >> defaultPercentageTestMethods [
	^10
]

{ #category : #'default-settings' }
MLSExperimentBatch >> defaultPercentageThresholdSpecialLiteral [
	"batch should not include more than this percentage of specialLiterals
	 i.e. ignored literals, nil, true, false, array literals, long strings"
	^15
]

{ #category : #'default-settings' }
MLSExperimentBatch >> defaultSizeLongStringLiteral [
	"minimum size (inclusive) for a string to be considered long"
	^3
]

{ #category : #running }
MLSExperimentBatch >> fillInFromSample: methodSample alreadyTreated: methodsTreated [
	[ methods size < (self asQuantity: percentRedundancy) ]
		whileTrue: [ methods add: methodSample atRandom ].

]

{ #category : #accessing }
MLSExperimentBatch >> ignoredLiterals: anObject [
	literalsToIgnore := anObject
]

{ #category : #initialization }
MLSExperimentBatch >> initialize [ 
	super initialize .
	
	targetSize := self defaultBatchSize .
	literalsToIgnore := self defaultIgnoredLiterals .
	longStringSize := self defaultSizeLongStringLiteral .
	percentRedundancy := self defaultPercentageRedundantMethods .
	percentTest := self defaultPercentageTestMethods .
	thresholdSpecialLiterals := self defaultPercentageThresholdSpecialLiteral .

	methods := Set new: targetSize .
]

{ #category : #accessing }
MLSExperimentBatch >> longStringSize: anObject [
	longStringSize := anObject
]

{ #category : #accessing }
MLSExperimentBatch >> percentageRedundancy: anObject [
	percentRedundancy := anObject
]

{ #category : #accessing }
MLSExperimentBatch >> percentageTest: anObject [
	percentTest := anObject
]

{ #category : #accessing }
MLSExperimentBatch >> thresholdSpecialLiterals: anObject [
	thresholdSpecialLiterals := anObject
]
