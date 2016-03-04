//
//  PunchList.swift
//  PunchList
//
//  Created by Andrew Porter on 2/22/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import Foundation

class PunchList: Equatable {
    
    let title: String
    var items: [PunchItem]
    var units: Int
    var categories: [String]?
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
    
    init(title: String, items: [PunchItem], units: Int, categories: [String]?) {
        self.title = title
        self.items = items
        self.units = units
        self.categories = categories
    }
}

func ==(lhs: PunchList, rhs: PunchList) -> Bool {
    return lhs.title == rhs.title && lhs.items == rhs.items && lhs.units == rhs.units
}