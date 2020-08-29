"
A simple viewer that uses a spreadsheet.
"
Class {
	#name : #FredsLunchSpreadsheetViewer,
	#superclass : #FredsLunchViewer,
	#instVars : [
		'spreadsheet'
	],
	#category : #FredsLunch
}

{ #category : #initialization }
FredsLunchSpreadsheetViewer >> initialize [ 
	| |
	view := Spreadsheet new.
	
]

{ #category : #accessing }
FredsLunchSpreadsheetViewer >> refresh [ 
	| data csv headers columns rows |
	data := model.
	csv := data csv.
	columns := data columns.
	
	columns do: 
	    [ :each |
		   spreadsheet 
		 ]
]
