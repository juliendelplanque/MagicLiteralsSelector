"
Helper class to collect pharo methods from a collection of classes or packages
"
Class {
	#name : #MLSMethodsCollector,
	#superclass : #Object,
	#instVars : [
		'pharoClasses'
	],
	#category : #'MagicLiteralsSelector-experiment'
}

{ #category : #'instance creation' }
MLSMethodsCollector class >> fromClasses: aCollection [
	^self new
		classes: aCollection ;
		mlsMethods
]

{ #category : #'instance creation' }
MLSMethodsCollector class >> fromPackages: aCollection [
	^self new
		packages: aCollection ;
		mlsMethods
]

{ #category : #'instance creation' }
MLSMethodsCollector class >> sampleFromClasses: aCollection [
	^self new
		classes: aCollection ;
		asMethodsSample
]

{ #category : #'instance creation' }
MLSMethodsCollector class >> sampleFromPackages: aCollection [
	^self new
		packages: aCollection ;
		asMethodsSample
]

{ #category : #converting }
MLSMethodsCollector >> asMethodsSample [
	^MLSMethodsSample methods: self mlsMethods
]

{ #category : #accessing }
MLSMethodsCollector >> classes: aCollection [
	pharoClasses := aCollection 
]

{ #category : #accessing }
MLSMethodsCollector >> mlsMethods [
	^self pharoMethods collect: [ :m | MLSMethod compiledMethod: m ]
]

{ #category : #accessing }
MLSMethodsCollector >> packages: aCollection [
	pharoClasses := aCollection flatCollect: #classes
]

{ #category : #accessing }
MLSMethodsCollector >> pharoMethods [
	^pharoClasses flatCollect: #methods
]
