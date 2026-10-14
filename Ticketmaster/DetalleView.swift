//
//  DetalleView.swift
//  Ticketmaster
//

import SwiftUI

struct DetalleView: View {

    let evento: Evento

    @Environment(FavoritosViewModel.self) var favoritosViewModel

    var body: some View {
        VStack {

            ScrollView {
                VStack {

                    //Icono

                    HStack {
                        Spacer()
                        Image(systemName: evento.icono)
                            .font(.system(size: 90))
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    .padding(.vertical, 60)
                    .background(.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(10)

                    //Información

                    VStack {
                        HStack {
                            Text(evento.nombre)
                                .font(.system(size: 26))
                                .bold()
                                .foregroundStyle(.white)

                            Spacer()

                            Button {
                                favoritosViewModel.alternar(evento)
                            } label: {
                                Image(systemName: favoritosViewModel.esFavorito(evento) ? "heart.fill" : "heart")
                                    .font(.system(size: 28))
                                    .foregroundStyle(.white)
                            }
                        }
                        .padding(.bottom)

                        HStack {
                            Text("Fecha:")
                                .bold()
                                .foregroundStyle(.white)
                            Text("\(evento.fecha) | \(evento.hora) hrs")
                                .foregroundStyle(.white)
                            Spacer()
                        }

                        HStack {
                            Text("Lugar:")
                                .bold()
                                .foregroundStyle(.white)
                            Text("\(evento.lugar), \(evento.ciudad)")
                                .foregroundStyle(.white)
                            Spacer()
                        }

                        HStack {
                            Text("Descripción")
                                .font(.system(size: 18))
                                .bold()
                                .foregroundStyle(.white)
                            Spacer()
                        }
                        .padding(.top, 30)

                        HStack {
                            Text(evento.descripcion)
                                .foregroundStyle(.white)
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 25)
                    .padding(.vertical, 30)
                    .padding(.bottom, 60)
                    .background(.black)
                }
            }

            //Botón

            if let url = URL(string: evento.enlaceEntradas) {
                Link(destination: url) {
                    Text("Comprar o Consultar Entradas")
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 18)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .padding(.vertical, 20)
            }
        }
        .navigationTitle("Detalles del evento")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.black, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        DetalleView(evento: eventosDeEjemplo[2])
    }
    .environment(FavoritosViewModel())
}
