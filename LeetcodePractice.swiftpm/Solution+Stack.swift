//
//  Solution+Stack.swift
//  LeetcodePractice
//
//  Created by Mohit Kumar on 04/02/24.
//

import Foundation

extension Solution {
    class MinStack {
        private var elements = [Int]()
        init() {
            
        }
        
        func push(_ val: Int) {
            elements.append(val)
        }
        
        func pop() {
            elements.removeLast()
        }
        
        func top() -> Int {
            elements.last ?? 0
        }
        
        func getMin() -> Int {
            elements.sorted().first ?? 0
        }
    }
}
