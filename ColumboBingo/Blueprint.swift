//  Blueprint.swift
//  ColumboBingo
//  Made with ♥︎ by Inge Chiles on 4/29/24.

import Foundation
/*
 (Moonshot)ZGrid of 9 adaptive GridItems
 (Moonshot)ZGrid on top of that/populate pre-existing ZGrid with array of columbo facts -- i know i can do that from moonshot app
 (TicTac) @State bool properties or binding properties for each grid item to establish whether a bingo tile is selected/unselected
 (GuessTheFlag) Method that presents an alert when all 9 tiles are selected
 
 Assets:
 Columbo font
 png of crossed cigars for isSelected on grid
 frame for grid that looks like old tv/70's bg
 Columbo gif/something changes when you select a tile
 launchscreen
 app icon
 
 Tests:
 Test that when a tile .onTouch the property changes from one bool to the other, or
 That when the cigarIsShown property changes, an X of cigars appears over the selected square
 Test that when all 9 tiles are selected, an alert isPresented is == true
 Test that when 0-8 tiles are selected, an alert isPresented is == false
 Test that when the textfield isSelected
 
 
 Bonus:
 if onPressed == longer, magnify tile
 Textfield to enter episode name or number + share with friends
 
 Columbo Bingo:
 1) Brags about car
 2) Cigar Commented On
 3) *Smacks Forehead*
 4) "One More Thing" X 2
 5) Mentions Wife
 6) 70's Rapid Camera Zoom
 7) Raincoat Commented On
 8) Murderer has Butler
 9) Is Sleepy
 
 
 -Look at button format in TicTac to see syntax
 */
