Class {
	#name : #MLSAnalysisLiteralTest,
	#superclass : #TestCase,
	#category : #'MagicLiteralsSelector-Tests-core'
}

{ #category : #helpers }
MLSAnalysisLiteralTest >> attributes: attributesValues valueAt: key default: defaultBlock [
	^attributesValues
		detect: [ :attrVal | attrVal key = key ]
		ifOne: [ :attrVal | attrVal value ]
		ifNone: defaultBlock
]

{ #category : #helpers }
MLSAnalysisLiteralTest >> mock: aMock kind: attributesValues [
	aMock stub method
		willReturn: (self 
			attributes: attributesValues 
			valueAt: #kind 
			default: [MLSLiteralKindInteger new])
]

{ #category : #helpers }
MLSAnalysisLiteralTest >> mock: aMock method: attributesValues [  
	aMock stub method
		willReturn: (self 
			attributes: attributesValues 
			valueAt: #method 
			default: [MLSAbstractTest >> #manyLiterals])
]

{ #category : #helpers }
MLSAnalysisLiteralTest >> mock: aMock position: attributesValues [
	| position |
	position := self 
		attributes: attributesValues 
		valueAt: #position 
		default: [13@13].
	aMock stub startPosition
		willReturn: position x.
	aMock stub endPosition
		willReturn: position y.

]

{ #category : #helpers }
MLSAnalysisLiteralTest >> mock: aMock sourceCode: attributesValues [
	aMock stub sourceCode
		willReturn: (self 
			attributes: attributesValues 
			valueAt: #sourceCode 
			default: ['returnOne
	^1'])
]

{ #category : #helpers }
MLSAnalysisLiteralTest >> mock: aMock status: attributesValues [
	aMock stub method
		willReturn: (self 
			attributes: attributesValues 
			valueAt: #status 
			default: [MLSIsMagic new])
]

{ #category : #helpers }
MLSAnalysisLiteralTest >> serialized: attributesValues [
	| serialized |
	serialized := Mock new.
	self mock: serialized method: attributesValues.
	self mock: serialized sourceCode: attributesValues.
	self mock: serialized position: attributesValues.
	self mock: serialized kind: attributesValues.
	self mock: serialized status: attributesValues.
	^serialized

]
