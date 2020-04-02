"
An abstract class representing a filter on methods for the experiment

subclasses shold implement the #accept: boolean method that answers whether a method should be accepted for the experiment or not
"
Class {
	#name : #MLSExperimentFilter,
	#superclass : #Object,
	#category : #'MagicLiteralsSelector-experiment'
}

{ #category : #visiting }
MLSExperimentFilter >> accept: aMethod [
	self subclassResponsibility 
]
