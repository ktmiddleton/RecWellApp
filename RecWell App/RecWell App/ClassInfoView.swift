//
//  ClassInfroView.swift
//  RecWell App
//
//  Created by Student on 11/6/23.
//

import SwiftUI

struct ClassInfoView: View{
    
    @State var classVar: `class`
    
    var body: some View{
        
        //Color(red: 0.369, green: 0.369, blue: 0.369)
        
        VStack{
            
            //Color(red: 0.369, green: 0.369, blue: 0.369)
            
            Text(classVar.className)
                .bold()
                .font(.title3)
            
            HStack{
                
                Text("Instructor: " + classVar.instructor)
                    .padding()
                
                Spacer() 
                
                Text("@ " + classVar.startTime)
                    .padding()
                
                Spacer()
                
                Text("Duration: " + String(classVar.duration) + " minutes")
                    .padding()
            }
            
            Button (action: {
                
                // Register for Class:
                
                
            }) {
                Text("Register")
                    .bold()
                    .frame(width: 200, height: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color(red: 0.22, green: 0.463, blue: 0.114)))
                    .foregroundColor(.white)
            }
            
            // Insert List of Participants:
            
            
        }
    }
}
