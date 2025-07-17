//
//  ProfileView.swift
//  ToDoList
//
//  Created by Anmol Mangat on 09/06/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()

    var body: some View {
        NavigationView {
            VStack {
                //Avatar
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.blue)
                    .frame(width: 125, height: 125)
                    .padding()
                
                //Info
                VStack(alignment: .leading) {
                    if let user = viewModel.user {
                        HStack {
                            Text("Name: ")
                                .bold()
                                .padding()
                            Text(user.name)
                        }
                        
                        HStack {
                            Text("Email: ")
                                .bold()
                                .padding()
                            Text(user.email)
                        }
                        
                        HStack {
                            Text("Member Since: ")
                                .bold()
                                .padding()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }
                    } else {
                        Text("Loading Profile...")
                    }
                    
                    
                }
                
                //SignOut
                Button("Log Out") {
                    viewModel.logOut()
                }
                .tint(Color.red)
                Spacer()
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
