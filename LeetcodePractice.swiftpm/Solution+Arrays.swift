//
//  Solution+Arrays.swift
//  LeetcodePractice
//
//  Created by Mohit Kumar on 09/02/24.
//

import Foundation

extension Solution {
//    func solve() {
//        let heap = Heap([3, 9, 2, 1, 4, 5])
//        print(lengthOfLastWord("   fly me   to   the moon  "))
        
//        let list1 = ListNode(2)
//        list1.next = ListNode(4)
//        list1.next = ListNode(3)
//        
//        let list2 = ListNode(5)
//        list2.next = ListNode(6)
//        list2.next = ListNode(4)
//        
//        let newListNode = addTwoNumbers(list1, list2)
//        printList(newListNode)
        
//        print(longestCommonPrefix(["flower","flow","flight"]))
//        print(longestCommonPrefix(["dog","racecar","car"]))
        
//        print(strStr("sadbutsad", "sad"))
//        print(strStr("leetcode", "leeto"))
//        print(strStr("mississippi", "issip"))
        
//        print(canConstruct("aa", "ab"))
//        print(canConstruct("aa", "aa"))
//        print(canConstruct("ba", "aa"))
        
//        print(isIsomorphic("foo", "bar"))
//        print(isIsomorphic("paper", "title"))
//        print(isIsomorphic("badc", "baba"))
//    }
    /// tidle --> paper
    /// https://leetcode.com/problems/isomorphic-strings/?envType=study-plan-v2&envId=top-interview-150
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var dic = [String: String]()
        let sArr = s.split(separator: "").map({ String($0) })
        let tArr = t.split(separator: "").map({ String($0) })
        
        var sDic = [String: Int]()
        var tDic = [String: Int]()
        
        var it = 0
        while(it < sArr.count) {
            sDic[sArr[it]] = (sDic[sArr[it]] ?? 0) + 1
            tDic[tArr[it]] = (tDic[tArr[it]] ?? 0) + 1

            it += 1
        }
        
        let sCount = sDic.values.map({ $0 }).sorted()
        let tCount = tDic.values.map({ $0 }).sorted()
        
        for it in (0..<sCount.count) {
            guard sCount[it] == tCount[it] else {
                return false
            }
        }
        
        return true
    }
    
    /// https://leetcode.com/problems/ransom-note/?envType=study-plan-v2&envId=top-interview-150
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var magDic = [String: Int]()
        
        /// Create map for magazine
        for mag in magazine.split(separator: "").map({ String($0) }) {
            magDic[mag] = (magDic[mag] ?? 0) + 1
        }
        
        for ran in ransomNote.split(separator: "").map({ String($0) }) {
            if let value = magDic[ran] {
                if value > 1 {
                    magDic[ran] = value - 1
                } else {
                    magDic[ran] = nil
                }
            } else {
                return false
            }
        }
        
        return true
    }
    
    func lengthOfLastWord(_ s: String) -> Int {
        s.split(separator: " ").last?.count ?? 0
    }
    
    /// https://leetcode.com/problems/longest-common-prefix/description/
    func longestCommonPrefix(_ strs: [String]) -> String {
        let sortedStr = strs.sorted(by: { $0.count < $1.count })
        var prevCommonPrefix = strs[0]
        for it in (1..<strs.count) {
            prevCommonPrefix = longestCommonPrefixUtil(str1: prevCommonPrefix,
                                                       str2: strs[it])
        }
        
        return prevCommonPrefix
    }
    
    func longestCommonPrefixUtil(str1: String, str2: String) -> String {
        let s1 = str1.split(separator: "")
        let s2 = str2.split(separator: "")
        
        var s1It = 0
        var s2It = 0
        var c = ""
        
        while(s1It < s1.count && s2It < s2.count) {
            guard s1[s1It] == s2[s2It] else {
                break
            }
            
            c += s1[s1It]
            s1It += 1
            s2It += 1
        }
        
        return c
    }
    
    /// https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let hayArr = haystack.split(separator: "")
        let neeArr = needle.split(separator: "")
        
        var neeIt = 0
        var hayIt = 0
        while(hayIt < hayArr.count) {
            var lastHayIt = hayIt
            
            /// If any char match check
            if neeArr[neeIt] == hayArr[hayIt] {
                while(neeIt < neeArr.count && hayIt < hayArr.count) {
                    guard neeArr[neeIt] == hayArr[hayIt] else {
                        break
                    }
                    
                    neeIt += 1
                    hayIt += 1
                }
                
                /// If needle found in haystaclk
                if neeIt == neeArr.count {
                    return hayIt-neeIt
                } else {
                    /// Did not match full string, reset neeIt to 0
                    neeIt = 0
                    hayIt = lastHayIt
                }
            }
            
            hayIt += 1
        }
        
        return neeIt == neeArr.count ? hayIt-neeIt : -1
    }
    
    
//    https://leetcode.com/problems/jump-game-ii/description/
    func jump(_ nums: [Int]) -> Int {
        /*
        0(2) --> 1(3)
        1(3) --> 2(1)
        1(3) --> 3(1)
        1(3) --> 4(4)
        
        0(2) --> 2(1)
        2(1) --> 3(1)
        3(1) --> 4(1)
        */
        
        
        return 1
    }
    
}
