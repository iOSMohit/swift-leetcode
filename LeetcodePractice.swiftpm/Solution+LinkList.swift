//
//  Solution+LinkList.swift
//  LeetcodePractice
//
//  Created by Mohit Kumar on 04/02/24.
//

import Foundation

extension Solution {
    final class ListNode {
        var val: Int
        var next: ListNode?
        init() { self.val = 0; self.next = nil; }
        init(_ val: Int) { self.val = val; self.next = nil; }
        init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
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
}

//extension Solution {
//    func printList(_ head: ListNode?) {
//        var tempHead: ListNode? = ListNode(head?.val ?? 0, head?.next)
//        while(tempHead != nil) {
//            print("\(tempHead?.val ?? 0)", separator: "")
//            tempHead = tempHead?.next
//        }
//        print("")
//    }
//}
