//
//  main.swift
//  Problem36
//
//  Created by Robbie Plankenhorn on 5/18/16.
//  Copyright © 2016 Plankenhorn. All rights reserved.
//

import Foundation

extension UInt {
    
    func isPalindron() -> Bool {
        let decimalString = "\(self)"
        let binaryString = String(self, radix: 2)
        return binaryString == String(binaryString.characters.reverse()) && decimalString == String(decimalString.characters.reverse())
    }
    
}

var sum:UInt = 0

for i in 0..<1000000 {
    if UInt(i).isPalindron() {
        sum += UInt(i)
    }
}

print(sum)