//
//  Evento.swift
//  Ticketmaster
//

import Foundation

enum Categoria: String {
    case todo = "Todo"
    case musica = "Música"
    case deportes = "Deportes"
    case artes = "Artes"
}

struct Evento: Identifiable, Hashable {
    let id: String
    let nombre: String
    let categoria: Categoria
    let fecha: String
    let hora: String
    let lugar: String
    let ciudad: String
    let icono: String
    let descripcion: String
    let enlaceEntradas: String
    let esDestacado: Bool
}
