//
//  PunchItemController.swift
//  PunchList
//
//  Created by Andrew Porter on 3/5/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import Foundation

class PunchItemController {
    
    static func punchItemFromIdentifier(identifier: String, completion: (punchItem: PunchItem?) -> Void) {
        
    }
    
    static func togglePunchItemComplete(punchItem: PunchItem, completion: (success: Bool, punchItem: PunchItem?) -> Void) {
        punchItem.isComplete = !punchItem.isComplete
    }
    
    static func addNoteToPunchItem(punchItem: PunchItem, note: String, completion: (success: Bool, post: PunchItem?) -> Void) {
        
    }
}