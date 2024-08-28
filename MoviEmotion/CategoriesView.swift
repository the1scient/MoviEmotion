import SwiftUI

struct CategoriesView: View {
    
    @StateObject private var viewModel = CategoriesViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.categories, id: \.name) { categorie in
                
                if categorie.name != "Cinema TV" {
                    Text(categorie.name)
                }

            }
            .onAppear {
                viewModel.fetchCategories()
            }
        }
    }
}

#Preview {
    CategoriesView()
}
