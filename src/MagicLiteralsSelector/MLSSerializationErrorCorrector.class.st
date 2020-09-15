"
A class to correct serialized bodies of methods in experiment .ston files

Some serialized experiments saved wrong method bodies
This raises problems when unserializing the literals as their position in the method body does not fit the erroneous body serialized
This corrector assumes the methods are all loaded in image so that we can get their correct body from CompiledMethod

"
Class {
	#name : #MLSSerializationErrorCorrector,
	#superclass : #Object,
	#instVars : [
		'settings'
	],
	#category : #'MagicLiteralsSelector-serialization'
}

{ #category : #running }
MLSSerializationErrorCorrector class >> onDirectory: aString [
	self new
		runOnDirectory: aString
]

{ #category : #running }
MLSSerializationErrorCorrector class >> onFile: aFileName [
	self new
		runOnFile: aFileName
]

{ #category : #running }
MLSSerializationErrorCorrector >> checkLiterals: serializedMeth with: compiledMethod [
	| literalNodes |
	self shouldCheckLiterals
		ifFalse: [ ^self ].
		literalNodes := MLSFindLiteralsNodeVisitor visit: (compiledMethod parseTree).
	serializedMeth literalCandidates
		do: [ :serialized |
			(self findLiteral: serialized inNodes: literalNodes)
		]

]

{ #category : #running }
MLSSerializationErrorCorrector >> correctMethod: serializedMeth [
	serializedMeth
		compiledMethodIfFound: [ :compiledMethod |
			self updateMethodBody: serializedMeth with: compiledMethod.
			self checkLiterals: serializedMeth with: compiledMethod. ]
		ifAbsent: [ NotFound signal: serializedMeth ]
]

{ #category : #settings }
MLSSerializationErrorCorrector >> doesAlterSomething [
	^(settings reject: [:s | s = self settingForCheckLiterals]) notEmpty
]

{ #category : #running }
MLSSerializationErrorCorrector >> findLiteral: serialized inNodes: literalNodes [
	^literalNodes
		detect: [ :node |
			(serialized startPosition = node start) and: [
			(serialized endPosition = node stop) ]
		]
		ifNone: [ AssertionFailure signal: 'Literal not found in compiled method' ]
			

]

{ #category : #initialization }
MLSSerializationErrorCorrector >> initialize [
	super initialize .
	settings := Set new: 2.
]

{ #category : #settings }
MLSSerializationErrorCorrector >> isSet: aSetting [
	^settings includes: aSetting
]

{ #category : #running }
MLSSerializationErrorCorrector >> runOnDirectory: aString [
	self runOnDirectory: aString filesMatching: [:fref | (fref basename endsWith: '.ston')]
]

{ #category : #running }
MLSSerializationErrorCorrector >> runOnDirectory: aString filesMatching: aBlock [
	| directory |
	directory := aString asFileReference.
	directory exists ifFalse: [ ^ nil ].
	directory isDirectory  ifFalse: [ ^ nil ].
	(directory entries select: aBlock)
		do: [ :fref | self runOnFileReference: fref ]
		displayingProgress: [ :e | e basename]
]

{ #category : #running }
MLSSerializationErrorCorrector >> runOnFile: fileName [
	self runOnFileReference: fileName asFileReference
]

{ #category : #running }
MLSSerializationErrorCorrector >> runOnFileReference: aFileReference [
	aFileReference readStreamDo: [ :s || corrected |
		corrected := self runOnStream: s.
		self doesAlterSomething 
			ifTrue: [corrected saveIn: aFileReference fullName ]
	]
]

{ #category : #running }
MLSSerializationErrorCorrector >> runOnFiles: fileReferences [
	fileReferences
		do: [ :fref | self runOnFileReference: fref ]
	 	displayingProgress:  [ :e | e basename ]
]

{ #category : #running }
MLSSerializationErrorCorrector >> runOnStream: aStream [
	| serializedSample |
	serializedSample := (MLSReader on: aStream) next.
	serializedSample methods do: [ :serializedMeth | self correctMethod: serializedMeth ].
	^serializedSample
]

{ #category : #settings }
MLSSerializationErrorCorrector >> set: aSetting [
	settings add: aSetting
]

{ #category : #settings }
MLSSerializationErrorCorrector >> setCheckLiterals [
	self set: self settingForCheckLiterals
]

{ #category : #settings }
MLSSerializationErrorCorrector >> setUpdateMethodBody [
	self set: self settingForUpdateMethodBody
]

{ #category : #settings }
MLSSerializationErrorCorrector >> settingForCheckLiterals [
	^#checkLiterals
]

{ #category : #settings }
MLSSerializationErrorCorrector >> settingForUpdateMethodBody [
	^#updateMethodBody
]

{ #category : #settings }
MLSSerializationErrorCorrector >> shouldCheckLiterals [
	^self isSet: self settingForCheckLiterals
]

{ #category : #settings }
MLSSerializationErrorCorrector >> shouldUpdateMethodBody [
	^self isSet: self settingForUpdateMethodBody 
]

{ #category : #running }
MLSSerializationErrorCorrector >> updateMethodBody: serializedMeth with: compiledMethod [
	self shouldUpdateMethodBody
		ifTrue: [serializedMeth sourceCode: compiledMethod sourceCode]
]
