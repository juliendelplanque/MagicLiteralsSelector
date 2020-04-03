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
		'name',
		'methodsTreated',
		'numberOfBatches',
		'numberFirstBatches',
		'ignoredLiterals',
		'longStringSize',
		'methodFilters',
		'sizeOfBatches'
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
MLSBatchGenerator >> defaultNumberFirstBatches [
	^2
]

{ #category : #settings }
MLSBatchGenerator >> defaultNumberOfBatches [
	^ 10
]

{ #category : #settings }
MLSBatchGenerator >> defaultSizeOfBatches [
	^50
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

{ #category : #initialization }
MLSBatchGenerator >> initialize [ 
	super initialize .

	sizeOfBatches := self defaultSizeOfBatches.
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

{ #category : #accessing }
MLSBatchGenerator >> name [
	^ name
]

{ #category : #accessing }
MLSBatchGenerator >> name: anObject [
	name := anObject
]

{ #category : #running }
MLSBatchGenerator >> newBatch [
	| batch |
	batch := MLSExperimentBatch new
		batchSize: sizeOfBatches ;
		name: (self name , '-' , batches size asString) ;
		yourself.
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

{ #category : #accessing }
MLSBatchGenerator >> sizeOfBatches: anInteger [
	sizeOfBatches := anInteger
]
