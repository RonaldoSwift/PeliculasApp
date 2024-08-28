//
//  PrincipalRootView.swift
//  PeliculasApp
//
//  Created by Ronaldo Andre on 26/08/24.
//

import Foundation
import SwiftUI

struct PrincipalRootView: View {
    
    @State private var isActiveLogin: Bool = false
    
    var body: some View {
        NavigationView {
            HomeView(onClickInLogin: {
                isActiveLogin = true
            })
            .navigation(LoginView(), $isActiveLogin)
        }
    }
}
