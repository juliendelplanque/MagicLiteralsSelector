Class {
	#name : #MLSExperimentAnalysis,
	#superclass : #Object,
	#instVars : [
		'literals',
		'experiments'
	],
	#category : #'MagicLiteralsSelector-analysis'
}

{ #category : #'instance creation' }
MLSExperimentAnalysis class >> importDirectory: aName [
	^self new importFromDirectory: aName
]

{ #category : #'instance creation' }
MLSExperimentAnalysis class >> importExpertsBase: aName [
	^self new importExpertsFromFile: aName
]

{ #category : #importing }
MLSExperimentAnalysis >> importExpertExperiment: record [
	(record third) ifNotNil: [ |tokens|
		tokens := record first findBetweenSubstrings: '-'.
		experiments add:
			(MLSAnalysisExperiment
				project: (tokens first)
				experiment: (tokens second asInteger)
				expert: (record second)
				expertise: (record third) )
	]
]

{ #category : #importing }
MLSExperimentAnalysis >> importExpertsFromFile: aFilename [
	aFilename asFileReference readStreamDo: [ :st | self importExpertsFromStream: st ]
]

{ #category : #importing }
MLSExperimentAnalysis >> importExpertsFromStream: aStream [
	| csv |
	csv := NeoCSVReader on: aStream contents readStream.
	3 timesRepeat: [ csv skipHeader ].
	csv do: [ :record |
		1 to: record size by: 3 do: [ :i |
			self importExpertExperiment: (record copyFrom: i to: i+2)
		]
	]
]

{ #category : #importing }
MLSExperimentAnalysis >> importFromDirectory: aName [
	| directory |
	directory := aName asFileReference.
	directory exists ifFalse: [ ^ nil ].
	directory isDirectory  ifFalse: [ ^ nil ].
	directory entries
		do: [ :e | 
			(e basename endsWith: '.ston')
			ifTrue: [ self importLiteralsFromFile: e ]
			ifFalse: [
				(e basename endsWith: '.csv')
				ifTrue: [ self importExpertsFromFile: e ] ] ]
		displayingProgress: [ :e | e basename ]
]

{ #category : #importing }
MLSExperimentAnalysis >> importLiterals: project xp: id fromStream: aStream [
	(self stonToSerializedSample: aStream)
		allLiterals do: [ :lit |
			literals
				add:
					(MLSAnalysisLiteral
						fromSerialized: lit
						project: project
						id: id)
		]
]

{ #category : #importing }
MLSExperimentAnalysis >> importLiteralsFromFile: aFileRef [
	| tokens xpId projectName |
	tokens := aFileRef basename findBetweenSubstrings: '-.'.
	projectName := tokens second.
	xpId := tokens third asInteger.
	aFileRef readStreamDo: [ :s |
		self importLiterals: projectName xp: xpId fromStream: s
	]
]

{ #category : #'instance creation' }
MLSExperimentAnalysis >> initialize [
	literals := OrderedCollection new.
	experiments := OrderedCollection new
]

{ #category : #importing }
MLSExperimentAnalysis >> stonToSerializedSample: aStream [
	^(STON reader
		acceptUnknownClasses: true ;
		on: aStream)
		next
			fixStonErrors ;
			yourself
]
