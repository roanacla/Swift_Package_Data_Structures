//
//  File.swift
//  
//
//  Created by Roger Navarro on 12/22/20.
//

import Foundation

protocol Queue: Sequence, IteratorProtocol {
  associatedtype Element
  
  mutating func enqueue(_ element: Element)
  mutating func dequeue() -> Element?
  var isEmpty: Bool { get }
  var peek: Element? { get }
}

extension Queue {
  mutating func next() -> Element? {
    return dequeue()
  }
}

struct QueueArray<T>: Queue {
  private var array: [T] = []
  
  mutating func enqueue(_ element: T){
    self.array.append(element)
  }
  
  @discardableResult
  mutating func dequeue() -> T? {
    return self.isEmpty ? nil : array.removeFirst()
  }
  
  var isEmpty: Bool { array.isEmpty }
  
  var peek: T? { array.first }
}

struct QueueStack<T: Equatable>: Queue, Equatable {
  
  private var enqueueStack: [T] = []
  private var dequeueStack: [T] = []
  
  mutating func enqueue(_ element: T) {
    self.enqueueStack.append(element)
  }
  
  @discardableResult
  mutating func dequeue() -> T? {
    if dequeueStack.isEmpty {
      dequeueStack = enqueueStack.reversed()
      enqueueStack.removeAll()
    }
    return dequeueStack.popLast()
  }
  
  var isEmpty: Bool { enqueueStack.isEmpty && dequeueStack.isEmpty }
  
  var peek: T? { !dequeueStack.isEmpty ? dequeueStack.last : enqueueStack.first  }
}
