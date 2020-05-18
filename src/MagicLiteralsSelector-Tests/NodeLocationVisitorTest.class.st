Class {
	#name : #NodeLocationVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'nodes'
	],
	#category : #'MagicLiteralsSelector-Tests-analysis'
}

{ #category : #tests }
NodeLocationVisitorTest >> nodeLocation: aRBNode [
	^(MLSNodeLocationVisitor on: aRBNode) class
]

{ #category : #running }
NodeLocationVisitorTest >> sampleMethod [
	"a colection of literal nodes in doifferent 'locations'"
	<apragma: #yes argument: #(a 2)>
	| w x y z a |
	w := $a.
	x := 42.
	y := x + 1.
	z := 2 * y ; - 7.
	a := 'receiver' asString.
	0 to: 5 do: [ :i | #standalone ].
	
	^ true
]

{ #category : #running }
NodeLocationVisitorTest >> setUp [
	nodes := MLSFindLiteralsNodeVisitor visit: (NodeLocationVisitorTest >> #sampleMethod) parseTree.
]

{ #category : #tests }
NodeLocationVisitorTest >> testBinaryArgumentLocation [
	self assert: (self nodeLocation: nodes fifth) equals: MLSNodeLocationBinaryArgument.
	self assert: (self nodeLocation: nodes seventh) equals: MLSNodeLocationBinaryArgument
]

{ #category : #tests }
NodeLocationVisitorTest >> testExpressionValueLocationAssignement [
	self assert: (self nodeLocation: nodes third) equals: MLSNodeLocationExpressionValue .
	self assert: (self nodeLocation: nodes fourth) equals: MLSNodeLocationExpressionValue.
]

{ #category : #tests }
NodeLocationVisitorTest >> testExpressionValueLocationBlockReturn [
	self assert: (self nodeLocation: (nodes at: 11)) equals: MLSNodeLocationExpressionValue 
]

{ #category : #tests }
NodeLocationVisitorTest >> testKeywordArgumentLocation [
	self assert: (self nodeLocation: (nodes at: 10)) equals: MLSNodeLocationKeywordArgument
]

{ #category : #tests }
NodeLocationVisitorTest >> testMessageReceiverLocation [
	self assert: (self nodeLocation: nodes sixth) equals: MLSNodeLocationMessageReceiver.
	self assert: (self nodeLocation: nodes eighth) equals: MLSNodeLocationMessageReceiver.
	self assert: (self nodeLocation: nodes ninth) equals: MLSNodeLocationMessageReceiver.
]

{ #category : #tests }
NodeLocationVisitorTest >> testPragmaArgumentLocation [
	self assert: (self nodeLocation: nodes first) equals: MLSNodeLocationPagmaArgument.
	self assert: (self nodeLocation: nodes second) equals: MLSNodeLocationPagmaArgument
]

{ #category : #tests }
NodeLocationVisitorTest >> testReturnValueLocation [
	self assert: (self nodeLocation: (nodes at: 12)) equals: MLSNodeLocationReturnValue.

]
