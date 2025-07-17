//
//  RegisterView.swift
//  ToDoList
//
//  Created by Anmol Mangat on 09/06/25.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        
        VStack {
            //Header
            HeaderView(title: "Register", subtitle: "Start your ToDo journey", angle: -15, backgroundColor: .orange)
                .offset(y: 30)
            
            Form {
                
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Adress", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButtonView(title: "Create Account", backgroundColor: .green){
                    //Create Account
                    viewModel.register()
                }
                .padding()
            }
            .offset(y: -50)
            
            
            
            Spacer()
        }

    }
}

#Preview {
    RegisterView()
}
