import UIKit
import Foundation

class RadixSort {
    private var numbers : [Int]
    private var countingSort = CountingSort()
    
    init(_ numbers :  [Int]) {
        self.numbers = numbers
    }

    public func sort() -> [Int] {
        var maks = numbers.max() ?? 0
        var exp = 1

        while maks/exp>0 {
            countingSort.sort(&numbers, exp)
            exp *= 10
        }
        return numbers
    }
}

class CountingSort {
    func sort(_ numbers : inout [Int],_ exp : Int) { // O(n) = n because we use another array store for the number of numbers it contains
        var max = numbers.max() ?? 0
        var count : [Int] = Array(repeating: 0, count:10)
        var outputArray : [Int] = Array(repeating: 0, count: max)
        for var i in 0..<numbers.count {
            count[(numbers[i]/exp)%10] += 1
        }
        for var i in 1..<10 { // kümülatif toplam
            count[i] += count[i-1]
        }
        for var i in stride(from: numbers.count-1, through: 0, by: -1){ // burada kümülatif toplam üzerinde gidiyoruz sebebi ise kaç tane eleman olduğunu o ana kadar anlamak
            outputArray[count[(numbers[i]/exp)%10]-1] = numbers[i]
            count[(numbers[i]/exp)%10] = count[(numbers[i]/exp)%10] - 1
        }
        for var i in 0..<numbers.count {
            numbers[i]=outputArray[i]
        }
    }
}
var unsortedArray = [170, 45, 75, 90, 2, 24, 802, 66]
var radixSort = RadixSort(unsortedArray)
var sortedArray = radixSort.sort()
print(sortedArray)




