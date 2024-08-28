//
//  View+Extension.swift
//  PeliculasApp
//
//  Created by Ronaldo Andre on 27/08/24.
//

import Foundation
import SwiftUI

extension View {
    func navigation(_ view: any View, _ isActive: Binding<Bool>) -> some View {
        modifier(
            NavigationModifier(destinationView: AnyView(view), isActive: isActive)
        )
    }
}
