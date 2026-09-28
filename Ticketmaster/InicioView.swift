//
//  InicioView.swift
//  Ticketmaster
//

import SwiftUI

struct InicioView: View {
    
    @State var busqueda: String = ""
    
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
                    Button {
                        print("Todo")
                    } label: {
                        Text("Todo")
                            .foregroundStyle(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    Spacer()
                    
                    Button {
                        print("Música")
                    } label: {
                        Text("Música")
                            .foregroundStyle(.black)
                    }
                    
                    Spacer()
                    
                    Button {
                        print("Deportes")
                    } label: {
                        Text("Deportes")
                            .foregroundStyle(.black)
                    }
                    
                    Spacer()
                    
                    Button {
                        print("Artes")
                    } label: {
                        Text("Artes")
                            .foregroundStyle(.black)
                    }
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
                
                VStack {
                    Image(systemName: "music.mic")
                        .font(.system(size: 80))
                        .foregroundStyle(.yellow)
                        .padding(.vertical, 20)
                    
                    HStack {
                        VStack {
                            HStack {
                                Text("Concierto Anual: CDMX")
                                    .bold()
                                    .foregroundStyle(.white)
                                Spacer()
                            }
                            
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.yellow)
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.yellow)
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.yellow)
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.yellow)
                                Spacer()
                            }
                        }
                        
                        Button {
                            print("Comprar")
                        } label: {
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
                .padding()
                .background(.black)
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
                            Image(systemName: "music.note")
                                .font(.system(size: 50))
                                .foregroundStyle(.white)
                            Spacer()
                        }
                        .padding(.vertical, 30)
                        .background(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        HStack {
                            Text("Festival de Música")
                                .bold()
                            Spacer()
                        }
                        
                        HStack {
                            Text("Foro Sol, 18 Abril")
                                .font(.system(size: 14))
                            Spacer()
                        }
                        
                        HStack {
                            Text("19:00 hrs")
                                .font(.system(size: 14))
                            Spacer()
                            Button {
                                print("Favorito Festival de Música")
                            } label: {
                                Image(systemName: "heart")
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
                    
                    // Evento 2
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "soccerball")
                                .font(.system(size: 50))
                                .foregroundStyle(.white)
                            Spacer()
                        }
                        .padding(.vertical, 30)
                        .background(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        HStack {
                            Text("Partido de Fútbol")
                                .bold()
                            Spacer()
                        }
                        
                        HStack {
                            Text("Estadio Azteca, 22 Octubre")
                                .font(.system(size: 14))
                            Spacer()
                        }
                        
                        HStack {
                            Text("12:00 hrs")
                                .font(.system(size: 14))
                            Spacer()
                            Button {
                                print("Favorito Partido de Fútbol")
                            } label: {
                                Image(systemName: "heart")
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
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    InicioView()
}
