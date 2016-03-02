//
//  PunchList.swift
//  PunchList
//
//  Created by Andrew Porter on 2/22/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import Foundation

class PunchList {
    
    let title: String
    var items: [PunchItem] = []
    var units: Int
    var completedUnits: [Int] {
        var completedUnits: [Int] = []
        for num in 1...units {
            var isComplete = true
            for item in items {
                if !item.completedUnits.contains(num) {
                    isComplete = false
                }
            }
            if isComplete {
                completedUnits.append(num)
            }
        }
        return completedUnits
    }
    
    init(title: String, units: Int) {
        self.title = title
        self.units = units
        
        if let path = NSBundle.mainBundle().pathForResource("frontEndPunch", ofType: "json") {
            if let data = NSData(contentsOfFile: path) {
                do {
                    if let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as? [String: AnyObject] {
                        if let punchItemsArray = jsonDictionary["Front End Punch"] as? [String] {
                            for item in punchItemsArray {
                                let punchItem = PunchItem(itemDescription: item, units: self.units)
                                self.items.append(punchItem)
                            }
                        }
                    }
                } catch {
                    print("Error serializing JSON")
                    return
                }
            }
            
        }
    }
}