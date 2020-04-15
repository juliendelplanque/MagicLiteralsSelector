Class {
	#name : #MLSAnalysisMethodTest,
	#superclass : #MLSAbstractAnalysisTest,
	#category : #'MagicLiteralsSelector-Tests-analysis'
}

{ #category : #tests }
MLSAnalysisMethodTest >> testSampleName [
	| mth sample lit |
	lit := self simpleAnalysisLiteral1.
	mth := lit method.
	sample := Mock new.
	sample stub name willReturn: 'sample-1'.
	mth methodSample: sample.

	self assert: lit sampleName equals: 'sample-1'.
	self assert: mth sampleName equals: 'sample-1'.

]
