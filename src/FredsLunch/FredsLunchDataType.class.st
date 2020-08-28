"
Constants for the various data types that can be in a CSV column.
"
Class {
	#name : #FredsLunchDataType,
	#superclass : #Object,
	#instVars : [
		'int',
		'float',
		'currency',
		'string',
		'date',
		'typeNames',
		'typeNumbers',
		'typesStart',
		'typesEnd'
	],
	#classInstVars : [
		'typeNames'
	],
	#category : #FredsLunch
}

{ #category : #'instance creation' }
FredsLunchDataType class >> named: aString [
	| anInt |
	anInt := aString asSymbol 
]

{ #category : #accessing }
FredsLunchDataType >> currency [
	^currency
]

{ #category : #accessing }
FredsLunchDataType >> date [ 
	^ date.
]

{ #category : #accessing }
FredsLunchDataType >> float [
	^float
	
]

{ #category : #initialization }
FredsLunchDataType >> initialize [
	
	typesStart := 1.
	typesEnd := 5.
	typeNames := Array new: typesEnd.
	typeNumbers := Dictionary new.
   int := 1.
		typeNames at: int put: #int.
		typeNumbers at: #int put: int.
	float := 2.
		typeNames at: float put: #float.
		typeNumbers at: #float put: float.
	currency := 3.
		typeNames at: currency put: #currency.
		typeNumbers at: #currency put: currency.
	string := 4.
		typeNames at: string put: #string.
		typeNumbers at: #string put: string.
	date := 5.
		typeNames at: date put: #date.
		typeNumbers at: #date put: date.
	
]

{ #category : #accessing }
FredsLunchDataType >> int [
	^ int.
]

{ #category : #'instance creation' }
FredsLunchDataType >> named: aSymbol [
	^ typeNumbers at: aSymbol.
	
]

{ #category : #'as yet unclassified' }
FredsLunchDataType >> numbered: anInt [
	^ typeNames at: anInt
	
]

{ #category : #accessing }
FredsLunchDataType >> string [ 
   ^ string.
]

{ #category : #accessing }
FredsLunchDataType >> typesEnd [
	^ typesEnd
]

{ #category : #accessing }
FredsLunchDataType >> typesStart [
	^typesStart
]
