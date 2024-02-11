//
//  Queue.swift
//  LeetcodePractice
//
//  Created by Mohit Kumar on 06/02/24.
//

import Foundation

class Node<T>: CustomStringConvertible {
    
    var value: T
    var next: Node?
    
    var description: String {
        guard let next = next else { return "\(value)" }
        return "\(value) -> " + String(describing: next)
    }
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

struct Queue<T>: CustomStringConvertible {
    
    private var front: Node<T>?
    
    private var rear: Node<T>?
    
    init() { }
    
    var isEmpty: Bool {
        return front == nil
    }
    
    var description: String {
        guard let front = front else { return "Empty Queue" }
        return String(describing: front)
    }
    
    var peek: T? {
        return front?.value
    }
}

extension Queue {
    mutating private func push(_ value: T) {
        front = Node(value: value, next: front)
        if rear == nil {
            rear = front
        }
    }
    
    /// This will add item to rear of the list
    mutating func enqueue(_ value: T) {
        if isEmpty {
            self.push(value)
            return
        }
        
        rear?.next = Node(value: value)
        rear = rear?.next
    }
    
    /// This will remove item from the front of the list
    mutating func dequeue() -> T? {
        defer {
            front = front?.next
            if isEmpty {
                rear = nil
            }
        }
        return front?.value
    }
}
