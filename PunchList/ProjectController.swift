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
    
    var projectsArray: [Project] = []
    
    init() {
        self.projectsArray = mockData
    }
    
    // CREATE
    static func addProjectToFirebase(project: Project, completion: (success: Bool, project: Project?) -> Void) {
        
    }
    
    func addProject(project: Project) {
        projectsArray.append(project)
    }
    
    // READ
    
    static func fetchProjectsForUser(user: User, completion: (success: Bool, projects: [Project]?) -> Void) {
        
    }
    
    static func projectFromIdentifier(identifier: String, completion: (project: Project?) -> Void) {
        
    }
    
    var mockData: [Project] {
        get {
            let projects = [
                Project(identifier: nil, name: "Project 1", pin: "3928", numberOfBuildings: 100, unitsPerBuilding: 12),
                Project(identifier: nil, name: "Project 2", pin: "2923", numberOfBuildings: 15, unitsPerBuilding: 6),
                Project(identifier: nil, name: "Project 3", pin: "0293", numberOfBuildings: 1, unitsPerBuilding: 4),
                Project(identifier: nil, name: "Project 4", pin: "3920", numberOfBuildings: 10, unitsPerBuilding: 12)
            ]
            return projects
        }
    }
    
    // UPDATE
    
    // DELETE/ARCHIVE
    static func deleteProject(project: Project) {
        
    }
    
    static func orderProjects(projects: [Project]) -> [Project] {
        
        return []
    }
    
}