//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Anmol Mangat on 09/06/25.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(item.title)
                    .font(.body)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle" )
            }
            .foregroundColor(Color.blue)
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(id: "123",
                                 title: "Get Milk",
                                 dueDate: Date().timeIntervalSince1970,
                                 createDate: Date().timeIntervalSince1970,
                                 isDone: false))
}
