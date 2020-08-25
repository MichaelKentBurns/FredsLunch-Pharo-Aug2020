"
A FredsLunchLunchList is a collection of all the lunches a group has enjoyed.

Instance Variables
	lunches:		<Object>
	main:		<Object>

lunches
	- xxxxx

main
	- xxxxx

"
Class {
	#name : #FredsLunchLunchList,
	#superclass : #Object,
	#instVars : [
		'main',
		'lunches'
	],
	#category : #FredsLunch
}

{ #category : #adding }
FredsLunchLunchList >> addLunch: aLunch [
	lunches add: aLunch.
]

{ #category : #initialization }
FredsLunchLunchList >> initialize [ 
	lunches := OrderedCollection new.
]

{ #category : #accessing }
FredsLunchLunchList >> main: theMain [
	"let the lunch list know where main is"

	|  |
	self.main := theMain.
	

]
