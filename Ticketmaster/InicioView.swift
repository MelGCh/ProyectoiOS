//
//  InicioView.swift
//  Ticketmaster
//

import SwiftUI

struct InicioView: View {

    @State var busqueda: String = ""
    @State var categoriaActiva: Categoria = .todo
    @State var todosLosEventos: [Evento] = []
    @State var cargando: Bool = true

    @Environment(FavoritosViewModel.self) var favoritosViewModel

    let servicio = EventosServicio()

    // Pide los eventos al servicio (simula la API)
    func cargarEventos() async {
        do {
            todosLosEventos = try await servicio.obtenerEventos()
        } catch {
            print("No se pudieron cargar los eventos")
        }
        cargando = false
    }

    // Deja solo los eventos de la categoría y la búsqueda
    func filtrarEventos() -> [Evento] {
        var resultado = todosLosEventos

        if categoriaActiva != .todo {
            resultado = resultado.filter { $0.categoria == categoriaActiva }
        }

        if busqueda != "" {
            resultado = resultado.filter { $0.nombre.localizedCaseInsensitiveContains(busqueda) }
        }

        return resultado
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {

                    //Encabezado

                    VStack {
                        HStack {
                            Text("Ticketmaster")
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(.white)
                            Spacer()
                        }

                        HStack {
                            Text("Eventos")
                                .foregroundStyle(.white)
                            Spacer()
                        }

                        HStack {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 20))
                                .foregroundStyle(.black)
                                .padding(.vertical, 12)
                                .padding(.leading, 12)
                            TextField(text: $busqueda) {
                                Text("Buscar eventos")
                            }
                        }
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(.top, 20)
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 40)
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 40))

                    //Categorías

                    HStack {
                        Button {
                            categoriaActiva = .todo
                        } label: {
                            Text("Todo")
                                .foregroundStyle(categoriaActiva == .todo ? Color.white : Color.black)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .background(categoriaActiva == .todo ? Color.black : Color.clear)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }

                        Spacer()

                        Button {
                            categoriaActiva = .musica
                        } label: {
                            Text("Música")
                                .foregroundStyle(categoriaActiva == .musica ? Color.white : Color.black)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .background(categoriaActiva == .musica ? Color.black : Color.clear)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }

                        Spacer()

                        Button {
                            categoriaActiva = .deportes
                        } label: {
                            Text("Deportes")
                                .foregroundStyle(categoriaActiva == .deportes ? Color.white : Color.black)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .background(categoriaActiva == .deportes ? Color.black : Color.clear)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }

                        Spacer()

                        Button {
                            categoriaActiva = .artes
                        } label: {
                            Text("Artes")
                                .foregroundStyle(categoriaActiva == .artes ? Color.white : Color.black)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .background(categoriaActiva == .artes ? Color.black : Color.clear)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)

                    //Contenido

                    if cargando {
                        EsqueletoView()
                    } else {
                        let eventos = filtrarEventos()
                        let destacados = eventos.filter { $0.esDestacado }
                        let recomendados = eventos.filter { !$0.esDestacado }

                        if eventos.isEmpty {
                            Text("No encontramos eventos")
                                .foregroundStyle(.gray)
                                .padding(.top, 40)
                        } else if busqueda != "" {

                            //Resultados de búsqueda

                            ForEach(eventos) { evento in
                                EventoFilaView(
                                    evento: evento,
                                    iconoBoton: favoritosViewModel.esFavorito(evento) ? "heart.fill" : "heart"
                                ) {
                                    favoritosViewModel.alternar(evento)
                                }
                                .padding(.horizontal)
                                .padding(.top, 20)
                            }
                        } else {

                            //Destacados

                            if destacados.count > 0 {
                                HStack {
                                    Text("Destacados")
                                        .font(.system(size: 22))
                                        .bold()
                                    Spacer()
                                }
                                .padding(.horizontal)
                                .padding(.top)

                                ForEach(destacados) { evento in
                                    VStack {
                                        NavigationLink(value: evento) {
                                            VStack {
                                                Image(systemName: evento.icono)
                                                    .font(.system(size: 80))
                                                    .foregroundStyle(.yellow)
                                                    .padding(.vertical, 20)

                                                HStack {
                                                    Text(evento.nombre)
                                                        .bold()
                                                        .foregroundStyle(.white)
                                                    Spacer()
                                                }
                                            }
                                        }

                                        HStack {
                                            ForEach(0..<4) { _ in
                                                Image(systemName: "star.fill")
                                                    .foregroundStyle(.yellow)
                                            }

                                            Spacer()

                                            if let url = URL(string: evento.enlaceEntradas) {
                                                Link(destination: url) {
                                                    Text("Comprar")
                                                        .font(.system(size: 14))
                                                        .bold()
                                                        .foregroundStyle(.black)
                                                        .padding(.horizontal, 20)
                                                        .padding(.vertical, 10)
                                                        .background(.white)
                                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                                }
                                            }
                                        }
                                    }
                                    .padding()
                                    .background(.black)
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                    .padding(.horizontal)
                                }
                            }

                            //Recomendación

                            if recomendados.count > 0 {
                                HStack {
                                    Text("Recomendación")
                                        .font(.system(size: 22))
                                        .bold()
                                    Spacer()
                                }
                                .padding(.horizontal)
                                .padding(.top)

                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(recomendados) { evento in
                                            VStack {
                                                NavigationLink(value: evento) {
                                                    VStack {
                                                        HStack {
                                                            Spacer()
                                                            Image(systemName: evento.icono)
                                                                .font(.system(size: 50))
                                                                .foregroundStyle(.white)
                                                            Spacer()
                                                        }
                                                        .padding(.vertical, 30)
                                                        .background(.gray)
                                                        .clipShape(RoundedRectangle(cornerRadius: 12))

                                                        HStack {
                                                            Text(evento.nombre)
                                                                .bold()
                                                                .lineLimit(1)
                                                            Spacer()
                                                        }

                                                        HStack {
                                                            Text("\(evento.lugar), \(evento.fecha)")
                                                                .font(.system(size: 14))
                                                                .lineLimit(1)
                                                            Spacer()
                                                        }
                                                    }
                                                    .foregroundStyle(.black)
                                                }

                                                HStack {
                                                    Text("\(evento.hora) hrs")
                                                        .font(.system(size: 14))
                                                    Spacer()
                                                    Button {
                                                        favoritosViewModel.alternar(evento)
                                                    } label: {
                                                        Image(systemName: favoritosViewModel.esFavorito(evento) ? "heart.fill" : "heart")
                                                            .font(.system(size: 24))
                                                            .foregroundStyle(.black)
                                                    }
                                                }
                                            }
                                            .padding(10)
                                            .background(.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 20))
                                            .padding(2)
                                            .background(.black)
                                            .clipShape(RoundedRectangle(cornerRadius: 22))
                                            .frame(width: 210)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
            }
            .toolbar(.hidden, for: .navigationBar)
            .navigationDestination(for: Evento.self) { evento in
                DetalleView(evento: evento)
            }
        }
        .onAppear {
            if todosLosEventos.isEmpty {
                Task {
                    await cargarEventos()
                }
            }
        }
    }
}

#Preview {
    InicioView()
        .environment(FavoritosViewModel())
}
