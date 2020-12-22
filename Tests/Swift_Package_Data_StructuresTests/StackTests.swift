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
  
  func checkParentheses(_ string: String) -> Bool {
    if string.isEmpty { return false}
    let useParenthesis = string.contains("(")
    if useParenthesis == false { return false}
    
    var tempStack: Stack<String.Element> = Stack()
    
    for element in string {
      if element == "(" {
        tempStack.push(element: element)
      } else if element == ")" {
        guard let _ = tempStack.pop() else { return false}
      }
    }
    if useParenthesis && tempStack.isEmpty() {
      return true
    } else {
      return false
    }
  }
  
  func test_checkParens() {
    XCTAssertTrue( checkParentheses("()") )
  }
  
  func test_checkParens1() {
    XCTAssertTrue( checkParentheses("hello(world)()") )
  }
  
  func test_checkParens2() {
    XCTAssertFalse( checkParentheses("(hello world") )
  }
  
  func test_checkParens3() {
    XCTAssertFalse( checkParentheses("((())(meow))()))()") )
  }
  
  
  static var allTests = [
    ("testPush", testPush)
  ]
}
