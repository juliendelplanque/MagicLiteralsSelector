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

{ #category : #accessing }
MLSMethodsSample >> completionPercentage [
	^ (self methods select: [ :m | m isCompleted ]) size / self methods size
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
