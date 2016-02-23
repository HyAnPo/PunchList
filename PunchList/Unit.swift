//
//  Unit.swift
//  PunchList
//
//  Created by Andrew Porter on 2/22/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import Foundation

class Unit {
    
    let unitID: String
    var punchLists: [PunchList]?
    var punchItems: [PunchItem]?
    
    init(unitID: String, punchLists: [PunchList]?, punchItems: [PunchItem]?) {
        self.unitID = unitID
    }
}