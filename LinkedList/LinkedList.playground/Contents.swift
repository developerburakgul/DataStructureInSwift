import UIKit

class Node {
    var data : Int
    var next : Node?
    
    init(_ data : Int,_ next : Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkedList {
    var head : Node?
    var isEmpty : Bool {
        return head == nil
    }
    
    func addFront(_ data : Int){ // O(1)
        var newNode = Node(data)
        newNode.next = head
        head = newNode
    }
    
    func getFirst() -> Int? {
        if head == nil { return nil }
        return head!.data
    }
    
    func addBack(_ data : Int){ // O(n)
        var newNode = Node(data)
        if head == nil {
            head = newNode
            return
        }
        var iterator = head!
        while iterator.next != nil {
            iterator = iterator.next!
        }
        iterator.next=newNode
    }
    
    func getLast() -> Int? {
        if head == nil {return nil}
        var iterator = head!
        while iterator.next != nil {
            iterator = iterator.next!
        }
        return iterator.data
    }
    
    func insert(position : Int , data : Int)  {
        if position == 0 {
            addFront(data)
        }
        var newNode = Node(data)
        var iterator = head!
        for _ in 0..<position-1 {
            iterator = iterator.next!
        }
        newNode.next = iterator.next
        iterator.next = newNode
    }
    
    func deleteFirst()  {
        head = head?.next
    }
    
    func deleteLast()  {

        var iterator = head
        while iterator?.next?.next != nil {
            iterator = iterator?.next
        }
        iterator?.next = nil
        
    }
    
    func delete(at position : Int){
        if position == 0 {
            deleteFirst()
            return
        }
        var iterator = head
        for i in 0..<position-1 {
            iterator = iterator?.next
        }
        iterator?.next = iterator?.next?.next
    }
    
    func clear() {
        head = nil
    }
    
    
    
    func printLinkedList(){
        if head == nil {return}
        var iterator = head!
//        print(iterator.data)
        var result = "\(iterator.data)"
        while iterator.next != nil {
            iterator = iterator.next!
//            print(iterator.data)
            result = result + " -> " + "\(iterator.data)"
        }
        print(result)
    }

}



var linkList1  = LinkedList()
linkList1.addFront(30)
linkList1.addFront(20)
linkList1.addFront(10)
linkList1.printLinkedList()
linkList1.addFront(40)
linkList1.printLinkedList()

linkList1.addBack(50)
linkList1.printLinkedList()

print(linkList1.getFirst())
print(linkList1.getLast())

linkList1.insert(position: 2, data: 23)
linkList1.printLinkedList()

linkList1.deleteFirst()
linkList1.printLinkedList()

linkList1.deleteLast()
linkList1.printLinkedList()

linkList1.delete(at: 2)
linkList1.printLinkedList()
print(linkList1.isEmpty)

linkList1.clear()
print(linkList1.isEmpty)

linkList1.printLinkedList()

linkList1.addFront(256)
linkList1.printLinkedList()
