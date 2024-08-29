//
//  Pelicula.swift
//  PeliculasApp
//
//  Created by Ronaldo Andre on 28/08/24.
//

import Foundation

struct Pelicula: Identifiable {
    var id: Int
    var title: String
    var voteAverage: Double
    var posterPath: String
    var releaseDate: String
}
