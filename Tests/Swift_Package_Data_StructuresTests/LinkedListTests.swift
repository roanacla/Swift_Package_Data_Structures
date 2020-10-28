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
    var node1: LinkedListNode<Int> = LinkedListNode(value: 1)
    var node2: LinkedListNode<Int> = LinkedListNode(value: 2)
    var node3: LinkedListNode<Int> = LinkedListNode(value: 3)
    var node4: LinkedListNode<Int> = LinkedListNode(value: 4)
    
    linkedList.push(node: node4)
    linkedList.push(node: node3)
    linkedList.push(node: node2)
    linkedList.push(node: node1)
    
    return linkedList
  }()
  
  
  func testLinkedListReversePrinting() {
    linkedList.printInReverse()
  }
  
  func testPushFunction() {
    let result = 0
    linkedList.push(node: LinkedListNode(value: 0))
    XCTAssertEqual(result, linkedList.head?.value)
    XCTAssertEqual(1, linkedList.head?.next?.value)
  }
  
  
  static var allTests = [
    ("testLinkedListReversePrinting", testLinkedListReversePrinting)
  ]
}
