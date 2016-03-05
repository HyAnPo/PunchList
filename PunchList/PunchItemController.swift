//
//  PunchItemController.swift
//  PunchList
//
//  Created by Andrew Porter on 3/5/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import Foundation

class PunchItemController {
    
    func togglePunchItemComplete(punchItem: PunchItem, unit: Int) {
        if !punchItem.completedUnits.contains(unit) {
            punchItem.completedUnits.append(unit)
        } else if punchItem.completedUnits.contains(unit) {
            if let index = punchItem.completedUnits.indexOf(unit) {
                punchItem.completedUnits.removeAtIndex(index)
            }
        }
    }
}