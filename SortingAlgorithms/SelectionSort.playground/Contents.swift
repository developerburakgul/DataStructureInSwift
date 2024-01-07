import UIKit

class SelectionSort {
    func sort(_ numbers : [Int] ) -> [Int] { // O(n)= n^2 , best case n^2
        var arr = numbers
        for i in 0...arr.count-1 {
            var degisken = i
            for j in i...arr.count-1{
                if arr[j]<arr[degisken]{
                    var temp = arr[j]
                    arr[j]=arr[degisken]
                    arr[degisken]=temp
                }
            }
        }
        return arr
    }
}
var unsortedList = [5,7,2,9,6,1,3,7]
var selectionSort = SelectionSort()
selectionSort.sort(unsortedList)
