//
//  File.swift
//  
//
//  Created by Roger Navarro on 12/22/20.
//

import Foundation
import XCTest
@testable import Swift_Package_Data_Structures

protocol BoardGameManager {
  associatedtype Player
  mutating func nextPlayer() -> Player?
}

class Game<Player: Equatable>: BoardGameManager {
  
  var players = QueueStack<Player>()
  
  func nextPlayer() -> Player? {
    return self.players.dequeue()
  }
}

class ChallengeQueue: XCTestCase {
  
  var game = Game<String>()
  
  override func setUp() {
    game.players.enqueue("Roger")
    game.players.enqueue("Estefan")
    game.players.enqueue("Velka")
  }
  
  func testGameNextPlayer() {
    XCTAssertEqual(game.nextPlayer(), "Roger")
  }
}
