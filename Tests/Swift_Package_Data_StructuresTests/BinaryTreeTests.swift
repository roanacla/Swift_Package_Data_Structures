//
//  File.swift
//  
//
//  Created by Roger Navarro on 1/7/21.
//

import Foundation
import XCTest
@testable import Swift_Package_Data_Structures

class BinaryTreeTests: XCTestCase {
  
  var binaryTree: BinaryTree<Int>!
  
  override func setUp() {
    let node7 = BinaryNode(value: 7)
    let node1 = BinaryNode(value: 1)
    let node9 = BinaryNode(value: 9)
    let node0 = BinaryNode(value: 0)
    let node5 = BinaryNode(value: 5)
    let node8 = BinaryNode(value: 8)
    
    node7.leftChild = node1
    node7.rightChild = node9
    node1.leftChild = node0
    node1.rightChild = node5
    node9.leftChild = node8
    
    binaryTree = BinaryTree(node: node7)
  }
  
  func testInOrderTraverse() {
    let ans = [0,1,5,7,8,9]
    var result: [Int] = []
    binaryTree.traverseInOrder(operation: {result.append($0)})
    XCTAssertEqual(ans, result)
  }
  
  func testPreOrderTraverse() {
    let ans = [7,1,0,5,9,8]
    var result: [Int] = []
    binaryTree.traversePreOrder(operation: {result.append($0)})
    XCTAssertEqual(ans,result)
  }
  
  func testPostOrderTraverse() {
    let ans = [0,5,1,8,9,71]
    var result: [Int] = []
    binaryTree.traversePostOrder(operation: {result.append($0)})
    XCTAssertEqual(ans,result)
  }
  
  func testSerialization() {
    let ans = [7,1,0,nil,nil,5,nil,nil,9,8,nil,nil,nil]
    XCTAssertEqual(ans, binaryTree.serialize())
  }
}
