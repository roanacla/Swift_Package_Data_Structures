import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Swift_Package_Data_StructuresTests.allTests),
    ]
}
#endif
