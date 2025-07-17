//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Anmol Mangat on 09/06/25.
//

import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject{
    @Published var currentUserID: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid ?? ""
            }
        }
    }
    
    var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
