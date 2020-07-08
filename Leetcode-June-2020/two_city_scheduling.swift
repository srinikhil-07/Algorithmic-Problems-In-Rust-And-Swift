//
//  two_city_scheduling.swift
//  Leetcode-June-2020
//
//  Created by sri-7348 on 6/4/20.
//  Copyright © 2020 Nikhi. All rights reserved.
//

import Foundation

func twoCitySchedCost(_ costs: [[Int]]) -> Int {
    let extraCost = costs.sorted { 
        print($0[0] - $0[1], $1[0] - $1[1])
        return ($0[0] - $0[1] < $1[0] - $1[1])
    }
    let minCostsOfA = extraCost.prefix(costs.count/2).compactMap {
        $0[0]
    }.reduce(0) { x, y in
        x+y
    }
    let minCostOfB = extraCost.suffix(costs.count/2).compactMap {
        $0[1]
    }.reduce(0) { x, y in
        x+y
    }
    return minCostsOfA+minCostOfB
}

func testTwoCitySchedCost() {
    let test = [[10,20],[30,200],[400,50],[30,20]]
    print(twoCitySchedCost(test))
}

//testTwoCitySchedCost()
