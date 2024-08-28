//
//  NavigationModifier.swift
//  PeliculasApp
//
//  Created by Ronaldo Andre on 27/08/24.
//

import Foundation
import SwiftUI

struct NavigationModifier: ViewModifier {
    var destinationView: AnyView
    @Binding var isActive: Bool
    
    func body(content: Content) -> some View {
        content
            .background(
                NavigationLink(
                    destination: destinationView,
                    isActive: $isActive
                ) {
                    EmptyView()
                }
            )
    }
}
