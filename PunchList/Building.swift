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
    var unitPunchLists: [PunchList] = []
    
    init(uid: String?, buildingID: String, units: Int) {
        self.uid = uid
        self.buildingID = buildingID
        self.units = units
        
        // Parse the front end JSON create a punchList and add it to the buildingPunchList array
        if let frontEndPath = NSBundle.mainBundle().pathForResource("frontEndPunch", ofType: "json") {
            var punchItems: [PunchItem] = []
            if let data = NSData(contentsOfFile: frontEndPath) {
                do {
                    if let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as? [String: AnyObject] {
                        if let punchItemsArray = jsonDictionary["Front End Punch"] as? [String] {
                            for item in punchItemsArray {
                                let punchItem = PunchItem(itemDescription: item, units: self.units)
                                punchItems.append(punchItem)
                            }
                        }
                    }
                } catch {
                    print("Error serializing Front End JSON")
                    return
                }
            }
            let punchList = PunchList(title: "Front End", items: punchItems, units: self.units, categories: nil)
            buildingPunchList.append(punchList)
        }
        
        // Parse the 4Way JSON create a punchList and add it to the unitPunchList array
        if let fourWayPath = NSBundle.mainBundle().pathForResource("4WayPunch", ofType: "json") {
            var punchItems: [PunchItem] = []
            var categoryArray: [String] = []
            if let data = NSData(contentsOfFile: fourWayPath) {
                do {
                    if let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as? [String: AnyObject] {
                        if let topLevelDictionary = jsonDictionary["4-Way Punch"] as? [String: AnyObject] {
                            categoryArray = Array(topLevelDictionary.keys)
                            for category in categoryArray {
                                if let itemsInCategory = topLevelDictionary[category] as? [String] {
                                    for item in itemsInCategory {
                                        let punchItem = PunchItem(itemDescription: item, units: self.units)
                                        punchItems.append(punchItem)
                                    }
                                }
                            }
                            categoryArray.append("Other")
                        }
                    }
                } catch {
                    print("Error serializing 4Way JSON")
                    return
                }
            }
            let punchList = PunchList(title: "4 Way", items: punchItems, units: self.units, categories: categoryArray)
            self.unitPunchLists.append(punchList)
        }
        
        // Parse final punch JSON create punchList and add it to the unitPunchList array
        if let finalPunchPath = NSBundle.mainBundle().pathForResource("finalPunch", ofType: "json") {
            var punchItems: [PunchItem] = []
            var categoryArray: [String] = []
            if let data = NSData(contentsOfFile: finalPunchPath) {
                do {
                    if let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as? [String: AnyObject] {
                        if let topLevelDictionary = jsonDictionary["Final Punch"] as? [String: AnyObject] {
                            categoryArray = Array(topLevelDictionary.keys)
                            for category in categoryArray {
                                if let itemsInCategory = topLevelDictionary[category] as? [String] {
                                    for item in itemsInCategory {
                                        let punchItem = PunchItem(itemDescription: item, units: self.units)
                                        punchItems.append(punchItem)
                                    }
                                }
                            }
                            categoryArray.append("Other")
                        }
                    }
                } catch {
                    print("Error serializing finalPunch JSON")
                    return
                }
            }
            let punchList = PunchList(title: "Final Punch", items: punchItems, units: self.units, categories: categoryArray)
            self.unitPunchLists.append(punchList)
        }
    }
}

func ==(lhs: Building, rhs: Building) -> Bool {
    return lhs.uid == rhs.uid && lhs.buildingID == rhs.buildingID && lhs.units == rhs.units
}