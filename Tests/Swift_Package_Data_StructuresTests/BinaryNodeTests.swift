//
//  File.swift
//  
//
//  Created by Roger Navarro on 9/25/20.
//

import XCTest
@testable import Swift_Package_Data_Structures

final class BinaryNodesTests: XCTestCase {
  
  var tree: BinaryNodeTwo<Int> = {
    let zero = BinaryNodeTwo(value: 0)
    let one = BinaryNodeTwo(value: 1)
    let five = BinaryNodeTwo(value: 5)
    let seven = BinaryNodeTwo(value: 7)
    let eight = BinaryNodeTwo(value: 8)
    let nine = BinaryNodeTwo(value: 9)
    
    seven.leftChild = one
    one.leftChild = zero
    one.rightChild = five
    seven.rightChild = nine
    nine.leftChild = eight
    
    return seven
  }()
  
  
  func testTraverseInOrder() {
    var output:[Int] = []
    traverseInOrder(node: tree, visit: { output.append($0)})
    let answer = [0,1,5,7,8,9]
    XCTAssertEqual(output, answer)
    let answerTwo = [0,1,5,7,8,19]
    XCTAssertNotEqual(output, answerTwo)
  }
  
  static var allTests = [
    ("testTraverseInOrder", testTraverseInOrder)
  ]
}
