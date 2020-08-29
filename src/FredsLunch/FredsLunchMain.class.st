"
""
Main represents the execution of this application whose purpose is to hold all the information regarding a group of friends, the lunches they share together, and who paid for lunch.

Responsibility: 
* Interface with the OS environment, arguments.
* Initialize the basic object classes.
* Start and drive the application.
* Save and terminate teh state.

Collaborators:
* LunchCSV - permanent storage of a lunch group.
* Data - central hub of all data structures.

Public API and Key Messages:

  None.

Instance Variables:
	arguments:		An array of arguments provided by the user.
	numArgs:			Number of items in the arguments array.
	account: 			A string identifying a group of lunch friends.
	csv:		   		The table of lunches in the form of a spreadsheet. 
	data:				All of the data about the friends.
	filePathname: 	A file system pathname of the data file.
	lunches:			A chronologically ordered list of all of the lunches they have had together.
	members:			A list of the names of the friends.
				
Implementation Points:

""
"
Class {
	#name : #FredsLunchMain,
	#superclass : #Object,
	#instVars : [
		'arguments',
		'numArgs',
		'accountName',
		'data',
		'filePathname',
		'debug',
		'viewer'
	],
	#classInstVars : [
		'arguments',
		'numArgs',
		'account',
		'csv',
		'data',
		'filePathname',
		'lunches',
		'members'
	],
	#category : #FredsLunch
}

{ #category : #accessing }
FredsLunchMain class >> main [
	"Interface with OS environment, arguments."
	"scope: class-variables  &  class-instance-variables"	
   ""
	|  |
	Transcript show: 'Start Main:'.
	
]

{ #category : #accessing }
FredsLunchMain >> account [
	"answers the account associated with this execution"

	|  |
	^ accountName

]

{ #category : #accessing }
FredsLunchMain >> account: anAccountName [
      "sets the account name for this execution"
      accountName := anAccountName.
      ^ self
]

{ #category : #accessing }
FredsLunchMain >> accountName [
	"answers the account associated with this execution"

	|  |
	^ accountName

]

{ #category : #accessing }
FredsLunchMain >> accountName: anAccountName [
      "sets the account name for this execution"
      accountName := anAccountName.
      ^ self
]

{ #category : #accessing }
FredsLunchMain >> arguments [
	"return the command line arguments list"

	|  |
	^ arguments
]

{ #category : #accessing }
FredsLunchMain >> arguments: theArguments [
	arguments := theArguments.
	( theArguments isNotNil ) ifTrue:[ numArgs := arguments size.]
]

{ #category : #accessing }
FredsLunchMain >> data [
	"answers the LunchData object"

	|  |
	^ data
	

]

{ #category : #accessing }
FredsLunchMain >> debug [ 
	 | |
	^ debug.
]

{ #category : #accessing }
FredsLunchMain >> debug: doDebug [
	| |
	debug := doDebug.
	( doDebug ) ifTrue: [ Transcript show: 'Main: debug is True'; cr. ].
]

{ #category : #initialization }
FredsLunchMain >> initialize [
	"initial setup of Main"

	|  |
	super initialize.
	debug := false.
	debug ifTrue: [ Transcript show: 'Main: begin initialize'; cr. ].
		
	data := FredsLunchLunchData new.
	data debug: debug.
	data main: self.
	"data arguments: arguments."
   filePathname := '~/Development/gitRepos/FredsLunch-Pharo/Freds.csv'.
   Transcript show: 'Main initialized. filePathname ', filePathname; cr; cr.
 

	debug ifTrue: [ Transcript show: 'Main: end   initialize'; cr. ].
]

{ #category : #accessing }
FredsLunchMain >> pathName [ 
	"answer the pathName of the input file, either default or set"
	|  |
	^filePathname.
]

{ #category : #accessing }
FredsLunchMain >> pathName: aDataFilePathname [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| |
	filePathname := aDataFilePathname.
	data filePathname: filePathname.
]

{ #category : #running }
FredsLunchMain >> run [ 
	| |
	
	debug ifTrue: [ Transcript show: 'Main: begin run'; cr. ].
	data debug: debug.
	data filePathname: filePathname.
	data run.
	
	debug ifTrue: [ Transcript show: 'Main: begin run'; cr. ].
]
