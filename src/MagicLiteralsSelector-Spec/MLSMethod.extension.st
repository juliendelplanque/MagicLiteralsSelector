Extension { #name : #MLSMethod }

{ #category : #'*MagicLiteralsSelector-Spec' }
MLSMethod >> completionStatusIcon [
	^ self isCompleted
		ifTrue: [ #glamorousAccept ]
		ifFalse: [ #flag ]
]

{ #category : #'*MagicLiteralsSelector-Spec' }
MLSMethod >> displayStringOn: aStream [
	^ self compiledMethod displayStringOn: aStream
]
