//
//  HomeView.swift
//  RecWell App
//
//  Created by Student on 11/6/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel : ViewModel
    var body: some View {
        VStack
        {
            VStack
            {
                Text("Fitness Classes")
                    .font(.title)
                List(viewModel.classes, id: \.className)
                { classIn in
                            ClassCardView(classVar: classIn)
                }
                .onAppear{
                    viewModel.getClassInfo()
                }
            }
            VStack
            {
                Text("Sports")
                    .font(.title)
                List(viewModel.sports, id: \.sportName)
                { sportIn in
                            SportCardView(sport: sportIn)
                }
                .onAppear{
                    viewModel.getGameInfo()
                }
            }
        }
        
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
