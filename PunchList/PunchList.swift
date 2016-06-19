//
//  PunchList.swift
//  PunchList
//
//  Created by Andrew Porter on 2/22/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import Foundation

class PunchList: Equatable, FirebaseType {
    
    private let kTitle = "title"
    private let kCategories = "categories"
    private let kBuildingID = "buildingID"
    private let kUnitID = "unitID"
    
    let title: String
    var categories: [Category]
    var identifier: String?
    var buildingID: String?
    var unitID: String?
    
    init?(fileName: String) throws {
        
        do {
            
            guard let fileURL = NSBundle.mainBundle().URLForResource(fileName, withExtension: ".json"),
                        data = NSData(contentsOfURL: fileURL),
                        jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String: [AnyObject]],
                        punchListName = jsonDictionary.keys.first else { return nil }
            
            var categories: [Category] = []
            if let punchItemNames = jsonDictionary[punchListName] as? [String] {
                
                let punchItems = punchItemNames.enumerate().map { PunchItem(itemDescription: $0.1, index: $0.0) }
                categories = [Category(title: punchListName, punchItems: punchItems)]
                
            } else if let categoryDictionaries = jsonDictionary[punchListName] as? [[String: [String]]] {
                
                for dict in categoryDictionaries {
                    
                    guard let categoryName = dict.keys.first, let punchItemNames = dict[categoryName] else { continue }
                    
                    let punchItems = punchItemNames.enumerate().map { PunchItem(itemDescription: $0.1, index: $0.0) }
                    categories.append(Category(title: categoryName, punchItems: punchItems))
                }
                
                categories.append(Category(title: "Other", punchItems: []))
            }
            
            self.title = punchListName
            self.categories = categories
            
        } catch let error {
            
            NSLog("Failure to deserialize punch list JSON: \(error)")
            self.title = ""
            self.categories = []
            throw error
        }
    }
    
    // MARK: - FirebaseType
    let endpoint = "punchList"
    var jsonValue: [String: AnyObject] {
        
        var json: [String: AnyObject] = [kTitle: title, kCategories: categories.map({$0.jsonValue})]
        
        if let buildingID = buildingID {
            
            json[kBuildingID] = buildingID
        }
        
        if let unitID = unitID {
            
            json[kUnitID] = unitID
        }
        
        return json
    }
    
    required init?(json: [String: AnyObject], identifier: String) {
        guard let title = json[kTitle] as? String, categories = json[kCategories] as? [String: AnyObject] else { return nil }
        
        self.title = title
        self.categories = categories.flatMap({Category(json: $0.1 as! [String: AnyObject], identifier: $0.0)})
        self.identifier = identifier
        
        self.buildingID = json[kBuildingID] as? String
        self.unitID = json[kUnitID] as? String
    }
    
}

func ==(lhs: PunchList, rhs: PunchList) -> Bool {
    return lhs.title == rhs.title && lhs.identifier == rhs.identifier
}