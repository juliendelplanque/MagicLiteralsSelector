"
A batch of methods with literals that answer to some constraints

This is actually very difficult as the constraints might be conflicting, or the set of methods from which to choose might not itself fulfill the constraints.

Simple example:
- one wants 20% test methods and there is no test
- one wants 20% test methods and no string literal but all tests have string literals in them
"
Class {
	#name : #MLSExperimentBatch,
	#superclass : #MLSMethodsSample,
	#instVars : [
		'targetSize',
		'percentRedundancy',
		'percentTest'
	],
	#category : #'MagicLiteralsSelector-experiment'
}

{ #category : #running }
MLSExperimentBatch >> add: aNumber from: aCollection [
	"adds to the methods of receiver aNumber of elements from aCollection (if possible)"
	| selected remaining |
	(aCollection size < aNumber)
	ifTrue: [ 
		methods addAll: aCollection.
		^aCollection ].

	selected := Set new: aNumber.
	remaining := aCollection copy.
	[ selected size < aNumber ]
		whileTrue: [ |elt |
			elt := remaining atRandom.
			selected add: elt.
			methods add: elt.
			remaining remove: elt
		].
	^selected	

]

{ #category : #converting }
MLSExperimentBatch >> asMethodsSample [
	^MLSMethodsSample methods: self methods
]

{ #category : #converting }
MLSExperimentBatch >> asOrderedCollection [
	"Because receiver's methods are in a Set"
	^self asMethodsSample 
]

{ #category : #running }
MLSExperimentBatch >> asQuantity: percentage [
	^ percentage / 100 * targetSize

]

{ #category : #'collection compatibility' }
MLSExperimentBatch >> at: index [
	methods doWithIndex: [ :elt :i | i = index ifTrue: [ ^elt ] ].
	self errorSubscriptBounds: index
]

{ #category : #'collection compatibility' }
MLSExperimentBatch >> at: index ifAbsent: aBlock [
	methods doWithIndex: [ :elt :i | i = index ifTrue: [ ^elt ] ].
	^aBlock value
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
MLSExperimentBatch >> defaultPercentageRedundantMethods [
	"percentage of methods already part of some other batch"
	^10
]

{ #category : #'default-settings' }
MLSExperimentBatch >> defaultPercentageTestMethods [
	^10
]

{ #category : #running }
MLSExperimentBatch >> fillInFromSample: methodSample alreadyTreated: methodsTreated [
	"adds required amount of redundancy, then required amount of test methods, then fill the rest of the batch"
	| methodsUntreated |
	self add: (self asQuantity: percentRedundancy) from: methodsTreated .

	self add: (self asQuantity: percentTest) from: (methodSample select: #isTestMethod).
	methodsUntreated := methodSample reject: [ :m |
		(methodsTreated includes: m) or: [ methods includes: m ] ].

	self add: (targetSize - methods size) from: methodsUntreated .

]

{ #category : #'collection compatibility' }
MLSExperimentBatch >> indexOf: index ifAbsent: aBlock [
	"receiver's methods being a Set starts to be a pain in the ass"
	self shouldNotImplement 
]

{ #category : #initialization }
MLSExperimentBatch >> initialize [ 
	super initialize .
	
	targetSize := self defaultBatchSize .
	percentRedundancy := self defaultPercentageRedundantMethods .
	percentTest := self defaultPercentageTestMethods .

	methods := Set new: targetSize .
]

{ #category : #accessing }
MLSExperimentBatch >> methods [
	^methods 
]

{ #category : #accessing }
MLSExperimentBatch >> noRedundancy [
	self percentageRedundancy: 0
]

{ #category : #accessing }
MLSExperimentBatch >> percentageRedundancy: anObject [
	percentRedundancy := anObject
]

{ #category : #accessing }
MLSExperimentBatch >> percentageTest: anObject [
	percentTest := anObject
]

{ #category : #printing }
MLSExperimentBatch >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: ': ' ;
		nextPutAll: name
]
