//
//  MenuInfos.swift
//  MoviEmotion
//
//  Created by MARIA MERCEDES DA SILVA RODRIGUES on 30/08/24.
//

import SwiftUI

import SwiftUI

struct MenuInfos: View {
    @State private var selectedDestination: String?

    var body: some View {
        VStack {
            Menu {
                Button(action: {
                    selectedDestination = "Sobre o App"
                }) {
                    Label("Sobre", systemImage: "info.circle")
                }

                Button(action: {
                    selectedDestination = "Termos de Uso"
                }) {
                    Label("Termos de Uso", systemImage: "doc.text")
                }

                Button(action: {
                    selectedDestination = "Política de Privacidade"
                }) {
                    Label("Política de Privacidade", systemImage: "lock.shield")
                }
            } label: {
                Image(systemName: "ellipsis.circle")
                    .resizable()
                    .frame(width: 23, height: 23)
                    .font(.title)
            }
            
            NavigationLink(destination: destinationView, tag: selectedDestination ?? "", selection: $selectedDestination) {
                EmptyView()
            }
        }
    }

    @ViewBuilder
    private var destinationView: some View {
        switch selectedDestination {
        case "Sobre o App":
            AppInfoView()
        case "Termos de Uso":
            TermsMenu()
        case "Política de Privacidade":
            PrivacyMenu()
        default:
            EmptyView()
        }
    }
}

#Preview {
    MenuInfos()
}
