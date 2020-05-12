"
Represent a class containing a MLSMethodExternal
"
Class {
	#name : #MLSClassExternal,
	#superclass : #Object,
	#instVars : [
		'package',
		'name'
	],
	#classInstVars : [
		'instances'
	],
	#category : #'MagicLiteralsSelector-analysis'
}

{ #category : #'instance creation' }
MLSClassExternal class >> forPackage: packageName name: className [
	^instances
		at: className
		ifAbsentPut: [ self new package: packageName ; name: className ; yourself ]

]

{ #category : #'class initialization' }
MLSClassExternal class >> initialize [
	super initialize.
	self resetInstances
]

{ #category : #initialization }
MLSClassExternal class >> resetInstances [
	instances := Dictionary new
]

{ #category : #accessing }
MLSClassExternal >> compiledMethodAt: selector ifPresent: aBlock ifAbsent: absentBlock [
	"first block useless, method cannot be found inexternal class"
	^absentBlock value
]

{ #category : #accessing }
MLSClassExternal >> name [
	^ name
]

{ #category : #accessing }
MLSClassExternal >> name: anObject [
	name := anObject
]

{ #category : #accessing }
MLSClassExternal >> package [
	^ package
]

{ #category : #accessing }
MLSClassExternal >> package: anObject [
	package := anObject
]
