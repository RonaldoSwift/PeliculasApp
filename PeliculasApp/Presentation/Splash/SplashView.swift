//
//  SplashView.swift
//  PeliculasApp
//
//  Created by Ronaldo Andre on 26/08/24.
//

import SwiftUI

struct SplashView: View {
    
    @EnvironmentObject private var appRootManager: AppRootManager
    
    var body: some View {
        Text("SplashView")
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    appRootManager.currentRoot = .principal
                }
            }
    }
}

#Preview {
    SplashView()
}
