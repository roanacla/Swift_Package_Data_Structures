//
//  File.swift
//  
//
//  Created by Roger Navarro on 12/22/20.
//

import Foundation

import XCTest
@testable import Swift_Package_Data_Structures

final class QueueTests: XCTestCase {
  var queueTest: QueueArray<String> = {
    var queue = QueueArray<String>()
    queue.enqueue("Roger")
    queue.enqueue("Velka")
    queue.enqueue("Estefan")
    return queue
  }()
  
  var queueStacksTest: QueueStack<Int> = {
    var queue = QueueStack<Int>()
    queue.enqueue(1)
    queue.enqueue(2)
    queue.enqueue(3)
    return queue
  }()
  
  func testEnqueueAndDequeue() {
    queueTest.enqueue("Rene")
    queueTest.dequeue()
    queueTest.dequeue()
    queueTest.dequeue()
    XCTAssertEqual("Rene", queueTest.peek!)
    queueTest.dequeue()
    XCTAssertTrue(queueTest.isEmpty)
  }
  
  func testQueueStackOperations() {
    queueStacksTest.enqueue(4)
    queueStacksTest.dequeue()
    queueStacksTest.dequeue()
    queueStacksTest.dequeue()
    XCTAssertEqual(4, queueStacksTest.peek)
    queueStacksTest.dequeue()
    XCTAssertTrue(queueStacksTest.isEmpty)
  }
  
  func testQueueStackPeek() {
    var result = queueStacksTest.peek!
    XCTAssertEqual(1, result)
    result = queueStacksTest.dequeue()!
    XCTAssertEqual(1, result)
  }
  
}
