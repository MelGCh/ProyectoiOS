//
//  FavoritosView.swift
//  Ticketmaster
//

import SwiftUI

struct FavoritosView: View {
    
    @State var busqueda: String = "Conciertos"
    
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
                        }
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                        Button {
                            print("Inicio")
                        } label: {
                            Image(systemName: "house")
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
                
                // Evento 1
                HStack {
                    Image(systemName: "music.note")
                        .font(.system(size: 50))
                        .foregroundStyle(.white)
                        .padding(30)
                        .background(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    VStack {
                        HStack {
                            Text("Don Omar: El regreso")
                                .bold()
                            Spacer()
                        }
                        
                        HStack {
                            Text("Fecha:")
                                .font(.system(size: 14))
                                .bold()
                            Text("12 Diciembre | 20:00 hrs")
                                .font(.system(size: 14))
                            Spacer()
                        }
                        
                        HStack {
                            Text("Lugar:")
                                .font(.system(size: 14))
                                .bold()
                            Text("Palacio de los Deportes, CDMX")
                                .font(.system(size: 14))
                            Spacer()
                        }
                        
                        Spacer()
                        
                        HStack {
                            Spacer()
                            Button {
                                print("Quitar Don Omar: El regreso")
                            } label: {
                                Image(systemName: "minus.circle")
                                    .font(.system(size: 26))
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                }
                .padding(10)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(2)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 22))
                .padding(.horizontal)
                .padding(.top, 20)
                
                // Evento 2
                HStack {
                    Image(systemName: "theatermasks.fill")
                        .font(.system(size: 50))
                        .foregroundStyle(.white)
                        .padding(30)
                        .background(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    VStack {
                        HStack {
                            Text("El Fantasma de la Ópera")
                                .bold()
                            Spacer()
                        }
                        
                        HStack {
                            Text("Fecha:")
                                .font(.system(size: 14))
                                .bold()
                            Text("29 Diciembre | 20:45 hrs")
                                .font(.system(size: 14))
                            Spacer()
                        }
                        
                        HStack {
                            Text("Lugar:")
                                .font(.system(size: 14))
                                .bold()
                            Text("Teatro Metropolitan, CDMX")
                                .font(.system(size: 14))
                            Spacer()
                        }
                        
                        Spacer()
                        
                        HStack {
                            Spacer()
                            Button {
                                print("Quitar El Fantasma de la Ópera")
                            } label: {
                                Image(systemName: "minus.circle")
                                    .font(.system(size: 26))
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                }
                .padding(10)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(2)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 22))
                .padding(.horizontal)
                .padding(.top, 20)
            }
        }
    }
}

#Preview {
    FavoritosView()
}
