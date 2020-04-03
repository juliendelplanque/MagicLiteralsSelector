"
Fallback solution to represent a MLSMethod that was exported from another image and could not be found in the current image
"
Class {
	#name : #MLSMethodExternal,
	#superclass : #MLSMethod,
	#instVars : [
		'serializedMethod'
	],
	#category : #'MagicLiteralsSelector-Serialization-Core'
}

{ #category : #displaying }
MLSMethodExternal >> displayStringOn: aStream [
	^self printOn: aStream
]

{ #category : #testing }
MLSMethodExternal >> isTestMethod [
	^ (serializedMethod methodSelector beginsWith: 'test') and:
		[serializedMethod methodClassName endsWith: 'Test']
]

{ #category : #accessing }
MLSMethodExternal >> methodClass [
	^ serializedMethod methodClassName
]

{ #category : #displaying }
MLSMethodExternal >> printOn: aStream [
	^aStream
		nextPut: $_ ;
		nextPutAll: serializedMethod methodClassName ;
		nextPutAll: '_>>_#' ;
		nextPutAll: serializedMethod methodSelector ;
		nextPut: $_
]

{ #category : #accessing }
MLSMethodExternal >> serializedMethod: anObject [
	serializedMethod := anObject
]

{ #category : #accessing }
MLSMethodExternal >> sourceCode [
	^ serializedMethod sourceCode
]
