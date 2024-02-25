//
//  Solution+LinkList.swift
//  LeetcodePractice
//
//  Created by Mohit Kumar on 04/02/24.
//

import Foundation

extension Solution {
    func solve() {
//        let list1 = ListNode(1)
//        list1.next = ListNode(2)
//        list1.next?.next = ListNode(4)
//        
//        let list2 = ListNode(1)
//        list2.next = ListNode(3)
//        list2.next?.next = ListNode(4)
//        
//        let newHead = mergeTwoLists(list1, list2)
//        print(newHead?.val)
        
        /// Duplicate remove from LinkedList
//        var head = ListNode(1)
//        head.next = ListNode(2)
//        head.next?.next = ListNode(2)
//        head.next?.next?.next = ListNode(3)
//        head.next?.next?.next?.next = ListNode(3)
//        head.next?.next?.next?.next?.next = ListNode(4)
//        head.next?.next?.next?.next?.next?.next = ListNode(4)
//        head.next?.next?.next?.next?.next?.next?.next = ListNode(5)
        
//        var head = ListNode(1)
//        head.next = ListNode(2)
//        head.next?.next = ListNode(2)
//        head.next?.next?.next = ListNode(3)
//        head.next?.next?.next?.next = ListNode(4)
//        head.next?.next?.next?.next?.next = ListNode(4)
//        head.next?.next?.next?.next?.next?.next = ListNode(5)
//        head.next?.next?.next?.next?.next?.next?.next = ListNode(5)
        
//        printList(deleteDuplicates(head))
    }
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil {
            return list2
        }
        
        if list2 == nil {
            return list1
        }
        
        
        var ll = LinkedList()
        var l1 = list1
        var l2 = list2
        
        while(l1 != nil && l2 != nil) {
            guard let lv1 = l1, let lv2 = l2 else {
                continue
            }
            
            if lv1.val < lv2.val {
                ll.append(item: lv1.val)
                
                l1 = l1?.next
            } else {
                ll.append(item: lv2.val)
                
                l2 = l2?.next
            }
        }
        
        while(l1 != nil) {
            ll.append(item: l1!.val)
            l1 = l1?.next
        }
        
        while(l2 != nil) {
            ll.append(item: l2!.val)
            
            l2 = l2?.next
        }
        
        return ll.head
    }
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var currentN = 1
        
        guard let head = head else { return nil }
        var nextNode: ListNode? = ListNode(head.val, head.next)
        var tempHead: ListNode? = ListNode(head.val, head.next)
        while(currentN < n) {
            currentN += 1
            nextNode = nextNode?.next
        }
        
        while(nextNode?.next?.next != nil) {
            nextNode = nextNode?.next
            tempHead = tempHead?.next
        }
        
        /// Remove item
        tempHead?.next = tempHead?.next?.next
        
        return head
    }
    /// L1 - 2-->4-->3
    /// L2 - 5-->6-->4
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var list1 = l1
        var list2 = l2
        
        var (sum, carry) = performSum(list1: list1, list2: list2)
        
        let finalListHead = ListNode(sum+carry)
        
        /// Move to next node
        list1 = list1?.next
        list2 = list2?.next
        
        
        while(list1 != nil || list2 != nil) {
            let (sum,newCarry) = performSum(list1: list1, list2: list2, carry: carry)
            carry = newCarry
            finalListHead.next = ListNode(sum+carry)
            
            list1 = list1?.next
            list2 = list2?.next
        }
        
        func performSum(list1: ListNode?, list2: ListNode?, carry: Int = 0) -> (Int, Int) {
            let sum = (list1?.val ?? 0) + (list2?.val ?? 0) + carry
            if sum > 9 {
                return (0, 1)
            }
            
            return (sum, 0)
        }
        
        return finalListHead
    }
    
    
    func hasCycle(_ head: ListNode?) -> Bool {
        var firstPointer = head
        var secondPointer = head?.next?.next
        
        while(secondPointer != nil || firstPointer != nil) {
            if firstPointer === secondPointer {
                return true
            }
            
            firstPointer = firstPointer?.next
            secondPointer = secondPointer?.next?.next
        }
        
        return false
    }
    
    /// https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/?envType=study-plan-v2&envId=top-interview-150
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var fHead = head
        var sHead = head
        
        var uHead: ListNode?
        var uHeadTrail: ListNode?
        
        while(sHead != nil) {
            var count = 0
            while(sHead != nil) {
                if fHead?.val == sHead?.val {
                    count += 1
                } else {
                    break
                }
                
                sHead = sHead?.next
            }
            
            if count == 1 {
                if uHead == nil {
                    uHead = fHead
                    uHeadTrail = fHead
                    fHead = fHead?.next
                    uHead?.next = nil
                } else {
                    uHeadTrail?.next = fHead
                    uHeadTrail = uHeadTrail?.next
                    fHead = fHead?.next
                    uHeadTrail?.next = nil
                }
            } else {
                fHead = sHead
            }
//            print("Unique head is \(uHead?.val). fHead is \(fHead?.val), count is \(count)")
        }
        
        return uHead
    }
}

extension Solution {
    func printList(_ head: ListNode?) {
        var tempHead: ListNode? = ListNode(head?.val ?? 0, head?.next)
        while(tempHead != nil) {
            print("\(tempHead?.val ?? 0)", separator: "", terminator: " ")
            tempHead = tempHead?.next
        }
        print("")
    }
}
