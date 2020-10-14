//
//  File.swift
//  
//
//  Created by Roger Navarro on 9/25/20.
//

import XCTest
@testable import Swift_Package_Data_Structures

final class BinaryNodesTests: XCTestCase {
  
  var tree: BinaryNode<Int> = {
    let zero = BinaryNode(value: 0)
    let one = BinaryNode(value: 1)
    let five = BinaryNode(value: 5)
    let seven = BinaryNode(value: 7)
    let eight = BinaryNode(value: 8)
    let nine = BinaryNode(value: 9)
    //   7
    // 1   9
    //0 5 8
    seven.leftChild = one
    one.leftChild = zero
    one.rightChild = five
    seven.rightChild = nine
    nine.leftChild = eight
    
    return seven
  }()
  
  func deserialize<T>(array: inout [T?]) -> BinaryNode<T>? {
    //[nil, 0, nil, 1, nil, 5, nil, 7, nil, 8, nil, 9, nil]
    
    guard let value = array.removeFirst() else { return nil}
    let node = BinaryNode(value: value)
    node.leftChild = deserialize(array: &array)
    node.rightChild = deserialize(array: &array)
    return node
  }
  
  func deserialize<T>(array: [T?]) -> BinaryNode<T>? {
    var array = Array(array.reversed())
    return deserialize(array: &array)
  }
  
  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    XCTAssertEqual(Swift_Package_Data_Structures().text, "Hello, World!")
  }
  
  func test1() {
    XCTAssertEqual(tree.leftChild!.leftChild!.value as Int, 0)
  }
  
  func test2() {
    var array: [Int?] = []
    let result: [Int?] = [nil, 0, nil, 1, nil, 5, nil, 7, nil, 8, nil, 9, nil]
    tree.traverseInOrder(visit: { array.append($0) })
    print(array)
    XCTAssertEqual(result, array)
  }
  
  static var allTests = [
    ("testExample", testExample),
    ("test1", test1),
    ("test2", test2)
  ]
}
