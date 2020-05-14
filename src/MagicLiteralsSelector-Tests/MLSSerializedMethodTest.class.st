"
A MLSSerializedMethodTest is a test class for testing the behavior of MLSSerializedMethod
"
Class {
	#name : #MLSSerializedMethodTest,
	#superclass : #MLSAbstractSerializationClassTest,
	#category : #'MagicLiteralsSelector-Tests-serialization'
}

{ #category : #tests }
MLSSerializedMethodTest >> testAsSerializedMethod [
	| method serialized |
	method := self mlsMethodFor: #sampleMethodWithLiterals2.
	
	serialized := method asSerializedMethod.
	
	self assert: serialized methodPackageName equals: MLSAbstractSerializationClassTest package name.
	self assert: serialized methodClassName equals: #MLSAbstractSerializationClassTest.
	self assert: serialized methodSelector equals: #sampleMethodWithLiterals2.
	self assert: serialized literalCandidates size equals: method literalCandidates size.
	self assert: serialized sourceCode equals: 'sampleMethodWithLiterals2
	^{ 1 . 2 . $a }'
]

{ #category : #tests }
MLSSerializedMethodTest >> testCommentLengthCommentsWithDoubleQuoteInIt [
	"Note: not counting double doublequote ("") "
	self
		assert:
			(MLSSerializedMethod new
				sourceCode: 'blah
				"a ""comment"""
				^ 0';
				yourself) commentLength
		equals: 9
]

{ #category : #tests }
MLSSerializedMethodTest >> testCommentLengthMultipleComments [
	self
		assert:
			(MLSSerializedMethod new
				sourceCode: 'blah
				"a comment"
				^ 0 "and another"';
				yourself) commentLength
		equals: 20
]

{ #category : #tests }
MLSSerializedMethodTest >> testCommentLengthSingleComment [
	self
		assert:
			(MLSSerializedMethod new
				sourceCode: 'blah
				"a comment"
				^ 0';
				yourself) commentLength
		equals: 9
]

{ #category : #tests }
MLSSerializedMethodTest >> testCommentLengthZero [
	self
		assert:
			(MLSSerializedMethod new
				sourceCode: 'blah';
				yourself) commentLength
		equals: 0
]
