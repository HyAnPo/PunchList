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
    }
    
}