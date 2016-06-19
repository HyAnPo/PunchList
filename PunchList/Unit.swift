//
//  Unit.swift
//  PunchList
//
//  Created by Andrew Porter on 2/22/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import Foundation

class Unit: Equatable, FirebaseType {
    
    private let kUnitName = "unitName"
    private let kPunchLists = "punchlists"
    private let kBuildingID = "buildingID"
    
    let unitName: String
    
    // TODO: - Changes made here
//    var punchLists: [PunchList]
    
    var identifier: String?
    var buildingID: String?
    
    
    init(unitName: String) {
        self.unitName = unitName
        
        // TODO: - Changes made here
//        let punchListNames = ["4WayPunch", "finalPunch"]
//        var tempPunchLists = [PunchList]()
        
//        for name in punchListNames {
//            
//            do {
//                if let punchList = try PunchList(fileName: name) {
//                    tempPunchLists.append(punchList)
//                }
//            } catch let error {
//                print("failiure to initializing \(name) punch List with error: \(error)")
//            }
//        }
//        self.punchLists = tempPunchLists
    }
    
    // MARK: - FirebaseType
    let endpoint = "unit"
    var jsonValue: [String: AnyObject] {
        var json: [String: AnyObject] = [kUnitName: unitName   /*, kPunchLists: punchLists.map({$0.jsonValue})*/  ]
        
        if let buildingID = buildingID {
            
            json[kBuildingID] = buildingID
        }
        
        return json
    }
    
    required init?(json: [String: AnyObject], identifier: String) {
        guard let unitID = json[kUnitName] as? String  /*, punchLists = json[kPunchLists] as? [String: AnyObject]*/    else { return nil }
        
        self.unitName = unitID
        
        // TODO: - Changes made here
//        self.punchLists = punchLists.flatMap({PunchList(json: $0.1 as! [String: AnyObject], identifier: $0.0)})
        
        self.identifier = identifier
        self.buildingID = json[kBuildingID] as? String
    }
}

func ==(lhs: Unit, rhs: Unit) -> Bool {
    return lhs.unitName == rhs.unitName && lhs.identifier == rhs.identifier
}





















