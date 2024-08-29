//
//  PeliculaRepository.swift
//  PeliculasApp
//
//  Created by Ronaldo Andre on 28/08/24.
//

import Foundation
import Combine

class PeliculaRepository {
 
    private let peliculasWebService: PeliculasWebService
    
    var cancelLables = Set<AnyCancellable>()

    init(peliculasWebService: PeliculasWebService) {
        self.peliculasWebService = peliculasWebService
    }
    
    func getPeliculaFromWebService()-> AnyPublisher<[Pelicula] ,Error> {
        return peliculasWebService.getPelicula().map { (peliculaResponse:PeliculaResponse) in            
            peliculaResponse.results.map { (resultDataResponse:ResultDataResponse) in
                Pelicula(
                    id: resultDataResponse.id,
                    title: "resultDataResponse.title",
                    voteAverage: 0.0,
                    posterPath: "",
                    releaseDate: "resultDataResponse.releaseDate"
                )
            }
        }
        .eraseToAnyPublisher()
    }
}
