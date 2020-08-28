"
This describes a column in the CSV and information needed about it during gatherColumns and later.
"
Class {
	#name : #FredsLunchDataColumn,
	#superclass : #Object,
	#instVars : [
		'debug',
		'columnNumber',
		'name',
		'dataType',
		'isSpecial',
		'isMember',
		'isIgnored',
		'columnBalance'
	],
	#category : #FredsLunch
}

{ #category : #accessing }
FredsLunchDataColumn >> columnBalance [
	^columnBalance.
]

{ #category : #accessing }
FredsLunchDataColumn >> columnBalance: aFloat [
	columnBalance := aFloat.
]

{ #category : #accessing }
FredsLunchDataColumn >> columnNumber [
	^columnNumber.
]

{ #category : #accessing }
FredsLunchDataColumn >> columnNumber: anInt [ 
	| |
	columnNumber := anInt
	
]

{ #category : #accessing }
FredsLunchDataColumn >> dataType [ 
	^dataType
	
]

{ #category : #accessing }
FredsLunchDataColumn >> dataType: aType [
	| |
	dataType := aType
]

{ #category : #accessing }
FredsLunchDataColumn >> debug: aBoolean [
| |
debug:= aBoolean.
]

{ #category : #initialization }
FredsLunchDataColumn >> initialize [ 
	debug := false.
	columnNumber := 0.
	name := ''.
	dataType := 0.
	isSpecial := false.
	isMember := false.
	isIgnored := false.
	columnBalance := 0.0.
]

{ #category : #accessing }
FredsLunchDataColumn >> isIgnored [
	^isIgnored
]

{ #category : #accessing }
FredsLunchDataColumn >> isIgnored: aBoolean [
	isIgnored := aBoolean.
]

{ #category : #accessing }
FredsLunchDataColumn >> isMember [ 
	^isMember
]

{ #category : #accessing }
FredsLunchDataColumn >> isMember: aBoolean [
	isMember := aBoolean.
]

{ #category : #accessing }
FredsLunchDataColumn >> isSpecial [ 
	^isSpecial
	
]

{ #category : #accessing }
FredsLunchDataColumn >> isSpecial: aBoolean [
	isSpecial := aBoolean.
]

{ #category : #accessing }
FredsLunchDataColumn >> name [ 
	^name
]

{ #category : #accessing }
FredsLunchDataColumn >> name: aString [
	name := aString.
]
