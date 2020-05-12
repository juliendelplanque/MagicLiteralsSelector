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
		'updateMethodBody',
		'updateLiteralsKind'
	],
	#category : #'MagicLiteralsSelector-serialization'
}

{ #category : #running }
MLSSerializationErrorCorrector class >> onFile: aFileName [
	self new
		runOn: aFileName
]

{ #category : #running }
MLSSerializationErrorCorrector >> correctLiterals: serializedMeth with: compiledMethod [
	updateLiteralsKind ifFalse: [ ^self ].
	serializedMeth literalCandidates
		with: (MLSFindLiteralsNodeVisitor visit: (compiledMethod parseTree)) 
		do: [ :serialized :node | serialized kind: (MLSLiteralKind fromMLSLiteral: node)]

]

{ #category : #running }
MLSSerializationErrorCorrector >> correctMethod: serializedMeth [
	serializedMeth
		compiledMethodIfFound: [ :compiledMethod |
			updateMethodBody ifTrue: [serializedMeth sourceCode: compiledMethod sourceCode].
			self correctLiterals: serializedMeth with: compiledMethod ]
		ifAbsent: [ NotFound signal: serializedMeth ]
]

{ #category : #initialization }
MLSSerializationErrorCorrector >> initialize [
	super initialize .
	updateMethodBody := false.
	updateLiteralsKind := false
]

{ #category : #running }
MLSSerializationErrorCorrector >> runOnFile: fileName [
	fileName asFileReference readStreamDo: [ :s |
		(self runOnStream: s) saveIn: (fileName , '-c')
	]
]

{ #category : #running }
MLSSerializationErrorCorrector >> runOnStream: aStream [
	| serializedSample |
	serializedSample := (MLSReader on: aStream) next.
	serializedSample methods do: [ :serializedMeth | self correctMethod: serializedMeth ].
	^serializedSample
]

{ #category : #settings }
MLSSerializationErrorCorrector >> updateLiteralsKind [
	updateLiteralsKind := true
]

{ #category : #settings }
MLSSerializationErrorCorrector >> updateMethodBody [
	updateMethodBody := true
]
