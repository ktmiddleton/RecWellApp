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
            
            HStack{
                
                Text("Instructor: " + classVar.instructor).padding()
                Spacer()
                
                Text("@ " + classVar.startTime).padding()
                Spacer()
                Text("Duration: " + String(classVar.duration) + " *insert comically large unit of time here*").padding()
                
            }
        }
    }
}
