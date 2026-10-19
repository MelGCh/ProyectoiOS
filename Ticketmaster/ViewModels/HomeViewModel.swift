//
//  HomeViewModel.swift
//  Ticketmaster
//

import SwiftUI

// Aquí vive el estado y la lógica de la pantalla de Inicio.
// La vista solo dibuja y le avisa cuando el usuario escribe o toca algo.
@Observable
final class HomeViewModel {

    private let service = EventsService()

    private(set) var allEvents: [Event] = []
    private(set) var isLoading: Bool = true
    private(set) var activeCategory: Category = .all

    var searchText: String = ""

    // Los eventos de la categoría y la búsqueda
    var filteredEvents: [Event] {
        var result = allEvents

        if activeCategory != .all {
            result = result.filter { $0.category == activeCategory }
        }

        if isSearching {
            result = result.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }

        return result
    }

    var featuredEvents: [Event] {
        filteredEvents.filter { $0.isFeatured }
    }

    var recommendedEvents: [Event] {
        filteredEvents.filter { !$0.isFeatured }
    }

    var isSearching: Bool {
        searchText != ""
    }

    // Pide los eventos al servicio (simula la API)
    func loadEvents() async {
        if !allEvents.isEmpty {
            return
        }

        do {
            allEvents = try await service.fetchEvents()
        } catch {
            print("No se pudieron cargar los eventos")
        }
        isLoading = false
    }

    func categoryTapped(_ category: Category) {
        activeCategory = category
    }
}
