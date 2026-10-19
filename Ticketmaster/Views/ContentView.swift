//
//  ContentView.swift
//  Ticketmaster
//
//

import SwiftUI

struct ContentView: View {

    let homeViewModel: HomeViewModel

    var body: some View {
        TabView {
            HomeView(viewModel: homeViewModel)
                .tabItem {
                    Label("Inicio", systemImage: "house")
                }

            FavoritesView()
                .tabItem {
                    Label("Favoritos", systemImage: "heart")
                }
        }
        .tint(.black)
    }
}

#Preview {
    ContentView(homeViewModel: HomeViewModel())
        .environment(FavoritesViewModel())
}
