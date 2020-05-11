"
Fallback solution to represent a MLSMethod that was exported from another image and could not be found in the current image
"
Class {
	#name : #MLSMethodExternal,
	#superclass : #Object,
	#instVars : [
		'methodClass',
		'methodSelector'
	],
	#classInstVars : [
		'instances'
	],
	#category : #'MagicLiteralsSelector-analysis'
}

{ #category : #'instance creation' }
MLSMethodExternal class >> fromSerialized: aSerializedMethod [
	^instances
		at: (aSerializedMethod methodClassName / aSerializedMethod methodSelector)
		ifAbsentPut: [self new
			fromSerialized: aSerializedMethod ;
			yourself]
]

{ #category : #'class initialization' }
MLSMethodExternal class >> initialize [ 
	super initialize.
	self resetInstances 
]

{ #category : #initialization }
MLSMethodExternal class >> resetInstances [
	instances := Dictionary new
]

{ #category : #displaying }
MLSMethodExternal >> displayStringOn: aStream [
	^self printOn: aStream
]

{ #category : #'instance creation' }
MLSMethodExternal >> fromSerialized: aSerializedMethod [
	methodClass := aSerializedMethod methodClassName.
	methodSelector := aSerializedMethod methodSelector
]

{ #category : #testing }
MLSMethodExternal >> isTestMethod [
	^ (methodSelector beginsWith: 'test') and:
		[methodClass endsWith: 'Test']
]

{ #category : #accessing }
MLSMethodExternal >> methodClass [
	^ methodClass
]

{ #category : #displaying }
MLSMethodExternal >> printOn: aStream [
	^aStream
		nextPut: $_ ;
		nextPutAll: methodClass ;
		nextPutAll: '_>>_#' ;
		nextPutAll: methodSelector ;
		nextPut: $_
]
