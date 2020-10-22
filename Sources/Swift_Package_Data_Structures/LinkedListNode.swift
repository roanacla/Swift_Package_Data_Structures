//
//  File.swift
//  
//
//  Created by Roger Navarro on 10/21/20.
//

import Foundation

class LinkedListNode<Element> {
  var value: Element
  var next: LinkedListNode<Element>?
  
  init(value: Element) {
    self.value = value
    self.next = nil
  }
  
  init(value: Element, next: LinkedListNode) {
    self.value = value
    self.next = next
  }
  
  func printInReverse() {
    //base case
    if self.next == nil {
      print(value)
      return
    }
    //Logic?
    else {
      self.next?.printInReverse()
      print(self.value)
    }
  }
}
