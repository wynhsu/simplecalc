//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        var result: Int
        if args.count == 1 {
            return 0
        } else if args.count == 3 {
            let first:Int! = Int(args[0])
            let op = args[1]
            let last:Int! = Int(args[2])
            switch op {
            case "+" :
                result = first + last
            case "-" :
                result = first - last
            case "*" :
                result = first * last
            case "/" :
                result = first / last
            case "%" :
                result = first % last
            default:
                result = 0
            }
            return result
        } else {
            let op = args[args.count - 1]
            switch op {
            case "count" :
                result = args.count - 1
            case "avg" :
                var sum = 0
                var count = 0
                while count < args.count - 1 {
                    let x:Int! = Int(args[count])
                    sum += x
                    count += 1
                }
                result = sum / (args.count - 1)
            case "fact" :
                var fact = 1
                var index:Int! = Int(args[0])
                while index > 0 {
                    fact *= index
                    index -= 1
                }
                result = fact
            default:
                result = 0
            }
            return result
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

