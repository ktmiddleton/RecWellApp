//
//  SportsView.swift
//  RecWell App
//
//  Created by Student on 11/6/23.
//

import SwiftUI

struct SportsView: View {
    @ObservedObject var viewModel : ViewModel
    
    var body: some View {
        
        Text("Sports")
            .font(.title)
            .foregroundColor(.white)
        
        NavigationView() {
            
            List {
                
                ForEach(viewModel.sports){ sport in
                    NavigationLink(sport.sportName){
                        SportInfoView(sport: sport, viewModel: viewModel)
                    }
                }
            }
        }
    }
}

//struct SportsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SportsView()
//    }
//}
