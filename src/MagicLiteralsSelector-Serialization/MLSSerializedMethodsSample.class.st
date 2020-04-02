Class {
	#name : #MLSSerializedMethodsSample,
	#superclass : #Object,
	#instVars : [
		'methods',
		'pharoVersionString',
		'generationDateAndTime'
	],
	#category : #'MagicLiteralsSelector-Serialization-Core'
}

{ #category : #converting }
MLSSerializedMethodsSample >> asMethodsSample [
	^MLSMethodsSample new
		methods: (methods collect: #asMLSMethod) ;
		yourself
]

{ #category : #accessing }
MLSSerializedMethodsSample >> generationDateAndTime [
	^ generationDateAndTime
]

{ #category : #accessing }
MLSSerializedMethodsSample >> generationDateAndTime: anObject [
	generationDateAndTime := anObject
]

{ #category : #accessing }
MLSSerializedMethodsSample >> methods [
	^ methods
]

{ #category : #accessing }
MLSSerializedMethodsSample >> methods: anObject [
	methods := anObject
]

{ #category : #accessing }
MLSSerializedMethodsSample >> pharoVersionString [
	^ pharoVersionString
]

{ #category : #accessing }
MLSSerializedMethodsSample >> pharoVersionString: anObject [
	pharoVersionString := anObject
]

{ #category : #saving }
MLSSerializedMethodsSample >> saveIn: anObject [
	"Saves myself on anObject (that understands #asFileReference) encoded via STON format."
	anObject asFileReference writeStreamDo: [ :stream |
		STON put: self onStream: stream ]
]

{ #category : #saving }
MLSSerializedMethodsSample >> saveInImageDirectory [
	| fileReference |
	fileReference := (FileLocator imageDirectory / 'magic-literals.1.ston') nextVersion.
	self saveIn: fileReference.
	^ fileReference
]
