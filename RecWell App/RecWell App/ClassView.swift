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
        
        Text("Classes")
            .font(.title)
            .foregroundColor(.white)

        NavigationView() {
            
            VStack {
            
                List {
                    
                    ForEach(viewModel.classes) { classexample in
                        NavigationLink(classexample.className) {
                            ClassInfoView(classVar: classexample, viewModel: viewModel)
                                .onDisappear
                            {
                                viewModel.saveUser()
                            }
                        }
                    }
                }
            }
        }
    }
}
