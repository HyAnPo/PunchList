//
//  PunchList.swift
//  PunchList
//
//  Created by Andrew Porter on 2/22/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import Foundation

class PunchList {
    
    var items: [PunchItem]
    var units: Int
    var completedUnits: [Int] {
        var completedUnits: [Int] = []
        for num in 1...units {
            var isComplete = true
            for item in items {
                if !item.completedUnits.contains(num) {
                    isComplete = false
                }
            }
            if isComplete {
                completedUnits.append(num)
            }
        }
        return completedUnits
    }
    
    init(items: [PunchItem], units: Int) {
        self.items = items
        self.units = units
    }
}