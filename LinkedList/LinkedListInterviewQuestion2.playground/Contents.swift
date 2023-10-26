import UIKit

/*
 Find Merge Point of Two Lists

 Given pointers to the head nodes of 2 linked lists that merge together at some point, find the node where the two lists merge. The merge point is where both lists point to the same node, i.e. they reference the same memory location. It is guaranteed that the two head nodes will be different, and neither will be NULL. If the lists share a common node, return that node's data value.

 Note: After the merge point, both lists will share the same node pointers.
 
 */
class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func length(_ head : Node?) -> Int {
    if head == nil {
        return 0
    }
    var iterator = head!
    var count = 0
    
    while iterator.next != nil {
        iterator = iterator.next!
        count += 1
        
    }
    return count+1
}

func printLinkedList(_ head : Node?){
    if head == nil {return}
    var iterator = head!
//        print(iterator.data)
    var result = "\(iterator.data)"
    while iterator.next != nil {
        iterator = iterator.next!
//            print(iterator.data)
        result = result + " -> " + "\(iterator.data)"
    }
    print(result)
}


func findMergeBrute(headA: Node?, headB: Node?) -> Int? {
    var iteratorA = headA
    var lengthOfA = length(headA)
    var lengthOfB = length(headB)
    
    for _ in 0...lengthOfA-1 {
        var iteratorB = headB
        for _ in 0...lengthOfB-1 {
            let A = iteratorA?.data
            let B = iteratorB?.data
            print("A : \(A ?? 0) B \(B ?? 0)")
            if A == B {
                return A
            }
            iteratorB = iteratorB?.next
            
        }
        iteratorA = iteratorA?.next
    }
    
    return nil
}


func findMergeSpaceTime(headA : Node? , headB : Node?) -> Int? {
    
    var lengthOfA = length(headA) // if lengthOfA == m then O(m)
    var lengthOfB = length(headB) // if lengthOfB == n then O(n)
    
    var dictionary : [Int:Bool] = [:]
    var iteratorB = headB
    for _ in 0...lengthOfB-1 { // O(n)
        guard let B = iteratorB?.data else {return nil }
        dictionary[B] = true
        iteratorB = iteratorB?.next
        
    }
    
    var iteratorA = headA
    for _ in 0...lengthOfA-1 { // O(m) =
        guard let A = iteratorA?.data else {return nil}
        if dictionary[A] == true {
            return A
        }
        iteratorA = iteratorA?.next
    }
    
    
    
    
    return nil
}


func findMergeInsight(headA : Node? , headB : Node?) -> Int? {
    var lengthOfA = length(headA) // if lengthOfA == m then O(m)
    var lengthOfB = length(headB) // if lengthOfB == n then O(n)
    var iteratorA = headA
    var iteratorB = headB
    
    if lengthOfB > lengthOfA {
        var temp = iteratorB
        iteratorB = iteratorA
        iteratorA = temp
    }
    
    let distance = abs(lengthOfA-lengthOfB)
    for _ in 0...distance-1 { //O(n)
        iteratorA = iteratorA?.next
    }
    
    for _ in 0...lengthOfA-1 { // O(n)
        guard let A = iteratorA?.data else {return nil}
        guard let B = iteratorB?.data else {return nil}
        if A == B { return A }
        iteratorA = iteratorA?.next
        iteratorB = iteratorB?.next
    }
    return nil
}

// 1 2 3 4 5 6
let node6 = Node(6)
let node5 = Node(5, node6)
let node4 = Node(4, node5)
let node3 = Node(3, node4)
let node2 = Node(2, node3)
let node1 = Node(1, node2)

// 10 11 4 5 6
let node11 = Node(11, node4)
let node10 = Node(10, node11)

//printLinkedList(node1)
//printLinkedList(node10)

findMergeBrute(headA: node1, headB: node10)
findMergeSpaceTime(headA: node1, headB: node10)
findMergeInsight(headA: node1, headB: node10)
findMergeInsight(headA: node10, headB: node1)


