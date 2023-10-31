import UIKit


//func fibonacci(_ number : Int) -> Int {
//    if number == 0 {
//        return 0
//    }else if number == 1 {
//        return 1
//    }else {
//        return fibonacci(number-1)+fibonacci(number-2)
//    }
//}
//
//let startTime = Date()
//let result = fibonacci(30)
//let endTime = Date()
//
//let elapsedTime = endTime.timeIntervalSince(startTime)
//print("Fonksiyonun çalışma süresi (saniye): \(elapsedTime)") // Fonksiyonun çalışma süresi (saniye): 14.045269012451172
//
var memo : [Int:Int] = [:]
func fibonacciWithMemoization(_ number : Int) -> Int {
    if number == 0 {
        return 0
    }else if number == 1 {
        return 1
    }
    if let result = memo[number] {
        return result
    }
    memo[number] = fibonacciWithMemoization(number-1)+fibonacciWithMemoization(number-2)
    return memo[number]!
    
}

let startTime = Date()
let result = fibonacciWithMemoization(30)
let endTime = Date()

let elapsedTime = endTime.timeIntervalSince(startTime)
print("Fonksiyonun çalışma süresi (saniye): \(elapsedTime)") // Fonksiyonun çalışma süresi (saniye): 0.012312054634094238

