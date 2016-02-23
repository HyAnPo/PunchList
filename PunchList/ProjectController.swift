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
            Project(projectID: "294lsjf", projectName: "The Seasons", projectPIN: "294028", numberOfBuildings: 12, unitsPerBuilding: 12, dueDate: nil),
            Project(projectID: "20gasdlfj93", projectName: "FourPlex", projectPIN: "293r82", numberOfBuildings: 1, unitsPerBuilding: 4, dueDate: nil),
            Project(projectID: "29g20", projectName: "The Villas", projectPIN: nil, numberOfBuildings: 8, unitsPerBuilding: 8, dueDate: nil)
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