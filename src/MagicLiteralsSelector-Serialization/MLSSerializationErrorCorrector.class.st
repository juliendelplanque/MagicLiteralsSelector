"
A class to correct serialized bodies of methods in experiment .ston files

Some serialized experiments saved wrong method bodies
This raises problems when unserializing the literals as their position in the method body does not fit the erroneous body serialized
This corrector assumes the methods are all loaded in image so that we can get their correct body from CompiledMethod

"
Class {
	#name : #MLSSerializationErrorCorrector,
	#superclass : #Object,
	#category : #'MagicLiteralsSelector-serialization'
}

{ #category : #running }
MLSSerializationErrorCorrector class >> onFile: aFileName [
	self new
		runOnFile: aFileName
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
	serializedSample methods do: [ :serializedMeth |
			serializedMeth
				compiledMethodIfFound: [ :compiledMethod |
					serializedMeth sourceCode: compiledMethod sourceCode ]
				ifAbsent: [ NotFound signal: serializedMeth ]
		].
	^serializedSample
]
