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
MLSRawStats >> hasKindSelector: kind [
	^({'bool' -> #hasBooleanLiteral . 'char' -> #hasCharacterLiteral . 'float' -> #hasFloatLiteral . 'int' -> #hasIntegerLiteral . 'nil' -> #hasNilLiteral . 'string' -> #hasStringLiteral . 'symb' -> #hasSymbolLiteral}
		detect: [ :e | e key = kind ]) value

]

{ #category : #private }
MLSRawStats >> isKindSelector: kind [
	^({'bool' -> #isBooleanLiteral . 'char' -> #isCharacterLiteral . 'float' -> #isFloatLiteral . 'int' -> #isIntegerLiteral . 'nil' -> #isNilLiteral . 'string' -> #isStringLiteral . 'symb' -> #isSymbolLiteral}
		detect: [ :e | e key = kind ]) value

]

{ #category : #private }
MLSRawStats >> literalKinds [
	^#('bool' 'char' 'float' 'int' 'nil' 'string' 'symb')
]

{ #category : #api }
MLSRawStats >> methodAvgLiteralByKindStats [
	| allLit nbMth |
	nbMth := methodsSample size.
	allLit := methodsSample methods flatCollect: #literalCandidates.

	^String streamContents: [:str |
		self csvOn: str line: { 'kind', self desc . 'avg Number' }.
		self csvOn: str line: { 'all' . self roundedPercent: ((allLit size) / nbMth) }.
		self literalKinds do: [ :kind || nb |
			nb := (allLit select: (self isKindSelector: kind)) size.
			self
				csvOn: str  line: { kind . self roundedPercent: nb / nbMth }.
		].
		str
	]
]

{ #category : #accessing }
MLSRawStats >> methodsSample [
	^ methodsSample
]

{ #category : #accessing }
MLSRawStats >> methodsSample: mlsSample [
	methodsSample := mlsSample 
]

{ #category : #api }
MLSRawStats >> nbMethByKindStats [
	|lit nbLit |
	lit := methodsSample reject: #isCompleted.
	nbLit := lit size.
	^String streamContents: [:str |
		self csvOn: str line: { 'class', self desc . '#' . '%' }.
		self literalKinds do: [ :kind |
			self
				csvOn: str class: kind
				number: (lit select: (self hasKindSelector: kind)) size
				over: nbLit.
		].
		str
	]
]

{ #category : #private }
MLSRawStats >> percentageOf: kind status: status [
	| allOfKind  allOfStatus |
	allOfKind := (methodsSample flatCollect: #literalCandidates) select: kind value.
	allOfStatus := allOfKind select: #status.
	^self roundedPercent: allOfStatus / allOfKind
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

{ #category : #private }
MLSRawStats >> roundedPercent: frac [
	^frac * 100 asFloat roundTo: 0.1
]
