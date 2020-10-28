//
//  File.swift
//  
//
//  Created by Roger Navarro on 10/14/20.
//

import Foundation

class BinaryNodeTwo<Element> {
  var value: Element
  var leftChild: BinaryNodeTwo<Element>?
  var rightChild: BinaryNodeTwo<Element>?
  
  init (value: Element ) {
    self.value = value
  }
}

func traverseInOrder<T>(node: BinaryNodeTwo<T>?, visit: (T) -> Void) {
  guard let node = node else { return }
  traverseInOrder(node: node.leftChild, visit: visit)
  visit(node.value)
  traverseInOrder(node: node.rightChild, visit: visit)
}

extension BinaryNodeTwo: CustomStringConvertible {
  
  public var description: String {
    return diagram(for: self)
  }
  
  private func diagram(for node: BinaryNodeTwo?,
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
