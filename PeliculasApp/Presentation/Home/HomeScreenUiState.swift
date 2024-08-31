//
//  HomeScreenUiState.swift
//  PeliculasApp
//
//  Created by Ronaldo Andre on 28/08/24.
//

import Foundation
enum HomeScreenUiState {
    case inicial
    case cargando
    case errorDeWebService(String)
    case successDeWebService([Pelicula])
}
