//
//  Category.swift
//  PunchList
//
//  Created by Andrew Porter on 3/11/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import Foundation

struct Category: Equatable, FirebaseType {
    
    private let kTitle = "title"
    private let kPunchItems = "punchItems"
    
    let title: String
    var punchItems: [PunchItem]
    var identifier: String?
    
    // MARK: - FirebaseType
    let endpoint = "categories"
    var jsonValue: [String: AnyObject] {
        let json: [String: AnyObject] = [kTitle: title, kPunchItems: punchItems.map({$0.jsonValue})]
        
        return json
    }
    
    init?(json: [String : AnyObject], identifier: String) {
        guard let title = json[kTitle] as? String, punchItems = json[kPunchItems] as? [String: AnyObject] else { return nil }
        
        self.title = title
        self.punchItems = punchItems.flatMap({PunchItem(json: $0.1 as! [String: AnyObject], identifier: $0.0)})
    }
}

func ==(lhs: Category, rhs: Category) -> Bool {
    return lhs.title == rhs.title
}