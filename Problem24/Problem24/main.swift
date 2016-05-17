//
//  main.swift
//  Problem24
//
//  Created by Robbie Plankenhorn on 5/17/16.
//  Copyright © 2016 Plankenhorn. All rights reserved.
//

import Foundation

// Pulled from http://stackoverflow.com/questions/34968470/calculate-all-permutations-of-a-string-in-swift
func permutations<C: CollectionType>(items: C) -> [[C.Generator.Element]] {
    var scratch = Array(items) // This is a scratch space for Heap's algorithm
    var result: [[C.Generator.Element]] = [] // This will accumulate our result
    
    // Heap's algorithm
    func heap(n: Int) {
        if n == 1 {
            result.append(scratch)
            return
        }
        
        for i in 0..<n-1 {
            heap(n-1)
            let j = (n%2 == 1) ? 0 : i
            swap(&scratch[j], &scratch[n-1])
        }
        heap(n-1)
    }
    
    // Let's get started
    heap(scratch.count)
    
    // And return the result we built up
    return result
}

let input = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

let per = permutations(input).map { element in
    return element.reduce("", combine: { $0 + String($1) })
}.map { Int($0)! }.sort()

print(per[999999])