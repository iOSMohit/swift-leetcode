//
//  Solution+RandomArray.swift
//  LeetcodePractice
//
//  Created by Mohit Kumar on 06/02/24.
//

import Foundation

extension Solution {
    
//    func solve() {
//        let urlString = "https://www.lowes.com/l/your-recommendations?eventId=some-event-id&divId=based-on-your-purchase"
//        if let url = URL(string: urlString),
//           let components = URLComponents(url: url, resolvingAgainstBaseURL: false) {
//            let pathComp = components.path.components(separatedBy: "/").last
//            print(pathComp)
//        }
//        
//        
//        
//        //        print(maxArea([1,8,6,2,5,4,8,3,7]))
//    }
    
    
    /// [[1,0,0],[1,1,0],[1,1,0]]
    /// https://leetcode.com/problems/shortest-path-in-binary-matrix
    
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        //        var queue = Queue<String>()
        //        var visitedNodes = [String: Bool]()
        //        for i in grid.indices {
        //            for j in grid[i].indices {
        //                visitedNodes[getKey(i, j)] = false
        //            }
        //        }
        
        let root = TreeNode(3)
        root.left = TreeNode(9)
        root.right = TreeNode(20)
        
        root.left?.left = TreeNode(10)
        root.left?.right = TreeNode(19)
        
        root.right?.left = TreeNode(15)
        root.right?.right = TreeNode(7)
        
        var queue = Queue<TreeNode?>()
        queue.enqueue(root)
        queue.enqueue(nil)
        
        var results = [[Int?]]()
        var i = 0
        var currentResult = [Int?]()
        while(!queue.isEmpty) {
            let itemNode = queue.dequeue()
            if let item = itemNode, let notNilNode = item {
                if let left = item?.left {
                    queue.enqueue(left)
                }
                
                if let right = item?.right {
                    queue.enqueue(right)
                }
                
                currentResult.append(item?.val)
                queue.enqueue(nil)
            } else {
                results.append(currentResult)
                currentResult = []
            }
        }
        
        print(results)
        
        //        for row in dp {
        //            for item in row {
        //                print("\(item) ", terminator: "")
        //            }
        //            print("")
        //        }
        
        //        let shortestPath = dp[0][0]
        //        return shortestPath != Int.max ? shortestPath : -1
        
        //        _ = shortestPathGridUtil(grid, size: grid.count, &visitedNodes, &queue)
        return -1
    }
    
    /*
     row, column-1 // Left
     row, column+1 // Right
     row + 1, column // Down
     row - 1, column // Up
     
     row-1, column-1 // Diagonal Left-Up
     row-1, column+1 // Diagonal Right-Up
     row + 1, column + 1 // Diagonal Right-Down
     row+1, column-1 // Diagonal Left-Down
     */
    private func shortestPathGridUtil(_ grid: [[Int]],
                                      size: Int,
                                      _ visitedNodes: inout [String: Bool],
                                      _ queue: inout Queue<String>) -> Int {
        queue.enqueue(getKey(0, 0))
        queue.enqueue("break")
        var i = 1
        //        print("LEVEL \(i)")
        
        var path = [String]()
        while(!queue.isEmpty) {
            let key = (queue.dequeue() ?? "").components(separatedBy: "-")
            
            if key[0] == "break" {
                i += 1
                //                print("NEXT LEVEL \(i)")
                
                /// End of level
                print("")
                continue
            }
            
            print(key)
            
            let row = Int(key[0]) ?? -1
            let column = Int(key[1]) ?? -1
            
            if row == grid.count - 1 && column == grid.count - 1 {
                print("Reached")
                continue
            }
            
            /// Visit node
            visitedNodes[getKey(row, column)] = true
            
            let neibhours = getNeighborValues(in: grid, at: row, column: column)
                .filter({ (grid[$0.0][$0.1] == 0 )})
            
            for neibhour in neibhours {
                if let isVisited = visitedNodes[getKey(neibhour.0, neibhour.1)], !isVisited {
                    queue.enqueue(getKey(neibhour.0, neibhour.1))
                }
            }
            
            queue.enqueue("break")
        }
        
        print(i)
        
        return -1
    }
    
    func pathLength() {
        
    }
    
    func getKey(_ row: Int, _ column: Int) -> String {
        return "\(row)-\(column)"
    }
    
    private func getNeighborValues(in array2D: [[Int]], at row: Int, column: Int) -> [(Int, Int)] {
        let numRows = array2D.count
        let numCols = array2D[0].count
        var neighbors: [(Int, Int)] = []
        
        let directions = [(0, -1), (0, 1), (-1, 0), (1, 0), (-1, -1), (-1, 1), (1, -1), (1, 1)]
        
        for (dx, dy) in directions {
            let newRow = row + dx
            let newColumn = column + dy
            
            if newRow >= 0 && newRow < numRows && newColumn >= 0 && newColumn < numCols {
                neighbors.append((newRow, newColumn))
            }
        }
        
        return neighbors
    }
    
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        
        var str = Array("\(x)")
        var start = 0
        var end = str.count - 1
        while(start <= end) {
            guard str[start] == str[end] else {
                return false
            }
            
            start += 1
            end -= 1
        }
        
        return true
    }
}
