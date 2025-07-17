//
//  LoginView.swift
//  ToDoList
//
//  Created by Anmol Mangat on 09/06/25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "To Do List", subtitle: "Get Things Done", angle: 15, backgroundColor: .pink)
                    .offset(y: -10)

                
                
                //Login Form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Adress", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButtonView(title: "Log In", backgroundColor: .blue){
                        viewModel.login()
                    }
                    .padding()
                }
                .padding(.bottom, -300)

                //Create Account
                VStack {
                    Text("Don't have an account?")
    
                    NavigationLink("Create an Account",destination: RegisterView())
                    
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
