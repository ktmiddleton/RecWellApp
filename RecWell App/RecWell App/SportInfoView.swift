//
//  SportInfoView.swift
//  RecWell App
//
//  Created by Student on 11/6/23.
//

import SwiftUI


struct SportInfoView: View {
    
    @State var sport: Sport
    
    var body: some View {
        
        VStack{
            Text(sport.sportName)
            HStack{
                Text("League start date: " + sport.startDate).padding()
                Spacer()
                Text("Teams registered: " + sport.teamNum).padding()
                
            }
            HStack{
                Text("Registration Fee: " + String(sport.cost)).padding()
                Spacer()
            }
            Spacer()
        }
    }
}

