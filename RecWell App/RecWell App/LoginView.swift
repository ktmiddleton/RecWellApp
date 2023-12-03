import SwiftUI

struct LoginView: View {

    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        // (red: 0.5, green: 0.2, blue: 0.6)
        NavigationView {
            
            ZStack {
                
                // BOTTOM COLOR
                Color(red: 0.369, green: 0.369, blue: 0.369)
                
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                
                // TOP COLOR
                    .fill(Color(red: 0.42, green: 0.42, blue: 0.42))
                    .frame(width: 1000, height: 400)
                    .rotationEffect(.degrees(135))
                    .offset(y: -350)
                
                VStack {
                    
                    // Logo / welcome greeting
                    Text("Welcome to RecWell")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .bold()
                    
                    // Textfield for username
                    TextField("Username", text: $username)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: username.isEmpty) {
                            Text("Username")
                                .foregroundColor(.white)
                                .bold()
                        }
                    
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.white)
                    
                    // Textfield for password
                    SecureField("Password", text: $password)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: password.isEmpty) {
                            Text("Password")
                                .foregroundColor(.white)
                                .bold()
                        }
                    
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.white)
                    
                    // Login button
                    Button {
                        
                        // ACTION HERE
                        //NavigationLink(destination: ContentView(viewModel: ViewModel())) {}
                        
                    } label: {
                        Text("Login")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(Color(red: 0.22, green: 0.463, blue: 0.114)))
                            .foregroundColor(.white)
                    }
                    
                    // Sign Up button
                    Text("Dont have an acccount?")
                        .foregroundColor(.white)
                        .bold()
                    
                    Button {
                        
                        // ACTION HERE
                        
                    } label: {
                        Text("Sign up")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(Color(red: 0.22, green: 0.463, blue: 0.114)))
                            .foregroundColor(.white)
                    }
                }
                .frame(width: 350)
            }
            .ignoresSafeArea()
        }
    }
}

extension View {
    
    func placeholder<Content: View> (
        
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
        ZStack(alignment: alignment) {
                
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

/*
    .navigationBarItems(trailing: HStack {
        
        NavigationLink(destination: viewTasks(taskList: $taskList)) {
            
            Text("View Tasks").padding()
        }
*/
