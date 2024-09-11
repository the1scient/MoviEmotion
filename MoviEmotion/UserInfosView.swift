import SwiftUI

struct UserInfosView: View {
    @Binding var isFirstLaunch: Bool
    @State private var name: String = ""
    @State private var dateOfBirth = Date()
    @Environment(\.colorScheme) var colorScheme
    
    private var maxData: Date {
        Calendar.current.date(byAdding: .year, value: -6, to: Date())!
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        return formatter
    }()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Spacer()
                
                Text("Perfil")
                    .font(.system(size: 25))
                    .bold()
                
                Spacer()
                
                Text("Como você gostaria de ser chamado:")
                    .font(.system(size: 18))
                
                Spacer()
                    .frame(height: 20)
                
                TextField("", text: $name, prompt:
                            Text("Digite um nome").foregroundColor(.gray)
                )
                    .frame(width: .infinity, height: 40)
                    .multilineTextAlignment(.center)
                    .overlay (
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray)
                    )
                    
                
                Spacer()
                    .frame(height: 40)
                
                Text("Data de Nascimento:")
                    .font(.system(size: 18))
                DatePicker("Date", selection: $dateOfBirth, in: ...maxData, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .frame(width: .infinity, height: 330, alignment: .center)
                
                Spacer()
                    .frame(height: 30)
                
                NavigationLink(destination: DecisionView()) {
                    
                    
                    Button(action: {
                        if !name.isEmpty {
                            UserDefaults.standard.set(name, forKey: "UserName")
                            let age = calculateAge(from: dateOfBirth)
                            UserDefaults.standard.set(age, forKey: "UserAge") // Salva a idade no UserDefaults
                            isFirstLaunch = false
                        }
                        
                    }) {
                        Text("Concluir")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .foregroundColor(.white)
                            .background(.gray)
                            .cornerRadius(20)

                    }
                    
                }
                
         
               
                
                
            }
            .padding(20)
        }
    }
    

    private func calculateAge(from birthDate: Date) -> Int {
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthDate, to: Date())
        return ageComponents.year ?? 0
    }
}

#Preview {
    UserInfosView(isFirstLaunch: .constant(true))
}
