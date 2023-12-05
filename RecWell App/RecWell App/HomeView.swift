import SwiftUI

struct HomeView: View {
    
    @Environment(\.openURL) var openURL
    @ObservedObject var viewModel : ViewModel
    
    var body: some View {
        
        Text("Home Menu")
            .font(.title)
            .foregroundColor(.white)

        ScrollView {
            
            Text("Fitness Classes")
                .font(.title)
                .foregroundColor(.white)
            
            ScrollView {
                
                ForEach(viewModel.classes, id: \.className){
                    classIn in
                        ClassCardView(classVar: classIn)
                }
                .onAppear {
                    
                    viewModel.fetchClass()
                }
                
            }
                    
                Text("Sports")
                    .font(.title)
                    .foregroundColor(.white)
            
            ScrollView {
                
                ForEach(viewModel.sports, id: \.sportName) {

                    sportIn in
                    SportCardView(sport: sportIn)
                }
                .onAppear {
                            
                    viewModel.fetchSport()
                    viewModel.fetchUser()
                }
                //.background(Color(red: 0.369, green: 0.369, blue: 0.369))
            }
            
            ScrollView {
                
                Button("FAC SCHEDULE") {
                    
                    openURL(URL(string: "https://www.loyola.edu/department/recreation-wellness/facilities/hours-of-operation/building-hours")!)
                }                            .bold()
                    .frame(width: 200, height: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color(red: 0.22, green: 0.463, blue: 0.114)))
                    .foregroundColor(.white)
            }
        }
    }
}
