//
//  PunchList.swift
//  PunchList
//
//  Created by Andrew Porter on 12/3/15.
//  Copyright © 2015 Andrew Porter. All rights reserved.
//

import Foundation

class PunchList {
    
    let name: String
    let project: Project
    let building: Building
    let unit: Unit?
    let categories: [PunchListCategory]
    let punches: [Punch]
    
    
    init(name: String, project: Project, building: Building, unit: Unit?, categories: [PunchListCategory], punches: [Punch]) {
        
        self.name = name
        self.project = project
        self.building = building
        self.unit = unit
        self.categories = []
        self.punches = []
    }
}