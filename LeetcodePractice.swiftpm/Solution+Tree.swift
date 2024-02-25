//
//  Solution+Tree.swift
//  LeetcodePractice
//
//  Created by Mohit Kumar on 16/02/24.
//

import Foundation

extension Solution {
//    func solve() {
//        let head = TreeNode(1)
//        head.left = TreeNode(2)
        
//        head.left = TreeNode(4)
//        head.right = TreeNode(8)
//        
//        head.left?.left = TreeNode(11)
//        head.left?.left?.left = TreeNode(7)
//        head.left?.left?.right = TreeNode(2)
//        
//        
//        
//        head.right?.left = TreeNode(13)
//        head.right?.right = TreeNode(4)
//        
//        head.right?.right?.right = TreeNode(1)
        
//        print(hasPathSum(head, 1))
        
        
//        let root = TreeNode(1)
//        root.left = TreeNode(2)
//        root.right = TreeNode(3)
//        
//        root.left?.left = TreeNode(4)
//        root.left?.right = TreeNode(5)
//        
//        root.right?.left = TreeNode(6)
        
//        print(countNodes(root))
        
//        let root = TreeNode(1)
//        root.right = TreeNode(5)
//        root.right = TreeNode(0)
//        
//        root.left?.left = TreeNode(5)
//        root.left?.right = TreeNode(1)
        
//        print(sumNumbers(root))
//        invertTree(root)
//    }
    
    func printLevelOrder(_ root: TreeNode?) {
        var queue = Queue<TreeNode?>()
        queue.enqueue(root)
        queue.enqueue(nil)
        
        while(!queue.isEmpty) {
            guard let item = queue.dequeue() else {
                continue
            }
            
            guard let item = item else {
                if queue.peek == nil {
                    break
                }
                
                queue.enqueue(nil)
                print("")
                continue
            }
            
            print(item.val, separator: " ")
            if let left = item.left {
                queue.enqueue(left)
            }
            
            if let right = item.right {
                queue.enqueue(right)
            }
        }
    }
    
    /// https://leetcode.com/problems/invert-binary-tree/?envType=study-plan-v2&envId=top-interview-150
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        let newRoot = constructTree(root, newRoot: nil)
        printLevelOrder(newRoot)
        return nil
    }
    
    func constructTree(_ root: TreeNode?, newRoot: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        var newRoot = TreeNode(root.val)
        
        newRoot.left = constructTree(root.right, newRoot: newRoot.left)
        newRoot.right = constructTree(root.left, newRoot: newRoot.right)
        
        return newRoot
    }
    
    func sumNumbers(_ root: TreeNode?) -> Int {
        var results = [String]()
        var currentStr = ""
        sumNumbersUtil(root, results: &results, currentStr: currentStr)
        print(results)
        var total = 0
        for str in results {
            guard let num = Int(str) else {
                continue
            }
            total += num
        }
        return total
    }
    
    func sumNumbersUtil(_ root: TreeNode?, results: inout [String], currentStr: String) {
        guard let root = root else {
            return
        }
        
        var mutableStr = currentStr
        if (root.left == nil && root.right == nil) {
            mutableStr += "\(root.val)"
            results.append(mutableStr)
            return
        }
        
        mutableStr += "\(root.val)"
        sumNumbersUtil(root.left, results: &results, currentStr: mutableStr)
        sumNumbersUtil(root.right, results: &results, currentStr: mutableStr)
    }
    
    /// https://leetcode.com/problems/count-complete-tree-nodes/?envType=study-plan-v2&envId=top-interview-150
    func countNodes(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        var nodeCount = 0
        dfsUtil(root, count: &nodeCount)
        
        return nodeCount
    }
    func dfsUtil(_ root: TreeNode?, count: inout Int) {
        guard let root = root else {
            return
        }
        
        count += 1
        dfsUtil(root.left, count: &count)
        dfsUtil(root.right, count: &count)
    }
    
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        var currentSum = 0
        return hasPathSumUtil(root, targetSum, currentSum)
    }
    
    func hasPathSumUtil( _ root: TreeNode?, _ targetSum : Int, _ currentSum: Int) -> Bool {
        if currentSum == targetSum {
            return true
        }
        
        if currentSum > targetSum {
            return false
        }
        
        guard let root = root else {
            return false
        }
        
        var mutableCurrentSum = currentSum
        mutableCurrentSum += root.val
        
        return hasPathSumUtil(root.left, targetSum, mutableCurrentSum) || hasPathSumUtil(root.right, targetSum, mutableCurrentSum)
    }
}
