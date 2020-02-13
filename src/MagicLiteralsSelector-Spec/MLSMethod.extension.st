Extension { #name : #MLSMethod }

{ #category : #'*MagicLiteralsSelector-Spec' }
MLSMethod >> completionStatusIcon [
	^ self isCompleted
		ifTrue: [ #checkboxSelected ]
		ifFalse: [ #checkboxUnselected ]
]

{ #category : #'*MagicLiteralsSelector-Spec' }
MLSMethod >> displayStringOn: aStream [
	^ self compiledMethod displayStringOn: aStream
]
