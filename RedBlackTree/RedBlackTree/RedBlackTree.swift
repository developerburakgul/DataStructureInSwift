//
//  RedBlackTree.swift
//  RedBlackTree
//
//  Created by Burak Gül on 15.12.2023.
//

import Foundation

class RedBlackTree <T:Comparable> {
    
    var root : Node<T>?
    var size : Int
    
    
    init(root: Node<T>? = nil) {
        self.root = root
        self.root?.color = .black
        self.size = 0
    }
    
    //MARK: - Public methots
    func insert(_ data : T)  {
        let newNode = Node(value: data)
        if root == nil {
            root = newNode
            root?.color = .black
            size += 1
            return
        }
        insert(newNode, to: root!)
        size += 1
        return
    }
    func orderSmallToHigh(){
        inorderTraverse(root)
    }
    func printTreeStructure() {
        print("Red-Black Tree Structure:")
        print("-------------------------")
        printNodeStructure(root, level: 0)
        print("-------------------------")
    }
    
    //MARK: - Private Methods
    private func insert(_ newNode : Node<T>, to parent : Node<T>?){
        guard let parent = parent else { return }
        if newNode.value >= parent.value { // add newNode to parent.rightNode
            if parent.rightNode == nil {
                parent.rightNode = newNode
                newNode.parentNode = parent
                newNode.isLeftChild = false
                checkColor(newNode)
                return
            }
            insert(newNode, to: parent.rightNode)
        }else{
            if parent.leftNode == nil{
                parent.leftNode = newNode
                newNode.parentNode = parent
                newNode.isLeftChild = true
                checkColor(newNode)
                return
            }
            insert(newNode, to: parent.leftNode)
        }
    }
    
    
    private  func checkColor(_ node : Node<T>?){
        guard let node = node, node !== root else { return }

        if node.color == .red && node.parentNode?.color == .red {
            correctTree(node)
        }

        
    }
    
    private func correctTree(_ node : Node<T>?){ // we use this function in case  node and node's parent's color is red
        guard let node = node, let parent = node.parentNode else { return }
        
        if parent.isLeftChild { // aunt is parent.parent.rightNode
            if parent.parentNode?.rightNode == nil || parent.parentNode?.rightNode?.color == .black {
                // aunt is black
                return rotate(node)
            }
            // aunt is red /// check this section
            parent.parentNode?.rightNode?.color = .black
            parent.parentNode?.color = .red
            parent.color = .black
            return
        }else{
            // aunt is grandparent's left child
            if node.parentNode!.parentNode?.leftNode == nil || node.parentNode!.parentNode?.leftNode?.color == .black {  // aunt is black
                return rotate(node)
            }
            // aunt is red so we should change color of aunt and parent and grandparent
            parent.parentNode?.leftNode?.color = .black // aunt color should be black
            parent.color = .black  // parent should be black
            if let grandParent = parent.parentNode  {
                if grandParent !== root {
                    parent.parentNode?.color = .red // grandparent should be red but grandparent should not be root
                    checkColor(grandParent) // and we check grandparent
                }
            }
            return
        }
        
    }
    
    private func printNodeStructure(_ node: Node<T>?, level: Int) {
        guard let node = node else { return }

        printIndentation(level)
        print(node.description)

        printNodeStructure(node.leftNode, level: level + 1)
        printNodeStructure(node.rightNode, level: level + 1)
    }

    private func printIndentation(_ level: Int) {
        for _ in 0..<level {
            print("    ", terminator: "")
        }
    }
    

    
    //MARK: - Rotate Functions
    private  func rotate(_ node : Node<T>?){
        guard let node = node else { return }
        if node.isLeftChild { // if node is left child
            if let parent = node.parentNode { // right rotate
                if parent.isLeftChild {
                    rightRotate(parent.parentNode)
                    node.color = .red
                    node.parentNode?.color = .black
                    node.parentNode?.rightNode?.color = .red
                    return
                }else{ //  right left rotate

                    rightLeftRotate(parent.parentNode)
                    node.color = .black
                    node.rightNode?.color = .red
                    node.leftNode?.color = .red
                    return
                }
            }
        }else { // now node is right child
            if let parent = node.parentNode {
                if !parent.isLeftChild{ // left rotate
                    leftRotate(parent.parentNode)
                    node.color = .red
                    node.parentNode?.color = .black
                    node.parentNode?.leftNode?.color = .red
                    return
                }else{ // left right rotate
                    leftRightRotate(parent.parentNode)
                    node.color = .black
                    node.leftNode?.color = .red
                    node.rightNode?.color = .red
                    return
                }
            }
        }
    }
    
    
    private func rightRotate(_ node : Node<T>?)  {
        guard let node = node, let temp = node.leftNode else { return }
        
        
        node.leftNode = temp.rightNode
        if temp.rightNode != nil {
            node.leftNode?.parentNode = node
            node.leftNode?.isLeftChild = true
        }
        if node.parentNode == nil { // it means we are the root
            root = temp
            temp.parentNode = nil
        }else{
            temp.parentNode = node.parentNode
            if node.isLeftChild {
                temp.isLeftChild = true
                temp.parentNode?.leftNode = temp
            }else{
                temp.isLeftChild = false
                temp.parentNode?.rightNode = temp
            }
        }
        temp.rightNode = node
        node.isLeftChild = false
        node.parentNode = temp
    }
    
    private  func leftRotate(_ node : Node<T>?)  {
        guard let node = node, let temp = node.rightNode else { return }
        node.rightNode = temp.leftNode
        if temp.leftNode != nil {
            node.rightNode?.parentNode = node
            node.rightNode?.isLeftChild = false
        }
        if node.parentNode == nil { // it means node is root
            root = temp
            temp.parentNode = nil
        }else{
            temp.parentNode = node.parentNode
            if node.isLeftChild {
                temp.isLeftChild = true
                temp.parentNode?.leftNode = temp
            }else{
                temp.isLeftChild = false
                temp.parentNode?.rightNode = temp
            }
        }
        temp.leftNode = node
        node.isLeftChild = true
        node.parentNode = temp
        
        
    }

    
    private func rightLeftRotate(_ node : Node<T>?)  {
        guard let rightNode = node?.rightNode else { return }
        rightRotate(rightNode)
        leftRotate(node)
        
    }
    private func leftRightRotate(_ node : Node<T>?)  {
        guard let leftNode = node?.leftNode else { return }
        leftRotate(leftNode)
        rightRotate(node)
    }
    
    private func inorderTraverse(_ rootNode : Node<T>?){
        if let root = rootNode {
            inorderTraverse(root.leftNode)
            print(root.value,terminator: " ")
            inorderTraverse(root.rightNode)
        }
        return
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    

