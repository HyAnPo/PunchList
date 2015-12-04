//
//  PunchList.swift
//  PunchList
//
//  Created by Andrew Porter on 12/3/15.
//  Copyright © 2015 Andrew Porter. All rights reserved.
//

import Foundation

class PunchList {
    
    let name: String
    let project: Project
    let building: Building
    let unit: Unit?
    let punches: [Punch]
    
    enum FinalPunch: String {
        
        case Drywall = "Drywall"
        case ExteriorDoors = "Exterior Doors"
        case InteriorTrimAndHardware = "Interior Trim/Hardware"
        case Painting = "Painting"
        case Flooring = "Flooring"
        case Cabinets = "Cabinets"
        case Countertops = "Countertops"
        case LowVoltage = "Low Voltage"
        case Electric = "Electric"
        case HVAC = "HVAC"
        case FireSprinkler = "Fire Sprinkler"
        case Plumbing = "Plumbing"
        case Windows = "Windows"
        case ExteriorFinishes = "Exterior Finishes"
        case Appliances = "Appliances"
        case IronWork = "Iron Work"
        case Wasatch = "Wasatch"
    }
    
    enum fourWay: String {
        
        case Windows = "Windows"
        case ExteriorDoors = "Exterior Doors"
        case Electric = "Electric"
        case Plumbing = "Plumbing"
        case HVAC = "HVAC"
        case Drywall = "Drywall"
    }
    
    
    init(name: String, project: Project, building: Building, unit: Unit?, punches: [Punch]) {
        
        self.name = name
        self.project = project
        self.building = building
        self.unit = unit
        self.punches = []
    }
}