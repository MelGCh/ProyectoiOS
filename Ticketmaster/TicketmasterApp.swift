//
//  TicketmasterApp.swift
//  Ticketmaster
//
//

import SwiftUI

@main
struct TicketmasterApp: App {

    @State var favoritosViewModel = FavoritosViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(favoritosViewModel)
        }
    }
}
