//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Anmol Mangat on 09/06/25.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
