//
//  SampleData.swift
//  Ticketmaster
//

import Foundation

// Eventos de prueba (los mismos de las pantallas). Después se cambiarán por la API.

let sampleEvents: [Event] = [
    Event(
        id: "1",
        name: "Concierto Anual: CDMX",
        category: .music,
        date: "22 Octubre",
        time: "20:00",
        venue: "Foro Sol",
        city: "CDMX",
        icon: "music.mic",
        description: "El concierto del año reúne a los mejores artistas en una sola noche.",
        ticketsURL: "https://www.ticketmaster.com.mx",
        isFeatured: true
    ),
    Event(
        id: "2",
        name: "Festival de Otoño",
        category: .music,
        date: "10 Noviembre",
        time: "17:00",
        venue: "Autódromo",
        city: "CDMX",
        icon: "leaf.fill",
        description: "Un festival al aire libre con música en vivo durante todo el día.",
        ticketsURL: "https://www.ticketmaster.com.mx",
        isFeatured: false
    ),
    Event(
        id: "3",
        name: "Don Omar: El regreso",
        category: .music,
        date: "12 Diciembre",
        time: "20:00",
        venue: "Palacio de los Deportes",
        city: "CDMX",
        icon: "music.note",
        description: "¡Prepárate para vivir la noche más eléctrica! Don Omar, el “Rey del Reggaetón”, regresa para dejar sin aliento con su esperada presentación en vivo: “El Regreso”.",
        ticketsURL: "https://www.ticketmaster.com.mx",
        isFeatured: false
    ),
    Event(
        id: "4",
        name: "Festival de Música",
        category: .music,
        date: "18 Abril",
        time: "19:00",
        venue: "Foro Sol",
        city: "CDMX",
        icon: "music.note",
        description: "Varias bandas en un mismo escenario para disfrutar de una noche de música.",
        ticketsURL: "https://www.ticketmaster.com.mx",
        isFeatured: false
    ),
    Event(
        id: "5",
        name: "Partido de Fútbol",
        category: .sports,
        date: "22 Octubre",
        time: "12:00",
        venue: "Estadio Azteca",
        city: "CDMX",
        icon: "soccerball",
        description: "Un partido de fútbol en el estadio más grande de la ciudad.",
        ticketsURL: "https://www.ticketmaster.com.mx",
        isFeatured: false
    ),
    Event(
        id: "6",
        name: "El Fantasma de la Ópera",
        category: .arts,
        date: "29 Diciembre",
        time: "20:45",
        venue: "Teatro Metropolitan",
        city: "CDMX",
        icon: "theatermasks.fill",
        description: "El musical clásico llega al teatro con una producción llena de música y misterio.",
        ticketsURL: "https://www.ticketmaster.com.mx",
        isFeatured: false
    )
]
