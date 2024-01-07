//  Created by Burak Gül on 15.12.2023.
import Foundation


var rbt = RedBlackTree<Int>()
let array = (0..<50).map { _ in Int.random(in: 0...1000) }
print(array)
array.forEach { number in
    rbt.insert(number)
}
print("************************************")
rbt.orderSmallToHigh()























