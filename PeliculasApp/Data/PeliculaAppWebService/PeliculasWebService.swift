//
//  PeliculasWebService.swift
//  PeliculasApp
//
//  Created by Ronaldo Andre on 28/08/24.
//

import Foundation
import Combine

class PeliculasWebService {
    func getPelicula() -> AnyPublisher<PeliculaResponse, Error> {
        let urlBase = Bundle.main.object(forInfoDictionaryKey: "URL_BASE") as! String
        let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as! String
        
        guard let urlComponents = URLComponents(string: "\(urlBase)/3/discover/movie") else {
            return Fail(error: PeliculasAppError.errorURL)
                .eraseToAnyPublisher()
        }
        
        guard let validUrl = urlComponents.url else {
            return Fail(error: PeliculasAppError.urlInvalido)
                .eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(
            url: validUrl
        )
        
        urlRequest.httpMethod = "GET"
        
        urlRequest.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        urlRequest.setValue("application/json", forHTTPHeaderField: "accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, response: URLResponse) in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw PeliculasAppError.errorDesconocido
                }
                // 202 - Cuando la aplicacion es exitoso
                if (200 ... 299 ~= httpResponse.statusCode) {
                    return data
                }
                
                //404 - cualquier rango qeu supere al 200 y 299 en el servicio pasa automaticamente al errorResponse
                let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                throw PeliculasAppError.errorData(errorResponse.message)
            }
            .decode(type: PeliculaResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    enum PeliculasAppError: Error, Equatable {
        case errorURL
        case urlInvalido
        case errorData(String)
        case errorDesconocido
    }
}
