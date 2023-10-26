import UIKit

// Write a function that determines length of any Linked List

class Node {
    var data : Int
    var next : Node?
    
    init(_ data : Int, _ next : Node? = nil) {
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



var node6 = Node(6)
var node5 = Node(6,node6)
var node4 = Node(6,node5)
var node3 = Node(6,node4)
var node2 = Node(6,node3)
var node1 = Node(6,node2)

length(node1)
length(nil)

