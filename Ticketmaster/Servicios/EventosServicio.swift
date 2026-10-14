//
//  EventosServicio.swift
//  Ticketmaster
//

import Foundation

struct EventosServicio {

    // Simula la llamada a la API: espera 2 segundos y regresa los eventos de ejemplo
    func obtenerEventos() async throws -> [Evento] {
        try await Task.sleep(for: .seconds(2))
        return eventosDeEjemplo
    }
}
