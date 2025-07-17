//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Anmol Mangat on 09/06/25.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    init () {
        
    }
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userID)
            .collection("todoItems")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
