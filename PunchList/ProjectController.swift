//
//  ProjectController.swift
//  PunchList
//
//  Created by Andrew Porter on 12/3/15.
//  Copyright © 2015 Andrew Porter. All rights reserved.
//

import Foundation

class ProjectController {
    
    var currentUser: User = UserController.sharedController.currentUser
    
    var projects: [Project] = []
    
    // CREATE
    func addProject(project: Project) {
        projects.append(project)
    }
    
    // READ/RETRIEVE
    func getProjectsForUser() {
        if let projects = currentUser.projects {
            self.projects = projects
        }
    }
    
    // UPDATE
    
    // DELETE/ARCHIVE
    func deleteProject(project: Project) {
        if let index = projects.indexOf(project) {
            
        }
    }
}