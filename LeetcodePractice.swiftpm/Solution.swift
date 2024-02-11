//
//  Solution.swift
//  LeetcodePractice
//
//  Created by Mohit Kumar on 04/02/24.
//

import Foundation

final class Solution: ObservableObject {
    
    //    func solve() {
    //        print(threeSumClosest([1,1,1,0], -100))
    
    //        var elements = ["3", "2", "2", "3"]
    //        print(removeElement(&elements, "3"))
    
    //        var elements = [0,0,1,1,1,2,2,2,3,3,4]
    //        _ = removeDuplicatesKeepOne(&elements)
    
    //        var elements = [1,1,1,2,2,3]
    //        _ = removeDuplicates(&elements)
    
    //        var elements = [1,2,3,4,5,6,7]
    //        rotate(&elements, 3)
    
    //        let maxProfitResult = maxProfit([7, 1, 5, 6 , 8, 3, 6, 4])
    //        print(maxProfitResult)
    //
    //        print(maxProfit([7,6,4,3,1]))
    
    //        print(isPalindrome("A man, a plan, a canal: Panama"))
    //        print(isPalindrome("race a car"))
    //        print(isPalindrome(" "))
    //        print(isPalindrome("."))
    
    
    //        print(canJump([2,3,1,1,4]))
    //        print(canJump([3,2,1,0,4]))
    //        print(canJump([2,0]))
    
    //        print(lengthOfLongestSubstring("abccdbcbb"))
    //        print(lengthOfLongestSubstring("au"))
    //        print(lengthOfLongestSubstring(" "))
    //        print(lengthOfLongestSubstring("uqinntq"))
    
    //        print(minSubArrayLen(7, [2,3,1,2,4,3]))
    //        print(minSubArrayLen(4, [1,4,4]))
    //        print(minSubArrayLen(11, [1,1,1,1,1,1,1,1]))
    //        print(minSubArrayLen(11, [1,2,3,4,5]))
    
    //        let head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, nil)))))
    //        removeNthFromEnd(head, 4)
    //        let tempHead = ListNode(head.val, head.next)
    //        printList(tempHead)
    
    
    
    /// BFS Array
    //        print(shortestPathBinaryMatrix([[0,1],[1,0]]))
    //        print(shortestPathBinaryMatrix([[0,0,0],[1,1,0],[1,1,0]]))
    //        print(shortestPathBinaryMatrix([[1,0,0],[1,1,0],[1,1,0]]))
    //        print(shortestPathBinaryMatrix([[0,0,0],[1,1,0],[1,1,1]]))
    //        print(shortestPathBinaryMatrix([[0,0,0,1],[0,0,1,0],[0,1,0,0],[1,0,0,0]]))  // --> 4
    // print(shortestPathBinaryMatrix([[0,1,1,0,0,0],[0,1,0,1,1,0],[0,1,1,0,1,0],[0,0,0,1,1,0],[1,1,1,1,1,0],[1,1,1,1,1,0]])) //--> 14
    
    //        var A = ["pom", "pim", "mohit"]
    //        var B = ["12345", "5678", "8008"]
    //        var P = "8080"
    //        print(solution(&A, &B, &P))
    //    }
    
    public func solution(_ A : inout [String], _ B : inout [String], _ P : inout String) -> String {
        var foundIndices = [Int]()
        for (index, numberString) in B.enumerated() {
            if numberString.contains(P) {
                foundIndices.append(index)
            }
        }
        
        /// Get user names of found indices
        var userNames = [String]()
        for foundIndex in foundIndices {
            userNames.append(A[foundIndex])
        }
        userNames.sort()
        
        return userNames.isEmpty ? "NO CONTACT" : userNames[0]
    }
    
    
    /// Leet Code Problems
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var minimumSumSoFar = Int.max
        for i in stride(from: 0, to: nums.count - 2, by: 1) {
            for j in stride(from: i+1, to: nums.count - 1, by: 1) {
                for k in stride(from: j+1, to: nums.count, by: 1) {
                    let currentSum = nums[i] + nums[j] + nums[k]
                    let absoluteDifference = abs((target - currentSum))
                    if absoluteDifference < minimumSumSoFar {
                        minimumSumSoFar = currentSum
                    }
                }
            }
        }
        return minimumSumSoFar
    }
    
    func removeElement(_ nums: inout [String], _ val: String) -> Int {
        var firstPointer = 0
        var lastPointer = nums.count - 1
        
        while(firstPointer < lastPointer) {
            var value = nums[firstPointer]
            if value == val {
                /// Replace current index item with lastPointer item
                let lastPointerValue = nums[lastPointer]
                
                if lastPointerValue == val {
                    nums[lastPointer] = "_"
                    nums[firstPointer] = "_"
                } else {
                    let tempValue = nums[firstPointer]
                    nums[firstPointer] = nums[lastPointer]
                    nums[lastPointer] = tempValue
                }
                
                firstPointer += 1
                lastPointer -= 1
            } else {
                firstPointer += 1
            }
        }
        print(nums)
        return nums.filter({ $0 != "_"}).count
    }
    
    /// https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/?envType=study-plan-v2&envId=top-interview-150
    func removeDuplicatesKeepOne(_ nums: inout [Int]) -> Int {
        var firstPointer = 0
        var secondPointer = 1
        while(firstPointer < nums.count && secondPointer < nums.count) {
            guard nums[secondPointer] != nums[firstPointer] else {
                nums.remove(at: secondPointer)
                continue
            }
            
            firstPointer += 1
            secondPointer += 1
        }
        
        return nums.count
    }
    
    /// https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/description/?envType=study-plan-v2&envId=top-interview-150
    /// Input: nums = [1,1,1,2,2,3]
    /// Output: 5, nums = [1,1,2,2,3,_]
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var i = 0
        for (idx, num) in nums.enumerated() {
            guard idx >= 2 else {
                i += 1
                continue
            }
            
            /// Check i-2 index element is not same
            /// If same then go to next number but i will point to that number itself which is duplicate so that we can replace with coming unique numbers
            if num != nums[i-2] {
                nums[i] = num
                i += 1
            }
        }
        
        return i
    }
    
    /// https://leetcode.com/problems/rotate-array/?envType=study-plan-v2&envId=top-interview-150
    func rotate(_ nums: inout [Int], _ k: Int) {
        let cutIndex = k % nums.count
        
        reverse(start: 0, end: nums.count-1)
        reverse(start: 0, end: cutIndex-1)
        reverse(start: cutIndex, end: nums.count-1)
        
        func reverse(start: Int, end: Int) {
            var iStart = start
            var iEnd = end
            while(iStart < iEnd) {
                (nums[iStart], nums[iEnd]) = (nums[iEnd], nums[iStart])
                iStart += 1
                iEnd -= 1
            }
        }
    }
    
    /// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/?envType=study-plan-v2&envId=top-interview-150
    func maxProfitTwo(_ prices: [Int]) -> Int {
        var maxProfit = 0
        var buyPrice = prices[0]
        
        for price in prices {
            if buyPrice < price {
                maxProfit = max(price-buyPrice, maxProfit)
            } else {
                buyPrice = price
            }
        }
        
        return maxProfit
    }
    
    /// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/description/?envType=study-plan-v2&envId=top-interview-150
    func maxProfit(_ prices: [Int]) -> Int {
        let buyPrice = prices[0]
        var maxProfit = 0
        
        var startIndex = 0
        while(startIndex+1 < prices.count) {
            let currentProfit = prices[startIndex+1] - prices[startIndex]
            maxProfit += currentProfit > 0 ? currentProfit : 0
            
            startIndex += 1
        }
        
        return maxProfit
    }
    
    
    /// https://leetcode.com/problems/jump-game/?envType=study-plan-v2&envId=top-interview-150
    func canJump(_ nums: [Int]) -> Bool {
        
        /*
         /// O(N*N) solution - Using dyanmic programming concept
         let finalIndex = nums.count - 1
         var dp = [String: Bool]()
         func canJumpUtil(currentIndex: Int, maxJumpValue: Int) -> Bool {
         guard currentIndex < finalIndex else {
         dp["\(currentIndex),\(maxJumpValue)"] = true
         return true
         }
         
         guard maxJumpValue != 0 else {
         dp["\(currentIndex),\(maxJumpValue)"] = false
         return false
         }
         
         if let value = dp["\(currentIndex),\(maxJumpValue)"] {
         return value
         }
         
         for it in stride(from: 1, through: maxJumpValue, by: 1) {
         let nextIndex = currentIndex+it
         let result = canJumpUtil(currentIndex: nextIndex,
         maxJumpValue: nums[nextIndex])
         if result {
         dp["\(currentIndex),\(maxJumpValue)"] = result
         return result
         }
         }
         
         dp["\(currentIndex),\(maxJumpValue)"] = false
         return false
         }
         
         return canJumpUtil(currentIndex: 0, maxJumpValue: nums[0])
         */
        
        var it = nums.endIndex - 1
        var goalIndex = it
        while(it > 0) {
            let prvIndex = it - 1
            if (prvIndex + nums[prvIndex] >= goalIndex) {
                goalIndex = prvIndex
            }
            
            it -= 1
        }
        
        return goalIndex == 0
    }
}

extension Solution {
    /// https://leetcode.com/problems/valid-palindrome/?envType=study-plan-v2&envId=top-interview-150
    func isPalindrome(_ s: String) -> Bool {
        let updateStr = s.components(separatedBy: CharacterSet.alphanumerics.inverted)
            .flatMap({ $0.lowercased() })
        
        if updateStr.count == 1 || updateStr.count == 0 {
            return true
        }
        
        var startIterator = 0
        var endIterator = updateStr.count - 1
        
        while(startIterator < endIterator) {
            guard updateStr[startIterator] == updateStr[endIterator] else {
                return false
            }
            
            startIterator += 1
            endIterator -= 1
        }
        
        return true
    }
}

extension Solution {
    /// https://leetcode.com/problems/longest-substring-without-repeating-characters/description/?envType=study-plan-v2&envId=top-interview-150
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        let str = s.map{ $0 }
        
        var startIdx = 0
        var endIdx = 0
        
        var maxLengthLongestSubstring = 1
        var uniqueCharacterSet = Set<Character>()
        
        while(endIdx < str.count) {
            let currentChar = str[endIdx]
            if uniqueCharacterSet.contains(currentChar) {
                /// Move start index to correct place
                while(uniqueCharacterSet.contains(currentChar) && startIdx < str.count) {
                    let cR = str[startIdx]
                    uniqueCharacterSet.remove(cR)
                    
                    startIdx += 1
                }
            }
            
            let currentMax = endIdx - startIdx + 1
            maxLengthLongestSubstring = max(maxLengthLongestSubstring, currentMax)
            
            uniqueCharacterSet.insert(currentChar)
            endIdx += 1
        }
        
        return maxLengthLongestSubstring
    }
    
    /// https://leetcode.com/problems/minimum-size-subarray-sum/description/?envType=study-plan-v2&envId=top-interview-150
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var firstPointer = 0
        var secondPointer = 0
        var minLength = Int.max
        
        var currentSum = 0
        while(secondPointer < nums.count) {
            currentSum += nums[secondPointer]
            
            while(currentSum >= target) {
                minLength = min(minLength, secondPointer - firstPointer + 1)
                currentSum -= nums[firstPointer]
                firstPointer += 1
            }
            
            secondPointer += 1
        }
        
        return minLength != Int.max ? minLength : 0
    }
    
    //    func threeSum(_ nums: [Int]) -> [[Int]] {
    //        var results = [[Int]]()
    //        let sortedNums = nums.sorted()
    //        var start = 0
    //        var end = nums.count - 1
    //
    //        while(start < end) {
    //            let startNo = nums[start]
    //            let endNo = nums[end]
    //            let searchNo = -(startNo+endNo)
    //
    //            /// Find no in range start+1 to end-1
    //            var it = start+1
    //            var foundIndex = -1
    //            while(it < end) {
    //                if nums[it] == searchNo {
    //                    foundIndex = it
    //                    break
    //                }
    //
    //                it += 1
    //            }
    //
    //            if foundIndex != -1 {
    //                results.append([nums[start], nums[end], nums[foundIndex]])
    //            }
    //        }
    //        return results
    //    }
    
//    func threeSum(_ nums: [Int]) -> [[Int]] {
//        var results = [[Int]]()
//        var dic = [String: Bool]()
//        
//        let sortedNums = nums.sorted()
//        for i in stride(from: 0, to: sortedNums.count - 2, by: 1) {
//            let currNo = sortedNums[i]
//            let result = findTwoSum(nums: sortedNums,
//                                    from: i+1,
//                                    to: sortedNums.count-1,
//                                    target: -currNo)
//            if !result.isEmpty {
//                for comb in result {
//                    let (j, k) = comb
//                    let resultArr = [sortedNums[i], sortedNums[j], sortedNums[k]].sorted()
//                    let key = "\(resultArr[0])\(resultArr[1])\(resultArr[2])"
//                    if let isAlreadyExist = dic[key], isAlreadyExist {
//                        continue
//                    } else {
//                        results.append(resultArr)
//                        dic[key] = true
//                    }
//                }
//            }
//        }
//        return results
//    }
//    
//    func findTwoSum(nums: [Int], from: Int, to: Int, target: Int) -> [(Int, Int)] {
//        var result = [(Int, Int)]()
//        
//        var start = from
//        var end = to
//        while(start < end) {
//            let curSum = nums[start] + nums[end]
//            if curSum > target {
//                end -= 1
//            } else if curSum < target {
//                start += 1
//            } else {
//                result.append((start, end))
//                start += 1
//                end -= 1
//            }
//        }
//        
//        return result
//    }
    
//    func isSubsequence(_ s: String, _ t: String) -> Bool {
//        let input = s.map({ String($0) })
//        let sample = t.map({ String($0) })
//        var iStart = 0
//        let iEnd = input.count
//        
//        var sStart = 0
//        let sEnd = sample.count
//        
//        while(iStart < iEnd && sStart < sEnd) {
//            let currentInputChar = input[iStart]
//            let currentSampleChar = sample[sStart]
//            
//            if currentInputChar == currentSampleChar {
//                iStart += 1
//                sStart += 1
//            } else {
//                sStart += 1
//            }
//        }
//        
//        return iStart == iEnd
//    }
    
//    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
//        var firstPointer = 1
//        var secondPointer = numbers.count
//        for (index, number) in numbers.enumerated() {
//            let newTarget = target - number
//            let anotherIndex = bSearch(numbers: numbers,
//                                       startIndex: index+1,
//                                       endIndex: numbers.count - 1,
//                                       target: newTarget)
//            if anotherIndex != -1 {
//                return [index+1, anotherIndex+1]
//            }
//        }
//        
//        return []
//    }
//    
//    func bSearch(numbers: [Int],
//                 startIndex: Int,
//                 endIndex: Int,
//                 target: Int) -> Int {
//        guard startIndex <= endIndex else {
//            return -1
//        }
//        
//        let mid = (startIndex+endIndex)/2
//        let midElement = numbers[mid]
//        
//        if midElement == target {
//            return mid
//        } else if midElement < target {
//            return bSearch(numbers: numbers,
//                           startIndex: startIndex+1,
//                           endIndex: endIndex,
//                           target: target)
//        } else {
//            return bSearch(numbers: numbers,
//                           startIndex: startIndex,
//                           endIndex: mid-1,
//                           target: target)
//        }
//    }
//    
    
    /// Hashing
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        var dic = [Int: Set<Int>]()
//        for (index, num) in nums.enumerated() {
//            if let va = dic[num], !va.isEmpty {
//                dic[num]?.insert(index)
//            } else {
//                dic[num] = [index]
//            }
//        }
//        
//        for (index, num) in nums.enumerated() {
//            let target = target-num
//            
//            /// This will exempt current number from lookup
//            dic[num]?.remove(index)
//            
//            if let arr = dic[target] {
//                /// Indices for num
//                if !arr.contains(index), let firstIndex = arr.first {
//                    return [index, firstIndex]
//                }
//            }
//        }
//        return []
//    }
    
//    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
//        var dic = [Int: Set<Int>]()
//        
//        /// Creating map which contains duplicate item as key and their respective indices as array
//        for (index, num) in nums.enumerated() {
//            if let val = dic[num], !val.isEmpty {
//                dic[num]?.insert(index)
//            } else {
//                dic[num] = [index]
//            }
//        }
//
//        for (key, value) in dic {
//            /// Check if any item is duplicate
//            if value.count > 1 {
//                let sortedIndices = value.sorted() // Sort indices of that item <
//                
//                /// Loop through all indices and check if any has abs diff <= k
//                for i in stride(from: 0, to: sortedIndices.count - 1, by: 1) {
//                    if abs(sortedIndices[i+1] - sortedIndices[i]) <= k {
//                        return true
//                    }
//                }
//            }
//        }
//
//        return false
//    }
    
//    func groupAnagrams(_ strs: [String]) -> [[String]] {
//        var map = [String: [String]]()
//        var results = [[String]]()
//        
//        /// Preparing map
//        for str in strs {
//            let sortedStr = str.sorted().reduce("", { String($0)+String($1) })
//            if let value = map[sortedStr] {
//                map[sortedStr]?.append(str)
//            } else {
//                map[sortedStr] = [str]
//            }
//        }
//        
//        map.values.forEach { rst in
//            results.append(rst)
//        }
//        
//        return results
//    }
    
//    func longestConsecutive(_ nums: [Int]) -> Int {
//        guard !nums.isEmpty else {
//            return 0
//        }
//        
//        var dic = [Int: Bool]()
//        for num in nums {
//            dic[num] = true
//        }
//        
//        var maxLength = 1
//        var index = 0
//        while(index < nums.count) {
//            let currentNo = nums[index]
//            
//            /// Check if next no is present
//            /// If yes, We can calculate how many other increasing squence no are present
//            if (dic[currentNo+1] ?? false) {
//                var currentLength = 1
//                
//                /// Loop from array remaining length to total array size
//                var i = 0 // Remaing space in array
//                var nextNo = currentNo+1
//                while(dic[nextNo] != nil && dic[nextNo] != false) {
//                    currentLength += 1
//                    maxLength = max(maxLength, currentLength)
//                    nextNo += 1
//                }
//            }
//            
//            index += 1
//        }
//        
//        return maxLength
//    }
//    
//    func majorityElement(_ nums: [Int]) -> Int {
//        let freq = dicWithFreq(nums)
//        let moreThan = (Double(nums.count)/2.0).rounded(.up)
//        
//        for (key, value) in freq {
//            if Double(value) >= moreThan {
//                return key
//            }
//        }
//        return 0
//    }
//    
//    func dicWithFreq(_ nums: [Int]) -> [Int: Int] {
//        var result = [Int: Int]()
//        for num in nums {
//            if let value = result[num] {
//                result[num] = value + 1
//            } else {
//                result[num] = 1
//            }
//        }
//        return result
//    }
    
//    func reverseWords(_ s: String) -> String {
//        let sArr = s
//            .split(separator: " ")
//            .reversed()
//            .joined(separator: " ")
//        return sArr
//    }
    
//    func productExceptSelf(_ nums: [Int]) -> [Int] {
//        var forMul = [Int]()
//        var backMul = [Int](repeating: 0, count: nums.count)
//        
//        let size = nums.count
//        
//        var results = [Int](repeating: 0, count: nums.count)
//        
//        forMul.append(nums[0])
//        for index in stride(from: 1, to: size, by: 1) {
//            forMul.append(forMul[index-1] * nums[index])
//        }
//        
//        backMul[size-1] = nums[size-1]
//        for index in stride(from: size-2, through: 0, by: -1) {
//            backMul[index] = backMul[index+1] * nums[index]
//        }
//        
//        for index in stride(from: 0, to: size, by: 1) {
//            var firstRes = 1
//            var secondRes = 1
//            if nums.indices.contains(index-1) {
//                firstRes = forMul[index-1]
//            }
//            
//            if nums.indices.contains(index+1) {
//                secondRes = backMul[index+1]
//            }
//            
//            results[index] = secondRes * firstRes
//        }
//        
//        return results
//    }
    
//    [0,0,9,0,0]
    
//    func solve() {
//        print(threeSum([-1,0,1,2,-1,-4]))
//        print(isSubsequence("abc", "ahbgdc"))
//        print(isSubsequence("axc", "ahbgdc"))
//        print(isSubsequence("bac", "ahbgdc"))
        
//        print(twoSum([2,7,11,15], 9))
//        print(twoSum([2,3,4], 6))
//        print(twoSum([-1,0], -1))
//        print(twoSum([3,3], 6))
         
//        print(containsNearbyDuplicate([1,2,3,1], 3))
//        print(containsNearbyDuplicate([1,0,1,1], 1))
//        print(containsNearbyDuplicate([1,2,3,1,2,3], 2))
        
//        print(groupAnagrams(["eat","tea","tan","ate","nat","bat"]))
//        print(groupAnagrams([""]))
//        print(groupAnagrams(["a"]))
        
//        print(longestConsecutive([100,4,200,1,3,2]))
//        print(longestConsecutive([0,3,7,2,5,8,4,6,0,1]))
//        print(longestConsecutive([9,1,4,7,3,-1,0,5,8,-1,6]))
        
//        print(majorityElement([3,2,3]))
//        print(majorityElement([2,2,1,1,1,2,2]))
        
//        print(reverseWords(" a good   example "))
        
//        print(productExceptSelf([1,2,3,4]))
//        print(productExceptSelf([-1,1,0,-3,3]))
//    }
}
