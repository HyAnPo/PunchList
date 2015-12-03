//
//  User.swift
//  PunchList
//
//  Created by Andrew Porter on 12/3/15.
//  Copyright © 2015 Andrew Porter. All rights reserved.
//

import Foundation

struct User {
    
    let name: String
    let email: String
    let company: String
    let password: String
    
    init(name: String, email: String, company: String, password: String) {
        
        self.name = name
        self.email = email
        self.company = company
        self.password = password
    }
}