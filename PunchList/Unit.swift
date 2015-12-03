//
//  Unit.swift
//  PunchList
//
//  Created by Andrew Porter on 12/3/15.
//  Copyright © 2015 Andrew Porter. All rights reserved.
//

import Foundation

struct Unit {
    
    let number: String
    let building: Building
    let project: Project
    let punchLists: [PunchList]
    
    init(number: String, building: Building, project: Project, punchLists: [PunchList]) {
        
        self.number = number
        self.building = building
        self.project = project
        self.punchLists = []
        
    }
}