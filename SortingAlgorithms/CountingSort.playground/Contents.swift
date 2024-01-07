import UIKit

class CountingSort {
    func sort(numbers : [Int]) -> [Int] { // O(n) = n because we use another array store for the number of numbers it contains
        var max = numbers.max() ?? 0
        var howMany : [Int] = Array(repeating: 0, count: max+1)
        var array : [Int] = Array(0...max)
        var returnArray : [Int] = []
        numbers.forEach { number in
            howMany[number] += 1
        }
        array.forEach { number in
            for i in 0..<howMany[number]{
                returnArray.append(number)
            }
        }
        return returnArray
    }
}
var unsortedArray = [5,7,2,9,6,1,3,7]
var countingSort = CountingSort()
print(countingSort.sort(numbers: unsortedArray))
