"
A FredsLunchCSV is a CSV file and all the data in it.

Instance Variables

"
Class {
	#name : #FredsLunchCSV,
	#superclass : #Object,
	#instVars : [
		'url',
		'pathName',
		'file',
		'lines',
		'headerLine',
		'headers',
		'headerLineNumber',
		'startingBalanceLine',
		'startingBalanceLineNumber',
		'endingBalanceLine',
		'endingBalanceLineNumber',
		'rows',
		'columns',
		'debug',
		'separator',
		'lineSeparator',
		'possibleLineSeparators',
		'firstColumnName',
		'hasData',
		'isNil'
	],
	#category : #FredsLunch
}

{ #category : #adding }
FredsLunchCSV >> addLine: aLine [
	| sizeBefore sizeAfter |

	sizeBefore := lines size.
	lines addLast: aLine.
	
	sizeAfter := lines size.
	
   self parseRow: sizeAfter.
]

{ #category : #adding }
FredsLunchCSV >> addRow: aRow [
	| sizeBefore sizeAfter |
	debug ifTrue: [ Transcript show: 'addRow: ',aRow asString; cr. 
						self halt. ].
   (lines isNil) ifTrue: [ rows := OrderedCollection new ].

	sizeBefore := rows size.
	rows addLast: aRow.
	
	sizeAfter := rows size.
]

{ #category : #'as yet unclassified' }
FredsLunchCSV >> columnNames [
	| |
	^ columns.
]

{ #category : #accessing }
FredsLunchCSV >> debug [ 
	^ debug.
	
]

{ #category : #accessing }
FredsLunchCSV >> debug: value [ 
	debug := value.
]

{ #category : #initialization }
FredsLunchCSV >> initialize [ 
	| |
	hasData := false.
	lines := OrderedCollection new.
	rows := OrderedCollection new.
	debug := false.
]

{ #category : #accessing }
FredsLunchCSV >> lines [ 
	^lines
]

{ #category : #accessing }
FredsLunchCSV >> lines: someLines [
	lines := someLines.
	
]

{ #category : #parsing }
FredsLunchCSV >> parseColumns: aLine [
	"parse a CSV line into it's columns and return an array of them."	
	| cols alNE text |
	debug ifTrue: [ self halt ].
	
	alNE := ( aLine isNotEmpty ).

"
	alNE ifTrue: [ Transcript show: ' alNE is true'; cr.]
			ifFalse: [ Transcript show: ' alNE is false'; cr. ].
"	
	alNE ifTrue: [
					  debug ifTrue: [ self halt ].
					  cols := Array new.
					  text := ''.
					  aLine do: 	[ :c | c == #, 
										ifFalse: [ "| str |	str := '' writeStream.
															 	str nextPutAll: text;
										 							 nextPut: c.
										 						text := str contents. "
														text := text, (c asString).
													]
										ifTrue: [ cols add: text. text := '' ]
					  				]
		     		].
			debug ifTrue: [ self halt ].
	^ cols.
]

{ #category : #parsing }
FredsLunchCSV >> parseRow: lineNumber [ 
   | lineText row lineParser |
   lineText := self lines at: lineNumber.
	lineParser := FredsLunchCSVlineParser new.
	lineParser debug: debug.
	row := lineParser from: lineText.
	
	self addRow: row.
	
	
]

{ #category : #accessing }
FredsLunchCSV >> pathName [ 
	^ pathName
	
]

{ #category : #accessing }
FredsLunchCSV >> pathName: aPath [
	pathName := aPath.
	^ self
	
]

{ #category : #processing }
FredsLunchCSV >> readFile [ 
	| "dir" characterStream aLine |
	"dir := FileSystem disk workingDirectory."
	(File named: pathName) 
	 	readStreamDo: 
		  [ :in | 
				characterStream := ZnCharacterReadStream on: in.
				Array streamContents: 
					[ :out | [ characterStream atEnd ] whileFalse: 
							[
								| cols | 
								aLine := characterStream nextLine.
								self addLine: aLine.
								debug ifTrue: [ 
									  Transcript show: 'line# ', (lines size asString), ' ', aLine; cr.
									 ].
							
								out nextPut: aLine.
								
								cols := self parseColumns: aLine.
								
							] ] ].

	 
]

{ #category : #accessing }
FredsLunchCSV >> rows [ 	
	^ rows
]

{ #category : #accessing }
FredsLunchCSV >> rows: aSetOfRows [
	rows := aSetOfRows
	
]
