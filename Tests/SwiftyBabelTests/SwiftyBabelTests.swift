import XCTest
@testable import SwiftyBabel

final class SwiftyBabelTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftyBabel().parse(code: "testing"), nil)
    }
}
