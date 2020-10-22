//
//  File.swift
//  
//
//  Created by Roger Navarro on 10/22/20.
//

import XCTest
@testable import Swift_Package_Data_Structures

final class LinkedListTests: XCTestCase {
  
  var linkedList: LinkedListNode<Int> = {
    var node1: LinkedListNode<Int> = LinkedListNode(value: 1)
    var node2: LinkedListNode<Int> = LinkedListNode(value: 2)
    var node3: LinkedListNode<Int> = LinkedListNode(value: 3)
    var node4: LinkedListNode<Int> = LinkedListNode(value: 4)
    
    node1.next = node2
    node2.next = node3
    node3.next = node4
    
    return node1
  }()
  
  func testLinkedListReversePrinting() {
    linkedList.printInReverse()
  }
  
  
  static var allTests = [
    ("testLinkedListReversePrinting", testLinkedListReversePrinting)
  ]
}
