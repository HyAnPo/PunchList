//
//  Project.swift
//  PunchList
//
//  Created by Andrew Porter on 12/3/15.
//  Copyright © 2015 Andrew Porter. All rights reserved.
//

import Foundation

struct Project {
    
    let name: String
    let pin: String
    let buildings: Int
    let units: Int
    
    init(name: String, pin: String, buildings: Int, units: Int) {
        
        self.name = name
        self.pin = pin
        self.buildings = buildings
        self.units = units
        
    }
}