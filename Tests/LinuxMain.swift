import XCTest

import AuthTests

var tests = [XCTestCaseEntry]()
tests += AuthTests.allTests()
XCTMain(tests)
