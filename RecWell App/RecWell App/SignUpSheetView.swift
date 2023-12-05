//
//  SignUpSheetView.swift
//  RecWell App
//
//  Created by Student on 12/5/23.
//

import SwiftUI

struct SignUpSheetView: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        
        ZStack {
            
            Color(red: 0.369, green: 0.369, blue: 0.369)
            
            VStack {
                
                Text("Create Account")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .bold()
                
                Group {
                    
                    TextField("Name", text: $viewModel.user.name)
                        .disableAutocorrection(true)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: viewModel.user.name.isEmpty) {
                            Text("Username")
                                .foregroundColor(.white)
                                .bold()
                        }
                    
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.white)
                    
                    TextField("Student ID", text: $viewModel.user.studentID)
                        .disableAutocorrection(true)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: viewModel.user.studentID.isEmpty) {
                            Text("Student ID")
                                .foregroundColor(.white)
                                .bold()
                        }
                    
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.white)
                    
                    TextField("Class Year", text: $viewModel.user.year)
                        .disableAutocorrection(true)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: viewModel.user.year.isEmpty) {
                            Text("Class Year")
                                .foregroundColor(.white)
                                .bold()
                        }
                    
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.white)
                    
                    TextField("Email", text: $viewModel.email)
                        .disableAutocorrection(true)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: viewModel.email.isEmpty) {
                            Text("Email")
                                .foregroundColor(.white)
                                .bold()
                        }
                    
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.white)
                    
                    TextField("Password", text: $viewModel.password)
                        .disableAutocorrection(true)
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
                }
                
                Group {
                    
                    Button (action: {
                        
                        // Logout stuff
                        viewModel.signOut()
                        viewModel.register()
                        dismiss()
                    }) {
                        
                        Text("Create Account")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(Color(red: 0.22, green: 0.463, blue: 0.114)))
                            .foregroundColor(.white)
                    }
                    .disabled(viewModel.email.count < 1 || viewModel.password.count < 6)
                }
            }
            .padding(20)
        }
        .background(Color(red: 0.369, green: 0.369, blue: 0.369))
    }
}
