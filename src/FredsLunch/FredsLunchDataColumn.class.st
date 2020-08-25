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
	columnBalance := 0.0.
]

{ #category : #accessing }
FredsLunchDataColumn >> isMember: aBoolean [
	isMember := aBoolean.
]

{ #category : #accessing }
FredsLunchDataColumn >> isSpecial: aBoolean [
	isSpecial := aBoolean.
]

{ #category : #accessing }
FredsLunchDataColumn >> name: aString [
	name := aString.
]
