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
                    ClassView(viewModel: viewModel)
                case .profile:
                    ProfileView()
                default:
                    HomeView(viewModel: viewModel)
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
    
    @Published var users: [User] = []
    
    @Published var sports: [Sport] = []
    
    @Published var classes: [`class`] = []
    
    enum navigationChoices: String
    {
        case home = "home"
        case sports = "sports"
        case profile = "profile"
        case `class` = "class"
    }
    
    func getUserInfo(){
        guard let url = URL(string: "https://6549834ce182221f8d51a208.mockapi.io/users") else {return}
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {return}
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([User].self, from: data)
                    self.users = decodedData
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            } else if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
            }
        } .resume()
    }
    func getGameInfo(){
        guard let url = URL(string: "https://6549945ae182221f8d51acb1.mockapi.io/game") else {return}
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {return}
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([Sport].self, from: data)
                    self.sports = decodedData
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            } else if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
            }
        } .resume()
        
    }
    
    func getClassInfo(){
        guard let url = URL(string: "https://654998ece182221f8d51af8d.mockapi.io/classes") else {return}
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {return}
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([`class`].self, from: data)
                    self.classes = decodedData
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            } else if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
            }
        } .resume()
    }
    
}

class User: Decodable
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
