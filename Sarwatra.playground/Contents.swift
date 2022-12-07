import UIKit

var greeting = "Hello, playground"

var reverse = 0
var number = 8769
func reverseNum(){
    while (number != 0) {
        var reminder = number % 10
         reverse = reverse*10  + reminder
        number = number/10
    }
    print(reverse)
}

reverseNum()
