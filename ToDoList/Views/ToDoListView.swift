//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Anmol Mangat on 09/06/25.
//

import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel : ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
        
    init(userID: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/todoItems")
        
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userID: userID))
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(Color.red)
                            
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented:
                                $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userID: "laDfJPv7G4TC3Nz8aAvHuBD6oBC2")
}
