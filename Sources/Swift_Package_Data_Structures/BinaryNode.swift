//
//  File.swift
//  
//
//  Created by Roger Navarro on 9/25/20.
//

import Foundation

class BinaryNode<Element> {
  var value: Element
  var leftChild: BinaryNode?
  var rightChild: BinaryNode?
  
  init(value: Element) {
    self.value = value
  }
  
  func traverseInOrder(visit: (Element?) -> Void) {
    if leftChild != nil {
      leftChild?.traverseInOrder(visit: visit)
    } else {
      visit(nil)
    }
    
    visit(value)
    
    if rightChild != nil {
      rightChild?.traverseInOrder(visit: visit)
    } else {
      visit(nil)
    }
  }
  
  func traversePreOrder(visit: (Element) -> Void ) {
    visit(value)
    leftChild?.traversePreOrder(visit: visit)
    rightChild?.traversePreOrder(visit: visit)
  }
  
  func traversePostOrder(visit: (Element) -> Void ) {
    leftChild?.traversePostOrder(visit: visit)
    rightChild?.traversePostOrder(visit: visit)
    visit(value)
  }
  
}


//MARK: - Print Tree Function

extension BinaryNode: CustomStringConvertible {
  
  public var description: String {
    return diagram(for: self)
  }
  
  private func diagram(for node: BinaryNode?,
                       _ top: String = "",
                       _ root: String = "",
                       _ bottom: String = "") -> String {
    guard let node = node else {
      return root + "nil\n"
    }
    if node.leftChild == nil && node.rightChild == nil {
      return root + "\(node.value)\n"
    }
    return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
      + root + "\(node.value)\n"
      + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
  }
}
