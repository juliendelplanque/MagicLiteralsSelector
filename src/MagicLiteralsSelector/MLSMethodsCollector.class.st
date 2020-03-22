"
Helper class to collect pharo methods from a collection of classes or packages
"
Class {
	#name : #MLSMethodsCollector,
	#superclass : #Object,
	#instVars : [
		'pharoClasses'
	],
	#category : #MagicLiteralsSelector
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
