//
//  Building.swift
//  PunchList
//
//  Created by Andrew Porter on 12/3/15.
//  Copyright © 2015 Andrew Porter. All rights reserved.
//

import Foundation

struct Building {
    
    let name: String
    let units: Int
    let project: Project
    let punchList: PunchList
    
    init(name: String, units: Int, project: Project, punchList: PunchList) {
        
        self.name = name
        self.units = units
        self.project = project
        self.punchList = punchList
        
    }
}