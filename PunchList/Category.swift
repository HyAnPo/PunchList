//
//  Category.swift
//  PunchList
//
//  Created by Andrew Porter on 3/11/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import Foundation

struct Category: Equatable {
    
    let title: String
    var punchItems: [PunchItem]
}

func ==(lhs: Category, rhs: Category) -> Bool {
    return lhs.title == rhs.title
}