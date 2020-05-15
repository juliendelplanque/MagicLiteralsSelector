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
		'commentLength',
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

{ #category : #private }
MLSAnalysisLiteral >> commentLength: compiledMethod [
	| length |
	length := 0.
	RBCommentNodeVisitor
		visit: compiledMethod parseTree
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
	^literalNodes
		detect: [ :node |
			(serialized startPosition = node start) and: [
			(serialized endPosition = node stop) ]
		]
		ifNone: [ AssertionFailure signal: 'Literal not found in compiled method' ]

]

{ #category : #initialisation }
MLSAnalysisLiteral >> fromSerialized: serializedLiteral inMethod: serializedMethod [
	value := serializedMethod sourceCode
		copyFrom: serializedLiteral startPosition to: serializedLiteral endPosition.
	kind := serializedLiteral kind.
	status := serializedLiteral status.
	serializedMethod
		compiledMethodIfFound: [ :compiled || node |
			method := compiled.
			commentLength := self commentLength: compiled.
			node := self
				findSerialized: serializedLiteral
				inNodes: (MLSFindLiteralsNodeVisitor visit: (compiled parseTree)).
			kind := MLSLiteralKind fromMLSLiteral: node.
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
