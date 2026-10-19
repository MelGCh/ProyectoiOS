//
//  FavoritesViewModel.swift
//  Ticketmaster
//

import SwiftUI

// Aquí vive la lista de favoritos. Todas las pantallas usan esta misma lista.
@Observable
final class FavoritesViewModel {

    private(set) var favorites: [Event] = []

    func isFavorite(_ event: Event) -> Bool {
        favorites.contains(event)
    }

    func toggle(_ event: Event) {
        if isFavorite(event) {
            remove(event)
        } else {
            favorites.append(event)
        }
    }

    func remove(_ event: Event) {
        favorites.removeAll { $0.id == event.id }
    }

    // Deja solo los favoritos que coinciden con la búsqueda
    func filterFavorites(searchText: String) -> [Event] {
        if searchText == "" {
            return favorites
        }
        return favorites.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
}
