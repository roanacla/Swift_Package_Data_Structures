//
//  File.swift
//  
//
//  Created by Roger Navarro on 12/21/20.
//

import Foundation

struct Stack<Element: Equatable>: Equatable {
  
  private var storage: [Element] = []
  
  init() { }
  
  init(array: Array<Element>) {
    storage = array
  }
  
  mutating func push(element: Element) {
    storage.append(element)
  }
  
  mutating func pop() -> Element? {
    return storage.popLast()
  }
  
  func peek() -> Element? {
    return storage.last
  }
  
  func isEmpty() -> Bool {
    peek() == nil
  }
  
  var first: Element? {
    return self.storage.first
  }
  
  var last: Element? {
    return self.peek()
  }
  
}

extension Stack: CustomStringConvertible {
  var description: String {
    storage.map{"\($0)"}
      .joined(separator: " ")
  }
}

extension Stack: ExpressibleByArrayLiteral {
  init(arrayLiteral elements: Element...) {
    storage = elements
  }
}
