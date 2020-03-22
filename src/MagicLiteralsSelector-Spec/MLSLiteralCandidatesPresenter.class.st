Class {
	#name : #MLSLiteralCandidatesPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'literalCandidatesTable',
		'literalCandidateStatusChangeBlock'
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
	literalCandidateStatusChangeBlock := [ :literalCandidate |  ].
	literalCandidatesTable := self newTable.
	literalCandidatesTable
		addColumn:
			(SpStringTableColumn
				title: 'Literal value'
				evaluated: [ :literalCandidate | literalCandidate literalValue storeString ]);
		addColumn:
			((SpCheckBoxTableColumn
				title: 'Magic'
				evaluated: [ :literalCandidate | literalCandidate isMagic ])
				onActivation: [ :literalCandidate |
					self setCandidate: literalCandidate status: #beMagic ];
				onDesactivation: [ :literalCandidate | 
					self setCandidate: literalCandidate status: #beUnknown ];
				yourself);
		addColumn:
			((SpCheckBoxTableColumn
				title: 'Not magic'
				evaluated: [ :literalCandidate | literalCandidate isNotMagic ])
				onActivation: [ :literalCandidate | 
					self setCandidate: literalCandidate status: #beNotMagic ];
				onDesactivation: [ :literalCandidate | 
					self setCandidate: literalCandidate status: #beUnknown ];
				yourself);
		addColumn:
			((SpCheckBoxTableColumn
				title: 'Can not decide'
				evaluated: [ :literalCandidate | literalCandidate isCanNotDecide ])
				onActivation: [ :literalCandidate | 
					self setCandidate: literalCandidate status: #beCanNotDecide ];
				onDesactivation: [ :literalCandidate | 
					self setCandidate: literalCandidate status: #beUnknown ];
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

{ #category : #initialization }
MLSLiteralCandidatesPresenter >> setCandidate: aLiteralCandidate status: aSelector [
	aLiteralCandidate perform: aSelector.
	self refresh.
	literalCandidateStatusChangeBlock value: aLiteralCandidate
]

{ #category : #api }
MLSLiteralCandidatesPresenter >> whenLiteralCandidateSelectedChange: aBlock [
	literalCandidatesTable whenSelectionChangedDo: [ :selection |
		aBlock value: selection selectedItem ]
]

{ #category : #api }
MLSLiteralCandidatesPresenter >> whenLiteralCandidateStatusChange: aBlock [
	literalCandidateStatusChangeBlock := aBlock
]
