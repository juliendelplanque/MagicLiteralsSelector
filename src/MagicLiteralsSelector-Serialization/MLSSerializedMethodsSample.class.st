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
