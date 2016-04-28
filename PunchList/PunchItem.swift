//
//  PunchItem.swift
//  PunchList
//
//  Created by Andrew Porter on 2/22/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import Foundation

class PunchItem: Equatable, FirebaseType {
    
    private let kItem = "itemDescription"
    private let kIsComplete = "isComplete"
    private let kNotes = "notes"
    private let kIndex = "index"
        
    let itemDescription: String
    var isComplete: Bool = false
    var notes: String?
    let index: Int
    var identifier: String?
    
    init(itemDescription: String, index: Int) {
        self.itemDescription = itemDescription
        self.index = index
    }
    
    // MARK: - FirebaseType
    let endpoint = "punchItem"
    var jsonValue: [String: AnyObject] {
        var json: [String: AnyObject] = [kItem: itemDescription, kIsComplete: isComplete, kIndex: index]
        
        if let notes = self.notes {
            json.updateValue(notes, forKey: kNotes)
        }
        
        return json
    }
    
    required init?(json: [String : AnyObject], identifier: String) {
        guard let itemDescription = json[kItem] as? String, isComplete = json[kIsComplete] as? Bool, index = json[kIndex] as? Int else { return nil }
        
        self.itemDescription = itemDescription
        self.isComplete = isComplete
        self.index = index
        
        if let notes = json[kNotes] as? String {
            self.notes = notes
        }
        
        self.identifier = identifier
        
    }
    
}

func ==(lhs: PunchItem, rhs: PunchItem) -> Bool {
    return lhs.itemDescription == rhs.itemDescription && lhs.isComplete == rhs.isComplete && lhs.notes == rhs.notes && lhs.index == rhs.index
}