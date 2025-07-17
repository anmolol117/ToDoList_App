//
//  ContentView.swift
//  ToDoList
//
//  Created by Anmol Mangat on 09/06/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty {
                //signedIn
                TabView {
                    ToDoListView(userID: viewModel.currentUserID)
                        .tabItem{
                            Label("Home", systemImage: "house")
                        }
                    
                    ProfileView()
                        .tabItem{
                            Label("Profile", systemImage: "person.circle")
                        }
                }
                    
            } else {
                LoginView()
            }
                
            }
        }
    
    }


#Preview {
    MainView()
}
