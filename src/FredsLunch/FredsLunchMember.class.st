"
A FredsLunchMember is a person who has had lunch with the group.

Instance Variables
	main:		<Object>
	name:		<Object>

main
	- xxxxx

name
	- xxxxx

"
Class {
	#name : #FredsLunchMember,
	#superclass : #Object,
	#instVars : [
		'main',
		'name'
	],
	#category : #FredsLunch
}

{ #category : #accessing }
FredsLunchMember >> main: anObject [
	main := anObject.
]

{ #category : #accessing }
FredsLunchMember >> name: aString [
	name := aString.
	
]
