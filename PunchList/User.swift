//
//  User.swift
//  PunchList
//
//  Created by Andrew Porter on 12/3/15.
//  Copyright © 2015 Andrew Porter. All rights reserved.
//

import Foundation

struct User: Equatable, FirebaseType {
    
    private let userKey = "user"
    private let nameKey = "name"
    private let companyKey = "company"
    
    let name: String?
    let email: String
    let company: String?
    var projects: [Project]?
    var identifier: String?
    
    init(name: String, email: String, uid: String?, company: String, projects: [Project]?) {
        
        self.name = name
        self.email = email
        self.company = company
        self.projects = []
        self.identifier = uid
    }
    
    //MARK: - FirebaseType
    
    var endpoint: String = "users"
    
    var jsonValue: [String: AnyObject] {
        
        var json: [String: AnyObject] = [userKey: self.email]
        
        if let name = self.name {
            json.updateValue(name, forKey: nameKey)
        }
        
        if let company = self.company {
            json.updateValue(company, forKey: companyKey)
        }
        
        return json
    }
    
    init?(json: [String : AnyObject], identifier: String) {
        
        guard let email = json[userKey] as? String else { return nil }
        
        self.email = email
        self.name = json[nameKey] as? String
        self.company = json[companyKey] as? String
        self.identifier = identifier
    }
}

func ==(lhs: User, rhs: User) -> Bool {
    
    return (lhs.email == rhs.email) && (lhs.identifier == rhs.identifier)
}