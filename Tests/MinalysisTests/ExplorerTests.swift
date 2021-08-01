import XCTest
@testable import Minalysis

final class ExplorerTests: XCTestCase {
    func testAllExplored_shouldReturn8() {
        let input = [
            [1, 1, 1],
            [1, 1, 1],
            [1, 1, 1],
        ]
        let result = explore(row: 1, col: 1, width: 3, height: 3, mineField: input, depth: 2)
        XCTAssertEqual(result, 9, "When all fields are explored, should return 8")
    }

    func test5Explored_shouldReturn6() {
        let input = [
            [-1, 1, 1],
            [-1, 1, 1],
            [-1, 1, 1],
        ]
        let result = explore(row: 1, col: 1, width: 3, height: 3, mineField: input, depth: 2)
        XCTAssertEqual(result, 6, "When 5 fields are explored, should return 6")
    }

    func testNoneExplored_shouldReturn1() {
        let input = [
            [-1, -1, -1],
            [-1, 1, -1],
            [-1, -1, -1],
        ]
        let result = explore(row: 1, col: 1, width: 3, height: 3, mineField: input, depth: 2)
        XCTAssertEqual(result, 1, "When none of the fields are explored, should return 1")
    }
}
