//
//  ContentView.swift
//  Ticketmaster
//
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            InicioView()
                .tabItem {
                    Label("Inicio", systemImage: "house")
                }

            FavoritosView()
                .tabItem {
                    Label("Favoritos", systemImage: "heart")
                }
        }
        .tint(.black)
    }
}

#Preview {
    ContentView()
        .environment(FavoritosViewModel())
}
