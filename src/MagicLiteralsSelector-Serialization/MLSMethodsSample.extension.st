Extension { #name : #MLSMethodsSample }

{ #category : #'*MagicLiteralsSelector-Serialization' }
MLSMethodsSample >> asSerializedMethodsSample [
	^ MLSSerializedMethodsSample new
		methods: (self methods collect: #asSerializedMethod);
		pharoVersionString: SystemVersion current imageVersionString;
		generationDateAndTime: DateAndTime now;
		yourself
]
