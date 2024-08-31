//
//  ErrorResponse.swift
//  PeliculasApp
//
//  Created by Ronaldo Andre on 28/08/24.
//

import Foundation

struct ErrorResponse: Decodable {
    let status: String
    let message: String
}
