//
//  File.swift
//  
//
//  Created by Roger Navarro on 1/7/21.
//

import Foundation

class BinaryNode<Element> {
  var currentValue: Element
  var leftChild: BinaryNode?
  var rightChild: BinaryNode?
  
  init(value: Element) {
    currentValue = value
  }
  
  func traverseInOrder(operation: (Element)->()) {
    leftChild?.traverseInOrder(operation: operation)
    operation(currentValue)
    rightChild?.traverseInOrder(operation: operation)
  }
  
  func traversePreOrder(operation: (Element)->()) {
    operation(currentValue)
    leftChild?.traversePreOrder(operation: operation)
    rightChild?.traversePreOrder(operation: operation)
  }
  
  func traversePostOrder(operation: (Element)->()) {
    leftChild?.traversePostOrder(operation: operation)
    rightChild?.traversePostOrder(operation: operation)
    operation(currentValue)
  }
  
  func serialize()->[Element?] {
    var output:[Element?] = [currentValue]
    output += (leftChild?.serialize() ?? [nil])
    output += (rightChild?.serialize() ?? [nil])
    
    return output
  }
  
  
  
}

class BinaryTree<Element> {
  var rootNode: BinaryNode<Element>
  
  init(node: BinaryNode<Element>) {
    rootNode = node
  }
  
  func traverseInOrder(operation: (Element)->()) {
    rootNode.traverseInOrder(operation: operation)
  }
  
  func traversePreOrder(operation: (Element)->()) {
    rootNode.traversePreOrder(operation: operation)
  }
  
  func traversePostOrder(operation: (Element)->()) {
    rootNode.traversePostOrder(operation: operation)
  }
  
  func serialize() -> [Element?] {
    return rootNode.serialize()
  }
}
