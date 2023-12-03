import SwiftUI
import Firebase

struct LoginView: View {

    @State var email: String = ""
    @State var password: String = ""
    @State private var userIsLoggedIn = false
    @State private var loginStatusMessage = ""
    
    var body: some View {
        if self.userIsLoggedIn == true
        {
            ContentView(viewModel: ViewModel())
                .task
            {
                print(userIsLoggedIn)
            }
        }
        else
        {
            // (red: 0.5, green: 0.2, blue: 0.6)
            NavigationView {
                
                ZStack {
                    
                    // BOTTOM COLOR - darker gray
                    Color(red: 0.369, green: 0.369, blue: 0.369)
                    
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                    
                    // TOP COLOR - lighter gray
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
                        TextField("Username", text: $email)
                            .foregroundColor(.white)
                            .textFieldStyle(.plain)
                            .placeholder(when: email.isEmpty) {
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
                            login()
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
            }
//            .onAppear
//            {
//                Auth.auth().addStateDidChangeListener {auth, user in
//                    if user != nil {
//                        print(user!.email!)
//                        userIsLoggedIn.toggle()
//                    }
//                }
//            }
            .ignoresSafeArea()
        }
    }
//    func handleAction()
//    {
//        if self.userIsLoggedIn
//        {
//            login()
//        }
//        else
//        {
//            register()
//        }
//    }
    
    func signOut()
    {
        do
        {
            try FirebaseManager.shared.auth.signOut()
            print("Logout successful!")
            self.userIsLoggedIn = false
        }
        catch
        {
            print("Logout Unsuccessful!")
        }
    }
    
    func login()
    {
        FirebaseManager.shared.auth.signIn(withEmail:email, password: password) {
            result, err in
            if let err = err
            {
                print("Failed to login user:\(err)")
                return
            }
            
            print("Successfully logged in as user: \(result?.user.uid ?? "")")
            
            self.loginStatusMessage = "Successfully logged in as user: \(result?.user.uid ?? "")"
            
            self.userIsLoggedIn = true
        }
    }
    
    func register()
    {
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password)
        {
            result, err in
            if let err = err
            {
                print("Failed to create user:", err)
                self.loginStatusMessage = "Failed to create user:\(err)"
                return
            }
            print("Successfully created user: \(result?.user.uid ?? "")")
            self.loginStatusMessage = "Successfully created user: \(result?.user.uid ?? "")"
        }
    }
//    func login()
//    {
//        Auth.auth().signIn(withEmail: email, password: password) {result, error in
//            if error != nil {
//                print(error!.localizedDescription)
//            }
//        }
//    }
//
//    func register()
//    {
//        Auth.auth().createUser(withEmail: email, password: password) {result, error in
//            if error != nil
//            {
//                print(error!.localizedDescription)
//            }
//        }
//    }
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

class FirebaseManager : NSObject
{
    let auth: Auth
    static let shared = FirebaseManager()
    
    override init()
    {
        self.auth = Auth.auth()
        super.init()
    }
}

/*
    .navigationBarItems(trailing: HStack {
        
        NavigationLink(destination: viewTasks(taskList: $taskList)) {
            
            Text("View Tasks").padding()
        }
*/
