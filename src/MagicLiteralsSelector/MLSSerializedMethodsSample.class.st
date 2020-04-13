"
Serialized version of an MLSMethodsSample

Can save the sample on a file
"
Class {
	#name : #MLSSerializedMethodsSample,
	#superclass : #Object,
	#instVars : [
		'name',
		'methods',
		'pharoVersionString',
		'generationDateAndTime'
	],
	#category : #'MagicLiteralsSelector-serialization'
}

{ #category : #'instance creation' }
MLSSerializedMethodsSample class >> fromSerializedStream: aStream [
	^STON fromStream: aStream
]

{ #category : #converting }
MLSSerializedMethodsSample >> asMethodsSample [
	^MLSMethodsSample new
		name: name ;
		methods: (methods collect: #asMLSMethod) ;
		yourself
]

{ #category : #converting }
MLSSerializedMethodsSample >> asSampleAnalysis [
	^MLSAnalysisMethodSample new
		name: name ;
		methods: (methods collect: #asAnalysisMethod) ;
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
MLSSerializedMethodsSample >> name [
	^ name
]

{ #category : #accessing }
MLSSerializedMethodsSample >> name: anObject [
	name := anObject
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
	| fileReference filename |
	filename := 'mls-',self name,'.ston'.
	fileReference := (FileLocator imageDirectory / filename ) resolve.
	self saveIn: fileReference.
	^ fileReference
]
