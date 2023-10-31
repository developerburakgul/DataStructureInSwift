import UIKit

/*
 Lowest common ancestor (LCA) in BST.
 https://www.geeksforgeeks.org/lowest-common-ancestor-in-a-binary-search-tree/
 
 O(h) - height of the tree
 
 1. If the value of the current node is less than both n1 and n2, then LCA lies in the right.
 2. If the value of the current node is greater than both n1 and n2, then LCA lies in the left.
 3. If both the above cases are false then return the current node as LCA.
 
                    20
                  /    \
                8        22
              /   \
            4       12
                  /    \
                10      14
 */
class Node {
    var data: Int = 0
    var left: Node?
    var right: Node?
    
    init(_ key: Int) {
        self.data = key
    }
}

class BinaryTree {
    var root: Node?
    
    func lca(_ node: Node?, _ n1: Int, _ n2: Int) -> Node? {
        guard let nd = node else {return nil}
        if nd.data < n1 && nd.data < n2 {
            return lca(nd.right, n1, n2)
        }else if nd.data > n1 && nd.data > n2 {
            return lca(nd.left, n1, n2)
        }else {
            return node
        }
    }
}

let tree = BinaryTree()
// Step 1: Build the BST
var node20 = Node(20)
var node8 = Node(8)
var node22 = Node(22)

node20.left = node8
node20.right = node22

var node4 = Node(4)
var node12 = Node(12)
node8.left = node4
node8.right = node12

var node10 = Node(10)
var node14 = Node(14)
node12.left = node10
node12.right = node14
tree.root = node20

// Step 2: Make it pass these test cases
var n1 = 10, n2 = 14
var t = tree.lca(tree.root, n1, n2)
print("LCA of \(n1) and \(n2) is \(String(describing: t?.data))") // 12

n1 = 14; n2 = 8
t = tree.lca(tree.root, n1, n2)
print("LCA of \(n1) and \(n2) is \(String(describing: t?.data))") // 8

n1 = 10; n2 = 22
t = tree.lca(tree.root, n1, n2)
print("LCA of \(n1) and \(n2) is \(String(describing: t?.data))") // 20

