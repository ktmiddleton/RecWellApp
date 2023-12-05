//
//  LoginScreenView.swift
//  RecWell App
//
//  Created by Student on 12/4/23.
//

import SwiftUI

struct LoginScreenView: View {
    @ObservedObject var viewModel: ViewModel
    //    @State var email: String
    //    @State var password: String
    var body: some View
    {
        ZStack
        {
            
            // BOTTOM COLOR - darker gray
            Color(red: 0.369, green: 0.369, blue: 0.369)
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
            
            // TOP COLOR - lighter gray
                .fill(Color(red: 0.42, green: 0.42, blue: 0.42))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
            
            VStack {
                
                // Logo / welcome greeting
                Text("Welcome to RecWell")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .bold()
                
                // Textfield for username
                TextField("Username", text: $viewModel.email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: viewModel.email.isEmpty) {
                        Text("Username")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                // Textfield for password
                SecureField("Password", text: $viewModel.password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: viewModel.password.isEmpty) {
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                // Login button
                Button {
                    viewModel.login()
                    // ACTION HERE
                    //NavigationLink(destination: ContentView(viewModel: ViewModel())) {}
                    
                } label: {
                    Text("Login")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color(red: 0.22, green: 0.463, blue: 0.114)))
                        .foregroundColor(.white)
                }
                
                // Sign Up button
                Text("Dont have an acccount?")
                    .foregroundColor(.white)
                    .bold()
                
                Button {
                    
                    viewModel.register()
                    
                } label: {
                    Text("Sign up")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color(red: 0.22, green: 0.463, blue: 0.114)))
                        .foregroundColor(.white)
                }
                .disabled(viewModel.password.count < 6)
            }
            .frame(width: 350)
        }
        .ignoresSafeArea()
    }
}
struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView(viewModel:ViewModel())
    }
}
