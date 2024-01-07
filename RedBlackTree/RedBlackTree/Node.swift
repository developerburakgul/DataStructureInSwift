//
//  Node.swift
//  RedBlackTree
//
//  Created by Burak Gül on 15.12.2023.
//

import Foundation

class Node<T:Comparable>{
    var height : Int {
        if leftNode == nil && rightNode == nil {
            return 0
        }
        return max(leftNode?.height ?? 0, rightNode?.height ?? 0) + 1
    }
    
    var value : T
    var color : Color

    var isLeftChild : Bool
    var parentNode : Node<T>?
    var leftNode : Node<T>?
    var rightNode : Node<T>?
    
    init(value: T, color: Color = .red, isLeftChild: Bool = false, parentNode: Node? = nil, leftNode: Node? = nil, rightNode: Node? = nil) {
        self.value = value
        self.color = color
        self.isLeftChild = isLeftChild
        self.parentNode = parentNode
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}

extension Node { // we use this extension for print tree's details
    var description: String {
        var defaultValue = 0
//        let parentValue = parentNode?.value ?? 0
        let parentValue = parentNode?.value ?? (T.self == Int.self ? 0 as! T as! Int : defaultValue) as! T

        let colorDescription = color.description
        return "Value: \(value), Parent: \(parentValue), Color: \(colorDescription)"
    }
}
