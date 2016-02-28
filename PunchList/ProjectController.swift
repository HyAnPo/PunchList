//
//  ProjectController.swift
//  PunchList
//
//  Created by Andrew Porter on 12/3/15.
//  Copyright © 2015 Andrew Porter. All rights reserved.
//

import Foundation

class ProjectController {
    
    static let sharedController = ProjectController()
    
//    var currentUser: User = UserController.sharedController.currentUser
    
    var projectsArray: [Project] = []
    
    init() {
        self.projectsArray = mockData
    }
    
    // CREATE
    func addProject(project: Project) {
        projectsArray.append(project)
    }
    
    // READ/RETRIEVE
    var mockData: [Project] {
        get {
            let projects = [
                Project(id: nil, name: "The Four Seasons", pin: "3928", numberOfBuildings: 20, unitsPerBuilding: 12, dueDate: nil),
                Project(id: nil, name: "Seasons of Layton", pin: "2923", numberOfBuildings: 15, unitsPerBuilding: 12, dueDate: nil),
                Project(id: nil, name: "4 Plex", pin: "0293", numberOfBuildings: 1, unitsPerBuilding: 4, dueDate: nil),
                Project(id: nil, name: "Villas On Main", pin: "3920", numberOfBuildings: 10, unitsPerBuilding: 12, dueDate: nil)
            ]
            return projects
        }
    }
//    func getProjectsForUser() {
//        if let projects = currentUser.projects {
//            self.projectsArray = projects
//        }
//    }
    
    // UPDATE
    
    // DELETE/ARCHIVE
    
}