import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel : ViewModel
    
    var body: some View {

        VStack {
                
            VStack {
                    
                Text("Fitness Classes")
                    .font(.title)
                    .foregroundColor(.white)
                    
                List(viewModel.classes, id: \.className) {
                        
                    classIn in
                    ClassCardView(classVar: classIn)
                }
                .onAppear {
                    viewModel.fetchClass()
                }
            }
                
            VStack {
                    
                Text("Sports")
                    .font(.title)
                    .foregroundColor(.white)
                    
                List(viewModel.sports, id: \.sportName) {
                        
                    sportIn in
                    SportCardView(sport: sportIn)
                }
                .onAppear {
                        
                    viewModel.fetchSport()
                    viewModel.fetchUser()
                }
            }
        }
        .background(Color(red: 0.369, green: 0.369, blue: 0.369))
    }
}

/* Cailyn's Code
import SwiftUI

struct HomeView: View {

    @ObservedObject var viewModel : ViewModel

    var body: some View {

        ScrollView {

                Text("Home")
                    .font(.title)

                Text("Fitness Classes")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .font(.headline)

            ScrollView{

                ForEach(viewModel.classes, id: \.className){
                    classIn in
                        ClassCardView(classVar: classIn)
                }

                .onAppear{
                    viewModel.fetchClass()
                }
            }

            .onAppear{
                
                viewModel.getClassInfo() // ERRORS
            }

            Text("Sports")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .font(.headline)

            ScrollView{
                
                ForEach(viewModel.sports, id: \.sportName) {

                    sportIn in
                    SportCardView(sport: sportIn)
                }
            }
            .onAppear {

                viewModel.fetchSport()
                viewModel.getGameInfo() // ERROS
            }
        }
    }
}
*/
