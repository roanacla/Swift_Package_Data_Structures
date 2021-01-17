//
//  File.swift
//  
//
//  Created by Roger Navarro on 1/16/21.
//

import Foundation
import XCTest
@testable import Swift_Package_Data_Structures

final class PriorityQueueTestCase: XCTestCase {
  func test() {
    let priorityQueue = PriorityQueue(unsortedInts, areSorted: <)
    XCTAssertEqual( priorityQueue.map { $0 }, unsortedInts.sorted() )
    XCTAssertEqual(priorityQueue.peek, 1)
  }

  private let unsortedInts = [12, 3, 4, 1, 7, 6, 8, 7]
}
