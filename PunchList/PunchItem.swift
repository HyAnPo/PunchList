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
    var isComplete: Bool = false
    var notes: String?
    let index: Int
    
    init(itemDescription: String, index: Int) {
        self.itemDescription = itemDescription
        self.index = index
    }
    
}

func ==(lhs: PunchItem, rhs: PunchItem) -> Bool {
    return lhs.itemDescription == rhs.itemDescription && lhs.isComplete == rhs.isComplete && lhs.notes == rhs.notes && lhs.index == rhs.index
}