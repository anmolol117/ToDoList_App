//
//  User.swift
//  ToDoList
//
//  Created by Anmol Mangat on 09/06/25.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
    
}
