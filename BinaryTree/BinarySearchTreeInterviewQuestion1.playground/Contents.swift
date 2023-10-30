import Foundation


/*
 CheckBST
 https://www.hackerrank.com/challenges/ctci-is-binary-search-tree/problem
 
 Given the root node of a binary tree, determine if it is a binary search tree.
 
 The Node class is defined as follows:
    class Node {
        int data;
        Node left;
        Node right;
     }
*/

class Node {
    var key: Int
    var left: Node?
    var right: Node?
    
    init(_ data: Int) {
        self.key = data
    }
    
}
    
func checkBST(root: Node?) -> Bool {
    return isCheckBST(root: root, max: nil, min: nil)
}

fileprivate func isCheckBST(root: Node?,max : Int?=nil,min : Int?=nil) -> Bool {
    guard let node = root else {return true}
    
    // for left tree : parentData is should be greater than currentValue
    if let maxFromParent = max , node.key >= maxFromParent{
        print("\(node.key) shouldn't be greater than \(maxFromParent)")
        return false
    }
    
    // for right tree : parentData is should be less than currentValue
    if let minFromParent = min , node.key <= minFromParent {
        print("\(node.key) shouldn't be less than \(minFromParent)")
        return false
    }
    return isCheckBST(root: node.left, max: node.key) && isCheckBST(root: node.right, min: node.key)
    
}
// to see data in Tree
func inOrderTraverse(root : Node? ) {
    guard let node = root else {return}
    inOrderTraverse(root: node.left)
    print(node.key)
    inOrderTraverse(root: node.right)
    
}

var n4 = Node(4)
var n2 = Node(2)
var n6 = Node(6)
n4.left = n2
n4.right = n6

var n1 = Node(1)
var n3 = Node(3)
n2.left = n1
n2.right = n3
var n5 = Node(5)
var n7 = Node(7)
n6.left = n5
n6.right = n7

inOrderTraverse(root: n4)
print(checkBST(root: n4))







