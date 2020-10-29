//
//  File.swift
//  
//
//  Created by Roger Navarro on 10/22/20.
//

import XCTest
@testable import Swift_Package_Data_Structures

final class LinkedListTests: XCTestCase {
  
  var linkedList: LinkedList<Int> = {
    var linkedList: LinkedList<Int> = LinkedList()
  
    linkedList.append(value: 1)
    linkedList.append(value: 2)
    linkedList.append(value: 3)
    linkedList.append(value: 4)
    
    return linkedList
  }()
  
  
  func testLinkedListReversePrinting() {
    linkedList.printInReverse()
  }
  
  func testPushFunction() {
    let result = 0
    linkedList.push(value:0)
    XCTAssertEqual(result, linkedList.head?.value)
    XCTAssertEqual(1, linkedList.head?.next?.value)
  }
  
  func testAppendFunction() {
    let result = 5
    linkedList.append(value: result)
    XCTAssertEqual(linkedList.tail?.value, result)
    XCTAssertEqual(linkedList.head?.next?.next?.next?.value, 4)
  }
  
  
  static var allTests = [
    ("testLinkedListReversePrinting", testLinkedListReversePrinting)
  ]
}
