//
//  SportInfoView.swift
//  RecWell App
//
//  Created by Student on 11/6/23.
//

import SwiftUI


struct SportInfoView: View {
    
    @State var sport: Sport
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        
        VStack{
            
            Text(sport.sportName)
                .bold()
                .font(.title3)
            
            HStack{
                
                Text("League start date: " + sport.startDate)
                    .padding()
                
                Spacer()
                
                Text("Teams registered: " + sport.teamNum)
                    .padding()



                Text("Registration Fee: " + String(sport.cost))
                    .padding()
                
                Spacer()
            }
        
            Color(red: 0.369, green: 0.369, blue: 0.369)
            
            Button (action: {
    
                //viewModel.user.classes.append(classVar)
                dismiss()
                
            }) {
                Text("Register")
                    .bold()
                    .frame(width: 200, height: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color(red: 0.22, green: 0.463, blue: 0.114)))
                    .foregroundColor(.white)
            }
            //.disabled(viewModel.user.classes.contains{$0.className == classVar.className})
        }
        .background(Color(red: 0.369, green: 0.369, blue: 0.369))
        .foregroundColor(.white)    }
}

