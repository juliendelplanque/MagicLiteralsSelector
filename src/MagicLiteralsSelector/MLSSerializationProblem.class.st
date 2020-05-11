Class {
	#name : #MLSSerializationProblem,
	#superclass : #Object,
	#instVars : [
		'package',
		'methodClass',
		'selector',
		'body'
	],
	#classInstVars : [
		'knownIssues'
	],
	#category : #'MagicLiteralsSelector-analysis'
}

{ #category : #accessing }
MLSSerializationProblem class >> knownIssues [
	^knownIssues ifNil: [
		knownIssues := OrderedCollection new.
		knownIssues add:
			(self new
				package: 'Math-Tests-Core' ;
				methodClass: 'PMVectorTest' ;
				selector: 'testVectorCloseTo' ;
				body: 'testVectorCloseTo
	self assert: (#(1.00001 2.00005) asPMVector closeTo: #(1.00005 2.00001) asPMVector).
	self assert: #(1.00001 2.00005) asPMVector closeTo: #(1.00005 2.00001) asPMVector.	"Double check that the TestAsserter >> #assert:closeTo: functions properly here."
	self deny: (#(1.00001 2.00007) asPMVector closeTo: #(1.00007 2.00001) asPMVector)' ;
				yourself)
	]
]

{ #category : #accessing }
MLSSerializationProblem class >> method: selector inClass: className inPackage: packageName [
	self knownIssues
		detect: [ :m |
			m package = packageName and: [ 
			m methodClass = className and: [
			m selector = selector] ]
		]
		ifNone: [ nil ]
]

{ #category : #accessing }
MLSSerializationProblem >> body [
	^ body
]

{ #category : #accessing }
MLSSerializationProblem >> body: anObject [
	body := anObject
]

{ #category : #accessing }
MLSSerializationProblem >> methodClass [
	^ methodClass
]

{ #category : #accessing }
MLSSerializationProblem >> methodClass: anObject [
	methodClass := anObject
]

{ #category : #accessing }
MLSSerializationProblem >> package [
	^ package
]

{ #category : #accessing }
MLSSerializationProblem >> package: anObject [
	package := anObject
]

{ #category : #accessing }
MLSSerializationProblem >> selector [
	^ selector
]

{ #category : #accessing }
MLSSerializationProblem >> selector: anObject [
	selector := anObject
]
