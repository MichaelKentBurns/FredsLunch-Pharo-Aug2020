"
A FredsLunchLunchData is the data hub of a lunch group.

Instance Variables
	lunches:		<Object>
	main:		<Object>
	members:		<Object>

lunches
	- xxxxx

main
	- xxxxx

members
	- xxxxx

"
Class {
	#name : #FredsLunchLunchData,
	#superclass : #Object,
	#instVars : [
		'main',
		'lunchList',
		'memberList',
		'account',
		'inputPathname',
		'csv',
		'arguments',
		'numArgs',
		'url',
		'debug',
		'columnNames',
		'columns',
		'dateColumnNumber',
		'dateTextColumnNumber',
		'firstBlankColumnNumber',
		'secondBlankColumnNumber',
		'rowBalanceColumnNumber',
		'firstMemberColumnNumber',
		'lastMemberColumnNumber',
		'dataTypes'
	],
	#category : #FredsLunch
}

{ #category : #initialization }
FredsLunchLunchData >> arguments [ 
	| |
	^arguments
	
]

{ #category : #initialization }
FredsLunchLunchData >> arguments: arrayOfArguments [
	| |
	arguments := arrayOfArguments.
	numArgs := arguments size.
	
]

{ #category : #'as yet unclassified' }
FredsLunchLunchData >> checkBalances [
	| |
	debug ifTrue: [ Transcript show: 'Data: begin checkBalances'; cr. ].
		
	
	debug ifTrue: [ Transcript show: 'Data: end   checkBalances'; cr. ].
]

{ #category : #accessing }
FredsLunchLunchData >> csv [
	^csv
	
]

{ #category : #accessing }
FredsLunchLunchData >> debug [ 
	| |
	^debug.
]

{ #category : #accessing }
FredsLunchLunchData >> debug: debugBool [
	| |
	debug := debugBool.
]

{ #category : #'as yet unclassified' }
FredsLunchLunchData >> filePathname: aPath [
	"set the data file pathname"
	| |
	inputPathname := aPath.
]

{ #category : #'as yet unclassified' }
FredsLunchLunchData >> gatherColumns [
	| columnNumber newColumn newMember memberNumber |
	debug ifTrue: [ Transcript show: 'Data: begin gatherColumns'; cr. ].
	columnNames := csv rows at: 1.
	columnNumber := 0.
	dateColumnNumber := 0.
	rowBalanceColumnNumber := 0.
	firstMemberColumnNumber := 0.
	lastMemberColumnNumber := 0. 
	memberNumber := 0.
	
	columnNames do: 
		[ :each | 
		  columnNumber := columnNumber + 1.
		  newMember := nil. 
		  newColumn := FredsLunchDataColumn new.
		  columns add: newColumn.
		  newColumn debug: debug; columnNumber: columnNumber; name: each .
			
		  "debug columnNumber name dataType isSpecial isMember columnBalance"
		
		  Transcript show: 'columnNumber ',(columnNumber asString), ': ', ( each asString ), '.'; cr .
	
		  (each isString & (each = 'Date')) ifTrue: [dateColumnNumber := columnNumber.
																		newColumn isSpecial: true;
																          		dataType: dataTypes date ].
	     (each isString & (each = 'DateText')) ifTrue: [ dateTextColumnNumber := columnNumber. 
																			newColumn isSpecial: true;
																						 dataType: dataTypes string ].
		  (each isString & (each = 'RowBalance')) ifTrue: [ rowBalanceColumnNumber := columnNumber.
																			newColumn isSpecial: true;
																						 dataType: dataTypes float ].
							
		  ( each isEmpty )
				ifTrue: 
					[ newColumn isIgnored: true.
					 ]
				ifFalse: 
					[ 
						(newColumn isSpecial)
					     ifFalse: 
							[
							   memberNumber := memberNumber + 1.
								newColumn isMember: true.
								newMember := FredsLunchMember new.
								newMember main: main; memberNumber: memberNumber; name: each.
								memberList addMember: newMember.
							]
						
					  
					].
		].
	
	debug ifTrue: 
		[ 
		 " dump the data types defined."
     	( dataTypes typesStart to: dataTypes typesEnd )
		 do: [ :n | 
	            Transcript show: 'dataType #',n asString, ' is named ', ( dataTypes numbered: n) asString; cr.
	 			].
		" dump the columns defined."	
		columns do:
		    [ :each |
			   Transcript show: 'column #', (each columnNumber asString) , ' is named ', each name ; cr. 
			 ]
		 ].
	   " dump the known group members."
	   memberNumber := 0.
		memberList members do: 
		    [ :each | 
			   memberNumber := memberNumber + 1.
				Transcript show: 'member #', (each memberNumber asString) , ' is named ', each name ; cr.
			 ].
	debug ifTrue: [ Transcript show: 'Data: end   gatherColumns'; cr. ].
]

{ #category : #'as yet unclassified' }
FredsLunchLunchData >> gatherData [
	| |
	debug ifTrue: [ Transcript show: 'Data: begin gatherData'; cr. ].
	self parseRawData.
	
	self gatherColumns.
	self gatherStartingBalance.
	self gatherLunches.
	
	self checkBalances.
	self printReport.
	debug ifTrue: [ Transcript show: 'Data: end   gatherData'; cr. ].
]

{ #category : #'as yet unclassified' }
FredsLunchLunchData >> gatherLunches [
	| |
	debug ifTrue: [ Transcript show: 'Data: begin gatherLunches'; cr. ].
		
	
	debug ifTrue: [ Transcript show: 'Data: end   gatherLunches'; cr. ].
]

{ #category : #'as yet unclassified' }
FredsLunchLunchData >> gatherMembers [
	| |
	debug ifTrue: [ Transcript show: 'Data: begin gatherMembers'; cr. ].
		
	
	debug ifTrue: [ Transcript show: 'Data: end   gatherMembers'; cr. ].
]

{ #category : #'as yet unclassified' }
FredsLunchLunchData >> gatherStartingBalance [
	| |
	debug ifTrue: [ Transcript show: 'Data: begin gatherStartingBalance'; cr. ].
		
	
	debug ifTrue: [ Transcript show: 'Data: end   gatherStartingBalance'; cr. ].
]

{ #category : #initialization }
FredsLunchLunchData >> initialize [
	"establish the basics of the data"
			
	|  |
	debug := false.
	columns := OrderedCollection new.
	memberList := FredsLunchMemberList new.
	lunchList := FredsLunchLunchList new.
	dataTypes := FredsLunchDataType new.
]

{ #category : #accessing }
FredsLunchLunchData >> main [
	"answer the main reference to a FredsLunchMain"
		
	|  |
	^main
]

{ #category : #accessing }
FredsLunchLunchData >> main: aMain [
	"let data know where the main is"

	|  |
	main := aMain.
]

{ #category : #parsing }
FredsLunchLunchData >> parseRawData [
	| lines rows |
	
	debug ifTrue: [ Transcript show: 'Data: begin parseRawData'; cr. ].
	csv := FredsLunchCSV new.
	"csv debug: debug."
	csv pathName: inputPathname.
	csv readFile.	
   debug ifTrue: [ 
						Transcript show: 'Data: summary'; cr.
						lines := csv lines.
						Transcript show: 'lines = ', (lines asString); cr.
						rows := csv rows.
						Transcript show: 'rows = ', (rows asString); cr.
					  ].



	debug ifTrue: [ Transcript show: 'Data: end   parseRawData'; cr. ].
]

{ #category : #printing }
FredsLunchLunchData >> printReport [
	| |
	debug ifTrue: [ Transcript show: 'Data: begin printReport'; cr. ].
		
	
	debug ifTrue: [ Transcript show: 'Data: end   printReport'; cr. ].
]

{ #category : #running }
FredsLunchLunchData >> run [ 
	| |
	debug ifTrue: [ Transcript show: 'Data: begin main run'; cr. ].
	self gatherData.
	
	debug ifTrue: [ Transcript show: 'Data: end   main run'; cr. ].
	
]

{ #category : #initialization }
FredsLunchLunchData >> setUrl: aDataURL [
	| |
	url := aDataURL.
]
