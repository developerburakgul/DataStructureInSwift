import UIKit

class InsertionSort {
    func sort(numbers : [Int]) -> [Int] { // O(n) 0 n^2 , best case n
        var arr = numbers
        for var i in 0..<arr.count-1{
            var separator = i
            var newItem = arr[i+1]
            if newItem < arr[i] {
                for j in stride(from: separator, through: 0, by: -1) {
                    var temp : Int? = arr[j]
                    arr[j]=arr[j+1]
                    arr[j+1]=temp!
                    temp = nil
                    if j == 0 { // you can check j value because ; you can not check j value you get error because of index out of range.
                        break
                    }
                    if arr[j-1] < arr[j]  {
                        break
                    }
                }
            }else {
                i = i+1
            }
        }
        return arr
    }
    
}
var unsortedArray = [33,44,21,83,56,73,22]
var insertionSort = InsertionSort()
insertionSort.sort(numbers: unsortedArray)

