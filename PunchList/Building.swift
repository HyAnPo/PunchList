//
//  Building.swift
//  PunchList
//
//  Created by Andrew Porter on 2/22/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import Foundation

class Building: Equatable {
    
    let buildingID: String
    let numberOfUnits: Int
    var units: [Unit] = []
    let punchList: PunchList?
    let project: Project
    
    init(buildingID: String, numberOfUnits: Int, punchList: PunchList?, project: Project) {
        self.buildingID = buildingID
        self.numberOfUnits = numberOfUnits
        self.punchList = punchList
        self.project = project
        
        // initialize a unit for every unit the building has
        for num in 1...numberOfUnits {
            let unit = Unit(unitID: String(num), punchLists: nil, punchItems: nil)
            self.units.append(unit)
        }
    }
}

func ==(lhs: Building, rhs: Building) -> Bool {
    return lhs.buildingID == rhs.buildingID && lhs.numberOfUnits == rhs.numberOfUnits
}