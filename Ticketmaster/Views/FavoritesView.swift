//
//  FavoritesView.swift
//  Ticketmaster
//

import SwiftUI

struct FavoritesView: View {

    @State var searchText: String = ""

    @Environment(FavoritesViewModel.self) var favoritesViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {

                    SearchHeaderView(searchText: $searchText)

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

                    if favoritesViewModel.favorites.count == 0 {
                        Text("Aún no tienes eventos favoritos")
                            .foregroundStyle(.gray)
                            .padding(.top, 60)
                    } else {
                        ForEach(favoritesViewModel.filterFavorites(searchText: searchText)) { event in
                            EventRowView(event: event, buttonIcon: "minus.circle") {
                                favoritesViewModel.remove(event)
                            }
                            .padding(.horizontal)
                            .padding(.top, 20)
                        }
                    }
                }
            }
            .toolbar(.hidden, for: .navigationBar)
            .navigationDestination(for: Event.self) { event in
                DetailView(event: event)
            }
        }
    }
}

#Preview {
    FavoritesView()
        .environment(FavoritesViewModel())
}
