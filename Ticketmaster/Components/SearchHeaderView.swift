//
//  SearchHeaderView.swift
//  Ticketmaster
//

import SwiftUI

// El encabezado negro con el buscador. Se usa en Inicio y en Favoritos
struct SearchHeaderView: View {

    @Binding var searchText: String

    var body: some View {
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
                TextField(text: $searchText) {
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
    }
}

#Preview {
    SearchHeaderView(searchText: .constant(""))
}
