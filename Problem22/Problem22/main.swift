//
//  main.swift
//  Problem22
//
//  Created by Robbie Plankenhorn on 5/17/16.
//  Copyright © 2016 Plankenhorn. All rights reserved.
//

import Foundation

func readInputFile(filename:String) -> String! {
    let path = NSBundle.mainBundle().pathForResource(filename, ofType: "txt")
    return try? String(NSString(contentsOfFile: path! as String, encoding: NSUTF8StringEncoding))
}

let alphabet = "abcdefghijklmnopqrstuvwxyz"

var alphabetDictionary:[String:Int] = [:]

var i = 1

for character in alphabet.characters {
    alphabetDictionary[String(character)] = i
    i+=1
}

var nameScores = readInputFile("p022_names").stringByReplacingOccurrencesOfString("\"", withString: "").componentsSeparatedByString(",").sort().map { name in
    return name.lowercaseString.characters.reduce(0, combine: { $0 + alphabetDictionary[String($1)]! })
}

for i in 1...nameScores.count {
    nameScores[i-1] = nameScores[i-1] * i
}

let totalScore = nameScores.reduce(0, combine: { $0 + $1 })

print(totalScore)