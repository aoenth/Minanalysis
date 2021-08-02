import XCTest
@testable import Minalysis

final class MinalysisTests: XCTestCase {
    let sut: ([[Int]]) throws -> [[Double]] = analyze

    func testFieldWith0Height_shouldThrow() throws {
        let input: [[Int]] = []
        XCTAssertThrowsError(try sut(input), "Should throw when input is 0 height")
    }

    func testFieldWith0Width_shouldThrow() {
        let input: [[Int]] = [[]]
        XCTAssertThrowsError(try sut(input), "Should throw when input is 0 width")
    }

    func testFieldOfSize1x1WithWithoutMine_shouldBe0() throws {
        let input = [[0]]
        let expectation: [[Double]] = [[0]]
        let result = try sut(input)
        XCTAssertEqual(result, expectation, errorMessage(input, result, expectation))
    }

    func testFieldOfSize1x2WithMine_shouldBe1OnMine() throws {
        let input = [[1, -1]]
        let expectation: [[Double]] = [[0, 1]]
        let result = try sut(input)
        XCTAssertEqual(result, expectation, errorMessage(input, result, expectation))
    }

    func testFieldOfSize2x2With2Mine_shouldBe50PercentOnEachMine() throws {
        let input = [
            [1, -1],
            [1, -1],
        ]
        let expectation: [[Double]] = [
            [0, 0.5],
            [0, 0.5],
        ]
        let result = try sut(input)
        XCTAssertEqual(result, expectation, errorMessage(input, result, expectation))
    }


    func testFieldOfSize3x3With8Mine_shouldBe12_5PercentOnEachMine() throws {
        let input = [
            [-1, -1, -1],
            [-1,  1, -1],
            [-1, -1, -1],
        ]
        let expectation: [[Double]] = [
            [0.125, 0.125, 0.125],
            [0.125,     0, 0.125],
            [0.125, 0.125, 0.125],
        ]
        let result = try sut(input)
        XCTAssertEqual(result, expectation, errorMessage(input, result, expectation))
    }

    func testFieldOfSize2x2With1MineLeft_shouldBe100PercentOn1Mine() throws {
        let input = [
            [-1, 1],
            [ 1, 1],
        ]
        let expectation: [[Double]] = [
            [1, 0],
            [0, 0],
        ]
        let result = try sut(input)
        XCTAssertEqual(result, expectation, errorMessage(input, result, expectation))
    }

    func testFieldOfSize2x2With2MinesLeft_shouldBe100PercentOn2Mines() throws {
        let input = [
            [-1, -1],
            [ 2,  2],
        ]
        let expectation: [[Double]] = [
            [1, 1],
            [0, 0],
        ]
        let result = try sut(input)
        XCTAssertEqual(result, expectation, errorMessage(input, result, expectation))
    }

    func testFieldOfSize3x3With3MinesLeft_shouldBe100PercentOn3Mines() throws {
        let input = [
            [-1, -1, -1],
            [ 2,  3,  2],
            [ 0,  0,  0]
        ]
        let expectation: [[Double]] = [
            [1, 1, 1],
            [0, 0 ,0],
            [0, 0 ,0],
        ]
        let result = try sut(input)
        XCTAssertEqual(result, expectation, errorMessage(input, result, expectation))
    }


    func testFieldOfSize3x3With4MinesLeft_shouldBe100PercentOn4Mines() throws {
        let input = [
            [-1, -1, -1],
            [ 3,  4,  3],
            [ 1, -1,  1]
        ]
        let expectation: [[Double]] = [
            [1, 1, 1],
            [0, 0 ,0],
            [0, 1 ,0],
        ]
        let result = try sut(input)
        XCTAssertEqual(result, expectation, errorMessage(input, result, expectation))
    }


    func testFieldOfSize3x3With3MinesLeft_shouldBe100PercentOn3Mines_50PercentOn2Mines() throws {
        let input = [
            [-1, -1, -1],
            [ 3,  4,  3],
            [-1, -1,  1]
        ]
        let expectation: [[Double]] = [
            [0.5, 1, 1],
            [  0, 0 ,0],
            [0.5, 1 ,0],
        ]
        let result = try sut(input)
        XCTAssertEqual(result, expectation, errorMessage(input, result, expectation))
    }
}
