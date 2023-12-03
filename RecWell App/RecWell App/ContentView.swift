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

class ViewModel: ObservableObject
{
    @Published var navChoice = navigationChoices.home
    
    @Published var users: [User] = []
    
    @Published var sports: [Sport] = []
    
    @Published var classes: [`class`] = []
    
    @State private var email = ""
    @State private var password = ""
    
    enum navigationChoices: String
    {
        case home = "home"
        case sports = "sports"
        case profile = "profile"
        case `class` = "class"
    }
    
//    func getUserInfo(){
//        guard let url = URL(string: "https://6549834ce182221f8d51a208.mockapi.io/users") else {return}
//        URLSession.shared.dataTask(with: url) {data, response, error in
//            guard let httpResponse = response as? HTTPURLResponse,
//                  (200...299).contains(httpResponse.statusCode) else {return}
//            if let data = data {
//                do {
//                    let decodedData = try JSONDecoder().decode([User].self, from: data)
//                    self.users = decodedData
//                } catch {
//                    print("Error decoding JSON in user info: \(error.localizedDescription)")
//                }
//            } else if let error = error {
//                print("Error fetching data: \(error.localizedDescription)")
//            }
//        } .resume()
//    }
//    func getGameInfo(){
//        guard let url = URL(string: "https://6549945ae182221f8d51acb1.mockapi.io/game") else {return}
//        URLSession.shared.dataTask(with: url) {data, response, error in
//            guard let httpResponse = response as? HTTPURLResponse,
//                  (200...299).contains(httpResponse.statusCode) else {return}
//            if let data = data {
//                do {
//                    let decodedData = try JSONDecoder().decode([Sport].self, from: data)
//                    self.sports = decodedData
//                } catch {
//                    print("Error decoding JSON in game info: \(error.localizedDescription)")
//                }
//            } else if let error = error {
//                print("Error fetching data: \(error.localizedDescription)")
//            }
//        } .resume()
//
//    }
//
//    func getClassInfo(){
//        guard let url = URL(string: "https://654998ece182221f8d51af8d.mockapi.io/classes") else {return}
//        URLSession.shared.dataTask(with: url) {data, response, error in
//            guard let httpResponse = response as? HTTPURLResponse,
//                  (200...299).contains(httpResponse.statusCode) else {return}
//            if let data = data {
//                do {
//                    let decodedData = try JSONDecoder().decode([`class`].self, from: data)
//                    self.classes = decodedData
//                } catch {
//                    print("Error decoding JSON in class info: \(error.localizedDescription)")
//                }
//            } else if let error = error {
//                print("Error fetching data: \(error.localizedDescription)")
//            }
//        } .resume()
//    }
    func fetchSport()
    {
        self.sports.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("sport")
        ref.getDocuments
        {
            snapshot, error in
            guard error == nil else
            {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot
            {
                for document in snapshot.documents
                {
                    let data = document.data()
                    
                    let cost = data["cost"] as? Int ?? 0
                    let sportName = data["sportName"] as? String ?? ""
                    let startDate = data["startDate"] as? String ?? ""
                    let teamNum = data["teamNum"] as? String ?? ""
                    
                    let sportObj = Sport(startDate:startDate, cost:cost, teamNum:teamNum, sportName:sportName)
                    
                    self.sports.append(sportObj)
                }
            }
            
        }
    }
    
    func fetchClass()
    {
        self.classes.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("class")
        ref.getDocuments
        {
            snapshot, error in
            guard error == nil else
            {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot
            {
                for document in snapshot.documents
                {
                    let data = document.data()
                    
                    let className = data["className"] as? String ?? ""
                    let duration = data["duration"] as? Int ?? 0
                    let instructor = data["instructor"] as? String ?? ""
                    let startTime = data["startTime"] as? String ?? ""
                    
                    let classObj = `class`(instructor: instructor, duration: duration, startTime: startTime, className: className)
                    
                    self.classes.append(classObj)
                }
            }
            
        }
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
