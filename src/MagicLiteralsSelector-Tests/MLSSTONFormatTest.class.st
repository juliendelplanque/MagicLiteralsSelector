Class {
	#name : #MLSSTONFormatTest,
	#superclass : #MLSAbstractSerializationClassTest,
	#category : #'MagicLiteralsSelector-Tests-serialization'
}

{ #category : #tests }
MLSSTONFormatTest >> stonParse: aString [
	^(STON reader
		acceptUnknownClasses: true ;
		on: (aString readStream) ;
		yourself) next
]

{ #category : #tests }
MLSSTONFormatTest >> testLiteralCannotDecide [
	| obj |
	obj := self stonParse:
		'MLSSerializedLiteralCandidate{#status:MLSCannotDecide{},#startPosition:123,#endPosition:456}'.
	self assert: obj class equals: MLSSerializedLiteralCandidate.
	self assert: obj status isCannotDecide.
	self assert: obj startPosition equals: 123.
	self assert: obj endPosition equals: 456
]

{ #category : #tests }
MLSSTONFormatTest >> testLiteralMagic [
	| obj |
	obj := STON fromString:
		'MLSSerializedLiteralCandidate{#status:MLSIsMagic{},#startPosition:123,#endPosition:456}'.
	self assert: obj class equals: MLSSerializedLiteralCandidate.
	self assert: obj status isMagic.
	self assert: obj startPosition equals: 123.
	self assert: obj endPosition equals: 456
]
