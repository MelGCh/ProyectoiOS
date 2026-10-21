//
//  DetailView.swift
//  Ticketmaster
//

import SwiftUI

struct DetailView: View {

    let event: Event

    @Environment(FavoritesViewModel.self) var favoritesViewModel

    var body: some View {
        VStack {

            ScrollView {
                VStack {

                    //Icono

                    HStack {
                        Spacer()
                        Image(systemName: event.icon)
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
                            Text(event.name)
                                .font(.system(size: 26))
                                .bold()
                                .foregroundStyle(.white)

                            Spacer()

                            Button {
                                favoritesViewModel.toggle(event)
                            } label: {
                                Image(systemName: favoritesViewModel.isFavorite(event) ? "heart.fill" : "heart")
                                    .font(.system(size: 28))
                                    .foregroundStyle(.white)
                            }
                        }
                        .padding(.bottom)

                        HStack {
                            Text("Fecha:")
                                .bold()
                                .foregroundStyle(.white)
                            Text("\(event.date) | \(event.time) hrs")
                                .foregroundStyle(.white)
                            Spacer()
                        }

                        HStack {
                            Text("Lugar:")
                                .bold()
                                .foregroundStyle(.white)
                            Text("\(event.venue), \(event.city)")
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
                            Text(event.description)
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

            if let url = event.ticketsLink {
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
        DetailView(event: sampleEvents[2])
    }
    .environment(FavoritesViewModel())
}
