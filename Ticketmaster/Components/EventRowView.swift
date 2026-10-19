//
//  EventRowView.swift
//  Ticketmaster
//

import SwiftUI

// La fila de evento. Se usa en Inicio (corazón) y en Favoritos (quitar)
struct EventRowView: View {

    let event: Event
    let buttonIcon: String
    let action: () -> Void

    var body: some View {
        HStack {
            NavigationLink(value: event) {
                HStack {
                    Image(systemName: event.icon)
                        .font(.system(size: 50))
                        .foregroundStyle(.white)
                        .padding(30)
                        .background(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 12))

                    VStack(alignment: .leading) {
                        Text(event.name)
                            .bold()

                        HStack {
                            Text("Fecha:")
                                .font(.system(size: 14))
                                .bold()
                            Text("\(event.date) | \(event.time) hrs")
                                .font(.system(size: 14))
                        }

                        HStack {
                            Text("Lugar:")
                                .font(.system(size: 14))
                                .bold()
                            Text("\(event.venue), \(event.city)")
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
                    action()
                } label: {
                    Image(systemName: buttonIcon)
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
        EventRowView(event: sampleEvents[2], buttonIcon: "heart") { }
            .padding()
    }
}
