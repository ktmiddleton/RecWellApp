//
//  ContentView.swift
//  RecWell App
//
//  Created by Student on 11/5/23.
//

import SwiftUI

// Kobe working here -- HStack Navigation Bar + Page Selector Code
struct ContentView: View {
    @ObservedObject var viewModel : ViewModel

    var body: some View {
        VStack
        {
            switch viewModel.navChoice
            {
                case .sports:
                    SportsView()
                case .`class`:
                    ClassView()
                case .profile:
                    ProfileView()
                default:
                    HomeView()
            }
            Spacer()
            HStack
            {
                Button("Home")
                {
                    viewModel.navChoice = .home
                }
                .padding(20)
                Spacer()
                Button("Sports")
                {
                    viewModel.navChoice = .sports
                }
                .padding(20)
                Spacer()
                Button("Classes")
                {
                    viewModel.navChoice = .class
                }
                .padding(20)
                Spacer()
                Button("Profile")
                {
                    viewModel.navChoice = .profile
                }
                .padding(20)
            }
        }
    }
}

// Preview code
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}

class ViewModel: ObservableObject
{
    @Published var navChoice = navigationChoices.home
    
    enum navigationChoices: String
    {
        case home = "home"
        case sports = "sports"
        case profile = "profile"
        case `class` = "class"
    }
}

class User
{
    // Cailyn: Insert Superclass Variables and Methods here
    
}

class Player: User
{
    // Cailyn: Insert Player variables/methods here, do not duplicate methods inherited by User already
    
}

class Instructor: User
{
    // Cailyn: Insert Player variables/methods here, do not duplicate methods inherited by User already
    
}

class Referee: User
{
    // Cailyn: Insert Player variables/methods here, do not duplicate methods inherited by User already
    
}

class Administrator: User
{
    // Cailyn: Insert Player variables/methods here, do not duplicate methods inherited by User already
    
}

class Team
{
    // Cailyn: Insert code for team here. Should be a list of users, complete with a coach. A Coach can just be a type of user, feel free to explicitly define if you
    // want.
}
