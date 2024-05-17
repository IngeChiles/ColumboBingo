//  ColumboBingoTests.swift
//  ColumboBingoTests
//  Made with ♥︎ by Inge Chiles on 5/2/24.

import XCTest
@testable import ColumboBingo

final class ColumboBingoTests: XCTestCase {
    var subject: BingoViewModel!

    override func setUp() {
        subject = BingoViewModel()
    }

    // MARK: - Test buttonTap(index:)

    func testButtonTapAdd() {
        // test that when buttonTap() is called, an array is added to tappedIndices.

        subject.buttonTap(index: 0)
        XCTAssertEqual(subject.tappedIndices, [0])
    }

    func testButtonTapRemove() {
        // test that when the buttonTap is called, the button is tapped and the property tappedIndices gets an array 
        // removed from it.

        subject.buttonTap(index: 0)
        subject.buttonTap(index: 0)
        XCTAssertTrue(subject.tappedIndices.isEmpty)
    }
    
    func testButtonTapCallsAlert() {
        // test that within buttonTap(), when containsWinningCombination() is called and the result is true,
        // bingoAlert() is called.

        subject.buttonTap(index: 0)
        XCTAssertFalse(subject.itsBingo)

        subject.buttonTap(index: 1)
        XCTAssertFalse(subject.itsBingo)

        subject.buttonTap(index: 2)
        XCTAssertFalse(subject.itsBingo)

        subject.buttonTap(index: 3)
        XCTAssertTrue(subject.itsBingo)
    }

    func testButtonTapNonWinningCombinationNoAlert() {
        // test that when a user inputs a non-winning combination, itsBingo = false.
        subject.buttonTap(index: 0)
        XCTAssertFalse(subject.itsBingo)

        subject.buttonTap(index: 1)
        XCTAssertFalse(subject.itsBingo)

        subject.buttonTap(index: 2)
        XCTAssertFalse(subject.itsBingo)

        subject.buttonTap(index: 4)
        XCTAssertFalse(subject.itsBingo)
    }

    // MARK: - Test containsWinningCombination(tappedIndices:winningIndices)

    func testContainsWinningCombination() {
        // test that when tappedIndices == any winningCombination, it returns true.

        let didWin = subject.containsWinningCombination(
            tappedIndices: [0, 1, 2, 3], winningIndices: subject.winningIndices)

        XCTAssertTrue(didWin)
    }

    func testDoesNotContainWinningCombination() {
        // test that when tappedIndices != any winningcombination inside winningCombination, 
        // winningCombination returns false.

        let nonWin = subject.containsWinningCombination(
            tappedIndices: [0, 1, 2, 4], winningIndices: subject.winningIndices)

        XCTAssertFalse(nonWin)
    }


    // MARK: - Test checkCombination()

    func testCheckCombination() {
        // test that if containsWinningCombination is called and returns true, checkCombination returns true.
        subject.tappedIndices = [0, 1, 2, 3]
        let didWin = subject.containsWinningCombination(
            tappedIndices: subject.tappedIndices, winningIndices: subject.winningIndices)

        let comboChecked = subject.checkCombination()

        XCTAssertEqual(didWin, comboChecked)
    }
    
    // MARK: - Test bingoAlert()
    
    func testBingoAlert() {
        // test that when bingoAlert is called, itsBingo = true.
        
        subject.bingoAlert()
        
        XCTAssertTrue(subject.itsBingo)
    }
    
    // MARK: - Test resetBoard()
    
    func testResetBoardRemoveAllTappedIndices() {
        // test that when resetBoard is called, tappedIndices.removeAll() is called and tappedIndices is an empty array.
        
        subject.resetBoard()
        
        XCTAssertTrue(subject.tappedIndices.isEmpty)
    }
    
    func testResetBoardItsBingoFalse() {
        // test that when resetBoard is called, itsBingo = false.
        
        subject.resetBoard()
        
        XCTAssertFalse(subject.itsBingo)
    }
}
