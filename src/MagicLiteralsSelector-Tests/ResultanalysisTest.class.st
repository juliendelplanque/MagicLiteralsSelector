Class {
	#name : #ResultanalysisTest,
	#superclass : #TestCase,
	#category : #'MagicLiteralsSelector-Tests-analysis'
}

{ #category : #samples }
ResultanalysisTest >> constantMethodSample [
	^42
]

{ #category : #samples }
ResultanalysisTest >> notConstantMethodSample [
	| x |
	x := 3+2.
	^42
]

{ #category : #tests }
ResultanalysisTest >> testValueOfConstantMethodFalse [
	| literals |
	literals := MLSFindLiteralsNodeVisitor visit: (ResultanalysisTest >> #notConstantMethodSample) parseTree.
	self deny: (MLSResultsAnalysis new isConstantMethod: literals last)
]

{ #category : #tests }
ResultanalysisTest >> testValueOfConstantMethodTrue [
	| literals |
	literals := MLSFindLiteralsNodeVisitor visit: (ResultanalysisTest >> #constantMethodSample) parseTree.
	self assert: (MLSResultsAnalysis new isConstantMethod: literals first)
]
