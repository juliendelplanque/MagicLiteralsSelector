Extension { #name : #MLSMethod }

{ #category : #'*MagicLiteralsSelector-Serialization' }
MLSMethod >> asSerializedMethod [
	^ MLSSerializedMethod new
		methodPackageName: self compiledMethod package name;
		methodClassName: self methodClass name;
		methodSelector: self compiledMethod selector;
		sourceCode: self compiledMethod sourceCode;
		literalCandidates: (self literalsCandidates collect: #asSerializedLiteralCandidate);
		yourself
]
