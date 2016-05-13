//
//  PunchItemController.swift
//  PunchList
//
//  Created by Andrew Porter on 3/5/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import Foundation

class PunchItemController {
    
    static func punchItemFromIdentifier(identifier: String, completion: (punchItem: PunchItem?) -> Void) {
        
        FirebaseController.dataAtEndpoint("punchItem/\(identifier)") { (data) in
            
            if let data = data as? [String: AnyObject] {
                let punchItem = PunchItem(json: data, identifier: identifier)
                
                completion(punchItem: punchItem)
            } else {
                
                completion(punchItem: nil)
            }
        }
    }
    
    static func togglePunchItemComplete(punchItem: PunchItem, completion: (success: Bool, punchItem: PunchItem?) -> Void) {
        
        // Duplicate the punchItem
        var duplicatePunchItem = punchItem
        
        // Toggle isComplete and then overwrite the old punchItem in firebase with the duplicate punchItem
        duplicatePunchItem.isComplete = !duplicatePunchItem.isComplete
        duplicatePunchItem.save()
        
        // Retrieve the new saved punchItem from firebase
        PunchItemController.punchItemFromIdentifier(duplicatePunchItem.identifier!) { (punchItem) in
            
            if let punchItem = punchItem {
                
                completion(success: true, punchItem: punchItem)
            } else {
                
                completion(success: false, punchItem: nil)
            }
        }
    }
    
    static func addNoteToPunchItem(punchItem: PunchItem, note: String, completion: (success: Bool, post: PunchItem?) -> Void) {
        
        var duplicatePunchItem = punchItem
        duplicatePunchItem.notes.append(note)
        duplicatePunchItem.save()
        
        PunchItemController.punchItemFromIdentifier(duplicatePunchItem.identifier!) { (punchItem) in
            
            if let punchItem = punchItem {
                
                completion(success: true, post: punchItem)
            } else {
                
                completion(success: false, post: nil)
            }
        }
    }
}