//
//  Unit.swift
//  PunchList
//
//  Created by Andrew Porter on 2/22/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import Foundation

class Unit: Equatable {
    
    let unitID: String
    var punchLists: [PunchList]
    
    init(unitID: String) {
        self.unitID = unitID
        
        let punchListNames = ["4WayPunch", "finalPunch"]
        var tempPunchLists = [PunchList]()
        
        for name in punchListNames {
            
            do {
                if let punchList = try PunchList(fileName: name) {
                    tempPunchLists.append(punchList)
                }
            } catch let error {
                print("failiure to initializing \(name) punch List with error: \(error)")
            }
        }
        self.punchLists = tempPunchLists
    }
}

func ==(lhs: Unit, rhs: Unit) -> Bool {
    return lhs.unitID == rhs.unitID && lhs.punchLists == rhs.punchLists
}