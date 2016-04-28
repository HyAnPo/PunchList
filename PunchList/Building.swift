//
//  Building.swift
//  PunchList
//
//  Created by Andrew Porter on 2/22/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import Foundation

class Building: Equatable, FirebaseType {
    
    private let kBuildingID = "buildingID"
    private let kUnits = "units"
    private let kBuildingPunchList = "buildingPunchList"
    
    //let uid: String?
    let buildingID: String
    var units: [Unit] = []
    var buildingPunchList: [PunchList] = []
    var identifier: String?
    
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
    
    // MARK: - FirebaseType
    let endpoint = "building"
    var jsonValue: [String: AnyObject] {
        let json: [String: AnyObject] = [kBuildingID: buildingID, kUnits: units.map({$0.jsonValue}), kBuildingPunchList: buildingPunchList.map({$0.jsonValue})]
        
        return json
    }
    
    required init?(json: [String: AnyObject], identifier: String) {
        guard let buildingID = json[kBuildingID] as? String, units = json[kUnits] as? [String: AnyObject], buildingPunchList = json[kBuildingPunchList] as? [String: AnyObject] else { return nil }
        
        self.buildingID = buildingID
        self.units = units.flatMap({Unit(json: $0.1 as! [String: AnyObject], identifier: $0.0)})
        self.buildingPunchList = buildingPunchList.flatMap({PunchList(json: $0.1 as! [String: AnyObject], identifier: $0.0)})
        self.identifier = identifier
    }
}

func ==(lhs: Building, rhs: Building) -> Bool {
    return lhs.buildingID == rhs.buildingID && lhs.units == rhs.units
}