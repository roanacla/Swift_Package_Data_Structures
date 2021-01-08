//
//  File.swift
//  
//
//  Created by Roger Navarro on 1/8/21.
//

import Foundation

//Binary Search

extension RandomAccessCollection where Element: Comparable {
  func binarySearch(value: Element, in range: Range<Index>? = nil ) -> Index? {
    let range = range ?? startIndex..<endIndex
    guard range.lowerBound < range.upperBound else { return nil }
    
    let size = distance(from: range.lowerBound, to: range.upperBound)
    let middleIndex = index(range.lowerBound, offsetBy: size/2)
    
    if self[middleIndex] == value {
      return middleIndex
    } else if self[middleIndex] > value {
      return binarySearch(value: value, in: range.lowerBound..<middleIndex)
    } else {
      return binarySearch(value: value, in: index(after: middleIndex)..<range.upperBound)
    }
  }
}
