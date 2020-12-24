//
//  File.swift
//  
//
//  Created by Roger Navarro on 12/24/20.
//

import Foundation
import XCTest

@testable import Swift_Package_Data_Structures

class SortingAlgoritmsTests: XCTestCase {
  
  let numbers = [10,9,8,7,6,5,4,3,2,1]
  
  override class func setUp() {
    
  }
  
  func testBubleSort() {
    let expectedAns = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    let result = bubbleSort(array: numbers )
    XCTAssertEqual(result, expectedAns)
  }
  
  func testSelectionSort() {
    let result = selectionSort(array: numbers)
    let expectedAns = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    XCTAssertEqual(result, expectedAns)
  }
  
  func testInsertionSort() {
    let result = insertionSort(array: numbers)
    let expectedAns = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    XCTAssertEqual(result, expectedAns)
  }
}
