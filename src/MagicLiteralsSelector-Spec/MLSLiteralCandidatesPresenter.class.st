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

{ #category : #accessing }
MLSLiteralCandidatesPresenter >> checkBoxColumnWidth [
	^75
]

{ #category : #initialization }
MLSLiteralCandidatesPresenter >> initializePresenters [
	literalCandidateStatusChangeBlock := [ :literalCandidate |  ].
	literalCandidatesTable := self newTable.
	literalCandidatesTable
		addColumn:
			((SpStringTableColumn title: 'Literal value')
				evaluated: [ :literalCandidate | String streamContents: [:s | literalCandidate literalValue printOn: s] ] ;
				yourself) ;
		addColumn:
			((SpCheckBoxTableColumn title: 'Magic')
				evaluated: [ :literalCandidate | literalCandidate isMagic ] ;
				onActivation: [ :literalCandidate |
					self setCandidate: literalCandidate status: #beMagic ];
				onDesactivation: [ :literalCandidate | 
					self setCandidate: literalCandidate status: #beUnknown ];
				width: self checkBoxColumnWidth ;
				yourself);
		addColumn:
			((SpCheckBoxTableColumn title: 'Not magic')
				width: self checkBoxColumnWidth ;
				evaluated: [ :literalCandidate | literalCandidate isNotMagic ] ;
				onActivation: [ :literalCandidate | 
					self setCandidate: literalCandidate status: #beNotMagic ];
				onDesactivation: [ :literalCandidate | 
					self setCandidate: literalCandidate status: #beUnknown ];
				yourself);
		addColumn:
			((SpCheckBoxTableColumn title: 'Not sure')
				width: self checkBoxColumnWidth ;
				evaluated: [ :literalCandidate | literalCandidate isCanNotDecide ] ;
				onActivation: [ :literalCandidate | 
					self setCandidate: literalCandidate status: #beCanNotDecide ];
				onDesactivation: [ :literalCandidate | 
					self setCandidate: literalCandidate status: #beUnknown ];
				yourself)
]

{ #category : #accessing }
MLSLiteralCandidatesPresenter >> literalCandidates [
	^ literalCandidatesTable items
]

{ #category : #accessing }
MLSLiteralCandidatesPresenter >> literalCandidatesTable [
	^ literalCandidatesTable
]

{ #category : #accessing }
MLSLiteralCandidatesPresenter >> literalsCandidates: aListOfCandidates [
	literalCandidatesTable items: aListOfCandidates.
	literalCandidatesTable unselectAll.
	literalCandidatesTable selectIndex: 1
]

{ #category : #accessing }
MLSLiteralCandidatesPresenter >> refresh [
	self literalsCandidates: self literalCandidates
]

{ #category : #initialization }
MLSLiteralCandidatesPresenter >> setCandidate: aLiteralCandidate status: aSelector [
	aLiteralCandidate perform: aSelector.
	literalCandidatesTable selectItem: aLiteralCandidate.
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
