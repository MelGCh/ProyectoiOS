//
//  EventoFilaView.swift
//  Ticketmaster
//

import SwiftUI

// La fila de evento. Se usa en Inicio (corazón) y en Favoritos (quitar)
struct EventoFilaView: View {

    let evento: Evento
    let iconoBoton: String
    let accion: () -> Void

    var body: some View {
        HStack {
            NavigationLink(value: evento) {
                HStack {
                    Image(systemName: evento.icono)
                        .font(.system(size: 50))
                        .foregroundStyle(.white)
                        .padding(30)
                        .background(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 12))

                    VStack(alignment: .leading) {
                        Text(evento.nombre)
                            .bold()

                        HStack {
                            Text("Fecha:")
                                .font(.system(size: 14))
                                .bold()
                            Text("\(evento.fecha) | \(evento.hora) hrs")
                                .font(.system(size: 14))
                        }

                        HStack {
                            Text("Lugar:")
                                .font(.system(size: 14))
                                .bold()
                            Text("\(evento.lugar), \(evento.ciudad)")
                                .font(.system(size: 14))
                        }
                    }
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.leading)

                    Spacer()
                }
            }

            VStack {
                Spacer()
                Button {
                    accion()
                } label: {
                    Image(systemName: iconoBoton)
                        .font(.system(size: 26))
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
    }
}

#Preview {
    NavigationStack {
        EventoFilaView(evento: eventosDeEjemplo[2], iconoBoton: "heart") { }
            .padding()
    }
}
