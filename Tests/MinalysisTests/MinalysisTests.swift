import XCTest
@testable import Minalysis

final class MinalysisTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Minalysis().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
