//
//  File.swift
//  
//
//  Created by Roger Navarro on 10/21/20.
//

import Foundation

class LinkedList<Element> {
  
  var head: LinkedListNode<Element>? = nil
  var tail: LinkedListNode<Element>? = nil
  
  var isEmpty: Bool {
    head == nil
  }
  
  func printInReverse() {
    if isEmpty {
      print("The linked list is empty")
      return
    } else {
      printInReverseLogic(node: self.head)
    }
  }
  
  private func printInReverseLogic(node: LinkedListNode<Element>?) {
    //base case
    if node?.next == nil {
      print(node?.value ?? "")
    } else {
      //recursive logic
      printInReverseLogic(node: node?.next)
      print(node?.value ?? "")
    }
  }
  
  func push(node: LinkedListNode<Element>) {
    if isEmpty {
      self.head = node
    } else {
      node.next = head
      self.head = node
    }
  }
  
}

class LinkedListNode<Element> {
  var value: Element
  var next: LinkedListNode?
  
  init(value: Element, next: LinkedListNode? = nil) {
    self.value = value
    self.next = next
  }
}
