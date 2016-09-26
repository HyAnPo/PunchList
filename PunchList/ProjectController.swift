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
        self.projectsArray = mockProjects
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
    
    var mockProjects: [Project] {
        get {
            let projects = [
                Project(identifier: "k1234k", name: "Project 1", pin: "3928", numberOfBuildings: 100, unitsPerBuilding: 12),
                Project(identifier: "b1234b", name: "Project 2", pin: "2923", numberOfBuildings: 15, unitsPerBuilding: 6),
                Project(identifier: "c1234c", name: "Project 3", pin: "0293", numberOfBuildings: 1, unitsPerBuilding: 4),
                Project(identifier: "d1234d", name: "Project 4", pin: "3920", numberOfBuildings: 10, unitsPerBuilding: 12)
            ]
            return projects
        }
    }
    
    var mockBuildings: [Building] {
        get {
            
            let building1 = Building(buildingName: "Building A")
            building1.projectID = "k1234k"
            building1.identifier = "q1234q"
            
            let building2 = Building(buildingName: "Building B")
            building2.projectID = "b1234b"
            building2.identifier = "w1234w"
            
            let building3 = Building(buildingName: "Building C")
            building3.projectID = "c1234c"
            building3.identifier = "e1234e"
            
            let building4 = Building(buildingName: "Building D")
            building4.projectID = "d1234d"
            building4.identifier = "r1234r"
            
            let buildings: [Building] = [building1, building2, building3, building4]
            
            return buildings
        }
    }
    
    var mockUnits: [Unit] {
        get {
            
            let unit1 = Unit(unitName: "J301")
            unit1.identifier = "t1234t"
            unit1.buildingID = "q1234q"
            
            let unit2 = Unit(unitName: "J302")
            unit2.identifier = "y1234y"
            unit2.buildingID = "w1234w"
            
            let unit3 = Unit(unitName: "J303")
            unit3.identifier = "u1234u"
            unit3.buildingID = "e1234e"
            
            let unit4 = Unit(unitName: "J304")
            unit4.identifier = "i1234i"
            unit4.buildingID = "r1234r"
            
            let units: [Unit] = [unit1, unit2, unit3, unit4]
            
            return units
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