import UIKit


class Node {
    var key : Int = 0
    var leftNode : Node?
    var rightNode : Node?
    
    init(_ key : Int) {
        self.key = key
    }
    
    var min : Node {
        if leftNode == nil {
            return self
        }
        else {
            return leftNode!.min
        }
    }
    
}


class BST {
    var root : Node?
    // ok
    func insert(key : Int) {
        root = insertItem(root,key)
    }
    // ok
    func delete(_ key : Int){
        guard let _ = root else {return}
        root = delete(&root, key)
    
    }
    // ok
    func delete(_ node : inout Node?,_ key : Int) -> Node? {
        guard let nd = node else {return nil}
        
        
        if key < nd.key {
            nd.leftNode = delete(&nd.leftNode, key)
        }else if key > nd.key {
            nd.rightNode = delete(&nd.rightNode, key)
        }else {
            // there are 3 state
            // state 1 no child
            if nd.leftNode == nil && nd.rightNode == nil {
                node = nil // you can set nil nd because type of nd Node, (not Node?)
            }else if nd.leftNode != nil && nd.rightNode == nil { // state 2 ; 1 child
                node =  nd.leftNode
            }else if nd.rightNode != nil && nd.leftNode == nil { // state 2 ; 1 child
                node =  nd.rightNode
            }else { // state 3 ; 2 child
                var minRight = findMin(nd.rightNode!)
                nd.key = minRight.key
                node?.rightNode = delete(&node!.rightNode, key)
            }
            
        }

        
        return nd
        
    }
    // ok
    func insertItem(_ node : Node?,_ key : Int) -> Node? {
        guard let rootNode = node else { return Node(key) }
        if key < rootNode.key {
            rootNode.leftNode = insertItem(rootNode.leftNode, key)
            
        }else {
            rootNode.rightNode = insertItem(rootNode.rightNode, key)
        }
        return rootNode
                
    }
     // ok
    func find(key : Int) -> Int? {
        guard let rootNode = root else {return nil}
        guard let node = find(rootNode,key) else {return nil }
        
        return node.key
        
    }
    // ok
    private func find(_ node : Node? , _ key : Int) -> Node? {
        guard let nd = node else {return nil}
        if nd.key == key {return node}
        if key < nd.key {
            return find(nd.leftNode, key)
        }else {
            return find(nd.rightNode, key)
        }
        return nil
    }
    // ok
    func findMin() -> Int {
        guard let root = root else { return 0 }
        return findMin(root).key;
    }
    // ok
    private func findMin(_ node: Node) -> Node {
        return node.min;
    }
    
    
    func inOrderTraversal(node : Node?) {
        guard let nd = node else {return}
        inOrderTraversal(node: nd.leftNode)
        print(node?.key)
        inOrderTraversal(node: nd.rightNode)
    }
    func preOrderTraversal(node : Node?)  {
        guard let nd = node else {return}
        print(nd.key)
        preOrderTraversal(node: nd.leftNode)
        preOrderTraversal(node: nd.rightNode)
    }
    
    func postOrderTraversal(node : Node?)  {
        guard let nd = node else {return}
        postOrderTraversal(node: nd.rightNode)
        postOrderTraversal(node: nd.leftNode)
        print(nd.key)
    }
    
    
    

}
var bst = BST()
bst.insert(key: 5)
bst.insert(key: 3)
bst.insert(key: 2)
bst.insert(key: 4)
bst.insert(key: 7)
bst.insert(key: 6)
bst.insert(key: 8)

bst.postOrderTraversal(node: bst.root)


