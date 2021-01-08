//
//  File.swift
//  
//
//  Created by Roger Navarro on 1/8/21.
//

import Foundation
import XCTest

@testable import Swift_Package_Data_Structures

class SearchAlgorithmsTests: XCTestCase {
  
  let array = [1,2,3,4,5,6,7,8,9,10]
  
  func testBinarySearch() {
    XCTAssertEqual(4, array.binarySearch(value: 5))
    
    XCTAssertEqual(9, array.binarySearch(value: 10))
    
    XCTAssertEqual(nil, array.binarySearch(value: 0))
  }
}
