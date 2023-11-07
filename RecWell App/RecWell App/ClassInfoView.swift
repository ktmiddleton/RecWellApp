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
        
        VStack{
            Text(classVar.className)
            HStack{
                Text("Instructor: " + classVar.instructor).padding()
                Spacer()
                
                
            }
            HStack{
                Text("@ " + classVar.startTime).padding()
                Spacer()
                Text("Duration: " + String(classVar.duration) + " *insert comically large unit of time here*").padding()
                
            }
            Spacer()
        }
        
    }
}
