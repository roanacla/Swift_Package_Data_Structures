//
//  File.swift
//  
//
//  Created by Roger Navarro on 9/25/20.
//

import XCTest
@testable import Swift_Package_Data_Structures

final class BinaryNodesTests: XCTestCase {
  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    XCTAssertEqual(Swift_Package_Data_Structures().text, "Hello, World!")
  }
  
  func test1() {
    var tree: BinaryNode<Int> = {
      let zero = BinaryNode(value: 0)
      let one = BinaryNode(value: 1)
      let five = BinaryNode(value: 5)
      let seven = BinaryNode(value: 7)
      let eight = BinaryNode(value: 8)
      let nine = BinaryNode(value: 9)
      
      seven.leftChild = one
      one.leftChild = zero
      one.rightChild = five
      seven.rightChild = nine
      nine.leftChild = eight
      
      return seven
    }()
    
    XCTAssertEqual(tree.leftChild!.leftChild!.value as Int, 0)
  }
  
  static var allTests = [
    ("testExample", testExample),
    ("test1", test1),
  ]
}
