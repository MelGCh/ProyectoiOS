//
//  DetalleView.swift
//  Ticketmaster
//

import SwiftUI

struct DetalleView: View {

    var body: some View {
        VStack {

            //Barra superior

            HStack {
                Button {
                    print("Regresar")
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 24))
                        .foregroundStyle(.white)
                }

                Spacer()

                Text("Detalles del evento")
                    .font(.system(size: 20))
                    .foregroundStyle(.white)
            }
            .padding()
            .background(.black)

            ScrollView {
                VStack {

                    //Icono

                    HStack {
                        Spacer()
                        Image(systemName: "music.note")
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
                            Text("Don Omar: El regreso")
                                .font(.system(size: 26))
                                .bold()
                                .foregroundStyle(.white)

                            Spacer()

                            Button {
                                print("Favorito Don Omar: El regreso")
                            } label: {
                                Image(systemName: "heart")
                                    .font(.system(size: 28))
                                    .foregroundStyle(.white)
                            }
                        }
                        .padding(.bottom)

                        HStack {
                            Text("Fecha:")
                                .bold()
                                .foregroundStyle(.white)
                            Text("12 Diciembre | 20:00 hrs")
                                .foregroundStyle(.white)
                            Spacer()
                        }

                        HStack {
                            Text("Lugar:")
                                .bold()
                                .foregroundStyle(.white)
                            Text("Palacio de los Deportes, CDMX")
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
                            Text("¡Prepárate para vivir la noche más eléctrica! Don Omar, el “Rey del Reggaetón”, regresa para dejar sin aliento con su esperada presentación en vivo: “El Regreso”.")
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

            Button {
                print("Comprar o Consultar Entradas")
            } label: {
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
}

#Preview {
    DetalleView()
}
