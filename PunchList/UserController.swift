//
//  UserController.swift
//  PunchList
//
//  Created by Andrew Porter on 12/3/15.
//  Copyright © 2015 Andrew Porter. All rights reserved.
//

import Foundation

class UserController {
    
    private let UserKey = "user"
    
    static let sharedController = UserController()
    
    var currentUser: User! {
        get {
            
            guard let uid = FirebaseController.base.authData?.uid,
                let userDictionary = NSUserDefaults.standardUserDefaults().valueForKey(UserKey) as? [String: AnyObject] else {
                    
                    return nil
            }
            
            return User(json: userDictionary, identifier: uid)
        }
        
        set {
            
            if let newValue = newValue {
                NSUserDefaults.standardUserDefaults().setValue(newValue.jsonValue, forKey: UserKey)
                NSUserDefaults.standardUserDefaults().synchronize()
            } else {
                NSUserDefaults.standardUserDefaults().removeObjectForKey(UserKey)
                NSUserDefaults.standardUserDefaults().synchronize()
            }
        }
    }
    
    static func userForIdentifier(identifier: String, completion: (user: User?) -> Void) {
        
        FirebaseController.dataAtEndpoint("users\(identifier)") { (data) -> Void in
            
            if let json = data as? [String: AnyObject] {
                let user = User(json: json, identifier: identifier)
                completion(user: user)
            } else {
                completion(user: nil)
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
                
                UserController.userForIdentifier(response.uid, completion: { (user) -> Void in
                    
                    if let user = user {
                        
                        sharedController.currentUser = user
                    }
                    
                    completion(success: true, user: user)
                })
            }
        }
    }
    
    static func createUser(name: String, email: String, password: String, company: String, completion: (success: Bool, user: User?) -> Void) {
        
        FirebaseController.base.createUser(email, password: password) { (error, response) -> Void in
            
            if let error = error {
                print(error.localizedDescription)
            } else {
                
                if let uid = response["uid"] as? String {
                    var user = User(name: name, email: email, uid: uid, company: company, projects: [])
                    user.save()
                    
                    authenticateUser(email, password: password, completion: { (success, user) -> Void in
                        
                        completion(success: success, user: user)
                    })
                }
            }
        }
        
        //MARK: - Not sure what user to put in this completion block
        completion(success: true, user: UserController.sharedController.currentUser)
    }
    
    static func logoutCurrentUser() {
        
        FirebaseController.base.unauth()
        
        sharedController.currentUser = nil
    }
    
}



































