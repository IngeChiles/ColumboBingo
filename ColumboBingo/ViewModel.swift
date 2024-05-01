//  ViewModel.swift
//  ColumboBingo
//  Made with ♥︎ by Inge Chiles on 4/30/24.

import Foundation
class BingoModel: ObservableObject {
    
    @Published var itsBingo = false
    @Published var tropes = [
        "Is Sleepy",
        "Murderer Has Butler",
        "Raincoat Mentioned",
        "*Camera Zooms*",
        "Mentions Wife",
        "'One More Thing' X 2",
        "Smacks Forehead",
        "Smokes Cigar X 2",
        "Brags About Car",
        "Quiet Smile",
        "Dog",
        "Calls Wife",
        "Combover",
        "Jazz Flute",
        "Instant Failed Getaway",
        "Eats Chili",
        "Asks For Coffee",
        "Analog Button Sounds"
    ]
    
    @Published var tappedIndices: Set<Int> = []
    
    func buttonTap(index: Int) {
        if tappedIndices.contains(index) {
            tappedIndices.remove(index)
        } else {
            tappedIndices.insert(index)
        }
        
        if tappedIndices.count == tropes.count {
            bingoAlert()
        }
    }
    
    func bingoAlert() {
        itsBingo.self = true
    }
    
    func resetBoard() {
        tappedIndices.removeAll()
    }
}
