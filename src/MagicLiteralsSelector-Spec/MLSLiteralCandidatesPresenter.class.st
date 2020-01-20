Class {
	#name : #MLSLiteralCandidatesPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'literalCandidatesTable'
	],
	#category : #'MagicLiteralsSelector-Spec'
}

{ #category : #specs }
MLSLiteralCandidatesPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #literalCandidatesTable;
		yourself
]

{ #category : #initialization }
MLSLiteralCandidatesPresenter >> initializePresenters [
	literalCandidatesTable := self newTable.
	
	literalCandidatesTable
		addColumn: (SpStringTableColumn title: 'Literal value' evaluated: [ :literalCandidate | literalCandidate literalValue asString ]);
		addColumn:
			((SpCheckBoxTableColumn title: 'Magic' evaluated: [ :literalCandidate | literalCandidate isMagic ])
				onActivation: [ :literalCandidate | 
					literalCandidate beMagic.
					self refresh ];
				onDesactivation: [ :literalCandidate | 
					literalCandidate beUnknown.
					self refresh ];
				yourself);
		addColumn:
			((SpCheckBoxTableColumn title: 'Not magic' evaluated: [ :literalCandidate | literalCandidate isNotMagic ])
				onActivation: [ :literalCandidate | 
					literalCandidate beNotMagic.
					self refresh ];
				onDesactivation: [ :literalCandidate | 
					literalCandidate beUnknown.
					self refresh ];
				yourself);
		addColumn:
			((SpCheckBoxTableColumn title: 'Can not decide' evaluated: [ :literalCandidate | literalCandidate isCanNotDecide ])
				onActivation: [ :literalCandidate | 
					literalCandidate beCanNotDecide.
					self refresh ];
				onDesactivation: [ :literalCandidate | 
					literalCandidate beUnknown.
					self refresh ];
				yourself)
]

{ #category : #accessing }
MLSLiteralCandidatesPresenter >> literalCandidatesTable [
	^ literalCandidatesTable
]

{ #category : #accessing }
MLSLiteralCandidatesPresenter >> literalsCandidates [
	^ literalCandidatesTable items
]

{ #category : #accessing }
MLSLiteralCandidatesPresenter >> literalsCandidates: aListOfCandidates [
	literalCandidatesTable items: aListOfCandidates
]

{ #category : #accessing }
MLSLiteralCandidatesPresenter >> refresh [
	self literalsCandidates: self literalsCandidates
]
