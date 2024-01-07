import UIKit

class MergeSort {
    // We set number as private  so that not everyone can access numbers
    private var numbers : [Int]
    // constructor / init method
    init(_ numbers : [Int]) {
        self.numbers = numbers
    }
    //MARK: - public functions
    public func sort() {
        sort(&numbers)
    }
    public func getNumbers()->[Int]{
        return numbers
    }
    //MARK: - Private Functions
    // Recursive function
    private func sort (_ numbers : inout [Int]) -> [Int] {
        if numbers.count == 1 {return numbers}
        var left : [Int] = Array(numbers[0..<(numbers.count)/Int(2)])
        var right : [Int] = Array(numbers[(numbers.count)/Int(2)...numbers.count-1])
        left = sort(&left)
        right = sort(&right)
        return merge(left, right,&numbers)
       
    }
    private func merge(_ numberArray1 : [Int],_ numberArray2 : [Int],_ numbers : inout [Int]) -> [Int] {
        var indeks1 = 0
        var indeks2 = 0
        var indeks3 = 0
        while indeks1 < numberArray1.count && indeks2 < numberArray2.count {
            if numberArray1[indeks1] < numberArray2[indeks2] {
                numbers[indeks3] = numberArray1[indeks1]
                indeks1+=1
            }else {
                numbers[indeks3] = numberArray2[indeks2]
                indeks2+=1
            }
            indeks3+=1
        }
        var workArray : [Int]
        var workIndex : Int
        
        if indeks1 >= numberArray1.count {
            workArray = numberArray2
            workIndex = indeks2
        }else {
            workArray = numberArray1
            workIndex = indeks1
        }
        for i  in workIndex..<workArray.count{
            numbers[indeks3] = workArray[i]
            indeks3 += 1
        }
        return numbers
    }
}
var numbers = [15, 19, 4, 3, 18, 6, 2, 12, 7, 9, 11, 16]
var mergeSort = MergeSort(numbers)
mergeSort.sort()
var orderedArray = mergeSort.getNumbers()
print(orderedArray)
