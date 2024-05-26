//  BingoViewModel.swift
//  ColumboBingo
//  Made with ♥︎ by Inge Chiles on 4/30/24.

import Foundation
class BingoViewModel: ObservableObject {

    @Published var itsBingo = false
    @Published var tappedIndices: Set<Int> = []

    var currentColumboPhoto = "columbo-carrying-dog"

    // Array of photo strings for generating random photo of Columbo:
    private var columboPhotoArray = [
        "columbo-carrying-dog",
        "columbo-dog-scritches",
        "columbo-dog-smiling",
        "columbo-dog-staring",
        "columbo-dog-vet",
        "columbo-dog-workmen",
        "dog-licking-columbo"
    ]

    // Array of quotes for generating random alert message:
    @Published var alertMessages = [
        "I knew you could do it!",
        "I have a great deal of respect for your profession.",
        "*Smacks Forehead*",
        "You know, I could never do what you do.",
        "You have a great deal of talent.",
        """
        How did you do that?! I keep asking these questions, \
        but I'll tell ya, I can't help myself. It's a habit.
        """,
        """
        You win again! Isn't that a coincidence! I'll tell \
        ya, this case is just full of 'em.
        """
    ]

    // Array of classic Columbo tropes for grid buttons:
    let tropes = [
        "Is Sleepy",
        "Snobby Butler",
        "Talks About Raincoat",
        "70s Camera Zoom",
        "Talks About Wife",
        "One More Thing",
        "Lit Cigar",
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

    // Array of winning combinations of tapped tropes:
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

    func buttonTap(index: Int) {
        if tappedIndices.contains(index) {
            tappedIndices.remove(index)
        } else {
            tappedIndices.insert(index)
        }
        if containsWinningCombination(
            tappedIndices: tappedIndices,
            winningIndices: winningIndices
        ) {
            bingoAlert()
        }
    }

    // NEW:
    func containsWinningCombination(
        tappedIndices: Set<Int>,
        winningIndices: Array<Set<Int>>
    ) -> Bool {
        for winningCombination in winningIndices {
            if winningCombination.intersection(tappedIndices).count == 4 {
                return true
            }
        }
        return false
    }

    /*
     OLD: This function didn't account for the user
     tapping other tropes in addition to a final winning
     combination:

     func containsWinningCombination(
         tappedIndices: Set<Int>,
         winningIndices: Array<Set<Int>>
     ) -> Bool {
         for winningCombination in winningIndices {
             if winningCombination == tappedIndices {
                 return true
             }
         }
         return false
     }
     */

        func checkCombination() -> Bool {
        if containsWinningCombination(
            tappedIndices: tappedIndices,
            winningIndices: winningIndices
        ) {
            return true
        } else {
            return false
        }
    }

    func bingoAlert() {
        itsBingo = true
    }

    var photoIndex = 0

    func getPhoto() {
       let newPhoto = columboPhotoArray.randomElement()
        if currentColumboPhoto != newPhoto {
            currentColumboPhoto = newPhoto ?? "columbo-dog-workmen"
        }
    }

    func resetBoard() {
        tappedIndices.removeAll()
        itsBingo = false
        getPhoto()
    }

}
