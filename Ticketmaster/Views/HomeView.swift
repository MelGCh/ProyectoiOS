//
//  HomeView.swift
//  Ticketmaster
//

import SwiftUI

struct HomeView: View {

    @State private var viewModel: HomeViewModel

    @Environment(FavoritesViewModel.self) var favoritesViewModel

    init(viewModel: HomeViewModel) {
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {

                    SearchHeaderView(searchText: $viewModel.searchText)

                    CategoryBarView(activeCategory: viewModel.activeCategory) { category in
                        viewModel.categoryTapped(category)
                    }

                    //Contenido

                    if viewModel.isLoading {
                        SkeletonView()
                    } else if viewModel.filteredEvents.isEmpty {
                        Text("No encontramos eventos")
                            .foregroundStyle(.gray)
                            .padding(.top, 40)
                    } else if viewModel.isSearching {

                        //Resultados de búsqueda

                        ForEach(viewModel.filteredEvents) { event in
                            EventRowView(
                                event: event,
                                buttonIcon: favoritesViewModel.isFavorite(event) ? "heart.fill" : "heart"
                            ) {
                                favoritesViewModel.toggle(event)
                            }
                            .padding(.horizontal)
                            .padding(.top, 20)
                        }
                    } else {

                        //Destacados

                        if viewModel.featuredEvents.count > 0 {
                            SectionTitleView(title: "Destacados")

                            ForEach(viewModel.featuredEvents) { event in
                                FeaturedEventCard(event: event)
                            }
                        }

                        //Recomendación

                        if viewModel.recommendedEvents.count > 0 {
                            SectionTitleView(title: "Recomendación")

                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(viewModel.recommendedEvents) { event in
                                        RecommendedEventCard(
                                            event: event,
                                            isFavorite: favoritesViewModel.isFavorite(event)
                                        ) {
                                            favoritesViewModel.toggle(event)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .toolbar(.hidden, for: .navigationBar)
            .navigationDestination(for: Event.self) { event in
                DetailView(event: event)
            }
        }
        .onAppear {
            Task {
                await viewModel.loadEvents()
            }
        }
    }
}

// Los 4 botones de categoría
private struct CategoryBarView: View {

    let activeCategory: Category
    let categoryTapped: (Category) -> Void

    var body: some View {
        HStack {
            ForEach(Category.allCases, id: \.self) { category in
                Button {
                    categoryTapped(category)
                } label: {
                    Text(category.rawValue)
                        .foregroundStyle(activeCategory == category ? Color.white : Color.black)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(activeCategory == category ? Color.black : Color.clear)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }

                if category != Category.allCases.last {
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

private struct SectionTitleView: View {

    let title: String

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 22))
                .bold()
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

// La tarjeta negra grande de los eventos destacados
private struct FeaturedEventCard: View {

    let event: Event

    var body: some View {
        VStack {
            NavigationLink(value: event) {
                VStack {
                    Image(systemName: event.icon)
                        .font(.system(size: 80))
                        .foregroundStyle(.yellow)
                        .padding(.vertical, 20)

                    HStack {
                        Text(event.name)
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

                if let url = event.ticketsLink {
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

// Las tarjetas de la lista horizontal de recomendación
private struct RecommendedEventCard: View {

    let event: Event
    let isFavorite: Bool
    let favoriteTapped: () -> Void

    var body: some View {
        VStack {
            NavigationLink(value: event) {
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: event.icon)
                            .font(.system(size: 50))
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    .padding(.vertical, 30)
                    .background(.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                    HStack {
                        Text(event.name)
                            .bold()
                            .lineLimit(1)
                        Spacer()
                    }

                    HStack {
                        Text("\(event.venue), \(event.date)")
                            .font(.system(size: 14))
                            .lineLimit(1)
                        Spacer()
                    }
                }
                .foregroundStyle(.black)
            }

            HStack {
                Text("\(event.time) hrs")
                    .font(.system(size: 14))
                Spacer()
                Button {
                    favoriteTapped()
                } label: {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
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

#Preview {
    HomeView(viewModel: HomeViewModel())
        .environment(FavoritesViewModel())
}
