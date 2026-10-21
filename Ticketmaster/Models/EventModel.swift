//
//  EventModel.swift
//  Ticketmaster
//

import Foundation

struct Event: Identifiable, Hashable {
    let id: String
    let name: String
    let category: Category
    let date: String
    let time: String
    let venue: String
    let city: String
    let icon: String
    let description: String
    let ticketsURL: String
    let isFeatured: Bool

    // El enlace ya como URL, así no lo armamos en cada vista
    var ticketsLink: URL? {
        URL(string: ticketsURL)
    }
}
