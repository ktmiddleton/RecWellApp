//
//  ContentView.swift
//  RecWell App
//
//  Created by Student on 11/5/23.
//

import SwiftUI
import Firebase

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
                    ProfileView()
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

class User: Decodable, Identifiable
{
    // Cailyn: Insert Superclass Variables and Methods here
    var id = UUID()
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
    var certificationDate: Date? = nil
  
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
    var teamName: String = "team"
    
    //Team image(URL):
    var image: String = "image"
    
    // Function getTeams
    func getTeam() {
        
        
    }
}
