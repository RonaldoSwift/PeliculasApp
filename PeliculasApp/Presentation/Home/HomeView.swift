//
//  HomeView.swift
//  PeliculasApp
//
//  Created by Ronaldo Andre on 23/08/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var homeViewModel = HomeViewModel(
        peliculaRepository: PeliculaRepository(
            peliculasWebService: PeliculasWebService()
        )
    )
    
    var onClickInLogin: () -> Void
    @State private var showModal = false
    @State private var showLoading: Bool = false
    @State private var tituloDeAlerta = ""
    @State private var mensajeDeAlerta: String = ""
    @State private var showAlert: Bool = false
    @State private var arrayDePelicula: [Pelicula] = []
    @State private var searchText = ""
    
    var resultadosBusquedaDeReceta: [Pelicula] {
        if searchText.isEmpty {
            return arrayDePelicula
        } else {
            return arrayDePelicula.filter { (pelicula: Pelicula) in
                pelicula.title.lowercased().contains(searchText.lowercased())
            }
        }
    }

    var body: some View {
        VStack{
            if showLoading {
                ProgressView()
                    .frame(maxWidth: .infinity)
            } else {
                List {
                    LazyVStack {
                        ForEach(resultadosBusquedaDeReceta, id: \.id) { pelicula in
                            Text("\(pelicula.title)")
                            Text("\(pelicula.posterPath)")
                            Text("\(pelicula.releaseDate)")
                            Text("\(pelicula.voteAverage)")
                        }
                    }
                }
            }
        }
        .toolbar {
            TextSaveToolbarContent {
                showModal = true
            }
        }
        .navigationBarBackButtonHidden(true)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(tituloDeAlerta),
                message: Text(mensajeDeAlerta),
                dismissButton: .default(
                    Text("Aceptar"),
                    action: {
                    }
                )
            )
        }
        .onReceive(homeViewModel.$homeScreenUiState) { homeState in
            switch(homeState) {
            case .inicial:
                break
            case .cargando:
                showLoading = true
            case .errorDeWebService(let error):
                tituloDeAlerta = "Error de Web Service"
                mensajeDeAlerta = error
                showAlert = true
                showLoading = false
            case .successDeWebService(let peliculas):
                arrayDePelicula = peliculas
                showLoading = false
            }
        }
    }
}

#Preview {
    HomeView(onClickInLogin: {})
}
