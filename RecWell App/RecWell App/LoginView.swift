import SwiftUI

struct LoginView: View {
    
    //@ObservedObject var viewModel : ViewModel
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        // (red: 0.5, green: 0.2, blue: 0.6)
        
        ZStack {
            
            Color(red: 0.369, green: 0.369, blue: 0.369)
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.gray, .gray], startPoint:
                        .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
            
            VStack {
                
                // Logo / welcome greeting
                //Image("RecWell Logo 2").frame(width: 2, height: 2)
                Text("Welcome to RecWell")
                    

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
                
                // Sign up button
                
            }
            .frame(width: 350)
        }
        .ignoresSafeArea()
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

