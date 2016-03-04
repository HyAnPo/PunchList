//
//  PunchItem.swift
//  PunchList
//
//  Created by Andrew Porter on 2/22/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import Foundation

class PunchItem: Equatable {
        
    let itemDescription: String
    let units: Int
    var completedUnits: [Int] = []
    var notes: [Int: String] = [:]
    
    init(itemDescription: String, units: Int) {
        self.itemDescription = itemDescription
        self.units = units
    }
    
}

func ==(lhs: PunchItem, rhs: PunchItem) -> Bool {
    return lhs.itemDescription == rhs.itemDescription && lhs.units == rhs.units && lhs.completedUnits == rhs.completedUnits && lhs.notes == rhs.notes
}