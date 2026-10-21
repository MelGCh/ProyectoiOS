//
//  TicketmasterApp.swift
//  Ticketmaster
//
//

import SwiftUI

@main
struct TicketmasterApp: App {

    @State var favoritesViewModel = FavoritesViewModel()

    let homeViewModel = HomeViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView(homeViewModel: homeViewModel)
                .environment(favoritesViewModel)
        }
    }
}
