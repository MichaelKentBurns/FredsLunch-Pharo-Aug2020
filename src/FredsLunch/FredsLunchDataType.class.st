"
Constants for the various data types that can be in a CSV column.
"
Class {
	#name : #FredsLunchDataType,
	#superclass : #Object,
	#instVars : [
		'int',
		'string',
		'date'
	],
	#category : #FredsLunch
}

{ #category : #accessing }
FredsLunchDataType >> date [ 
	^ date.
]

{ #category : #initialization }
FredsLunchDataType >> initialize [
   int := 1.
	string := 2.
	date := 3.
	
]

{ #category : #accessing }
FredsLunchDataType >> int [
	^ int.
]

{ #category : #accessing }
FredsLunchDataType >> string [ 
   ^ string.
]
