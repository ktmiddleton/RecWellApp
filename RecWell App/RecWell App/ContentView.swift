//
//  ContentView.swift
//  RecWell App
//
//  Created by Student on 11/5/23.
//

import SwiftUI

// Kobe working here -- HStack Navigation Bar + Page Selector Code
struct ContentView: View {
//    ViewModel test = ViewModel()
//    
//    var body: some View {
//        switch test.navChoice
//        {
//        case .sports:
//                SportsView()
//            case .`class`:
//                ClassView()
//            case .profile:
//                ProfileView()
//            default:
//                HomeView()
//        }
//    }
}

// Kobe working here -- HomePage Code
struct HomeView: View {
    var body: some View {
        Text("Placeholder!")
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Placeholder!")
    }
}

struct ClassView: View {
    var body: some View {
        Text("Placeholder!")
    }
}

struct SportsView: View {
    var body: some View {
        Text("Placeholder!")
    }
}

// Preview code
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class ViewModel
{
    let navChoice = navigationChoices.home
    
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
