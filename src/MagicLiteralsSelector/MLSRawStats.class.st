"
Helper class to generate statistics from methods

#methodsSample:
  Collection of methods (or MLSMethodsSample) to work on
#desc:
  A short descirption (name) to identify the method Sample in the stats

#commentStats
  Some stats on methods having comments or not
#classStats
  Some stats on methods having literals of different classes (integer, boolean, string, ...)
"
Class {
	#name : #MLSRawStats,
	#superclass : #Object,
	#instVars : [
		'methodsSample',
		'name'
	],
	#category : #'MagicLiteralsSelector-analysis'
}

{ #category : #'instance creation' }
MLSRawStats class >> desc: aString on: mlsMethods [
	^self new
		desc: aString ;
		methodsSample: mlsMethods ;
		yourself
]

{ #category : #'instance creation' }
MLSRawStats class >> on: mlsMethods [
	^self new
		methodsSample: mlsMethods
		yourself
]

{ #category : #api }
MLSRawStats >> classStats [
	|lit nbLit |
	lit := methodsSample reject: #isCompleted.
	nbLit := lit size.
	^String streamContents: [:str |
		self csvOn: str line: { 'class', self desc . '#' . '%' }.
		self csvOn: str class: 'int'   number: (lit select: #hasIntegerLiteral) size over: nbLit.
		self csvOn: str class: 'string' number: (lit select: #hasStringLiteral) size over: nbLit.
		self csvOn: str class: 'bool'  number: (lit select: #hasBooleanLiteral) size over: nbLit.
		self csvOn: str class: 'char'  number: (lit select: #hasCharacterLiteral) size over: nbLit.
		self csvOn: str class: 'float' number: (lit select: #hasFloatLiteral) size over: nbLit.
		self csvOn: str class: 'nil'   number: (lit select: #hasNilLiteral) size over: nbLit.
		str
	]
]

{ #category : #api }
MLSRawStats >> commentStats [
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

{ #category : #private }
MLSRawStats >> csvOn: str class: aString number: anInt over: total [
	self csvOn: str line: { aString . anInt . (anInt / total * 100) roundTo: 0.1 }
]

{ #category : #private }
MLSRawStats >> csvOn: str line: aCollection [
	str nextPutAll: aCollection first asString.
	aCollection allButFirst do: [:elt | str nextPut: $, ; nextPutAll: elt asString	].
	str nextPut: Character cr
]

{ #category : #accessing }
MLSRawStats >> desc [
	^name
]

{ #category : #accessing }
MLSRawStats >> desc: aString [ 
	name := aString
]

{ #category : #private }
MLSRawStats >> literalKinds [
	^#(isBooleanLiteral isCharacterLiteral isFloatLiteral isIntegerLiteral isNilLiteral isStringLiteral isSymbolLiteral)
]

{ #category : #accessing }
MLSRawStats >> methodsSample [
	^ methodsSample
]

{ #category : #accessing }
MLSRawStats >> methodsSample: mlsSample [
	methodsSample := mlsSample 
]

{ #category : #private }
MLSRawStats >> percentageOf: kind status: status [
	| allOfKind  allOfStatus |
	allOfKind := (methodsSample flatCollect: #literalCandidates) select: kind.
	allOfStatus := allOfKind select: #status.
	^allOfStatus / allOfKind * 100 asFloat roundTo: 0.1
]

{ #category : #api }
MLSRawStats >> postXPStats: samples [
	| allKinds |
	allKinds := self literalKinds.
	^String streamContents: [:str |
		self csvOn: str line: { 'Sample' } , allKinds.
		samples do: [ :sample |
			self csvOn: str line: { 
				sample name .
				allKinds collect: [ :kind | self percentageOf: kind status: #isMagic ]
			}
		]
	]
]
