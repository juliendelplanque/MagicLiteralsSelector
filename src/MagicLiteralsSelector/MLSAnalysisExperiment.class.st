Class {
	#name : #MLSAnalysisExperiment,
	#superclass : #Object,
	#instVars : [
		'project',
		'experiment',
		'expert',
		'expertise'
	],
	#category : #'MagicLiteralsSelector-analysis'
}

{ #category : #'instance creation' }
MLSAnalysisExperiment class >> project: project experiment: id expert: expert expertise: expertise [
	^self new
		project: project ;
		experiment: id ;
		expert: expert ;
		expertise: expertise ;
		yourself
]

{ #category : #accessing }
MLSAnalysisExperiment >> experiment [
	^ experiment
]

{ #category : #accessing }
MLSAnalysisExperiment >> experiment: anObject [
	experiment := anObject
]

{ #category : #accessing }
MLSAnalysisExperiment >> expert [
	^ expert
]

{ #category : #accessing }
MLSAnalysisExperiment >> expert: anObject [
	expert := anObject
]

{ #category : #accessing }
MLSAnalysisExperiment >> expertise [
	^ expertise
]

{ #category : #accessing }
MLSAnalysisExperiment >> expertise: anObject [
	expertise := anObject
]

{ #category : #printing }
MLSAnalysisExperiment >> printOn: aStream [
		aStream << project << '-' << experiment asString << ' ' << expert
]

{ #category : #accessing }
MLSAnalysisExperiment >> project [
	^ project
]

{ #category : #accessing }
MLSAnalysisExperiment >> project: anObject [
	project := anObject
]
