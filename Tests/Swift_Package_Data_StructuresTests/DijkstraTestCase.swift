//
//  DijkstraTestCase.swift
//
//
//  Created by Roger Navarro on 01/19/21.
//

import XCTest
@testable import Swift_Package_Data_Structures

private typealias Graph = AdjacencyList<String>
private typealias Vertex = Graph.Vertex

final class DijkstraTestCase: XCTestCase {
  func test_getShortestPath() {
    let shortestPath = Dijkstra.getShortestPath(from: a, to: d, graph: graph)
    XCTAssertEqual(String(shortestPath: shortestPath), "AGCED")
  }
  
  func test_getShortestPaths() {
    let shortestPaths = [
      a: nil,
      b: "AGCEB",
      c: "AGC",
      d: "AGCED",
      e: "AGCE",
      f: "AGHF",
      g: "AG",
      h: "AGH"
    ]
    let dic = Dijkstra.getShortestPaths(source: a, graph: graph)
    var result: [Vertex: String?] = [:]
    for (key,value) in dic {
      if let value = value {
        result[key] = String(path: value)
      } else {
        let a: String? = nil
        result[key] = a
      }
    }
      
    XCTAssertEqual(shortestPaths, result )
  }

  private let (graph, a, b, c, d, e, f, g, h): (Graph, Vertex, Vertex, Vertex, Vertex, Vertex, Vertex, Vertex, Vertex) = {
    var graph = AdjacencyList<String>()

    let a = graph.addVertex("A")
    let b = graph.addVertex("B")
    let c = graph.addVertex("C")
    let d = graph.addVertex("D")
    let e = graph.addVertex("E")
    let f = graph.addVertex("F")
    let g = graph.addVertex("G")
    let h = graph.addVertex("H")

    for edge in [
      GraphEdge(source: a, destination: b, weight: 8),
      GraphEdge(source: a, destination: f, weight: 9),
      GraphEdge(source: a, destination: g, weight: 1),
      GraphEdge(source: b, destination: f, weight: 3),
      GraphEdge(source: b, destination: e, weight: 1),
      GraphEdge(source: c, destination: b, weight: 3),
      GraphEdge(source: c, destination: e, weight: 1),
      GraphEdge(source: c, destination: g, weight: 3),
      GraphEdge(source: d, destination: e, weight: 2),
      GraphEdge(source: f, destination: h, weight: 2),
      GraphEdge(source: g, destination: h, weight: 5)
    ] {
      graph.add(edge)
    }

    return (graph, a, b, c, d, e, f, g, h)
  } ()
}

private extension String {
  init?(shortestPath: [Graph.Edge]) {
    guard !shortestPath.isEmpty else {
      return nil
    }

    self = shortestPath.reduce(into: shortestPath[0].source.element) { string, edge in
      string += edge.destination.element
    }
  }
  
  init?(path: [Graph.Edge]) {
    guard !path.isEmpty else { return nil }
    var set = Set<Character>()
    let arrays = path.map { $0.destination.element + $0.source.element }.reduce(into: ""){ result, string in
      result += string
    }
    .reversed().filter{ set.insert($0).inserted }
    
    
    self = String(arrays)
  }
}
