"
a simple wrapper around STONReader fine tuned for deserialization of experiment .ston files
"
Class {
	#name : #MLSReader,
	#superclass : #STONReader,
	#category : #'MagicLiteralsSelector-serialization'
}

{ #category : #'initialize-release' }
MLSReader >> initialize [
	super initialize .
	self acceptUnknownClasses: true
]

{ #category : #public }
MLSReader >> next [
	^super next
		fixStonErrors ;
		yourself
]
