//
//  PunchItemController.swift
//  PunchList
//
//  Created by Andrew Porter on 3/5/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import Foundation

class PunchItemController {
    
    static func togglePunchItemComplete(punchItem: PunchItem) {
        punchItem.isComplete = !punchItem.isComplete
    }
    
    static func addNoteToPunchItem(punchItem: PunchItem, note: String) {
        
    }
}