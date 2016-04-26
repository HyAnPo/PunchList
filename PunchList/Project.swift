//
//  Project.swift
//  PunchList
//
//  Created by Andrew Porter on 12/3/15.
//  Copyright © 2015 Andrew Porter. All rights reserved.
//

import Foundation

class Project: Equatable, FirebaseType {
    
    private let kName = "name"
    private let kPin = "pin"
    private let kBuildings = "buildings"
    
    let identifier: String?
    let name: String
    let pin: String?
    var buildings: [Building]
    
    init(identifier: String?, name: String, pin: String?, numberOfBuildings: Int, unitsPerBuilding: Int) {
        self.identifier = identifier
        self.name = name
        self.pin = pin
        
        var buildings = [Building]()
        
        for num in 1...numberOfBuildings {
            let building = Building(buildingID: String(num), unitsPerBuilding: unitsPerBuilding)
            buildings.append(building)
        }
        self.buildings = buildings
    }
    
    // MARK: - FirebaseType
    let endpoint = "project"
    var jsonValue: [String: AnyObject] {
        var json: [String: AnyObject] = [kName: name, kBuildings: buildings.map({$0.jsonValue})]
        
        if let pin = pin {
            json.updateValue(pin, forKey: kPin)
        }
        
        return json
    }
    
    init?(json: [String : AnyObject], identifier: String) {
        guard let name = json[kName] as? String, buildings = json[kBuildings] as? [String: AnyObject] else { return nil }
        
        self.name = name
        
        
    }
}

func ==(lhs: Project, rhs: Project) -> Bool {
    return lhs.identifier == rhs.identifier && lhs.name == rhs.name
}