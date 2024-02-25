//
//  Solution+BST.swift
//  LeetcodePractice
//
//  Created by Mohit Kumar on 12/02/24.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

extension Solution {
//    func solve() {
//        let head = TreeNode(5)
//        head.left = TreeNode(3)
//        head.right = TreeNode(6)
//        
//        head.left?.left = TreeNode(2)
//        head.left?.right = TreeNode(4)
//        
//        head.left?.left?.left = TreeNode(1)
//        
//        print(kthSmallest(head, 3))
        
//        var nums = [1, 1, 1, 1, 1, 2, 2, 2, 3, 4, 4, 5, 5, 5, 5, 6, 7, 7, 7, 7, 8, 9, 10, 12, 12]
//        removeDuplciateFromSorted(&nums)
//    }
    
    /// Remove in place with O(n) time complexity and O(1) space
    func removeDuplciateFromSorted(_ arr: inout [Int]) {
        var it = 0 // Iterator to loop arr
        var j = it // Keep track on last item in result array
        var uIndex = it // Keep track of last unique item
        var size = arr.count
        
        
        while(it < size) {
            let cItem = arr[uIndex]
            
            while(it < size && cItem == arr[it]) {
                it += 1
            }
            
            /// Found unique number
            uIndex = it
            
            j += 1
            
            guard j < size && uIndex < size else {
                break
            }
            
            arr[j] = arr[uIndex]
        }
        
        print(Array(arr[0..<j]))
    }
    
//    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
//        let results = kthSmalletUtil(root)
//        return results[k-1]
//    }
//    
//    @discardableResult
//    func kthSmalletUtil(_ root: TreeNode?) -> [Int] {
//        guard let root = root else {
//            return []
//        }
//    
//        return kthSmalletUtil(root.left) + [root.val] + kthSmalletUtil(root.right)
//    }
}
