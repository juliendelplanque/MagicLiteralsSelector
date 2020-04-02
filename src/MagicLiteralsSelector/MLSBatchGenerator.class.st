"
A class to generate batches of methods containing literals 

Example of use:
  MLSBatchGenerator new
	methodSample: (MLSMethodsCollector sampleFromClasses: { Object }) ;
	generate ;
	batches.
"
Class {
	#name : #MLSBatchGenerator,
	#superclass : #Object,
	#instVars : [
		'methodSample',
		'batches',
		'methodsTreated',
		'numberOfBatches',
		'numberFirstBatches',
		'ignoredLiterals',
		'longStringSize',
		'methodFilters'
	],
	#category : #'MagicLiteralsSelector-experiment'
}

{ #category : #examples }
MLSBatchGenerator class >> example [
	<example>
	^MLSBatchGenerator new
		methodSample: (MLSMethodsCollector sampleFromClasses: { Object }) ;
		generate ;
		inspect.

]

{ #category : #accessing }
MLSBatchGenerator >> batches [ 
	^batches 
]

{ #category : #settings }
MLSBatchGenerator >> defaultIgnoredLiterals [
	^ #(-1 0 1 2)
]

{ #category : #settings }
MLSBatchGenerator >> defaultLongStringSize [
	^3
]

{ #category : #settings }
MLSBatchGenerator >> defaultNumberFirstBatches [
	^2
]

{ #category : #settings }
MLSBatchGenerator >> defaultNumberOfBatches [
	^ 10
]

{ #category : #running }
MLSBatchGenerator >> fillBatch: aBatch [
	aBatch fillInFromSample: methodSample alreadyTreated: methodsTreated .
	methodsTreated addAll: aBatch methods
]

{ #category : #running }
MLSBatchGenerator >> filterSample: methodsSample [
	^methodsSample select: [ :meth |
		methodFilters allSatisfy: [ :filter | filter accept: meth ]
	]
]

{ #category : #running }
MLSBatchGenerator >> generate [
	[ batches size < numberFirstBatches ]
		whileTrue: [
			self fillBatch: (self newBatch noRedundancy ; yourself) ].
	[ batches size < numberOfBatches ]
		whileTrue: [ self fillBatch: self newBatch 	].
]

{ #category : #accessing }
MLSBatchGenerator >> ignoredLiterals: anObject [
	ignoredLiterals := anObject
]

{ #category : #initialization }
MLSBatchGenerator >> initialize [ 
	super initialize .

	ignoredLiterals := self defaultIgnoredLiterals .
	longStringSize := self defaultLongStringSize .
	numberOfBatches := self defaultNumberOfBatches .
	numberFirstBatches := self defaultNumberFirstBatches .
	methodFilters := {
		MLSExperimentFilterWithLiteral new . 
		MLSExperimentFilterLiteralKind new
			literalKinds: #( isSymbolLiteral isStringLiteral isBooleanLiteral) ;
			yourself
	}

]

{ #category : #accessing }
MLSBatchGenerator >> longStringSize: anObject [
	longStringSize := anObject
]

{ #category : #accessing }
MLSBatchGenerator >> methodFilters [
	^ methodFilters
]

{ #category : #accessing }
MLSBatchGenerator >> methodFilters: anObject [
	methodFilters := anObject
]

{ #category : #accessing }
MLSBatchGenerator >> methodSample: aSample [
	methodSample := (self filterSample: aSample) asOrderedCollection.
	self reset
]

{ #category : #accessing }
MLSBatchGenerator >> methodsTreated [
	^ methodsTreated
]

{ #category : #running }
MLSBatchGenerator >> newBatch [
	| batch |
	batch := MLSExperimentBatch new.
	batches add: batch.
	^ batch

]

{ #category : #accessing }
MLSBatchGenerator >> numberFirstBatches: anObject [
	numberFirstBatches := anObject
]

{ #category : #accessing }
MLSBatchGenerator >> numberOfBatches: anObject [
	numberOfBatches := anObject
]

{ #category : #initialization }
MLSBatchGenerator >> reset [
	batches := numberOfBatches ifNil: [ OrderedCollection new ] ifNotNil: [ OrderedCollection new: numberOfBatches ] .
	methodsTreated := methodSample ifNil: [ Set new ] ifNotNil: [ Set new: methodSample size ]
]
