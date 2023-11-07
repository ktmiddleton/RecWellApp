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
        Text("Sports!")
        NavigationView(){
            List{
                ForEach(viewModel.sports){ sport in
                    NavigationLink(sport.sportName){
                        SportInfoView(sport: sport)
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
