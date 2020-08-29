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
		'name',
		'memberNumber'
	],
	#category : #FredsLunch
}

{ #category : #accessing }
FredsLunchMember >> main: anObject [
	main := anObject.
]

{ #category : #accessing }
FredsLunchMember >> memberNumber [
	^memberNumber
]

{ #category : #accessing }
FredsLunchMember >> memberNumber: anInt [ 
	memberNumber := anInt
]

{ #category : #accessing }
FredsLunchMember >> name [ 
	^name
	
]

{ #category : #accessing }
FredsLunchMember >> name: aString [
	name := aString.
	
]
