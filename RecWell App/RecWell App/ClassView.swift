//
//  ClassView.swift
//  RecWell App
//
//  Created by Student on 11/6/23.
//

import SwiftUI

struct ClassView: View {
    @ObservedObject var viewModel : ViewModel
    
    var body: some View {
        Text("Class!")
        NavigationView(){
            List{
                ForEach(viewModel.classes){ `class` in
                    NavigationLink(`class`.className){
                        ClassInfoView(classVar: `class`)
                    }
                        
                    }
                }
                
            }
        }
    }

//struct ClassView_Previews: PreviewProvider {
//    static var previews: some View {
//        ClassView(viewModel: ViewModel)
//    }
//}
