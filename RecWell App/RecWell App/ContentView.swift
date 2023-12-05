//
//  ContentView.swift
//  RecWell App
//
//  Created by Student on 11/5/23.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

// Kobe working here -- HStack Navigation Bar + Page Selector Code
struct ContentView: View {
    @ObservedObject var viewModel : ViewModel

    var body: some View {
        VStack
        {
            switch viewModel.navChoice
            {
                case .sports:
                    SportsView(viewModel: viewModel)
                case .`class`:
                    ClassView(viewModel: viewModel)
                case .profile:
                    ProfileView(viewModel: viewModel)
                default:
                    HomeView(viewModel: viewModel)
            }
            Spacer()
            HStack
            {
                Button(action: {
                    viewModel.navChoice = .home
                }) {
                    Image("Home Icon")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .aspectRatio(contentMode: .fit)
                }
                Button(action: {
                    viewModel.navChoice = .sports
                }) {
                    Image("Sports Icon")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .aspectRatio(contentMode: .fit)
                }
                Button(action: {
                    viewModel.navChoice = .class
                }) {
                    Image("Classes Icon")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .aspectRatio(contentMode: .fit)
                }
                Button(action: {
                    viewModel.navChoice = .profile
                }) {
                    Image("Profile Icon")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
        .background(Color(red: 0.369, green: 0.369, blue: 0.369))
    }
}

// Preview code
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}



class Team
{
    // Cailyn: Insert code for team here. Should be a list of users, complete with a coach. A Coach can just be a type of user, feel free to explicitly define if you
    // want.
    
    // Array of players:
    var players: [User] = []
    
    // Assigned Coach:
    var coach: User?
    
    // Team Name:
    var teamName: String = "team"
    
    //Team image(URL):
    var image: String = "image"
    
}
