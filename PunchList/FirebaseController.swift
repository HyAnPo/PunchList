//
//  NetworkController.swift
//  PunchList
//
//  Created by Andrew Porter on 12/3/15.
//  Copyright © 2015 Andrew Porter. All rights reserved.
//

import Foundation
import Firebase

class FirebaseController {
    
    // Firebase reference
    static let base = Firebase(url: "https://punchlistapp.firebaseio.com")
    
    static func dataAtEndpoint(endpoint: String, completion: (data: AnyObject?) -> Void) {
        
        let baseForEndpoint = FirebaseController.base.childByAppendingPath(endpoint)
        
        baseForEndpoint.observeSingleEventOfType(.Value, withBlock: { snapshot in
            
            if snapshot.value is NSNull {
                completion(data: nil)
            } else {
                completion(data: snapshot.value)
            }
        })
    }
    
}

protocol FirebaseType {
    
    // Properties
    var identifier: String? { get set }
    var endpoint: String { get }
    var jsonValue: [String: AnyObject] { get }
    
    // initializers
    init?(json: [String: AnyObject], identifier: String)
    
    // Functions
    mutating func save()
    func delete()
}

extension FirebaseType {
    
    mutating func save() {
        
        var endpointBase: Firebase
        
        if let childID = self.identifier {
            endpointBase = FirebaseController.base.childByAppendingPath(endpoint).childByAppendingPath(childID)
        } else {
            endpointBase = FirebaseController.base.childByAppendingPath(endpoint).childByAutoId()
            self.identifier = endpointBase.key
        }
        
        endpointBase.updateChildValues(self.jsonValue)
    }
    
    func delete() {
        
        let endpointBase: Firebase = FirebaseController.base.childByAppendingPath(endpoint).childByAppendingPath(self.identifier)
        
        endpointBase.removeValue()
    }
}