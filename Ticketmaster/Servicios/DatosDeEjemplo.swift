//
//  DatosDeEjemplo.swift
//  Ticketmaster
//

import Foundation

// Eventos de prueba (los mismos de las pantallas). Después se cambian por la API.

let eventosDeEjemplo: [Evento] = [
    Evento(
        id: "1",
        nombre: "Concierto Anual: CDMX",
        categoria: .musica,
        fecha: "22 Octubre",
        hora: "20:00",
        lugar: "Foro Sol",
        ciudad: "CDMX",
        icono: "music.mic",
        descripcion: "El concierto del año reúne a los mejores artistas en una sola noche.",
        enlaceEntradas: "https://www.ticketmaster.com.mx",
        esDestacado: true
    ),
    Evento(
        id: "2",
        nombre: "Festival de Otoño",
        categoria: .musica,
        fecha: "10 Noviembre",
        hora: "17:00",
        lugar: "Autódromo",
        ciudad: "CDMX",
        icono: "leaf.fill",
        descripcion: "Un festival al aire libre con música en vivo durante todo el día.",
        enlaceEntradas: "https://www.ticketmaster.com.mx",
        esDestacado: false
    ),
    Evento(
        id: "3",
        nombre: "Don Omar: El regreso",
        categoria: .musica,
        fecha: "12 Diciembre",
        hora: "20:00",
        lugar: "Palacio de los Deportes",
        ciudad: "CDMX",
        icono: "music.note",
        descripcion: "¡Prepárate para vivir la noche más eléctrica! Don Omar, el “Rey del Reggaetón”, regresa para dejar sin aliento con su esperada presentación en vivo: “El Regreso”.",
        enlaceEntradas: "https://www.ticketmaster.com.mx",
        esDestacado: false
    ),
    Evento(
        id: "4",
        nombre: "Festival de Música",
        categoria: .musica,
        fecha: "18 Abril",
        hora: "19:00",
        lugar: "Foro Sol",
        ciudad: "CDMX",
        icono: "music.note",
        descripcion: "Varias bandas en un mismo escenario para disfrutar de una noche de música.",
        enlaceEntradas: "https://www.ticketmaster.com.mx",
        esDestacado: false
    ),
    Evento(
        id: "5",
        nombre: "Partido de Fútbol",
        categoria: .deportes,
        fecha: "22 Octubre",
        hora: "12:00",
        lugar: "Estadio Azteca",
        ciudad: "CDMX",
        icono: "soccerball",
        descripcion: "Un partido de fútbol en el estadio más grande de la ciudad.",
        enlaceEntradas: "https://www.ticketmaster.com.mx",
        esDestacado: false
    ),
    Evento(
        id: "6",
        nombre: "El Fantasma de la Ópera",
        categoria: .artes,
        fecha: "29 Diciembre",
        hora: "20:45",
        lugar: "Teatro Metropolitan",
        ciudad: "CDMX",
        icono: "theatermasks.fill",
        descripcion: "El musical clásico llega al teatro con una producción llena de música y misterio.",
        enlaceEntradas: "https://www.ticketmaster.com.mx",
        esDestacado: false
    )
]
