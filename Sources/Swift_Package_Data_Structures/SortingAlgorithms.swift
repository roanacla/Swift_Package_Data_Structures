//
//  File.swift
//  
//
//  Created by Roger Navarro on 12/24/20.
//

import Foundation

func bubbleSort<T: Comparable>(array: Array<T>) -> Array<T> {
  if array.count < 2 { return array }
  var result = array
  var swapCounter = 0
  var visitorIndex = 0
  
  repeat {
    swapCounter = 0
    visitorIndex = 0
    while visitorIndex < result.count - 1 {
      let currentItem = result[visitorIndex]
      let nextItem = result[visitorIndex + 1]
      if currentItem > nextItem {
        result.swapAt(visitorIndex, visitorIndex + 1)
        swapCounter += 1
      }
      visitorIndex += 1
    }
  } while swapCounter > 0
  
  return result
}

func selectionSort<T: Comparable>(array: Array<T>) -> Array<T> {
  if array.count < 2 { return array}
  var result = array
  var currentIndex = 0
  var auxIndex = currentIndex + 1
  
  func smallestValueIndex(in array: Array<T>, smallerThan value: T) -> Int? {
    var smallestIndex: Int? = nil
    var currentIndex = 0
    
    for item in array {
      if item < value {
        smallestIndex = currentIndex
      }
      currentIndex += 1
    }
    return smallestIndex
  }
  
  while currentIndex < result.count - 1 {
    let currentItem = result[currentIndex]
    let subArray = result[auxIndex...]
    if let smallestIndex = smallestValueIndex(in: Array(subArray), smallerThan: currentItem) {
      result.swapAt(currentIndex, currentIndex+1+smallestIndex)
    }
    currentIndex += 1
    auxIndex = currentIndex + 1
  }
  
  return result
}

func insertionSort<T: Comparable>(array: Array<T>) -> Array<T> {
  if array.count < 2 { return array }
  var result = array
  var currentIndex = 1 //skip the first index
  
  func swapBack(currenIndex: Int, previousIndex: Int, in array: inout Array<T>) {
    if currenIndex == 0 {
      return
    } else {
      if array[currenIndex] < array[previousIndex] {
        array.swapAt(currenIndex, previousIndex)
      }
      swapBack(currenIndex: previousIndex, previousIndex: previousIndex-1, in: &array)
    }
  }
  
  while currentIndex < result.count {
    if result[currentIndex] < result[currentIndex - 1] {
      swapBack(currenIndex: currentIndex, previousIndex: currentIndex - 1, in: &result)
    }
    currentIndex += 1
  }
  
  return result
}
