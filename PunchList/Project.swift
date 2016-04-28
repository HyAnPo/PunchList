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
    
    let name: String
    let pin: String?
    var buildings: [Building]
    var identifier: String?
    
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
    
    required init?(json: [String: AnyObject], identifier: String) {
        guard let name = json[kName] as? String, buildings = json[kBuildings] as? [String: AnyObject] else { return nil }
        
        self.name = name
        self.buildings = buildings.flatMap({Building(json: $0.1 as! [String: AnyObject], identifier: $0.0)})
        self.identifier = identifier
        self.pin = json[kPin] as? String
    }
    
}

func ==(lhs: Project, rhs: Project) -> Bool {
    return lhs.identifier == rhs.identifier && lhs.name == rhs.name
}