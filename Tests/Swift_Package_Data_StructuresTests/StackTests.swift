//
//  File.swift
//  
//
//  Created by Roger Navarro on 12/21/20.
//

import Foundation

import XCTest
@testable import Swift_Package_Data_Structures

final class StackTests: XCTestCase {
  
  var stack: Stack<Int> = {
    var stack = Stack<Int>()
    stack.push(element: 1)
    stack.push(element: 2)
    stack.push(element: 3)
    return stack
  }()
  
  func testPush() {
    stack.push(element: 4)
    var last = stack.pop()!
    XCTAssertTrue(4 == last)
    last = stack.pop()!
    XCTAssertTrue(3 == last)
  }
  
  func testPrintDescription() {
    XCTAssertTrue("1 2 3" == stack.description)
  }
  
  func testPeek() {
    XCTAssertTrue(3 == stack.peek())
  }
  
  func testIsEmpty() {
    XCTAssertFalse(stack.isEmpty())
  }
  
  func testInitArray() {
    let array = [1,2,3]
    let testStack = Stack(array: array)
    XCTAssertEqual(self.stack, testStack)
  }
  
  func testArrayLiteralInitilizer() {
    let test: Stack<String> = ["Roger", "Estefan", "Velka"]
    XCTAssertEqual(test, ["Roger", "Estefan", "Velka"])
    let last = test.peek()
    XCTAssertTrue(last == "Velka")
  }
  
  
  
  static var allTests = [
    ("testPush", testPush)
  ]
}
