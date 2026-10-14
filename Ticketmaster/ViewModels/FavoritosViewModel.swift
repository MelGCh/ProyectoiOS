//
//  FavoritosViewModel.swift
//  Ticketmaster
//

import SwiftUI

// Aquí vive la lista de favoritos. Todas las pantallas usan esta misma lista.
@Observable
class FavoritosViewModel {

    var favoritos: [Evento] = []

    func esFavorito(_ evento: Evento) -> Bool {
        favoritos.contains(evento)
    }

    func alternar(_ evento: Evento) {
        if esFavorito(evento) {
            quitar(evento)
        } else {
            favoritos.append(evento)
        }
    }

    func quitar(_ evento: Evento) {
        favoritos.removeAll { $0.id == evento.id }
    }
}
