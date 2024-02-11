//
//  File.swift
//  
//
//  Created by Mohit Kumar on 10/02/24.
//

import Foundation

/// https://tomzurkan.medium.com/swift-heap-priority-queue-6a1644ba8d5d
struct Heap<T: Comparable> {
    typealias HeapComparator = (_ l: T, _ r: T) -> Bool
    var comparator:HeapComparator
    
    private var arr = [T]()
    private var size: Int {
        arr.count
    }
    
    init(_ comparator: @escaping HeapComparator) {
        self.comparator = comparator
    }
    
    private mutating func heapify(index: Int) {
        var largest = index
        
        
        let leftChildIndex = (2*index) + 1
        let rightChildIndex = (2*index) + 2
        
        if (rightChildIndex < size) && comparator(arr[rightChildIndex], arr[largest]) {
            largest = rightChildIndex
        }
        
        if (leftChildIndex < size) && comparator(arr[leftChildIndex], arr[largest]) {
            largest = leftChildIndex
        }
        
        if (index != largest) {
            arr.swapAt(index, largest)
            
            heapify(index: largest)
        }
    }
    
    private mutating func shiftup(_ index: Int) {
        let parent = (index-1)/2
        
        if index < 0 {
            return
        }
        
        if comparator(arr[index], arr[parent]) {
            arr.swapAt(parent, index)
            
            shiftup(parent)
        }
    }
    
    mutating func insert(_ node: T) {
        arr.append(node)
        
        shiftup(size-1)
    }
    
    @discardableResult
    mutating func extractTop() -> T? {
        guard !arr.isEmpty else {
            return nil
        }
        
        let max = arr[0]
        if size > 1 {
            arr.swapAt(0, size-1)
            arr.removeLast()
            
            heapify(index: 0)
        } else {
            arr.removeLast()
        }
        
        return max
    }
}

/// Example code for usage
extension Solution {
    
    func solve() {
        
        /// Max heap
        var maxHeap = Heap<Int>{ l, r  in
            l > r
        }
        maxHeap.insert(3)
        maxHeap.insert(9)
        maxHeap.insert(2)
        maxHeap.insert(1)
        maxHeap.insert(4)
        maxHeap.insert(5)
        print(maxHeap.extractTop())
        print(maxHeap.extractTop())
        print(maxHeap.extractTop())
        
        print("")
        
        /// Min heap
        var minHeap = Heap<Int>{ l, r in
            l < r
        }
        minHeap.insert(3)
        minHeap.insert(9)
        minHeap.insert(2)
        minHeap.insert(1)
        minHeap.insert(4)
        minHeap.insert(5)

        print(minHeap.extractTop())
        print(minHeap.extractTop())
        print(minHeap.extractTop())
        
        /// Problem solved using max-heap
        print(findKthLargest([1,2], 1))
    }

    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var heap = Heap<Int> { $0 > $1 }
        for num in nums {
            heap.insert(num)
        }
        
        for i in stride(from: 1, to: k, by: 1) {
            heap.extractTop()
        }
        
        return heap.extractTop() ?? 0
    }
}
