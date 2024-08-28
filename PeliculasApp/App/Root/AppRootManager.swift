//
//  AppRootManager.swift
//  PeliculasApp
//
//  Created by Ronaldo Andre on 26/08/24.
//

import Foundation

final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: AppRoots = .splash
    
    enum AppRoots {
        case splash
        case principal
    }
}
