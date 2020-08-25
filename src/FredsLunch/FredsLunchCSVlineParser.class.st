"
Class: FredsLunchCSVlineParser
Responsibility  To parse a single line from the CSV file and return an OrderedCollection of Cells.
Collaboration: Only used by FredsLunchCSV.

"
Class {
	#name : #FredsLunchCSVlineParser,
	#superclass : #Object,
	#instVars : [
		'debug',
		'line',
		'state',
		'currentElement',
		'collection'
	],
	#category : #FredsLunch
}

{ #category : #accessing }
FredsLunchCSVlineParser >> collection [ 
  ^ collection

]

{ #category : #accessing }
FredsLunchCSVlineParser >> collection: aCollection [ 
  collection := aCollection

]

{ #category : #accessing }
FredsLunchCSVlineParser >> currentElement [
   ^ currentElement
]

{ #category : #accessing }
FredsLunchCSVlineParser >> currentElement:  anElement [
	currentElement := anElement
	
]

{ #category : #accessing }
FredsLunchCSVlineParser >> debug [ 
	^debug
	
]

{ #category : #accessing }
FredsLunchCSVlineParser >> debug: value [	
	debug := value
	
]

{ #category : #'instance creation' }
FredsLunchCSVlineParser >> from: aLine [
	| result |
	line := aLine.
	state := #start:.debug ifTrue: [
		Transcript show: 'now parsing line (', aLine, ')' ; cr.
		self halt].
	self parse.
	result := self collection collect: [  :each | self simpleConversion: each ].
   debug ifTrue: [
		Transcript show: 'results from parsing line (', aLine, ') is ', result asString; cr.
		self halt].

	^ result.
]

{ #category : #execution }
FredsLunchCSVlineParser >> handleNext: next basedOnCurrentStateFrom: stream [ 
	" determine what to do with the character based on current state"
	
	| msg |
	msg := (self state asString, 'with:') asSymbol.
	self perform: msg with: next with: stream.
	
]

{ #category : #initialization }
FredsLunchCSVlineParser >> initialize [ 	
	state := #start:.
	collection := OrderedCollection new.
	currentElement := WriteStream on: String new.
	debug := false.
]

{ #category : #accessing }
FredsLunchCSVlineParser >> line [
	^ line
	
]

{ #category : #parsing }
FredsLunchCSVlineParser >> parse [
	| stream |
	stream := self line readStream.
	[  stream atEnd ]
		whileFalse: [  | next | 
			next := stream peek.
			"next = $, 
				If it is a comma after a comma, its an empty cell
				ifTrue: [ 
							collection add: ''.  add an empty cell 
							stream next ].   and swallow the comma
							currentElement should be empty and stay that way.
		   "
			self handleNext: next basedOnCurrentStateFrom: stream].
	state = #processing: 
		ifTrue: [ debug ifTrue: [self halt]. collection add: self currentElement contents trim ].
	^ self collection 
]

{ #category : #'execution-states' }
FredsLunchCSVlineParser >> processing: aCharacter with: stream [ 
	stream next.
	aCharacter = $,
		ifTrue: [ debug ifTrue: [self halt].
					collection add: self currentElement contents trim.
					state := #start: ]
		ifFalse: [ self currentElement nextPut: aCharacter ]
]

{ #category : #private }
FredsLunchCSVlineParser >> simpleConversion: element [ 
	|  converted isBS iAD size sizeGT0 |
	converted := element.
	isBS := element isByteString.
	iAD := element isAllDigits.
	size := element size.
	sizeGT0 := size > 0.

	debug ifTrue: [self halt].
(isBS & sizeGT0 ) ifTrue:
	[ 
		 ( (isBS) & (sizeGT0))
			ifTrue: [
		 				( iAD | ((converted at: 1) = $-) )
						ifTrue: [  converted := converted asNumber ]]
		].
	^ converted 
]

{ #category : #'execution-states' }
FredsLunchCSVlineParser >> start: aCharacter with: stream [ 
   | aCharacterTemp |
	aCharacterTemp := aCharacter.
	stream next.
	[aCharacterTemp = $,]
		whileTrue: [ 
					 aCharacterTemp := stream next.
					 collection add: ''.
				 ].
	aCharacterTemp isNil ifFalse: [ 
			aCharacterTemp = $"
				ifTrue: [  state := #startedQuote: ]
				ifFalse: [ state := #processing: .
								currentElement := WriteStream on: String new.
								currentElement nextPut: aCharacterTemp ].
		 	]
]

{ #category : #'execution-states' }
FredsLunchCSVlineParser >> startedQuote: aCharacter with: stream [ 
	| element |
	element := stream upTo: $".
	collection add: element.
	stream upTo: $,.
	state := #start: 
]

{ #category : #accessing }
FredsLunchCSVlineParser >> state [ 
	^ state
	
]

{ #category : #accessing }
FredsLunchCSVlineParser >> state: aState [
	state := aState
	
]
