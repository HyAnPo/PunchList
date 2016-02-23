//
//  PunchItem.swift
//  PunchList
//
//  Created by Andrew Porter on 2/22/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import Foundation

class PunchItem {
    
    let punchItemID: String
    let punchItemDescription: String
    var notes: String?
    var isComplete: Bool = false
    let unit: Unit
    
    init(punchItemID: String, punchItemDescription: String, notes: String?, unit: Unit) {
        self.punchItemID = punchItemID
        self.punchItemDescription = punchItemDescription
        self.notes = notes
        self.unit = unit
    }
}