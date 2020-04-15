Class {
	#name : #MLSAbstractAnalysisTest,
	#superclass : #TestCase,
	#category : #'MagicLiteralsSelector-Tests-analysis'
}

{ #category : #helpers }
MLSAbstractAnalysisTest >> simpleAnalysisLiteral1 [
	| lit |
	lit := MLSAnalysisLiteral new
		value: '1' ;
		method: self simpleAnalysisMethod1 ;
		yourself.
	lit method literals: {  lit }.
	^ lit
]

{ #category : #helpers }
MLSAbstractAnalysisTest >> simpleAnalysisMethod1 [
	^MLSAnalysisMethodExternal new
		code: 'method1
	^ 1'
]
