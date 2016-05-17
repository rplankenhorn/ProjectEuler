//
//  main.swift
//  Problem25
//
//  Created by Robbie Plankenhorn on 5/17/16.
//  Copyright © 2016 Plankenhorn. All rights reserved.
//

import Foundation

extension String {
    
    func characterAtIndex(index:Int) -> String {
        return String(self[self.startIndex.advancedBy(index)])
    }
    
}

struct BigInt {
    private(set) var string = "0"
    
    init(value:UInt) {
        string = "\(value)"
    }
    
    init(value:String) {
        string = value
    }
}

func +(lhs:BigInt, rhs:BigInt) -> BigInt {
    var startString = String(lhs.string.characters.reverse())
    var addingString = String(rhs.string.characters.reverse())
    
    while startString.characters.count < addingString.characters.count {
        startString += "0"
    }
    
    while addingString.characters.count < startString.characters.count {
        addingString += "0"
    }
    
    var carry = 0
    
    var retString = ""
    
    for i in 0..<startString.characters.count {
        let sum = Int(startString.characterAtIndex(i))! + Int(addingString.characterAtIndex(i))! + carry
        carry = sum / 10
        let digit = sum >= 10 ? sum - (carry * 10) : sum
        retString += "\(digit)"
    }
    
    if carry > 0 {
        retString += "\(carry)"
    }
    
    return BigInt(value: String(retString.characters.reverse()))
}

var i = 1

var previousPrevious = BigInt(value: 1)
var previous = BigInt(value: 1)

var current = BigInt(value: 0)

while current.string.characters.count < 1000 {
    i+=1
    
    if i == 1 || i == 2 {
        current = BigInt(value: 0)
    } else {
        current = previousPrevious + previous
        previousPrevious = previous
        previous = current
    }
}

print(i)