//
//  ProfileView.swift
//  RecWell App
//
//  Created by Student on 11/6/23.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        
        ScrollView {
            
            Text("Profile")
                .font(.title)
                .foregroundColor(.white)
            
            ZStack {
                
                Color(red: 0.369, green: 0.369, blue: 0.369)
                
                VStack {
                    
                    // Account info
                    Text("User information")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title3)
                        .padding(10)
                    
                    Text("Name: \(viewModel.user.name)")
                        .foregroundColor(.white)
                        .padding(5)
                    
                    Text("Student ID: \(String(viewModel.user.studentID))")
                        .foregroundColor(.white)
                        .padding(5)
                    
                    Text("Class year: \(viewModel.user.year)")
                        .foregroundColor(.white)
                        .padding(5)
                    
                    Text("Participates in the following classes: ")
                        .foregroundColor(.white)
                        .padding(5)
                        .font(.title3)
                        .bold()
                    ForEach(viewModel.user.classes) { classexample in
                        Text(classexample.className)
                            .foregroundColor(.white)
                            .padding(5)
                    }
                    Button (action: {
                        
                        // Logout stuff
                        viewModel.signOut()
                        
                    }) {
                        Text("Logout")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(Color(red: 0.22, green: 0.463, blue: 0.114)))
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}
/*
 struct ProfileView_Previews: PreviewProvider {
 static var previews: some View {
 ProfileView()
 }
 }
 */
