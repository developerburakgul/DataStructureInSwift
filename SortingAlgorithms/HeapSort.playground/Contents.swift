import UIKit

class HeapSort {
    private var array : [Int] = []
    
    //MARK: - Public functions
    
    // you dont have to write peek function to sort array
//    func peek() -> Int {
//        if array.isEmpty {
//            fatalError("Array is empty , i cant return data ")
//        }
//        return array.first!
//    }
    
    // This function was written to see the array
    func printHeap()  {
        array.forEach{print($0, terminator: " ")}
        print(" ")
        print("------------")
    }
    func sortArray(_ numbers : [Int]) -> [Int] {
        numbers.forEach { number in
            add(number)
        }
        return getOrderedArray()
    }

    //MARK: - Get İndex Methods
    
    private func getLeftChildIndex(_ parentIndex : Int) -> Int {
        return (2*parentIndex)+1
    }
    private func getRightChildIndex(_ parentIndex : Int) -> Int {
        return (2*parentIndex)+2
    }
    private func getParentIndex(_ childIndex : Int) -> Int{
        return (childIndex-1)/2
    }
    //MARK: - Has child or parent method
    private func hasLeftChild(_ parent : Int) -> Bool {
        return getLeftChildIndex(parent) < array.count
    } 
    private func hasRightChild(_ parent : Int) -> Bool {
        return getRightChildIndex(parent) < array.count
    }
    private func hasParent(_ child : Int) -> Bool{
        return getParentIndex(child) >= 0
    }
    //MARK: - return item from array
     private func leftChild(_ parent : Int) -> Int? {
         guard hasLeftChild(parent) else { return nil }
         return array[getLeftChildIndex(parent)]
    }     
    private func rightChild(_ parent : Int) -> Int? {
         guard hasRightChild(parent) else { return nil }
         return array[getRightChildIndex(parent)]
    }
    private func parent(_ child : Int) -> Int? {
         guard hasParent(child) else { return nil }
         return array[getParentIndex(child)]
    }
    //MARK: - Private Functions
    private func heapifyUP(){
        var index = array.count-1
        
        while parent(index) != nil && array[index] < parent(index)! {
            swap(index, getParentIndex(index))
            index = getParentIndex(index)
        }
    }
    private func heapifyDOWN(){
        var index = 0
        while hasLeftChild(index) {
            var smallerChildIndex = getLeftChildIndex(index)
            if hasRightChild(index) && rightChild(index)! < leftChild(index)!{
                smallerChildIndex = getRightChildIndex(index)
            }
            if  array[index]  > array[smallerChildIndex] {
                swap(index, smallerChildIndex)
            }
            index = smallerChildIndex
        }
    }
    private func swap(_ index1 : Int,_ index2 : Int)  {
        var temp = array[index1]
        array[index1] = array[index2]
        array[index2]=temp
    }
    private func add(_ item : Int)  {
        array.append(item)
        // kontrol etmeliyiz uygun mu değilmi diye yani yukarıya taşımalıyız
        heapifyUP()
    }
    private func remove() -> Int {
        guard !array.isEmpty else {fatalError("Array is empty so you can not remove ant item. ")}
        if array.count == 0 {fatalError()}
        var returnValue = array.first!
        array[0] = array[array.count-1]
        heapifyDOWN()
        array.removeLast()
        return returnValue
    }
    private func getOrderedArray() -> [Int] {
        var returnArray : [Int] = []
        returnArray = array.map({ _ in
            remove()
        })
        return returnArray
    }
}
var heapSort = HeapSort()
var unsortedArray = [99,91,84,83,81,78,77,64,53,47,45,42,18,14,6]
print(heapSort.sortArray(unsortedArray))







