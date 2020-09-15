Class {
	#name : #NodeLocationVisitorTest,
	#superclass : #TestCase,
	#category : #'MagicLiteralsSelector-Tests-analysis'
}

{ #category : #running }
NodeLocationVisitorTest >> literalNodes [
	^MLSFindLiteralsNodeVisitor visit: (NodeLocationVisitorTest >> #sampleMethod) parseTree.
]

{ #category : #tests }
NodeLocationVisitorTest >> nodeLocation: aRBNode [
	^(MLSNodeLocationVisitor on: aRBNode) class
]

{ #category : #samples }
NodeLocationVisitorTest >> sampleMethod [
	"a colection of literal nodes in doifferent 'locations'"
	<apragma: #yes argument: #(a 2)>
	| w x y z a |
	w := 42.
	x := { w . $a }.
	y := x + 1.
	z := 2 * y ; - 7.
	a := 'receiver' asString.
	0 to: 5 do: [ :i | #standalone ].
	
	^ true
]

{ #category : #tests }
NodeLocationVisitorTest >> testBinaryArgumentLocation [
	| nodes |
	nodes := self literalNodes.
	self assert: (self nodeLocation: nodes fifth) equals: MLSNodeLocationBinaryArgument.
	self assert: (self nodeLocation: nodes seventh) equals: MLSNodeLocationBinaryArgument
]

{ #category : #tests }
NodeLocationVisitorTest >> testBinarySelector [ 
	self assert: (MLSNodeLocationVisitor new binarySelector: #+).
	self assert: (MLSNodeLocationVisitor new binarySelector: #/).
	self assert: (MLSNodeLocationVisitor new binarySelector: #\\).
	self assert: (MLSNodeLocationVisitor new binarySelector: #>=).
	self assert: (MLSNodeLocationVisitor new binarySelector: #@).
	self assert: (MLSNodeLocationVisitor new binarySelector: #,).
	self deny: (MLSNodeLocationVisitor new binarySelector: #whatever).
]

{ #category : #tests }
NodeLocationVisitorTest >> testExpressionValueLocationAssignement [
	| nodes |
	nodes := self literalNodes.
	self assert: (self nodeLocation: nodes third) equals: MLSNodeLocationExpressionValue.
	self assert: (self nodeLocation: nodes fourth) equals: MLSNodeLocationExpressionValue.
]

{ #category : #tests }
NodeLocationVisitorTest >> testExpressionValueLocationBlockReturn [
	self assert: (self nodeLocation: (self literalNodes at: 11)) equals: MLSNodeLocationExpressionValue 
]

{ #category : #tests }
NodeLocationVisitorTest >> testKeywordArgumentLocation [
	self assert: (self nodeLocation: (self literalNodes at: 10)) equals: MLSNodeLocationKeywordArgument
]

{ #category : #tests }
NodeLocationVisitorTest >> testKeywordSelector [ 
	self assert: (MLSNodeLocationVisitor new keywordSelector: #to:do:).
	self deny: (MLSNodeLocationVisitor new keywordSelector: #+).
	self deny: (MLSNodeLocationVisitor new keywordSelector: #whatever).
]

{ #category : #tests }
NodeLocationVisitorTest >> testMessageReceiverLocation [
	| nodes |
	nodes := self literalNodes.
	self assert: (self nodeLocation: nodes sixth) equals: MLSNodeLocationMessageReceiver.
	self assert: (self nodeLocation: nodes eighth) equals: MLSNodeLocationMessageReceiver.
	self assert: (self nodeLocation: nodes ninth) equals: MLSNodeLocationMessageReceiver.
]

{ #category : #tests }
NodeLocationVisitorTest >> testPragmaArgumentLocation [
	| nodes |
	nodes := self literalNodes.
	self assert: (self nodeLocation: nodes first) equals: MLSNodeLocationPagmaArgument.
	self assert: (self nodeLocation: nodes second) equals: MLSNodeLocationPagmaArgument
]

{ #category : #tests }
NodeLocationVisitorTest >> testReturnValueLocation [
	self assert: (self nodeLocation: (self literalNodes at: 12)) equals: MLSNodeLocationReturnValue.

]
