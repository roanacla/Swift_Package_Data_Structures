//
//  Dijkstra.swift
//
//
//  Created by Roger Navarro on 01/19/21.
//

enum Dijkstra<Graph: Swift_Package_Data_Structures.Graph> where Graph.Element: Hashable {
  typealias Edge = Graph.Edge
  typealias Vertex = Edge.Vertex

  static func getEdges(alongPathsFrom source: Vertex, graph: Graph) -> [Vertex: Edge] {
    var edges: [Vertex: Edge] = [:]

    func getWeight(to destination: Vertex) -> Double {
      return getShortestPath(to: destination, edgesAlongPaths: edges)
        .map { $0.weight }
        .reduce(0, +)
    }

    var priorityQueue = PriorityQueue { getWeight(to: $0) < getWeight(to: $1) }
    priorityQueue.enqueue(source)
    while let vertex = priorityQueue.dequeue() {
      graph.getEdges(from: vertex)
        .filter {
          $0.destination == source
          ? false
          : edges[$0.destination] == nil
            || getWeight(to: vertex) + $0.weight < getWeight(to: $0.destination)
        }
        .forEach { newEdgeFromVertex in
          edges[newEdgeFromVertex.destination] = newEdgeFromVertex
          priorityQueue.enqueue(newEdgeFromVertex.destination)
        }
    }

    return edges
  }

  static func getShortestPath(to destination: Vertex, edgesAlongPaths: [Vertex: Edge]) -> [Edge] {
    var shortestPath: [Edge] = []
    var destination = destination
    while let edge = edgesAlongPaths[destination] {
      shortestPath = [edge] + shortestPath
      destination = edge.source
    }
    return shortestPath
  }

  static func getShortestPath(
    from source: Vertex, to destination: Vertex,
    graph: Graph
  ) -> [Edge] {
    return getShortestPath(
      to: destination,
      edgesAlongPaths: getEdges(alongPathsFrom: source, graph: graph)
    )
  }
  
  static func getShortestPaths(source: Vertex, graph: Graph) -> [Vertex: [Edge]?] {
    var paths: [Vertex: [Edge]?] = [source:nil]
    let edgesAlongPaths = getEdges(alongPathsFrom: source, graph: graph)
    
    for (destinationVertex, path) in edgesAlongPaths {
      var resultPath: [Edge] = [path]
      var tempVertex = path.source
      while tempVertex != source {
        let edge = edgesAlongPaths.filter { key , edge in
          edge.destination == tempVertex
        }.map{ $1 }[0]
        resultPath.append(edge)
        tempVertex = edge.source
      }
      
      paths[destinationVertex] = resultPath
    }
    
    return paths
  }
}
