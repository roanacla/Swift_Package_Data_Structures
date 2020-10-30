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
  
  func push(value: Element) {
    head = LinkedListNode(value: value, next: head)
    if tail == nil {
      tail = head
    }
  }
  
  func append(value: Element) {
    if isEmpty {
      push(value: value)
    } else {
      tail?.next = LinkedListNode(value: value)
      tail = tail?.next
    }
  }
  
  func pop() -> Element? {
    if isEmpty {
      return nil
    } else {
      let node = head
      head = head?.next
      if isEmpty {
        tail = nil
      }
      return node?.value
    }
  }
  
  func node(at index: Int) -> LinkedListNode<Element>? {
    if isEmpty {
      return nil
    } else {
      var node = head
      var count = 0
      var result: LinkedListNode<Element>? = nil
      while count <= index && node != nil{
        if count == index {
          result = node
          break
        } else {
          node = node?.next
          count += 1
        }
      }
      return result
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
