//
//  Project.swift
//  PunchList
//
//  Created by Andrew Porter on 12/3/15.
//  Copyright © 2015 Andrew Porter. All rights reserved.
//

import Foundation

class Project: Equatable {
    
    let uid: String?
    let name: String
    let pin: String?
    var buildings: [Building]
    var dueDate: NSDate?
    
    init(id: String?, name: String, pin: String?, numberOfBuildings: Int, unitsPerBuilding: Int, dueDate: NSDate?) {
        self.uid = id
        self.name = name
        self.pin = pin
        self.dueDate = dueDate
        
        var buildings = [Building]()
        
        for num in 1...numberOfBuildings {
            let building = Building(buildingID: String(num), unitsPerBuilding: unitsPerBuilding)
            buildings.append(building)
        }
        self.buildings = buildings
    }
}

func ==(lhs: Project, rhs: Project) -> Bool {
    return lhs.uid == rhs.uid && lhs.name == rhs.name
}