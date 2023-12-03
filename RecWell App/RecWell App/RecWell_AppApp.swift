//
//  RecWell_AppApp.swift
//  RecWell App
//
//  Created by Student on 11/5/23.
//

import SwiftUI
import Firebase

@main
struct RecWell_AppApp: App {
    
    init()
    {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            //ContentView(viewModel: ViewModel())
            LoginView()
        }
    }
}
