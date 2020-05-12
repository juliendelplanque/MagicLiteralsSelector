"
A class to load ston files resulting from experiments and export them in CSV for analysis in R

MLSExperimentAnalysis importDirectory: '/path/to/directory'
"
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
	MLSClassExternal resetInstances .
	MLSMethodExternal resetInstances .
	^self new importFromDirectory: aName
]

{ #category : #'instance creation' }
MLSExperimentAnalysis class >> importExpertsBase: aName [
	^self new importExpertsFromFile: aName
]

{ #category : #enumerating }
MLSExperimentAnalysis >> do: aBlock [
	"iterates on all literals"
	literals do: aBlock
]

{ #category : #accessing }
MLSExperimentAnalysis >> experimentForProject: project id: id [
	^experiments
		detect: [ :exp | exp project =project and: [ exp experiment = id ] ]
		ifNone: [ nil ]
]

{ #category : #accessing }
MLSExperimentAnalysis >> expertForProject: project experiment: experimentId [
	^(self experimentForProject: project id: experimentId) expert
]

{ #category : #accessing }
MLSExperimentAnalysis >> expertiseForProject: project experiment: experimentId [
	^(self experimentForProject: project id: experimentId) expertise
]

{ #category : #exporting }
MLSExperimentAnalysis >> exportToCsvFile: aFilename [
	aFilename asFileReference writeStreamDo: [ :st |
		self exportToCsvStream: st
	]
]

{ #category : #exporting }
MLSExperimentAnalysis >> exportToCsvStream: stream [
	(NeoCSVWriter on: stream)
		fieldWriter: #quoted ;
		writeHeader: #(literal status project expert expertise) ;
		addField: [ :lit | lit value asString] ;
		addField: [ :lit | lit status ] ;
		addField: [ :lit | lit project ] ;
		addField: [ :lit | self expertForProject: lit project experiment: lit experimentId ] ;
		addField: [ :lit | self expertiseForProject: lit project experiment: lit experimentId ] ;
		nextPutAll: self
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
	(MLSReader on: aStream) next
		methods do: [ :serializedMeth |
			serializedMeth literalCandidates do: [ :lit |
				literals
					add:
						((MLSAnalysisLiteral fromSerialized: lit inMethod: serializedMeth)
							project: project ;
							experimentId: id ;
							yourself)
			]
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
