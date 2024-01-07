//
//  Color.swift
//  RedBlackTree
//
//  Created by Burak Gül on 15.12.2023.
//

import Foundation
enum Color {
    case red
    case black
}

extension Color { // we use this extension for print tree's details
    var description: String {
        return self == .red ? "Red" : "Black"
    }
}
