//
//  main.swift
//  Problem26
//
//  Created by Robbie Plankenhorn on 5/17/16.
//  Copyright © 2016 Plankenhorn. All rights reserved.
//

import Foundation

var numbers:[Int] = [0]

for i in 1...999 {
    numbers.append(i)
}

let fractions = numbers.map { 1 / Double($0) }.map { "\($0)".stringByReplacingOccurrencesOfString("0.", withString: "") }

//142857142857143

extension String {
    
    func characterAtIndex(index:Int) -> String {
        return String(self[self.startIndex.advancedBy(index)])
    }
    
    func numberOfRecurringCycle() -> Int {
        
        var i=0
        
        var lastSubstr = ""
        
        while i<self.characters.count-1 {
            let subStr = String(self[self.startIndex...self.startIndex.advancedBy(i)])
            
            let nextOccurance = (self as NSString).rangeOfString(subStr, options: NSStringCompareOptions(rawValue: 0), range: NSRange(location: i+1, length: self.characters.count - (i+1)))
            
            if nextOccurance.location != NSNotFound {
                lastSubstr = subStr
            }
            
            i+=1
        }
        
        if lastSubstr.characters.count > 0 {
            return lastSubstr.characters.count
        } else if self.characters.count > 1 {
            let newStr = String(self[self.startIndex.advancedBy(1)...self.endIndex])
            return newStr.numberOfRecurringCycle()
        }
        
        return 0
    }
    
}

//print(fractions)
//
//print("142857142857143".numberOfRecurringCycle())
//print("001001001001001".numberOfRecurringCycle())

var longRecurring:(Int,Int) = (Int.min,Int.min)

for i in 1...fractions.count {
    let currentRecurring = fractions[i-1].numberOfRecurringCycle()
    if longRecurring.1 > currentRecurring {
        longRecurring = (i,currentRecurring)
    }
}

print(longRecurring)