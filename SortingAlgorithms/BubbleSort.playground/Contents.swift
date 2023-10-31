import UIKit

class BubbleSort {
    func sort(_ numbers : [Int]) -> [Int] { // O(n^2)
        var arr = numbers
        var n = arr.count
        for i in 0..<n-1 {
            for j in 0..<(n-1-i){
                if arr[j]>arr[j+1]{
                    var temp = arr[j]
                    arr[j]=arr[j+1]
                    arr[j+1]=temp
                }
            }
        }
        return arr
    }
}
var bubbleSort = BubbleSort()
var array = [5,4,3,2,1]
print(bubbleSort.sort(array))
