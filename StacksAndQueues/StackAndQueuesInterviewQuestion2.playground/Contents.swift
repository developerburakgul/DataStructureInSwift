import UIKit

// https://www.fullstack.cafe/interview-questions/stacks

/*
 Giving a String, write a function that reverses the String
 using a stack.
 */

func solution(_ text: String) -> String {
    var result : [Character] = []
    var inputText = text
    for _ in 0...text.count-1 {
        var data = inputText.removeLast()
        result.append(data)
    }
    return String(result)
}

solution("abc") // bca
solution("Would you like to play a game?")
