//
//  Building.swift
//  PunchList
//
//  Created by Andrew Porter on 2/22/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import Foundation

class Building: Equatable {
    
    let uid: String?
    let buildingID: String
    var units: Int
    var buildingPunchList: [PunchList] = []
    let unitPunchLists: [PunchList] = []
    
    init(uid: String?, buildingID: String, units: Int) {
        self.uid = uid
        self.buildingID = buildingID
        self.units = units
        
        self.buildingPunchList.append(PunchList(title: "Front End", units: units))
    }
}

func ==(lhs: Building, rhs: Building) -> Bool {
    return lhs.uid == rhs.uid && lhs.buildingID == rhs.buildingID && lhs.units == rhs.units
}