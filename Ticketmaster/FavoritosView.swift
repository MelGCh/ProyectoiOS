//
//  FavoritosView.swift
//  Ticketmaster
//

import SwiftUI

struct FavoritosView: View {

    @State var busqueda: String = ""

    @Environment(FavoritosViewModel.self) var favoritosViewModel

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

                    // Subtítulos

                    HStack {
                        Text("Mis Eventos")
                            .foregroundStyle(.black)

                        Spacer()

                        Text("Favoritos")
                            .bold()
                            .foregroundStyle(.purple)
                    }
                    .padding(.horizontal, 35)
                    .padding(.top)

                    //Lista de favoritos

                    if favoritosViewModel.favoritos.count == 0 {
                        Text("Aún no tienes eventos favoritos")
                            .foregroundStyle(.gray)
                            .padding(.top, 60)
                    } else {
                        ForEach(favoritosViewModel.favoritos.filter { busqueda == "" || $0.nombre.localizedCaseInsensitiveContains(busqueda) }) { evento in
                            EventoFilaView(evento: evento, iconoBoton: "minus.circle") {
                                favoritosViewModel.quitar(evento)
                            }
                            .padding(.horizontal)
                            .padding(.top, 20)
                        }
                    }
                }
            }
            .toolbar(.hidden, for: .navigationBar)
            .navigationDestination(for: Evento.self) { evento in
                DetalleView(evento: evento)
            }
        }
    }
}

#Preview {
    FavoritosView()
        .environment(FavoritosViewModel())
}
