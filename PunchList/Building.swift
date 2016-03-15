//
//  Building.swift
//  PunchList
//
//  Created by Andrew Porter on 2/22/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import Foundation

class Building: Equatable {
    
    //let uid: String?
    let buildingID: String
    var units: [Unit] = []
    var buildingPunchList: [PunchList] = []
    
    init(buildingID: String, unitsPerBuilding: Int) {
        self.buildingID = buildingID
        
        var tempUnits = [Unit]()
        var punchLists: [PunchList] = []
        
        for num in 1...unitsPerBuilding {
            let unit = Unit(unitID: String(num))
            tempUnits.append(unit)
        }
        self.units = tempUnits
        
        do {
            if let punchList = try PunchList(fileName: "frontEndPunch") {
                punchLists.append(punchList)
            }
        } catch let error {
            print("Failiure to initialize front end punch list with error: \(error)")
        }
        self.buildingPunchList = punchLists
    }
}

func ==(lhs: Building, rhs: Building) -> Bool {
    return lhs.buildingID == rhs.buildingID && lhs.units == rhs.units
}