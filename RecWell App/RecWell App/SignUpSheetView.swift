//
//  SignUpSheetView.swift
//  RecWell App
//
//  Created by Student on 12/5/23.
//

import SwiftUI

struct SignUpSheetView: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack{
            TextField("Name", text: $viewModel.user.name)
                .disableAutocorrection(true)
            TextField("Student ID", text: $viewModel.user.studentID)
                .disableAutocorrection(true)
            TextField("Class Year", text: $viewModel.user.year)
                .disableAutocorrection(true)
            TextField("Email", text: $viewModel.email)
                .disableAutocorrection(true)
            TextField("Password", text: $viewModel.password)
                .disableAutocorrection(true)
        }
        .textFieldStyle(.roundedBorder)
        
        Button("Create Account"){
            viewModel.signOut()
            viewModel.register()
            dismiss()
        }
        .disabled(viewModel.email.count < 1 || viewModel.password.count < 6)
    }
}

//struct SignUpSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpSheetView()
//    }
//}
