import SwiftUI
import Firebase

struct LoginView: View
{
    
    @ObservedObject var viewModel : ViewModel
    
    var body: some View
    {
        if viewModel.userIsLoggedIn == true
        {
            ContentView(viewModel: viewModel)
        }
        else
        {
            LoginScreenView(viewModel: viewModel)
        }
    }
}

class ViewModel: ObservableObject
    {
    @Published var navChoice = navigationChoices.home
    
    @Published var user: User = User(name: "", studentID: 1750832, year: "")
    
    @Published var sports: [Sport] = []
    
    @Published var classes: [`class`] = []
    
    @Published var email: String = ""
    
    @Published var password: String = ""
    
    @Published var userIsLoggedIn = false
    
    @Published var loginStatusMessage = ""
    
    private let db = Firestore.firestore()
    
    enum navigationChoices: String
    {
        case home = "home"
        case sports = "sports"
        case profile = "profile"
        case `class` = "class"
    }
    
    func updateUser()
    {
        db.collection("users").document(String(self.user.studentID)).setData([
            "classYear": self.user.year,
            "name": self.user.name,
            "studentID": self.user.studentID
    ]) { err in
        if let err = err {
          print("Error writing document: \(err)")
        } else {
          print("Document successfully written!")
        }
      }
        
    }
    
    func pullUser()
    {
        let docRef = db.collection("user").document(String(self.user.studentID))
        docRef.getDocument
        {
            (document, error) in
            if let document = document, document.exists
            {
                let dataDescription = document.data()
                self.user.name = dataDescription?["name"] as! String
                self.user.studentID = dataDescription?["studentID"] as! Int
                self.user.year = dataDescription?["classYear"] as! String
            }
            else
            {
                print("Document does not exist")
            }
        }
    }
    
    func fetchSport()
    {
        self.sports.removeAll()
        let ref = db.collection("sport")
        ref.getDocuments
        {
            snapshot, error in
            guard error == nil else
            {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot
            {
                for document in snapshot.documents
                {
                    let data = document.data()
                    
                    let cost = data["cost"] as? Int ?? 0
                    let sportName = data["sportName"] as? String ?? ""
                    let startDate = data["startDate"] as? String ?? ""
                    let teamNum = data["teamNum"] as? String ?? ""
                    
                    let sportObj = Sport(startDate:startDate, cost:cost, teamNum:teamNum, sportName:sportName)
                    
                    self.sports.append(sportObj)
                }
            }
            
        }
    }
    
    func fetchClass()
    {
        self.classes.removeAll()
        let ref = db.collection("class")
        ref.getDocuments
        {
            snapshot, error in
            guard error == nil else
            {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot
            {
                for document in snapshot.documents
                {
                    let data = document.data()
                    
                    let className = data["className"] as? String ?? ""
                    let duration = data["duration"] as? Int ?? 0
                    let instructor = data["instructor"] as? String ?? ""
                    let startTime = data["startTime"] as? String ?? ""
                    
                    let classObj = `class`(instructor: instructor, duration: duration, startTime: startTime, className: className)
                    
                    self.classes.append(classObj)
                }
            }
            
        }
    }
    
//    func fetchUser()
//    {
//        self.users.removeAll()
//        let db = Firestore.firestore()
//        let ref = db.collection("user")
//        ref.getDocuments{
//            snapshot, error in
//            guard error == nil else{
//                print(error!.localizedDescription)
//                return
//            }
//            if let snapshot = snapshot
//            {
//                for document in snapshot.documents
//                {
//                    let data = document.data()
//                    let classYear = data["classYear"] as? Int ?? 0
//                    let name = data["name"] as? String ?? ""
//                    let studentID = data["studentID"] as? Int ?? 0
//
//                    let userObj = `User`(name: name, studentID: studentID, year: classYear)
//
//                    self.users.append(userObj)
//                }
//            }
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
