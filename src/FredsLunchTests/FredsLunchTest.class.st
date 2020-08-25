Class {
	#name : #FredsLunchTest,
	#superclass : #TestCase,
	#instVars : [
		'main',
		'lunches',
		'members'
	],
	#classInstVars : [
		'main'
	],
	#category : #FredsLunchTests
}

{ #category : #initialization }
FredsLunchTest class >> setUp [
	"prepare a main before each test"

	Transcript show: 'FredsLunchTest>>setUp has run.'; cr
	

]

{ #category : #test }
FredsLunchTest class >> testMainNew [
	"create a Main and test how it is initialized"

	| account  data lunchList memberList |
	
	"Create a new fredsLunch"
	main := FredsLunchMain new.
	
	"self assert: (main )."
	self deny: (main data isNil ).
	self deny: (main lunches isNil ).
	self assert: (main arguments isNil ).
	self assert: (main account isNil ).
      self haltIf: true.

      "set and test the accountName"
	main account: 'Freds'.
	account := main account.
	self haltIf: ( main account isNil ).
	self deny: ( account isNil ).
	
	"check that a lunchData was created"
      data := main data.
      self haltIf: ( main data isNil ).
	self deny: ( data isNil ).

]

{ #category : #running }
FredsLunchTest >> setUp [
	| transcript |
	transcript := Transcript.
	transcript
		show: 'FredsLunchTest>>setUp has run.';
		cr
]

{ #category : #tests }
FredsLunchTest >> testCSVNew [
	| csv path |
	Transcript show: 'FredsLunchTest:testCSVNew'; cr; cr.
	csv := FredsLunchCSV new.
	self deny: csv isNil.
	path := csv pathName.
	self assert: path isNil.
]

{ #category : #tests }
FredsLunchTest >> testCSVlines [
	| csv lines aRow rowNumber |
	Transcript show: 'FredsLunchTest:testCSVLines'; cr; cr.
	csv := FredsLunchCSV new.
	self deny: csv isNil.
	lines := csv lines.
	self deny: lines isNil.
	csv addLine: 'Date,DateText,,Craig,Danny,Greg,Jerry,Mike,Rod,,RowBalance,'.
	lines := csv lines.
	self deny: lines isNil.
	self deny: lines size = 0.
	
	csv addLine: '(numeric),(text),,1,1,-2,-6,-1,0,,,';
		 addLine: ',,,,,,,,,,,testing';
		 addLine: '6-Mar-2020,Mar 6,,-2,,1,,1,,,0,';
		 addLine: '28-Feb-2020,Feb 28,,1,,-2,,1,,,0,'.
	Transcript show: lines; cr .

	1 to: csv lines size do: [ :x | 
		 | text |
		 text := 'line number ', ( x asString ), ' is ', ( csv lines at: x).
		 Transcript show: text ; cr .
		
		 ].
	 
	rowNumber := 0.
	csv rows do: [ :each | 
		 | text |
		 rowNumber := rowNumber + 1.
		 Transcript show: 'Row number ';
						show: rowNumber ;
						show: ' is ';
						show: each;
						cr .
		 ].


]

{ #category : #tests }
FredsLunchTest >> testDataCSV [
	| csv lines data|
	Transcript show: 'FredsLunchTest:testDataCSV'; cr; cr.
	csv := FredsLunchCSV new.
	csv debug: false.
	csv pathName: '~/Development/gitRepos/FredsLunch-Pharo/Freds.csv'.
	csv readFile.
	data := FredsLunchLunchData new.
	data main: self. 
]

{ #category : #tests }
FredsLunchTest >> testEmptyCells [
	| csv lines aRow rowNumber numberOfColumns |
	Transcript show: 'FredsLunchTest:testEmptyCells'; cr; cr.
	csv := FredsLunchCSV new.
   "csv debug: true."
	"csv addLine: 'Date,DateText,none,Craig,Danny,Greg,Jerry,Mike,Rod,none,RowBalance,'."
   "self halt."
	"csv addLine: '(numeric),(text),,1,1,-2,-6,-1,0,,,'."
	csv	 addLine: ',,,,,,,,,,,testing'.

	rowNumber := 0.
	csv rows do: [ :each | 
		 rowNumber := rowNumber + 1.
		 rowNumber = 1 ifTrue: [ numberOfColumns := each size].
		 Transcript show: 'Row number ';
						show: rowNumber ;
						show: ' has ';
						show: each size;
						show: ' elements. ';
						show: ' Content is : ';
						show: each;
						cr .
		self assert: each size = numberOfColumns.
		 ].


]

{ #category : #tests }
FredsLunchTest >> testMainNew [
	|  data accountName args |
	Transcript show: 'FredsLunchTest:testMainNew'; cr; cr.	
	
	main := FredsLunchMain new.

	self
		deny: main data isNil;
		assert: main arguments isNil;
		assert: main accountName isNil.
		
	main account: 'Freds'.
	main arguments: #('-f' 'arg2' 'arg3').	
	accountName := main accountName.
	main run.
	data := main data.
	
	self
		haltIf: self  isNil;
		deny: data isNil.
	data := main data.
	
	self
		haltIf: main data isNil;
		deny: data isNil.
		
	self haltIf: main arguments isNil.
	

]

{ #category : #tests }
FredsLunchTest >> testMainRun [
	|  data accountName args |
	
	Transcript show: 'FredsLunchTest:testMainRun'; cr; cr.
	main := FredsLunchMain new.
	main debug: true.
	self
		deny: main data isNil;
		assert: main arguments isNil;
		assert: main accountName isNil.
		
	main account: 'Freds'.
	main arguments: #('-f' 'arg2' 'arg3').	
	accountName := main accountName.
	main run.
	data := main data.
	
	self
		haltIf: self  isNil;
		deny: data isNil.
	
	self
		haltIf: main data isNil;
		deny: data isNil.
		
	self haltIf: main arguments isNil.
	

]

{ #category : #tests }
FredsLunchTest >> testReadFile [
	| csv lines |
	Transcript show: 'FredsLunchTest:testReadFile'; cr; cr.
	csv := FredsLunchCSV new.
	csv debug: false.
	csv pathName: '~/Development/gitRepos/FredsLunch-Pharo/Freds.csv'.
	
	csv readFile.
	lines := csv lines.
	
]

{ #category : #tests }
FredsLunchTest >> testReadFileAndShow [
	| c lines lineNumber rows |
		Transcript show: 'FredsLunchTest:testReadFileAndShow'; cr; cr.
	c := FredsLunchCSV new.
	c debug: false.
	c pathName: '~/Development/gitRepos/FredsLunch-Pharo/Freds.csv'.
	c readFile.
	lines := c lines.
	lineNumber := 1.
	lines do: 
	  [ :each |
		 Transcript show: 'line #', (lineNumber asString), ': ', each; cr.
		 lineNumber := lineNumber + 1.
	  ]

]

{ #category : #tests }
FredsLunchTest >> testReadLines [
	| c lines |
	Transcript show: 'FredsLunchTest:testReadLines'; cr; cr.
	c := FredsLunchCSV new.
	c debug: false.
	c pathName: '~/Development/gitRepos/FredsLunch-Pharo/Freds.csv'.
	
	c readFile.
	lines := c lines.
	
]
