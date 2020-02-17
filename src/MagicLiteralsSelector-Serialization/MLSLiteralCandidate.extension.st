Extension { #name : #MLSLiteralCandidate }

{ #category : #'*MagicLiteralsSelector-Serialization' }
MLSLiteralCandidate >> asSerializedLiteralCandidate [
	^ MLSSerializedLiteralCandidate new
		status: self status;
		startPosition: self astNode start;
		endPosition: self astNode stop;
		yourself
]
