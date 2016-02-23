//
//  Project.swift
//  PunchList
//
//  Created by Andrew Porter on 12/3/15.
//  Copyright © 2015 Andrew Porter. All rights reserved.
//

import Foundation

class Project: Equatable {
    
    let projectID: String
    let projectName: String
    let projectPIN: String?
    let numberOfBuildings: Int
    var buildings: [Building] = []
    let unitsPerBuilding: Int
    var punchList: PunchList?
    var dueDate: NSDate?
    
    init(projectID: String, projectName: String, projectPIN: String?, numberOfBuildings: Int, unitsPerBuilding: Int, punchList: PunchList? = nil, dueDate: NSDate?) {
        
        self.projectID = projectID
        self.projectName = projectName
        self.projectPIN = projectPIN
        self.numberOfBuildings = numberOfBuildings
        self.unitsPerBuilding = unitsPerBuilding
        self.punchList = punchList
        self.dueDate = dueDate
        
        for num in 1...numberOfBuildings {
            let building = Building(buildingID: String(num), numberOfUnits: unitsPerBuilding, punchList: nil, project: self)
            self.buildings.append(building)
        }
    }
}

func ==(lhs: Project, rhs: Project) -> Bool {
    return lhs.projectID == rhs.projectID && lhs.projectName == rhs.projectName
}