//
//  Punch.swift
//  PunchList
//
//  Created by Andrew Porter on 12/3/15.
//  Copyright © 2015 Andrew Porter. All rights reserved.
//

import Foundation

class Punch {
    
    let description: String
    var completed: Bool
    let category: PunchListCategory
    var notes: String
    
    init(description: String, completed: Bool, category: PunchListCategory, notes: String) {
        
        self.description = description
        self.completed = false
        self.category = category
        self.notes = notes
    }
}