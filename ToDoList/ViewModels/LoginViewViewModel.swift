//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Anmol Mangat on 09/06/25.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    
    @Published var email =  ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
        
    }
    
    func login() {
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    func validate() -> Bool {
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please enter email and password."
            
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            
            errorMessage = "Please enter Valid email."
            
            return false
        }
        
        return true
    }
}
