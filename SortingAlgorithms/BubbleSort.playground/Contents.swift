import Foundation
class BubbleSort {
    
    func sort(numbers : [Int]) -> [Int] { // O(n) = n^2 ,best case n
        var isOrdered = true
        var arr = numbers
        for i in 0..<arr.count-1 {
            for j in 0..<arr.count-1-i {
                if arr[j]>arr[j+1]{
                    isOrdered = false
                    var temp = arr[j]
                    arr[j]=arr[j+1]
                    arr[j+1]=temp
                }
            }
            if isOrdered { // if array is ordered you can quit from for loop
                break
            }
        }
        return arr
    }
}
var unsortedArray = [9,8,7,6,5,4,3,2,1]
//var sortedArray = [1,2,3,4,5,6,7,8,9]

var bubbleSort = BubbleSort()
bubbleSort.sort(numbers: unsortedArray)
//bubbleSort.sort(numbers: sortedArray)


