//
//  Building.swift
//  PunchList
//
//  Created by Andrew Porter on 2/22/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import Foundation

class Building: Equatable, FirebaseType {
    
    private let kBuildingName = "buildingName"
    private let kUnits = "units"
    private let kBuildingPunchList = "buildingPunchList"
    
    let buildingName: String
    
    // TODO: - Change made here
//    var units: [Unit] = []
//    var buildingPunchList: [PunchList] = []
    
    var identifier: String?
    var projectID: String?
    
    
    // TODO: - Change made here
    init(buildingName: String  /*, unitsPerBuilding: Int*/  ) {
        self.buildingName = buildingName
        
        // TODO: - Change made here
//        var tempUnits = [Unit]()
//        var punchLists: [PunchList] = []
        
//        for num in 1...unitsPerBuilding {
//            let unit = Unit(unitID: String(num))
//            tempUnits.append(unit)
//        }
//        self.units = tempUnits
        
//        do {
//            if let punchList = try PunchList(fileName: "frontEndPunch") {
//                punchLists.append(punchList)
//            }
//        } catch let error {
//            print("Failiure to initialize front end punch list with error: \(error)")
//        }
//        self.buildingPunchList = punchLists
    }
    
    // MARK: - FirebaseType
    let endpoint = "building"
    var jsonValue: [String: AnyObject] {
        
        // TODO: - Changes made here
        let json: [String: AnyObject] = [kBuildingName: buildingName  /*, kUnits: units.map({$0.jsonValue}), kBuildingPunchList: buildingPunchList.map({$0.jsonValue})*/ ]
        
        return json
    }
    
    required init?(json: [String: AnyObject], identifier: String) {
        
        // TODO: - Changes made here
        guard let buildingName = json[kBuildingName] as? String  /*, units = json[kUnits] as? [String: AnyObject], buildingPunchList = json[kBuildingPunchList] as? [String: AnyObject]*/   else { return nil }
        
        self.buildingName = buildingName
//        self.units = units.flatMap({Unit(json: $0.1 as! [String: AnyObject], identifier: $0.0)})
//        self.buildingPunchList = buildingPunchList.flatMap({PunchList(json: $0.1 as! [String: AnyObject], identifier: $0.0)})
        self.identifier = identifier
    }
}

func ==(lhs: Building, rhs: Building) -> Bool {
    return lhs.buildingName == rhs.buildingName && lhs.identifier == rhs.identifier
}


























