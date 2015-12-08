//
//  UserController.swift
//  PunchList
//
//  Created by Andrew Porter on 12/3/15.
//  Copyright © 2015 Andrew Porter. All rights reserved.
//

import Foundation

class UserController {
    
    static func userForIdentifier(identifier: String, completion: (user: User?) -> Void) {
        
        FirebaseController.dataAtEndpoint("users\(identifier)") { (data) -> Void in
            
            if let json = data as? [String: AnyObject] {
                let user = User(
            }
        }
    }
    
    //create user
    static func authenticateUser(email: String, password: String, completion: (success: Bool, user: User?) -> Void) {
        
        FirebaseController.base.authUser(email, password: password) { (error, response) -> Void in
            
            if error != nil {
                
                print("Unsuccessful login attempt.")
            } else {
                print("User ID: \(response.uid) authenticated successfully.")
                
                UserController.
            }
        }
    }
    
    static func createUser(name: String, email: String, password: String, company: String, completion: (success: Bool, user: User?) -> Void) {
        
    }
    
}