//
//  EventsService.swift
//  Ticketmaster
//

import Foundation

struct EventsService {

    // Simula la llamada a la API: espera 2 segundos y regresa los eventos de ejemplo
    func fetchEvents() async throws -> [Event] {
        try await Task.sleep(for: .seconds(2))
        return sampleEvents
    }
}
