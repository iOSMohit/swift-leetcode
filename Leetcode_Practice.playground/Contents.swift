import Foundation

class Solution {
    /// Other approach can be - Hash all value in dictionary
    /// Then check other value after subtracting first value from target in dictionary --> O(N)
    /// https://leetcode.com/problems/two-sum/
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for firstPointer in stride(from: 0, to: nums.count-1, by: 1) {
            for secondPointer in stride(from: firstPointer+1, to: nums.count, by: 1) {
                if (nums[firstPointer] + nums[secondPointer] == target) {
                    return [firstPointer, secondPointer]
                }
            }
        }
        return []
    }
    
    /// Brute Force Solution https://leetcode.com/problems/median-of-two-sorted-arrays/description/
    //    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    //        var resultArr = [Int]()
    //        var firstPointer = 0
    //        var secondPointer = 0
    //        while(firstPointer < nums1.count && secondPointer < nums2.count) {
    //            if (nums1[firstPointer] <= nums2[secondPointer]) {
    //                resultArr.append(nums1[firstPointer])
    //                firstPointer += 1
    //            } else {
    //                resultArr.append(nums2[secondPointer])
    //                secondPointer += 1
    //            }
    //        }
    //
    //        while(firstPointer < nums1.count) {
    //            resultArr.append(nums1[firstPointer])
    //            firstPointer += 1
    //        }
    //
    //        while(secondPointer < nums2.count) {
    //            resultArr.append(nums2[secondPointer])
    //            secondPointer += 1
    //        }
    //
    //        let finalArrLength = resultArr.count
    //        if finalArrLength % 2 == 0 {
    //            let middleIndex = finalArrLength/2
    //            let prefixMiddleIndex = middleIndex - 1
    //            let finalMedian = resultArr[middleIndex]+resultArr[prefixMiddleIndex]
    //            return Double(finalMedian)/2.0
    //        } else {
    //            let middleIndex = finalArrLength/2
    //            return Double(resultArr[middleIndex])
    //        }
    //    }
    
    /// Optimised Solution
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        if nums1.count > nums2.count {
            return findMedianSortedArrays(nums2, nums1)
        }
        var aLow = 0
        var aHigh = nums1.count
        let resultCount = (nums1.count + nums2.count) / 2
        
        while(aLow <= aHigh) {
            let aCut = (aLow+aHigh)/2
            let bCut = resultCount - aCut
            
            let l1 = aCut == 0 ? Int.min : nums1[aCut-1]
            let l2 = bCut == 0 ? Int.min : nums2[bCut-1]
            let r1 = aCut == nums1.count ? Int.max : nums1[aCut]
            let r2 = bCut == nums2.count ? Int.max : nums2[bCut]
            
            if l1 > r2 {
                aHigh = aCut - 1
            } else if l2 > r1 {
                aLow = aCut + 1
            } else {
                return (nums1.count+nums2.count) % 2 == 0 ? (Double(max(l1, l2)+min(r1, r2)) / 2.0) : Double(min(r1, r2))
            }
        }
        
        return 0.0
    }
    
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var minimumSumSoFar = Int.max
        for i in stride(from: 0, to: nums.count, by: 1) {
            for j in stride(from: i+1, to: nums.count, by: 1) {
                for k in stride(from: j+1, to: nums.count, by: 1) {
                    let currentSum = nums[i] + nums[j] + nums[k]
                    if (target - currentSum).abs < minimumSumSoFar {
                        minimumSumSoFar = currentSum
                    }
                }
            }
        }
        return minimumSumSoFar
    }
    
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var minimumSumSoFar = Int.max
        for i in stride(from: 0, to: nums.count - 2, by: 1) {
            for j in stride(from: i+1, to: nums.count - 1, by: 1) {
                for k in stride(from: j+1, to: nums.count, by: 1) {
                    let currentSum = nums[i] + nums[j] + nums[k]
                    if target < 0 {
                        let diff = target - currentSum
                        print(diff)
                        if diff > minimumSumSoFar {
                            minimumSumSoFar = diff
                        }
                    }
                }
            }
        }
        return minimumSumSoFar
    }
}

let solution = Solution()


//print(solution.findMedianSortedArrays([1, 5, 8, 10, 18, 20], [2, 3, 6, 7]))
//print(solution.findMedianSortedArrays([1], [3]))
//print(solution.findMedianSortedArrays([1, 2], [3, 4]))

