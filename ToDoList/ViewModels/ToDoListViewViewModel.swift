//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Anmol Mangat on 09/06/25.
//
import  FirebaseFirestore
import Foundation

class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userID: String
    
    init (userID: String) {
        self.userID = userID
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .collection("todoItems")
            .document(id)
            .delete()
            
    }
}
