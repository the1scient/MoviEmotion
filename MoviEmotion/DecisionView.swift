import SwiftUI

struct DecisionView: View {
    var body: some View {
        NavigationView { // Envolvendo toda a DecisionView em uma NavigationView
            ZStack {
                MenuInfos()
                    .offset(CGSize(width: 170.0, height: -380.0))
                
                VStack {
                    Spacer().frame(height: 25)
                    
                    Text("Recomendações \na partir de:")
                        .font(.system(size: 25))
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.top, 50)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    HStack {
                        NavigationLink(destination: FeelingView()) {
                            VStack {
                                Text("Humor Atual")
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(
                                            LinearGradient(
                                                gradient: Gradient(colors: [Color(red: 204/255, green: 0, blue: 0), Color(red: 102/255, green: 0, blue: 0)]),
                                                startPoint: .top,
                                                endPoint: .bottom
                                            )
                                        )
                                        .frame(width: 150, height: 250)
                                    Image("Feeling").resizable().frame(width: 104, height: 127)
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Spacer()
                            .frame(width: 40)
                        
                        NavigationLink(destination: WantToFeelView()) {
                            VStack {
                                Text("Quero me sentir")
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(
                                            LinearGradient(
                                                gradient: Gradient(colors: [Color(red: 102/255, green: 0, blue: 0), Color(red: 204/255, green: 0, blue: 0)]),
                                                startPoint: .top,
                                                endPoint: .bottom
                                            )
                                        )
                                        .frame(width: 150, height: 250)
                                    Image("WantToFeel").resizable().frame(width: 92, height: 130)
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    DecisionView()
}
