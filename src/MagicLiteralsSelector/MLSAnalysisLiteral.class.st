"
A literal analysed in one experiment contains the literal, its owning method, its status (magic or not), the project and experimentId where it was analysed
"
Class {
	#name : #MLSAnalysisLiteral,
	#superclass : #Object,
	#instVars : [
		'value',
		'status',
		'kind',
		'mid',
		'method',
		'project',
		'experimentId'
	],
	#category : #'MagicLiteralsSelector-analysis'
}

{ #category : #'instance creation' }
MLSAnalysisLiteral class >> fromSerialized: serializedLiteral inMethod: serializedMethod [
	^self new
		fromSerialized: serializedLiteral inMethod: serializedMethod
		yourself
]

{ #category : #accessing }
MLSAnalysisLiteral >> commentLength [
	| length |
	length := 0.
	RBCommentNodeVisitor
		visit: method parseTree
		do: [ :comment | length := length + comment size].
	^length
]

{ #category : #accessing }
MLSAnalysisLiteral >> experimentId [
	^ experimentId
]

{ #category : #accessing }
MLSAnalysisLiteral >> experimentId: anObject [
	experimentId := anObject
]

{ #category : #private }
MLSAnalysisLiteral >> findSerialized: serialized inNodes: literalNodes [
	| index |
	index := 0.
	literalNodes
		detect: [ :node |
			index := index + 1.
			(serialized startPosition = node start) and: [
			(serialized endPosition = node stop) ]
		]
		ifOne: [ :node | ^ node -> index ]
		ifNone: [ AssertionFailure signal: 'Literal not found in compiled method' ]

]

{ #category : #initialisation }
MLSAnalysisLiteral >> fromSerialized: serializedLiteral inMethod: serializedMethod [
	value := serializedMethod sourceCode
		copyFrom: serializedLiteral startPosition to: serializedLiteral endPosition.
	status := serializedLiteral status.
	serializedMethod
		compiledMethodIfFound: [ :compiled || nodeAndId |
			method := compiled.
			nodeAndId := self
				findSerialized: serializedLiteral
				inNodes: (MLSFindLiteralsNodeVisitor visit: (compiled parseTree)).
			kind := MLSLiteralKind fromMLSLiteral: nodeAndId key.
			mid := nodeAndId value
		]
		ifAbsent: [ NotFound signal: serializedMethod name]
]

{ #category : #accessing }
MLSAnalysisLiteral >> kind [ 
	^kind
]

{ #category : #accessing }
MLSAnalysisLiteral >> method [
	^ method
]

{ #category : #printing }
MLSAnalysisLiteral >> printOn: aStream [
		aStream << method name << ' ' << value
]

{ #category : #accessing }
MLSAnalysisLiteral >> project [
	^ project
]

{ #category : #accessing }
MLSAnalysisLiteral >> project: anObject [
	project := anObject
]

{ #category : #accessing }
MLSAnalysisLiteral >> status [
	^ status
]

{ #category : #accessing }
MLSAnalysisLiteral >> value [
	^ value
]
