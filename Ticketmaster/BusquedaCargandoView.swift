//
//  BusquedaCargandoView.swift
//  Ticketmaster
//

import SwiftUI

struct BusquedaCargandoView: View {
    
    @State var busqueda: String = "Concierto"
    
    var body: some View {
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
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 20))
                                .foregroundStyle(.black)
                                .padding(.vertical, 12)
                                .padding(.leading, 12)
                            TextField(text: $busqueda) {
                                Text("Buscar eventos")
                            }
                            Image(systemName: "circle.dotted")
                                .font(.system(size: 24))
                                .foregroundStyle(.gray)
                                .padding(.trailing, 12)
                        }
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                        Button {
                            print("Favoritos")
                        } label: {
                            Image(systemName: "heart")
                                .font(.system(size: 22))
                                .foregroundStyle(.black)
                                .padding(12)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                    }
                    .padding(.top, 20)
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 40)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                
                //Categorías
                
                HStack {
                    Text("Todo")
                        .foregroundStyle(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Spacer()
                    
                    Text("Música")
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    
                    Text("Deportes")
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    
                    Text("Artes")
                        .foregroundStyle(.gray)
                }
                .padding(.horizontal)
                .padding(.top)
                
                //Destacados
                
                HStack {
                    Text("Destacados")
                        .font(.system(size: 22))
                        .bold()
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)
                
                HStack {
                    Spacer()
                }
                .padding(.vertical, 90)
                .background(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding(.horizontal)
                
                //Recomendación
                
                HStack {
                    Text("Recomendación")
                        .font(.system(size: 22))
                        .bold()
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)
                
                HStack {
                    
                    // Evento 1
                    VStack {
                        HStack {
                            Spacer()
                        }
                        .padding(.vertical, 55)
                        .background(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        HStack {
                            Text("Festival de Música")
                                .bold()
                                .foregroundStyle(.gray)
                            Spacer()
                        }
                        
                        HStack {
                            Text("Foro Sol, 18 Abril")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                            Spacer()
                        }
                        
                        HStack {
                            Text("19:00 hrs")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                            Spacer()
                            Image(systemName: "heart")
                                .font(.system(size: 24))
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(10)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(2)
                    .background(.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                    
                    // Evento 2
                    VStack {
                        HStack {
                            Spacer()
                        }
                        .padding(.vertical, 55)
                        .background(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        HStack {
                            Text("Partido de Fútbol")
                                .bold()
                                .foregroundStyle(.gray)
                            Spacer()
                        }
                        
                        HStack {
                            Text("Estadio Azteca, 22 Octubre")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                            Spacer()
                        }
                        
                        HStack {
                            Text("12:00 hrs")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                            Spacer()
                            Image(systemName: "heart")
                                .font(.system(size: 24))
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(10)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(2)
                    .background(.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    BusquedaCargandoView()
}
