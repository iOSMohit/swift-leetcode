//
//  Solution+Arrays.swift
//  LeetcodePractice
//
//  Created by Mohit Kumar on 09/02/24.
//

import Foundation

extension Solution {
//    func processURL() {
//        let url = "https://www.lowes.com/l/your-recommendations?eventId=event-id&divId=based-on-your-purchase"
//        guard let uRL = URL(string: url), "your-recommendations" == uRL.pathComponents.last else {
//            return
//        }
//        print(uRL.pathComponents)
//        print(uRL.path(percentEncoded: false))
//    }
    
//    func solve() {
//        let s = "PAYPALISHIRING"
//        print(s.count/(5))
        
//        processURL()
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
        
//        print(wordPattern("abba", "dog dog dog dog"))
//        print(wordPattern("aaa", "aa aa aa aa"))
//        print(wordPattern("he", "unit"))
        
//        print(isHappy(19))
//        print(isHappy(12))
//        print(isHappy(7))
//        print(isHappy(10042))
        
//        print(romanToInt("III"))
//        print(romanToInt("LVIII"))
//        print(romanToInt("MCMXCIV"))
//        print(romanToInt("DCXXI"))
        
//        print(maxArea([1,8,6,2,5,4,8,3,7]))
        
//        print(plusOne([1,2,9,1]))
//    }
    
    func plusOne(_ digits: [Int]) -> [Int] {
        var mutableDigits = digits
        var lastPointer = mutableDigits.count - 1
        
        var carry = 1
        while(lastPointer >= 0) {
            let newResult = mutableDigits[lastPointer] + carry
            print(newResult, mutableDigits)
            if newResult > 9 {
                mutableDigits[lastPointer] = 0
                carry = 1
            } else {
                mutableDigits[lastPointer] = newResult
                carry = 0
            }
            
            lastPointer -= 1
        }
        
        if carry != 0 {
            mutableDigits.insert(1, at: 0)
        }
        
        return mutableDigits
    }
    /// https://leetcode.com/problems/container-with-most-water
    func maxArea(_ height: [Int]) -> Int {
        var leftPointer = 0
        var rightPointer = height.count - 1
        
        var maxArea = 0
        while(leftPointer < rightPointer) {
            let leftHeight = height[leftPointer]
            let rightHeight = height[rightPointer]
            
            let currentArea = (rightPointer - leftPointer) * min(leftHeight, rightHeight)
            maxArea = max(maxArea, currentArea)
            
            if leftHeight < rightHeight {
                leftPointer += 1
            } else {
                rightPointer -= 1
            }
        }
        
        return maxArea
    }
    
    func romanToInt(_ s: String) -> Int {
        let str = Array(s)
        let dic: [String: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000, "IV": 4, "IX": 9, "XL": 40, "XC": 90, "CD": 400, "CM": 900]
        
        let isSpecial: (String) -> Bool = { str -> Bool in
            (str == "I" || str == "X" || str == "C")
        }
        
        let isSpecialTwo: (String) -> Bool = { str -> Bool in
            (str == "V" || str == "X" || str == "L" || str == "C" || str == "D" || str == "M")
        }
        
        var number = 0
        for (index, char) in str.enumerated() {
            let charStr = String(char)
            
            if isSpecialTwo(charStr) && index > 0 && isSpecial(String(str[index-1])) {
                let previousStr = String(str[index-1])
                if let value = dic[previousStr+charStr] {
                    number -= dic[previousStr]!
                    number += value
                    continue
                }
            }
            
            if let num = dic[charStr] {
                number += num
            }
        }
        
        return number
    }
    
    /// https://leetcode.com/problems/word-pattern/
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        var patternArr = pattern
            .split(separator: "")
            .compactMap({ String($0) })
        
        var words = s
            .components(separatedBy: " ")
        
        var map = [String: String]()
        var valueToKeyMap = [String: String]()
        
        guard patternArr.count == words.count else {
            return false
        }
        var count = max(patternArr.count, words.count)
        for it in 0..<count {
            let char = it < patternArr.count ? patternArr[it] : ""
            let word = it < words.count ? words[it] : ""
            
            /// Check value to key map collide
            if let value = valueToKeyMap[word] {
                if value != char {
                    return false
                }
            } else {
                valueToKeyMap[word] = char
            }
            
            /// Check key to value map collide
            if let value = map[char] {
                if value != word {
                    return false
                }
            } else {
                map[char] = word
            }
        }
        
        return true
    }
    
    /// tidle --> paper
    /// https://leetcode.com/problems/isomorphic-strings/?envType=study-plan-v2&envId=top-interview-150
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        /// Only when t size is less than or equal to s size
        guard t.count <= s.count else {
            return false
        }
        
        let sArr = s.split(separator: "").map({ String($0) })
        let tArr = t.split(separator: "").map({ String($0) })
        
        var sDic = [String: String]()
        var tDic = [String: String]()
        
        var it = 0
        for it in 0..<sArr.count {
            let sChar = sArr[it]
            let tChar = tArr[it]
            
            if let tValue = sDic[sChar] {
                if tValue != tChar {
                    return false
                }
            } else {
                sDic[sChar] = tChar
            }
            
            if let sValue = tDic[tChar] {
                if sValue != sChar {
                    return false
                }
            } else {
                tDic[tChar] = sChar
            }
        }
        
        return true
    }
    
    
    func isHappy(_ n: Int) -> Bool {
        var number = n
        let map = [0: 0, 1: 1, 2: 4, 3: 9, 4: 16, 5: 25, 6: 36, 7: 49, 8: 64, 9: 81]
        while(number != 1) {
            if number == 2 || number == 3 || number == 4 ||  number == 5 || number == 6 ||  number == 8 || number == 9 {
                return false
            }
            
            if number == 7 {
                return true
            }
            
            var result = 0
            while(number > 0) {
                let rem = number % 10
                let restNum = number/10
                
                result += map[rem]!
                number = restNum
            }
            
            number = result
        }
        
        return number == 1
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
