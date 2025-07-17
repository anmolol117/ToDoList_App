//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Anmol Mangat on 09/06/25.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init () {
        
    }
    
    func save() {
        guard canSave else {
            return
        }
        
        //get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        //create model
        let newItemId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newItemId, title: title, dueDate: dueDate.timeIntervalSince1970, createDate: Date().timeIntervalSince1970, isDone: false
        )
        
        //Save model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todoItems")
            .document(newItemId)
            .setData(newItem.asDictionary())
                
            }
            
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
        
}
    
    
    
    

