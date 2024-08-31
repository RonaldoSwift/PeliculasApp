//
//  HomeViewModel.swift
//  PeliculasApp
//
//  Created by Ronaldo Andre on 28/08/24.
//

import Foundation
import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    
    let peliculaRepository: PeliculaRepository
    var cancelLables = Set<AnyCancellable>()

    @Published private(set) var homeScreenUiState = HomeScreenUiState.inicial

    init(peliculaRepository: PeliculaRepository) {
        self.peliculaRepository = peliculaRepository
        llamarServicioListaDePeliculas()
    }
    
    func llamarServicioListaDePeliculas() {
        
        homeScreenUiState = HomeScreenUiState.cargando
        
        peliculaRepository.getPeliculaFromWebService()
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { completion in
            switch(completion) {
            case .finished:
                break
            case .failure(let error):
                self.homeScreenUiState = HomeScreenUiState.errorDeWebService("Ocurrio un Error \(error)")
            }
        }, receiveValue: { (peliculas: [Pelicula]) in
            self.homeScreenUiState = HomeScreenUiState.successDeWebService(peliculas)
        })
        .store(in: &cancelLables)
    }
}
