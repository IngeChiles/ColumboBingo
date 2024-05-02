//  BingoViewModel.swift
//  ColumboBingo
//  Made with ♥︎ by Inge Chiles on 4/30/24.

import Foundation
class BingoViewModel: ObservableObject {
    
    @Published var itsBingo = false
    @Published var alertMessages = [
        "I knew you could do it!",
        "I have a great deal of respect for your profession.",
        "*Smacks Forehead*",
        "You know, I could never do what you do.",
        "You have a great deal of talent.",
        "I keep asking these questions, but I'll tell ya, I can't help myself. It's a habit.",
        "You win again! Isn't that a coincidence! I'll tell ya, this case is just full of 'em."
    ]
    
    let tropes = [
        "Is Sleepy",
        "Murderer Has Butler",
        "Raincoat Mentioned",
        "*Camera Zooms*",
        "Mentions Wife",
        "'One More Thing' X 2",
        "Smokes Cigar X 2",
        "Brags About Car",
        "Quiet Smile",
        "Dog",
        "Calls Wife",
        "Jazz Flute",
        "Instant Failed Getaway",
        "Eats Chili",
        "Asks For Coffee",
        "Analog Button Sounds"
    ]
    
    @Published var winningIndices: Array<Set<Int>> = [
        // Across Solutions
        [0, 1, 2, 3],
        [4, 5, 6, 7],
        [8, 9, 10, 11],
        [12, 13, 14, 15],
        
        // Down Solutions
        [0, 4, 8, 12],
        [1, 5, 9, 13],
        [2, 6, 10, 14],
        [3, 7, 11, 15],
        
        // Diagonal Solutions
        [0, 5, 10, 15],
        [12, 9, 6, 3]
    ]
    
    @Published var tappedIndices: Set<Int> = []
    
    func buttonTap(index: Int) {
        if tappedIndices.contains(index) {
            tappedIndices.remove(index)
        } else {
            tappedIndices.insert(index)
        }
        if containsWinningCombination(tappedIndices: tappedIndices, winningIndices: winningIndices) {
            bingoAlert()
        }
    }
    
    
    func containsWinningCombination(tappedIndices: Set<Int>, winningIndices: Array<Set<Int>>) -> Bool {
        for winningCombination in winningIndices {
            if winningCombination == tappedIndices {
                return true
            }
        }
        return false
    }
    
    
    func checkCombination() -> Bool {
        if containsWinningCombination(tappedIndices: tappedIndices, winningIndices: winningIndices) {
            print("Congratulations! You've won!")
            return true
        } else {
            print("Keep trying!")
            return false
        }
    }
    
    func bingoAlert() {
        itsBingo = true
    }
    
    func resetBoard() {
        tappedIndices.removeAll()
        itsBingo = false
    }
    
}
