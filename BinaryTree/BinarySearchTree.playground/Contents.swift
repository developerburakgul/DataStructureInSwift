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
    
    func insert(key : Int) {
        root = insertItem(root,key)
    }
    
    func delete(_ key : Int){
        guard let _ = root else {return}
        root = delete(&root, key)
    
    }
    
    func delete(_ node : inout Node?,_ key : Int) -> Node? {
        guard let nodee = node else {return nil}
        
        
        if key < nodee.key {
            nodee.leftNode = delete(&nodee.leftNode, key)
        }else if key > nodee.key {
            nodee.rightNode = delete(&nodee.rightNode, key)
        }else {
            // there are 3 state
            // state 1 no child
            if nodee.leftNode == nil && nodee.rightNode == nil {
                node = nil
            }else if nodee.leftNode != nil && nodee.rightNode == nil { // state 2 ; 1 child
                node =  nodee.leftNode
            }else if nodee.rightNode != nil && nodee.leftNode == nil { // state 2 ; 1 child
                node =  nodee.rightNode
            }else { // state 3 ; 2 child
                var minRight = findMin(nodee.rightNode!)
                nodee.key = minRight.key
                node?.rightNode = delete(&node!.rightNode, key)
            }
            
        }

        
        return nodee
        
    }
    
    func insertItem(_ root : Node?,_ key : Int) -> Node? {
        guard let rootNode = root else { return Node(key) }
        if key < rootNode.key {
            rootNode.leftNode = insertItem(rootNode.leftNode, key)
            
        }else {
            rootNode.rightNode = insertItem(rootNode.rightNode, key)
        }
        return rootNode
                
    }
    func find(key : Int) -> Int? {
        guard let root = root else {return nil}
        guard let node = find(root,key) else {return nil }
        
        return node.key
        
    }
    
    private func find(_ node : Node? , _ key : Int) -> Node? {
        guard let node = node else {return nil}
        if node.key == key {return node}
        if key < node.key {
            return find(node.leftNode, key)
        }else {
            return find(node.rightNode, key)
        }
        return nil
    }
    func findMin() -> Int {
        guard let root = root else { return 0 }
        return findMin(root).key;
    }

    private func findMin(_ node: Node) -> Node {
        return node.min;
    }
}
