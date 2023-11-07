//
//  HomeView.swift
//  RecWell App
//
//  Created by Student on 11/6/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack
        {
            VStack
            {
                Text("Fitness Classes")
                    .font(.title)
                List
                {
                    ClassCardView()
                }
            }
            VStack
            {
                Text("Sports")
                    .font(.title)
                List
                {
                    SportCardView()
                }
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
