//
//  Unit.swift
//  PunchList
//
//  Created by Andrew Porter on 2/22/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import Foundation

class Unit: Equatable, FirebaseType {
    
    private let kUnitID = "unitID"
    private let kPunchLists = "punchlists"
    
    let unitID: String
    var punchLists: [PunchList]
    var identifier: String?
    
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
    
    // MARK: - FirebaseType
    let endpoint = "unit"
    var jsonValue: [String: AnyObject] {
        let json: [String: AnyObject] = [kUnitID: unitID, kPunchLists: punchLists.map({$0.jsonValue})]
        
        return json
    }
    
    required init?(json: [String: AnyObject], identifier: String) {
        guard let unitID = json[kUnitID] as? String, punchLists = json[kPunchLists] as? [String: AnyObject] else { return nil }
        
        self.unitID = unitID
        self.punchLists = punchLists.flatMap({PunchList(json: $0.1 as! [String: AnyObject], identifier: $0.0)})
        self.identifier = identifier
    }
}

func ==(lhs: Unit, rhs: Unit) -> Bool {
    return lhs.unitID == rhs.unitID && lhs.punchLists == rhs.punchLists
}