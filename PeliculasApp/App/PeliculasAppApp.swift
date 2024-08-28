//
//  PeliculasAppApp.swift
//  PeliculasApp
//
//  Created by Ronaldo Andre on 23/08/24.
//

import SwiftUI

@main
struct PeliculasAppApp: App {
    
    @StateObject private var appRootManager = AppRootManager()
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch(appRootManager.currentRoot) {
                case .splash:
                    SplashRootView()
                    
                case .principal:
                    PrincipalRootView()
                }
            }
            .environmentObject(appRootManager)
        }
    }
}
