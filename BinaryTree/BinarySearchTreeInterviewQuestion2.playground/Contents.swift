
import Foundation


/*
 TreeHeight
 https://app.codility.com/programmers/trainings/4/tree_height/
 
 Height is the number of steps to the lowest leaf.
 Length of the longest path.
 Tree with one node has height of zero.
   
                    20
                  /    \
                8        22
              /   \
            4       12
                  /    \
                10      14
 */

class Node {
    var data : Int
    var left : Node?
    var right : Node?
    
    init(_ data:Int,_ left : Node? = nil, _ right : Node? = nil) {
        self.data = data
        self.left = left
        self.right = right
    }
    var height : Int  {
        if isLeaf {
            return 0
        }else {
            return (max(left?.height ?? 0, right?.height ?? 0)+1)
        }
    }
    var isLeaf : Bool {
        return left == nil && right == nil
    }
}

var n20 = Node(20)
var n8 = Node(8)
var n22 = Node(22)
n20.left = n8
n20.right = n22

var n4 = Node(4)
var n12 = Node(12)
n8.left = n4
n8.right = n12

var n10 = Node(10)
var n14 = Node(14)
n12.left = n10
n12.right = n14

print(n20.height)


class Tree {
    var data : Int
    var leftTree : Tree?
    var rightTree : Tree?

    init(_ data : Int) {
        self.data = data
    }

    var height : Int {
        if isLeaf {
            return 0
        }else {
            return (max(leftTree?.height ?? 0, rightTree?.height ?? 0) + 1)
        }
    }
    var isLeaf : Bool {
        return leftTree == nil && rightTree == nil
    }
}
// in the below example not BST but tree
var t5 = Tree(5)
var t3 = Tree(3)
var t10 = Tree(10)

t5.leftTree = t3
t5.rightTree = t10

var t20 = Tree(20)
var t21 = Tree(21)

t3.leftTree = t20
t3.rightTree = t21

var t1 = Tree(1)
t10.leftTree = t1

print(t5.height)
