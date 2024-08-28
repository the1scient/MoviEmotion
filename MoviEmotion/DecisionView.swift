import SwiftUI

struct DecisionView: View {
    var body: some View {

        
        NavigationView(content: {
            VStack {
                Text("Recomendações a partir de:")
                    .font(.system(size: 25))
                    .bold()
                
                Spacer()
                    .frame(maxHeight: 100)
                
                HStack {
                    // Navigations para Humor Atual e Quero me Sentir
                    NavigationLink(destination: FeelingView()) {
                        VStack {
                            Text("Humor Atual")
                            AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1619431843897-4676bff0c286?q=80&w=3870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")){
                                image in
                                image.image?.resizable()
                                    .frame(width: 150, height: 250)
                                    .cornerRadius(20)
                                
                            }
                        }
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                        .frame(width: 40)
                    NavigationLink(destination: WantToFeelView()) {
                        
                        
                        VStack {
                            Text("Quero me sentir")
                               
                                
                            AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1619431843897-4676bff0c286?q=80&w=3870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")){
                                image in
                                image.image?.resizable()
                                    .frame(width: 150, height: 250)
                                    .cornerRadius(20)
                                    
                                
                            }
                            
                        }
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                }
            }
        })
        
    }
}

#Preview {
    DecisionView()
}
