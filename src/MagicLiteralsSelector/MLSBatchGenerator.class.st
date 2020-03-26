"
A class to generate batches of methods containing literals 

Initialize with:
  #methodSample: aCollectionOfMLSMethods
"
Class {
	#name : #MLSBatchGenerator,
	#superclass : #Object,
	#instVars : [
		'methodSample',
		'batches',
		'methodsBatched'
	],
	#category : #'MagicLiteralsSelector-experiment'
}

{ #category : #'private - utilities' }
MLSBatchGenerator >> asQuantity: aPercentage [
	^ aPercentage / 100 * self batchSize
]

{ #category : #run }
MLSBatchGenerator >> batches [
	self firstBatches.
	[ methodSample size > methodsBatched size ]
		whileTrue: [ self batchesWithRedundancy ].
]

{ #category : #run }
MLSBatchGenerator >> batchesWithRedundancy [
	| batch |
	batch := Set new: self batchSize .
	[ batch size >= (self asQuantity: self percentageRedundantMethods) ]
		whileFalse: [ batch add: methodsBatched atRandom ].
	^self completeBatchNoRedundancy: batch
]

{ #category : #run }
MLSBatchGenerator >> completeBatchNoRedundancy: aBatch [
	[ (aBatch collect: #isTest) size >= (self asQuantity: self percentageTestMethods) ]
]

{ #category : #run }
MLSBatchGenerator >> firstBatches [
	"generates some batches without looking at redundancy (which does not mean there will not be some)"
	self numberFirstBatches timesRepeat: [
		self newBatch 
				percentageRedundancy: 0 ;
				fillInFromSample: methodSample alreadyTreated: methodsBatched 
	]

]

{ #category : #accessing }
MLSBatchGenerator >> methodSample: aSample [
	methodSample := aSample.
	self reset
]

{ #category : #run }
MLSBatchGenerator >> newBatch [
	| batch |
	batch := MLSExperimentBatch new.
	batches add: batch.
	^ batch

]

{ #category : #settings }
MLSBatchGenerator >> numberFirstBatches [
	^2
]

{ #category : #initialization }
MLSBatchGenerator >> reset [
	batches := OrderedCollection new.
	methodsBatched := methodSample ifNil: [ Set new ] ifNotNil: [ Set new: methodSample size ]
]
