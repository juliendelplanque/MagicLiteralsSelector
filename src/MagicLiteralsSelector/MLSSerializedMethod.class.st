"
Serialized version of an MLSMethod
Does not contain the AST tree of the method, but source code as text and information to recover the CompiledMethod (package name, class name, selector) in this image if it exists
"
Class {
	#name : #MLSSerializedMethod,
	#superclass : #Object,
	#instVars : [
		'methodPackageName',
		'methodClassName',
		'methodSelector',
		'literalCandidates',
		'sourceCode',
		'commentLength'
	],
	#category : #'MagicLiteralsSelector-serialization'
}

{ #category : #accessing }
MLSSerializedMethod >> commentLength [
	^sourceCode ifNil: [0] ifNotNil: [commentLength := self countComments]
]

{ #category : #converting }
MLSSerializedMethod >> compiledMethodIfFound: foundBlock ifAbsent: absentBlock [
	| clazz |
	clazz := (Smalltalk classNamed: methodClassName)
		ifNil: [ MLSClassExternal forPackage: methodPackageName name: methodClassName].
	^clazz
		compiledMethodAt: methodSelector
		ifPresent: [ :m | foundBlock value: m]
		ifAbsent: absentBlock

]

{ #category : #private }
MLSSerializedMethod >> countComments [
	"Note we do not count double doublequote ("") but it does not seem to make a big difference"
	| i |
	i:= 1.
	commentLength := 0.
	[true] whileTrue: [ | j |
		i := sourceCode indexOf: $" startingAt: i ifAbsent: [ ^ commentLength ].
		((i > 1) and: [
			(sourceCode at: i-1) = $$])
		ifTrue: [  i:= i+1 ]
		ifFalse: [
			j := sourceCode indexOf: $" startingAt: i+1.
			commentLength := commentLength + j - i -1.
			i := j+1
		]
	]
]

{ #category : #converting }
MLSSerializedMethod >> fixStonErrors [
	"correct ston issues in CanNotDecide statuses"
	literalCandidates do: #fixStonErrors.

]

{ #category : #accessing }
MLSSerializedMethod >> literalCandidates [
	^ literalCandidates
]

{ #category : #accessing }
MLSSerializedMethod >> literalCandidates: anObject [
	literalCandidates := anObject
]

{ #category : #accessing }
MLSSerializedMethod >> methodClassName [
	^ methodClassName
]

{ #category : #accessing }
MLSSerializedMethod >> methodClassName: anObject [
	methodClassName := anObject
]

{ #category : #accessing }
MLSSerializedMethod >> methodPackageName [
	^ methodPackageName
]

{ #category : #accessing }
MLSSerializedMethod >> methodPackageName: anObject [
	methodPackageName := anObject
]

{ #category : #accessing }
MLSSerializedMethod >> methodSelector [
	^ methodSelector
]

{ #category : #accessing }
MLSSerializedMethod >> methodSelector: anObject [
	methodSelector := anObject
]

{ #category : #accessing }
MLSSerializedMethod >> sourceCode [
	^ sourceCode
]

{ #category : #accessing }
MLSSerializedMethod >> sourceCode: anObject [
	sourceCode := anObject.
	self commentLength
]
