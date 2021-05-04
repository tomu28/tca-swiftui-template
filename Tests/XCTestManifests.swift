import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        return [
            testCase(AuthTests.allTests),
            testCase(ComponentTests.allTests),
        ]
    }
#endif
