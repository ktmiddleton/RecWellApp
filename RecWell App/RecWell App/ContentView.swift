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
    var name: String
    var email: String
    var phone: Int
    var admin: Bool
    
    init(name: String, email: String, phone: Int, admin: Bool){
        self.name = name
        self.email = email
        self.phone = phone
        self.admin = admin
    }
    
}

class Player: User
{
    // Cailyn: Insert Player variables/methods here, do not duplicate methods inherited by User already
    var studentID: String = "0"
    var hasForms: Bool = false
    
}

class Instructor: User
{
    // Cailyn: Insert Player variables/methods here, do not duplicate methods inherited by User already
    
}

class Referee: User
{
    // Cailyn: Insert Player variables/methods here, do not duplicate methods inherited by User already
    var certificationDate: Date = 
  
}


class Team
{
    // Cailyn: Insert code for team here. Should be a list of users, complete with a coach. A Coach can just be a type of user, feel free to explicitly define if you
    // want.
    
    // Array of players:
    var players: [Player] = []
    
    // Assigned Coach:
    var coach: Player?
    
    // Team Name:
    var teamName: String
    
    //Team image(URL):
    var image: String
    
    // Initialize variables:
    init(players: [Player], coach: Player?, teamName: String, image: String) {
        
        self.players = players
        self.coach = coach
        self.teamName = teamName
        self.image = image
    }
    
    // Function getTeams
    func getTeam() {
        
        
    }
}
