Class {
	#name : #MLSStats,
	#superclass : #Object,
	#instVars : [
		'methodsSample',
		'name'
	],
	#category : #MagicLiteralsSelector
}

{ #category : #'instance creation' }
MLSStats class >> desc: aString on: mlsMethods [
	^self new
		desc: aString ;
		methodsSample: mlsMethods ;
		yourself
]

{ #category : #'instance creation' }
MLSStats class >> on: mlsMethods [
	^self new
		methodsSample: mlsMethods
		yourself
]

{ #category : #accessing }
MLSStats >> commentStats [
	|lit noLit|
	lit := methodsSample reject: #isCompleted.
	noLit :=  methodsSample select: #isCompleted.
	^String streamContents: [:str |
		self csvOn: str line: { 'cmt', self desc . 'noCmt' . 'cmt' . 'total' }.
		self csvOn: str line: { 'noLit' . (noLit reject: #hasComment) size . (noLit select: #hasComment) size . noLit size}.
		self csvOn: str line: { 'lit' . (lit reject: #hasComment) size . (lit select: #hasComment) size . lit size}.
		self csvOn: str line: { 'total' . (methodsSample reject: #hasComment) size . (methodsSample select: #hasComment) size . methodsSample size}.
		str
	]
]

{ #category : #accessing }
MLSStats >> csvOn: str line: aCollection [
	str nextPutAll: aCollection first asString.
	aCollection allButFirst do: [:elt | str nextPut: $, ; nextPutAll: elt asString	].
	str nextPut: Character cr
]

{ #category : #'as yet unclassified' }
MLSStats >> desc [
	^name
]

{ #category : #'as yet unclassified' }
MLSStats >> desc: aString [ 
	name := aString
]

{ #category : #accessing }
MLSStats >> methodsSample: mlsSample [
	methodsSample := mlsSample 
]
