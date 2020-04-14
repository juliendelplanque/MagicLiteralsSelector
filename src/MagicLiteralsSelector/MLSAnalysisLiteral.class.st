Class {
	#name : #MLSAnalysisLiteral,
	#superclass : #Object,
	#instVars : [
		'value',
		'status',
		'method'
	],
	#category : #'MagicLiteralsSelector-analysis'
}

{ #category : #testing }
MLSAnalysisLiteral >> isBooleanLiteral [
	^(self value = 'true') or: [ self value = 'false' ]

]

{ #category : #testing }
MLSAnalysisLiteral >> isCannotDecide [
	^ self status isCannotDecide
]

{ #category : #testing }
MLSAnalysisLiteral >> isCharacterLiteral [
	^self value isCharacter
]

{ #category : #testing }
MLSAnalysisLiteral >> isFloatLiteral [
	^self value isFloat 
]

{ #category : #testing }
MLSAnalysisLiteral >> isIntegerLiteral [
	^self value isInteger 
]

{ #category : #testing }
MLSAnalysisLiteral >> isMagic [
	^ self status isMagic
]

{ #category : #testing }
MLSAnalysisLiteral >> isNilLiteral [
	^self value isNil
]

{ #category : #testing }
MLSAnalysisLiteral >> isNotMagic [
	^ self status isNotMagic
]

{ #category : #testing }
MLSAnalysisLiteral >> isStringLiteral [
	^self value isString
]

{ #category : #testing }
MLSAnalysisLiteral >> isSymbolLiteral [
	^self value isSymbol
]

{ #category : #testing }
MLSAnalysisLiteral >> isUnknown [
	^ self status isUnknown
]

{ #category : #accessing }
MLSAnalysisLiteral >> method [
	^ method
]

{ #category : #accessing }
MLSAnalysisLiteral >> method: anObject [
	method := anObject
]

{ #category : #accessing }
MLSAnalysisLiteral >> status [
	^ status
]

{ #category : #accessing }
MLSAnalysisLiteral >> status: anObject [
	status := anObject
]

{ #category : #accessing }
MLSAnalysisLiteral >> value [
	^ value
]

{ #category : #accessing }
MLSAnalysisLiteral >> value: anObject [
	value := anObject
]
