"
I model a collection of methods to be viewed by the user.
"
Class {
	#name : #MLSMethodsSample,
	#superclass : #Object,
	#instVars : [
		'methods'
	],
	#category : #MagicLiteralsSelector
}

{ #category : #'instance creation' }
MLSMethodsSample class >> methods: methods [
	^ self new
		methods: methods;
		yourself
]

{ #category : #'collection compatibility' }
MLSMethodsSample >> collect: aBlock [
	^ self methods collect: aBlock
]

{ #category : #accessing }
MLSMethodsSample >> completionPercentage [
	^ (self methods select: [ :m | m isCompleted ]) size / self methods size
]

{ #category : #'collection compatibility' }
MLSMethodsSample >> detect: aBlock [
	^ self methods detect: aBlock
]

{ #category : #'collection compatibility' }
MLSMethodsSample >> do: aBlock [
	^ self methods do: aBlock
]

{ #category : #initialization }
MLSMethodsSample >> initialize [
	super initialize.
	self methods: OrderedCollection new
]

{ #category : #accessing }
MLSMethodsSample >> methods [
	^ methods
]

{ #category : #accessing }
MLSMethodsSample >> methods: anObject [
	methods := anObject asOrderedCollection
]

{ #category : #'collection compatibility' }
MLSMethodsSample >> reject: aBlock [
	^ self methods reject: aBlock
]

{ #category : #'collection compatibility' }
MLSMethodsSample >> select: aBlock [
	^ self methods select: aBlock
]

{ #category : #'collection compatibility' }
MLSMethodsSample >> size [
	^ self methods size
]
