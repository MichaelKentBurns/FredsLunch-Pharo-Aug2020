"
Abstract class to define interface for a variety of viewers.
"
Class {
	#name : #FredsLunchViewer,
	#superclass : #Object,
	#instVars : [
		'model',
		'view'
	],
	#category : #FredsLunch
}

{ #category : #initialization }
FredsLunchViewer >> initialize [
Transcript show: 'Data: begin gatherMembers'; cr.
Transcript show: 'Viewer: begin initialize.'; cr.

Transcript show: 'Viewer: end   initialize'; cr.
  ^ self

]

{ #category : #accessing }
FredsLunchViewer >> model: aModel [
	model := aModel.
	
]

{ #category : #accessing }
FredsLunchViewer >> refresh [ 
	| |
	
]
