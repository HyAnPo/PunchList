//
//  User.swift
//  PunchList
//
//  Created by Andrew Porter on 12/3/15.
//  Copyright © 2015 Andrew Porter. All rights reserved.
//

import Foundation

class User: Equatable, FirebaseType {
    
    private let kEmail = "email"
    private let kName = "name"
    private let kCompany = "company"
    private let kProjects = "projects"
    
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
        
        var json: [String: AnyObject] = [kEmail: self.email]
        
        if let name = self.name {
            json.updateValue(name, forKey: kName)
        }
        
        if let company = self.company {
            json.updateValue(company, forKey: kCompany)
        }
        
        if let projects = self.projects {
            json.updateValue(projects.map({$0.jsonValue}), forKey: kProjects)
        }
        
        return json
    }
    
    required init?(json: [String: AnyObject], identifier: String) {
        guard let email = json[kEmail] as? String else { return nil }
        
        self.email = email
        self.name = json[kName] as? String
        self.company = json[kCompany] as? String
        
        if let projects = json[kProjects] as? [String: AnyObject] {
            self.projects = projects.flatMap({Project(json: $0.1 as! [String: AnyObject], identifier: $0.0)})
        }
        
        self.identifier = identifier
    }
    
}

func ==(lhs: User, rhs: User) -> Bool {
    
    return (lhs.email == rhs.email) && (lhs.identifier == rhs.identifier)
}