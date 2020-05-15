"
A class to load ston files resulting from experiments and export them in CSV for analysis in R

MLSExperimentAnalysis importDirectory: '/path/to/directory'
"
Class {
	#name : #MLSResultsAnalysis,
	#superclass : #Object,
	#instVars : [
		'literals',
		'experiments'
	],
	#category : #'MagicLiteralsSelector-analysis'
}

{ #category : #'instance creation' }
MLSResultsAnalysis class >> importDirectory: aName [
	MLSClassExternal resetInstances .
	MLSMethodExternal resetInstances .
	^self new importFromDirectory: aName
]

{ #category : #'instance creation' }
MLSResultsAnalysis class >> importExpertsBase: aName [
	^self new importExpertsFromFile: aName
]

{ #category : #enumerating }
MLSResultsAnalysis >> do: aBlock [
	"iterates on all literals"
	literals do: aBlock
]

{ #category : #accessing }
MLSResultsAnalysis >> experimentForProject: project id: id [
	^experiments
		detect: [ :exp | exp project =project and: [ exp experiment = id ] ]
		ifNone: [ nil ]
]

{ #category : #accessing }
MLSResultsAnalysis >> expertForProject: project experiment: experimentId [
	^(self experimentForProject: project id: experimentId) expert
]

{ #category : #accessing }
MLSResultsAnalysis >> expertiseForProject: project experiment: experimentId [
	^(self experimentForProject: project id: experimentId) expertise
]

{ #category : #exporting }
MLSResultsAnalysis >> exportToCsvFile: aFilename [
	aFilename asFileReference writeStreamDo: [ :st |
		self exportToCsvStream: st
	]
]

{ #category : #exporting }
MLSResultsAnalysis >> exportToCsvStream: stream [
	| csvWriter exportedFields |
	csvWriter := (NeoCSVWriter on: stream)
		fieldWriter: #quoted ;
		yourself.
	exportedFields := self exportedFields.
	csvWriter writeHeader: (exportedFields collect: #key).
	exportedFields do: [ :fieldToExport | csvWriter addField: fieldToExport value ].
	csvWriter nextPutAll: self
]

{ #category : #exporting }
MLSResultsAnalysis >> exportedFields [
	^{
		(#literal -> [ :lit | lit value asString]) .
		(#kind -> [ :lit | lit kind asString ]) .
		(#status -> [ :lit | lit status ]) .
		(#commentLength -> [:lit | lit commentLength]) .
		(#project -> [ :lit | lit project ]) .
		(#expert -> [ :lit | self expertForProject: lit project experiment: lit experimentId ]) .
		(#expertise -> [ :lit | self expertiseForProject: lit project experiment: lit experimentId ])
	}
]

{ #category : #importing }
MLSResultsAnalysis >> importExpertExperiment: record [
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
MLSResultsAnalysis >> importExpertsFromFile: aFilename [
	aFilename asFileReference readStreamDo: [ :st | self importExpertsFromStream: st ]
]

{ #category : #importing }
MLSResultsAnalysis >> importExpertsFromStream: aStream [
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
MLSResultsAnalysis >> importFromDirectory: aName [
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
MLSResultsAnalysis >> importLiterals: project xp: id fromStream: aStream [
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
MLSResultsAnalysis >> importLiteralsFromFile: aFileRef [
	| tokens xpId projectName |
	tokens := aFileRef basename findBetweenSubstrings: '-.'.
	projectName := tokens second.
	xpId := tokens third asInteger.
	aFileRef readStreamDo: [ :s |
		self importLiterals: projectName xp: xpId fromStream: s
	]
]

{ #category : #'instance creation' }
MLSResultsAnalysis >> initialize [
	literals := OrderedCollection new.
	experiments := OrderedCollection new
]

{ #category : #importing }
MLSResultsAnalysis >> stonToSerializedSample: aStream [
	^(STON reader
		acceptUnknownClasses: true ;
		on: aStream)
		next
			fixStonErrors ;
			yourself
]
