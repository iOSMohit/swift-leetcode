//
//  File.swift
//  
//
//  Created by Mohit Kumar on 23/02/24.
//

import Foundation

final class ListNode {
    var val: Int
    var next: ListNode?
    init() { self.val = 0; self.next = nil; }
    init(_ val: Int) { self.val = val; self.next = nil; }
    init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

struct LinkedList {
    var head: ListNode?
    var trail: ListNode?
    
    mutating func append(item: Int) {
        let newNode = ListNode(item)
        if let lastNode = trail {
            lastNode.next = newNode
        } else {
            head = newNode
        }
        
        trail = newNode
    }
}

final class DoubleListNode {
    var val: Int
    var next: DoubleListNode?
    var previous: DoubleListNode?
    
    init(val: Int, next: DoubleListNode? = nil, previous: DoubleListNode? = nil) {
        self.val = val
        self.next = next
        self.previous = previous
    }
}

struct DoublyLinkedList {
    var head: DoubleListNode?
    var trail: DoubleListNode?
    private(set) var dic = [Int: (Int, DoubleListNode)]() {
        didSet {
            
        }
    }
    
    /// Tested and working good
    mutating func insertAtFront(node: DoubleListNode, value: Int) {
        if let head = head {
            head.previous = node
            node.next = head
            
            self.head = node
        } else {
            self.head = node
            self.trail = node
        }

        dic[node.val] = (value, node)
    }
    
    /// Tested and working good
    @discardableResult
    mutating func deleteLast() -> Int? {
        if let lastNode = self.trail {
            /// Reset links for last node and second last
            let prevNode = lastNode.previous
            prevNode?.next = nil
            
            /// Reset deleting node link
            lastNode.previous = nil
            lastNode.next = nil
            
            trail = prevNode
            if head === lastNode {
                head = nil
            }
            
            self.dic[lastNode.val] = nil
            
            return lastNode.val
        }

        return nil
    }
    
    /// Tested and working good
    ///  trailing getting missed when updating priority check this method
    mutating func updatePriority(item: Int) {
        guard let (_, node) = dic[item] else {
            return
        }
        
        if node === head {
            return
        }
        
        let nextNode = node.next
        let prevNode = node.previous
        
        prevNode?.next = nextNode
        nextNode?.previous = prevNode
        
        if let (_, node) = dic[node.val] {
            if node === trail {
                if node === head {
                    return
                }
                
                trail = prevNode
            }
            
            head?.previous = node
            node.next = head
            node.previous = nil
            head = node
        }
    }
    
    @discardableResult
    func get(item: Int) -> (Int, DoubleListNode)? {
        dic[item]
    }
    
    mutating func update(key: Int, value: Int) {
        if let (_, node) = dic[key] {
            dic[key] = (value, node)
        }
    }
    
    func printLL() {
        var tempHead = head
        
        while(tempHead != nil) {
            if let tempHead = tempHead {
                print(tempHead.val, separator: "", terminator: " ")
            }
            
            tempHead = tempHead?.next
        }
        
        print(" Dictionary has \(dic.keys) keys")
    }
}
