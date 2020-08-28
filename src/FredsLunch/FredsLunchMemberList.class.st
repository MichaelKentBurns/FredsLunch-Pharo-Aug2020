"
A FredsLunchMemberList is a list of all the members of the lunch group.

Instance Variables
	main:		<Object>

main
	- xxxxx

"
Class {
	#name : #FredsLunchMemberList,
	#superclass : #Object,
	#instVars : [
		'main',
		'members'
	],
	#category : #FredsLunch
}

{ #category : #adding }
FredsLunchMemberList >> addMember: aMember [
	members add: aMember.
]

{ #category : #initialization }
FredsLunchMemberList >> initialize [ 
	members := OrderedCollection new.
]

{ #category : #accessing }
FredsLunchMemberList >> main [ 
	^main
]

{ #category : #accessing }
FredsLunchMemberList >> members [ 
	^members
]
