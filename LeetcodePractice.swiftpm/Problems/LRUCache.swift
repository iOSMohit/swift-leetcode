//
//  File.swift
//  
//
//  Created by Mohit Kumar on 23/02/24.
//

import Foundation

extension LinkedList {
    mutating func moveToEnd(item: Int) {
        
    }
}

final class LRUCache {
    /// We will put least recently used item at front and latest item at back
    private var ll = DoublyLinkedList()
    private var size: Int
    
    init(_ capacity: Int) {
        size = capacity
    }
    
    /// This we will update lruLinkedList accordingly
    func get(_ key: Int) -> Int {
        if let (value, _) = ll.get(item: key) {
            ll.updatePriority(item: key)
            return value
        }
        
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if ll.get(item: key) == nil {
            guard ll.dic.count < size else {
                /// Overflow
                ll.deleteLast()
                ll.insertAtFront(node: DoubleListNode(val: key), value: value)
                
                return
            }
            
            ll.insertAtFront(node: DoubleListNode(val: key), value: value)
        } else {
            ll.update(key: key, value: value)
            ll.updatePriority(item: key)
        }
    }
    
    func printLL() {
        ll.printLL()
    }
}



extension Solution {
//    func printLRU() {
        
//        var ll = DoublyLinkedList()
//        ll.insertAtFront(node: DoubleListNode(val: 1), value: 100)
//        ll.insertAtFront(node: DoubleListNode(val: 2), value: 101)
//        ll.insertAtFront(node: DoubleListNode(val: 3), value: 102)
//        ll.insertAtFront(node: DoubleListNode(val: 4), value: 103)
//        
//        ll.printLL()
//        
//        ll.updatePriority(item: 2)
        
//        guard let (value, node) = ll.get(item: 3) else {
//            return
//        }
//        print(value, node.val)
        
//        ll.updatePriority(item: 2)
//        ll.updatePriority(item: 3)
//        
//        ll.printLL()
//        
//        ll.deleteLast()
//        ll.deleteLast()
//        
//        ll.printLL()
        
//        print(ll.deleteLast())
//        print(ll.deleteLast())
//        print(ll.deleteLast())
//        print(ll.deleteLast())
        
        
//        let lru = LRUCache(1)
        
//        lru.put(1, 1)
//        lru.put(2, 2)
//        
//        print(lru.get(1))
//        
//        lru.put(3, 3)
//        
//        print(lru.get(2))
//        
//        lru.put(4, 4)
//        
//        print(lru.get(1))
//        print(lru.get(3))
//        print(lru.get(4))
        
//        [[1],[2,1],[2],[3,2],[2],[3]]
//        lru.put(2, 1)
//        print(lru.get(2))
//        lru.put(3, 2)
//        print(lru.get(2))
//        print(lru.get(3))
        
        
//        [[2],[2],[2,6],[1],[1,5],[1,2],[1],[2]]
//
//        print(lru.get(2))
//        lru.put(2, 6)
//        print(lru.get(1))
//        lru.put(1, 5)
//        lru.put(1, 2)
//        print(lru.get(1))
//        print(lru.get(2))
        
        
//        [[2],[2,1],[2,2],[2],[1,1],[4,1],[2]]
        
//        lru.put(2, 1)
//        lru.put(2, 2)
//        print(lru.get(2))
//        lru.put(1, 1)
//        lru.put(4, 1)
//        print(lru.get(2))
//    }
}
